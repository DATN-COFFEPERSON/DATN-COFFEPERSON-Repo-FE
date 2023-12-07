package com.asm.service;

import com.asm.bean.CfTable;

import java.util.List;
import java.util.Optional;

public interface CfTableService {
    List<CfTable> findAll();

    Optional<CfTable> findById(Long tableId);

    boolean existsById(Long id);

    CfTable save(CfTable order);

    void changeStatusById(Long id, int status);

    List<CfTable> searchTable(String kw);

}
