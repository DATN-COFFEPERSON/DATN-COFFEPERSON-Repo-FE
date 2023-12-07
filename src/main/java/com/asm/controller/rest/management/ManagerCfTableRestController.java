package com.asm.controller.rest.management;

import com.asm.bean.CfTable;
import com.asm.service.CfTableService;
import com.asm.service.UploadService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
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

import java.util.List;

@RestController
@CrossOrigin(origins = "*")
@RequestMapping("/management/rest/cf-tables")
public class ManagerCfTableRestController {
    @Autowired
    CfTableService tService;

    // Lấy tất cả bàn
    @GetMapping("")
    public List<CfTable> getAllTable() {
        return tService.findAll();

    }

    // Tìm kiếm bàn bằng id
    @GetMapping("/{id}")
    public CfTable getById(@PathVariable("id") Long id) {
        return tService.findById(id).orElse(null);
    }

    // Tìm kiếm những bàn có tên khớp với kw
    @GetMapping("/search")
    public List<CfTable> searchOrder(
            @RequestParam(value = "kw", defaultValue = "") String kw) {
        return tService.searchTable(kw);
    }

    // thêm bàn
    @PostMapping("")
    public ResponseEntity<CfTable> postTable(@RequestBody CfTable table) {

        return ResponseEntity.ok(tService.save(table));

    }

    // sửa bàn
    @PutMapping("/{id}")
    public ResponseEntity<CfTable> putTable(@PathVariable("id") Long id, @RequestBody CfTable table) {
        if (!tService.existsById(id)) {
            return ResponseEntity.notFound().build();
        } else {
            return ResponseEntity.ok(tService.save(table));
        }
    }

    // thay đổi trạng thái -1: xóa, 0: trống, 1: đã có người ngồi
    @DeleteMapping("/{id}")
    public ResponseEntity<Void> changeStatus(@PathVariable("id") Long id, @RequestParam("status") Integer status) {
        try {
            tService.changeStatusById(id, status);
            return ResponseEntity.ok().build();
        } catch (Exception e) {
            return ResponseEntity.notFound().build();
        }
    }

}
