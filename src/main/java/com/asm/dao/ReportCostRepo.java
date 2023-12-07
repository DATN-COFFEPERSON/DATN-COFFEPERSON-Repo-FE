package com.asm.dao;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.asm.report.ReportCost;

@Repository
public interface ReportCostRepo extends JpaRepository<ReportCost, Date> {
	@Query("SELECT NEW ReportCost(o.createDate, COUNT(DISTINCT o.id), SUM(od.quantity * od.price) ) "
			+ "FROM Order o, OrderDetail od "
			+ "WHERE o.id = od.order.id AND MONTH(o.createDate) = :month "
			+ "GROUP BY createDate")
	List<ReportCost> reportCost(@Param("month") Integer month);

	@Query(value = "SELECT o.createDate as date, COUNT(DISTINCT o.id) as sum_order, SUM(od.quantity * od.price) as cost FROM Orders o, OrderDetails od WHERE o.id = od.orderId AND MONTH(o.createDate) = :month AND YEAR(o.createDate) = :year GROUP BY createDate", nativeQuery = true)
	List<ReportCost> reportCostStatistic(@Param("month") Integer month, @Param("year") Integer year);
}
