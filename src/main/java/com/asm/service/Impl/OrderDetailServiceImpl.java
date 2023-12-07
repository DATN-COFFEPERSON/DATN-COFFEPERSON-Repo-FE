package com.asm.service.Impl;

import com.asm.bean.OrderDetail;
import com.asm.dao.OrderDetailRepo;
import com.asm.service.OrderDetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderDetailServiceImpl implements OrderDetailService {
    @Autowired
    OrderDetailRepo odRepo;

    @Override
    public List<OrderDetail> findAll() {
        return odRepo.findAll();
    }

    @Override
    public List<OrderDetail> findByOrderId(Long orderId) {
        return odRepo.findByOrderId(orderId);
    }

}
