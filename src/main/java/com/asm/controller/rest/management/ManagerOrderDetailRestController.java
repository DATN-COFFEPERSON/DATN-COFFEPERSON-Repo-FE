package com.asm.controller.rest.management;

import com.asm.bean.OrderDetail;
import com.asm.service.OrderDetailService;
import com.asm.service.UploadService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@CrossOrigin(origins = "*")
@RequestMapping("/management/rest/order-details")
public class ManagerOrderDetailRestController {
    @Autowired
    OrderDetailService odService;
    @Autowired
    UploadService uService;

    // Nếu không có orderId thì Lấy tất cả các đơn hàng, ngược lại thì chỉ lấy đơn
    // hàng có ID bằng với OrderId đầu vào
    @GetMapping("")
    public List<OrderDetail> getAllOrder(@RequestParam(value = "orderId", defaultValue = "") Long orderId) {
        if (orderId == null)
            return odService.findAll();
        else
            return odService.findByOrderId(orderId);
    }

}
