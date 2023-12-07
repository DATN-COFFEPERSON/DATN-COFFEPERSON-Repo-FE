package com.asm.dao;

import com.asm.bean.OrderDetail;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface OrderDetailRepo extends JpaRepository<OrderDetail, Long> {

    @Query(value = "SELECT * FROM OrderDetails od WHERE orderid = :id", nativeQuery = true)
    List<OrderDetail> findByOrderId(@Param("id") Long id);
}
