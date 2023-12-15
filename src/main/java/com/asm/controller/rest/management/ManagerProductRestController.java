package com.asm.controller.rest.management;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.websocket.server.PathParam;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.asm.bean.Brand;
import com.asm.bean.Product;
import com.asm.bean.ProductCategory;
import com.asm.service.BrandService;
import com.asm.service.CategoryService;
import com.asm.service.ProductService;
import com.asm.service.UploadService;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

@RestController
@CrossOrigin(origins = "*")
@RequestMapping("/management/rest/products")
public class ManagerProductRestController {
	@Autowired
	ProductService pService;
	@Autowired
	BrandService bService;
	@Autowired
	CategoryService cService;

	@Autowired
	UploadService uService;

	// Lấy tất thông tin gồm tất cả brands, category, product và productCates
	@GetMapping("")
	public Map<String, Object> get() {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("brands", bService.findAll());
		map.put("categories", cService.findAll());
		map.put("products", pService.findAll());
		map.put("productCates", pService.findProductCategory());
		return map;
	}

	// Lấy danh sách ProductCategory dựa trên Product Id
	@GetMapping("/{id}")
	public ResponseEntity<List<ProductCategory>> getProductDetail(@PathVariable("id") Long id) {
		if (!pService.existsById(id)) {
			return ResponseEntity.notFound().build();
		} else {
			return ResponseEntity.ok(pService.findByProductId(id));
		}
	}

	// Tìm những sản phẩm có tên khớp với kw
	@GetMapping("/search")
	public List<Product> searchProduct(@RequestParam("kw") Optional<String> kw) {
		String keyword = kw.orElse(null);
		if (keyword != null) {
			return pService.findByName("%" + keyword + "%");
		} else {
			return pService.findAll();
		}
	}

	// Thêm mới sản phẩm
	@PostMapping("")
	public Product postProduct(@RequestBody JsonNode data) {
		return pService.save(data);
	}

	// Sửa sản phẩm
	@PutMapping("/{id}")
	public ResponseEntity<Product> putProduct(@PathVariable("id") Long id, @RequestBody JsonNode data) {
		if (!pService.existsById(id)) {
			return ResponseEntity.notFound().build();
		} else {
			return ResponseEntity.ok(pService.save(data));
		}
	}

	// Xóa sản phẩm
	@DeleteMapping("/{id}")
	public void deleteProduct(@PathVariable("id") Long id) {
		Product product = pService.findById(id);
		String images = product.getImages();
		TypeReference<List<String>> typeString = new TypeReference<List<String>>() {
		};
		ObjectMapper mapper = new ObjectMapper();
		try {
			List<String> list = mapper.readValue(images, typeString);
			System.out.println(list);
			for (String filename : list) {
				if (!filename.equalsIgnoreCase("logo.jpg")) {
					uService.delete("product", filename);
				}
			}
			List<ProductCategory> productCates = pService.findByProductId(id);
			for (ProductCategory productCate : productCates) {
				pService.deleteProductCateById(productCate.getId());
			}
			pService.deleteById(id);
		} catch (Exception e) {
			// TODO: handle exception
		}
		//
	}

	// Xóa productCategory
	@DeleteMapping("/productcategory/{id}")
	public void deleteProductCategory(@PathVariable("id") Long id) {
		pService.deleteProductCateById(id);
	}

	// Thêm productCategory
	@PostMapping("/productcategory")
	public ProductCategory postProductCategory(@RequestBody ProductCategory productCates) {
		return pService.saveProductCates(productCates);
	}
}
