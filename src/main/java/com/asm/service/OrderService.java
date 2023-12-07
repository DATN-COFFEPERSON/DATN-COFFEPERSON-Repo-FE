package com.asm.service;

import com.asm.bean.Order;
import com.fasterxml.jackson.databind.JsonNode;

import java.util.List;

public interface OrderService {

    Order create(JsonNode order);

    Order findById(Long id);

    List<Order> findByUsername(String username);

    // Double sumCostInMonth(Integer month);

    List<Order> findOrderInMonth(Integer month);

    Integer countOrderInMonth(Integer month);

    List<Order> findAll();

    boolean existsById(Long id);

    Order save(JsonNode order, Boolean type);

    void changeStatusById(Long id, int status);

    List<Order> searchOrder(String kw, Long tableId);

    Order changeTable(Long id, Long tableId);
}
