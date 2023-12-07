package com.asm.dao;

import com.asm.bean.CfTable;
import com.asm.bean.OrderDetail;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CfTableRepo extends JpaRepository<CfTable, Long> {
    // truy vấn những bàn có tên khớp với string s
    @Query(value = "SELECT * FROM cf_tables t WHERE LOWER(t.name) LIKE CONCAT('%',LOWER(:s),'%')", nativeQuery = true)
    List<CfTable> findByKey(@Param("s") String s);

}
