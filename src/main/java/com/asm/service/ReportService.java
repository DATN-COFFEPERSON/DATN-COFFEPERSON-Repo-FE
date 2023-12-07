package com.asm.service;

import com.asm.report.ReportCost;
import com.asm.report.ReportProduct;

import java.util.List;

public interface ReportService {
    List<ReportCost> reportCostInMonth(Integer month);

    List<ReportProduct> reportProductInMonth(Integer month);

    List<ReportCost> reportCostInMonthStatistic();

    List<ReportProduct> reportProductInMonthStatistic();
}
