package com.asm.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.asm.report.ReportProduct;

@Repository
public interface ReportProductRepo extends JpaRepository<ReportProduct, Long> {
	@Query("SELECT NEW ReportProduct(p.id, p.name, COUNT(od.product.id)) "
			+ "FROM Product p, OrderDetail od "
			+ "WHERE p.id = od.product.id AND MONTH(p.createDate) = :month "
			+ "GROUP BY p.id, p.name ORDER BY COUNT(od.product.id) DESC")
	List<ReportProduct> reportProduct(@Param("month") Integer month);

	@Query(value = "SELECT p.id, p.name, COUNT(od.productId) as count FROM Products p, OrderDetails od, orders o WHERE p.id = od.productId AND o.id=od.orderId AND MONTH(o.createDate) = :month AND YEAR(o.createDate) = :year GROUP BY p.id, p.name ORDER BY COUNT(od.productId) DESC", nativeQuery = true)
	List<ReportProduct> reportProductStatistic(@Param("month") Integer month, @Param("year") Integer year);
}
