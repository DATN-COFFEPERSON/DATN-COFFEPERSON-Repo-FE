package com.asm.service.Impl;

import com.asm.bean.CfTable;
import com.asm.bean.Order;
import com.asm.bean.OrderDetail;
import com.asm.dao.CfTableRepo;
import com.asm.dao.OrderDetailRepo;
import com.asm.service.CfTableService;
import com.asm.service.OrderDetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class CfTableServiceImpl implements CfTableService {
    @Autowired
    CfTableRepo ctRepo;

    @Override
    public List<CfTable> findAll() {
        return ctRepo.findAll();
    }

    @Override
    public Optional<CfTable> findById(Long tableId) {
        return ctRepo.findById(tableId);
    }

    @Override
    public boolean existsById(Long id) {
        return ctRepo.findById(id).isPresent();
    }

    @Override
    public CfTable save(CfTable table) {
        return ctRepo.save(table);

    }

    @Override
    public void changeStatusById(Long id, int status) {
        ctRepo.findById(id).map(o -> {
            o.setStatus(status);
            return ctRepo.save(o);
        }).orElseThrow(() -> new RuntimeException("Not found"));
    }

    @Override
    public List<CfTable> searchTable(String kw) {
        return ctRepo.findByKey(kw);
    }
}
