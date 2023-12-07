package com.asm.dao;

import com.asm.bean.Order;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface OrderRepo extends JpaRepository<Order, Long> {
    @Query("SELECT o FROM Order o WHERE o.account.username = :name")
    List<Order> findByUsername(@Param("name") String username);

    @Query("SELECT o FROM Order o WHERE MONTH(o.createDate) = :month")
    List<Order> findOrderInMonth(@Param("month") Integer month);

    @Query("SELECT COUNT(o) FROM Order o WHERE MONTH(o.createDate) = :month")
    Integer countOrderInMonth(@Param("month") Integer month);

    @Query(value = "SELECT * FROM Orders o WHERE LOWER(o.id) LIKE CONCAT('%',LOWER(:s),'%')", nativeQuery = true)
    List<Order> findByKey(@Param("s") String s);

    @Query(value = "SELECT * FROM Orders o WHERE LOWER(o.id) LIKE CONCAT('%',LOWER(:kw),'%') AND (:tableId IS NULL OR :tableId = o.cf_table)", nativeQuery = true)
    List<Order> searchOrder(@Param("kw") String kw, @Param("tableId") Long tableId);

    @Query(value = "SELECT TOP 1 * FROM Orders o WHERE o.using_table = 1 AND o.cf_table = :tableId AND status = 0 ORDER BY o.createdate DESC", nativeQuery = true)
    Order findOrderUsingInStoreWithTableId(@Param("tableId") Long tableId);
}
