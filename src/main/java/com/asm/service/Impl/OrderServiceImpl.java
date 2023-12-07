package com.asm.service.Impl;

import com.asm.bean.CfTable;
import com.asm.bean.Order;
import com.asm.bean.OrderDetail;
import com.asm.dao.CfTableRepo;
import com.asm.dao.OrderDetailRepo;
import com.asm.dao.OrderRepo;
import com.asm.service.OrderService;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class OrderServiceImpl implements OrderService {
    @Autowired
    OrderRepo oRepo;
    @Autowired
    OrderDetailRepo odRepo;
    @Autowired
    CfTableRepo ctRepo;

    @Override
    public Order create(JsonNode orderData) {
        ObjectMapper mapper = new ObjectMapper();
        Order order = mapper.convertValue(orderData, Order.class);
        oRepo.save(order);

        TypeReference<List<OrderDetail>> type = new TypeReference<List<OrderDetail>>() {
        };
        List<OrderDetail> details = mapper.convertValue(orderData.get("orderDetails"), type)
                .stream().peek(d -> d.setOrder(order)).collect(Collectors.toList());
        odRepo.saveAll(details);
        return order;
    }

    @Override
    public Order findById(Long id) {
        return oRepo.findById(id).get();
    }

    @Override
    public List<Order> findByUsername(String username) {
        return oRepo.findByUsername(username);
    }

    @Override
    public List<Order> findOrderInMonth(Integer month) {
        return oRepo.findOrderInMonth(month);
    }

    @Override
    public Integer countOrderInMonth(Integer month) {
        return oRepo.countOrderInMonth(month);
    }

    @Override
    public List<Order> findAll() {
        return oRepo.findAll();
        // .stream().peek(
        // o -> o.setOrderDetails(odRepo.findByOrderId(o.getId()))
        // ).collect(Collectors.toList());
    }

    @Override
    public boolean existsById(Long id) {
        return oRepo.findById(id).isPresent();
    }

    @Override
    public Order save(JsonNode order, Boolean type) {
        ObjectMapper mapper = new ObjectMapper();
        Order orderConverted = mapper.convertValue(order, Order.class);

        TypeReference<List<OrderDetail>> typeRef = new TypeReference<List<OrderDetail>>() {
        };
        orderConverted.setOrderDetails(mapper.convertValue(order.get("orderDetails"), typeRef));
        if (type && orderConverted.isUsingTable() && orderConverted.getStatus() == 0) {
            Order curOr = oRepo.findOrderUsingInStoreWithTableId(
                    orderConverted.getCfTable().getId());
            if (curOr != null) {
                // System.out.println("====================================");
                List<OrderDetail> orderDetailList = orderConverted.getOrderDetails()
                        .stream()
                        .peek(od -> od.setOrder(curOr))
                        .collect(Collectors.toList());
                curOr.setOrderDetails(odRepo.saveAll(orderDetailList));
//                curOr.setOrderDetails(orderConverted.getOrderDetails());
//                System.out.println(curOr.getOrderDetails());
//                return this.onSave(curOr);
                return curOr;
            }
        }
        return this.onSave(orderConverted);
        // return null;
    }

    private Order onSave(Order order) {
        oRepo.save(order);
        System.out.println(order.getOrderDetails());
        List<OrderDetail> details = order.getOrderDetails()
                .stream()
                .peek(d -> d.setOrder(order))
                .collect(Collectors.toList());
        order.setOrderDetails(odRepo.saveAll(details));
        return order;
    }

    @Override
    public void changeStatusById(Long id, int status) {
        oRepo.findById(id).map(o -> {
            o.setStatus(status);
            return oRepo.save(o);
        }).orElseThrow(() -> new RuntimeException("Not found"));
    }

    @Override
    public List<Order> searchOrder(String kw, Long tableId) {
        return oRepo.searchOrder(kw, tableId);
    }

    @Override
    public Order changeTable(Long id, Long tableId) {
        Order order = findById(id);
        Boolean usingInOld = order.isUsingTable();

        order.setUsingTable(tableId != 0);
        if (tableId != 0)
            order.setCfTable(ctRepo.findById(tableId).orElse(null));

        Order result = oRepo.save(order);

        if (usingInOld) {
            CfTable oldTable = order.getCfTable();
            oldTable.setStatus(0);
            if (oRepo.findOrderUsingInStoreWithTableId(tableId) == null)
                oldTable.setStatus(1);
            result.setCfTable(ctRepo.save(oldTable));
        }

        return result;
    }

}
