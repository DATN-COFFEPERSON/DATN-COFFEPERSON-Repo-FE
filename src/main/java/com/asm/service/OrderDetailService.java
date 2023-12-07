package com.asm.service;

import com.asm.bean.OrderDetail;

import java.util.List;

public interface OrderDetailService {
    List<OrderDetail> findAll();

    List<OrderDetail> findByOrderId(Long orderId);
}
