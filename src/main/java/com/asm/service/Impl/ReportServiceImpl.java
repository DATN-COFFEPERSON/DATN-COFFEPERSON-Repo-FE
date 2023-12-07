package com.asm.service.Impl;

import com.asm.dao.ReportCostRepo;
import com.asm.dao.ReportProductRepo;
import com.asm.report.ReportCost;
import com.asm.report.ReportProduct;
import com.asm.service.ReportService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.List;

@Service
public class ReportServiceImpl implements ReportService {
	@Autowired
	ReportCostRepo rpcRepo;
	@Autowired
	ReportProductRepo rprRepo;

	@Override
	public List<ReportCost> reportCostInMonth(Integer month) {
		List<ReportCost> lst = rpcRepo.reportCost(month);
		return lst;
	}

	@Override
	public List<ReportProduct> reportProductInMonth(Integer month) {
		List<ReportProduct> lst = rprRepo.reportProduct(month);
		return lst;
	}

	@Override
	public List<ReportCost> reportCostInMonthStatistic() {
		LocalDate now = LocalDate.now();
		return rpcRepo.reportCostStatistic(now.getMonthValue(), now.getYear());

	}

	@Override
	public List<ReportProduct> reportProductInMonthStatistic() {
		LocalDate now = LocalDate.now();
		return rprRepo.reportProductStatistic(now.getMonthValue(), now.getYear());
	}

}
