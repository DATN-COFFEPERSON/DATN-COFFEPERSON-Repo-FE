package com.asm.controller.rest.management;

import com.asm.bean.Order;
import com.asm.service.OrderService;
import com.asm.service.UploadService;
import com.fasterxml.jackson.databind.JsonNode;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@CrossOrigin(origins = "*")
@RequestMapping("/management/rest/orders")
public class ManagerOrderRestController {
    @Autowired
    OrderService oService;
    @Autowired
    UploadService uService;

    @GetMapping("")
    public List<Order> getAllOrder() {
        return oService.findAll();
    }

    @GetMapping("/{id}")
    public ResponseEntity<Order> getOrder(@PathVariable("id") Long id) {
        if (!oService.existsById(id)) {
            return ResponseEntity.notFound().build();
        } else {
            return ResponseEntity.ok(oService.findById(id));
        }
    }

    @GetMapping("/search")
    public List<Order> searchOrder(
            @RequestParam(value = "kw", defaultValue = "") String kw,
            @RequestParam(value = "tableId", defaultValue = "") Long tableId) {
        return oService.searchOrder(kw, tableId);
    }

    @PostMapping("")
    public ResponseEntity<Order> postOrder(@RequestParam("type") Boolean type, @RequestBody JsonNode order) {
        return ResponseEntity.ok(oService.save(order, type));
    }

    @PutMapping("/{id}")
    public ResponseEntity<Order> putOrder(@PathVariable("id") Long id, @RequestBody JsonNode order) {
        if (!oService.existsById(id)) {
            return ResponseEntity.notFound().build();
        } else {
            return ResponseEntity.ok(oService.save(order, Boolean.FALSE));
        }
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> changeStatus(@PathVariable("id") Long id, @RequestParam("status") Integer status) {
        try {
            oService.changeStatusById(id, status);
            return ResponseEntity.ok().build();
        } catch (Exception e) {
            return ResponseEntity.notFound().build();
        }
    }

    @PutMapping("/change-table/{id}")
    public ResponseEntity<Order> putTable(@PathVariable("id") Long id, @RequestParam("tableId") Long tableId) {
        if (!oService.existsById(id)) {
            return ResponseEntity.notFound().build();
        } else {
            return ResponseEntity.ok(oService.changeTable(id, tableId));
        }
    }
}
