package com.asm.controller.rest.management;

import com.asm.bean.Order;
import com.asm.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.time.Instant;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.*;
import java.util.concurrent.atomic.AtomicReference;

@RestController
@CrossOrigin(origins = "*")
@RequestMapping("/management/rest/statistic")
public class ManagerStatisticRestController {
    @Autowired
    OrderService oService;

    // Lấy số liệu thống kê theo type đầu vào, nếu type=day thì sẽ lấy thống kê theo
    // tổng số tiền từ các đơn hàng theo từng ngày trong 14 ngày cuối trong db, nếu
    // day=month thì sẽ lấy thống kê theo tổng số tiền từ các đơn hàng theo từng
    // tháng trong 12 tháng cuối, nếu day=year thì sẽ lấy tất cả thống kê theo tổng
    // số tiền từ các đơn hàng theo từng năm
    @GetMapping("")
    public Map<String, Object> getStatistics(@RequestParam(value = "type", defaultValue = "day") String type) {
        ////// type: day (14 days) - month(12month) - year(all)
        List<Order> orders = oService.findAll();
        Map<String, Object> profit = new LinkedHashMap<String, Object>();
        profit.put("type", type);
        profit.put("lastTime", orders.get(orders.size() - 1).getCreateDate());
        ArrayList<Object> timeline = new ArrayList<>();
        Map<Object, Double> total = new LinkedHashMap<>();
        Map<Object, Double> inStore = new LinkedHashMap<>();
        Map<Object, Double> onApp = new LinkedHashMap<>();
        LocalDate currentDate = LocalDate.now();
        int count = 0;
        for (int i = orders.size() - 1; i >= 0; i--) {
            Order order = orders.get(i);
            Instant instant = Instant.ofEpochMilli(order.getCreateDate().getTime());
            LocalDate createDate = LocalDateTime.ofInstant(instant, ZoneId.systemDefault()).toLocalDate();
            if (Objects.equals(type, "day")) {
                if (count >= 14)
                    break;
                String key = createDate.toString();
                // Long key = ChronoUnit.DAYS.between(createDate, currentDate);
                AtomicReference<Double> totalCurrent = new AtomicReference<>(0D);
                order.getOrderDetails()
                        .forEach(od -> totalCurrent.updateAndGet(v -> v + od.getPrice() * od.getQuantity()));
                if (total.get(key) == null) {
                    total.put(key, totalCurrent.get());
                    count++;
                } else {
                    total.put(key, total.get(key) + totalCurrent.get());
                }
                if (order.getAccount() == null) {
                    if (inStore.get(key) == null) {
                        inStore.put(key, totalCurrent.get());
                    } else {
                        inStore.put(key, inStore.get(key) + totalCurrent.get());
                    }
                } else {
                    if (onApp.get(key) == null) {
                        onApp.put(key, totalCurrent.get());
                    } else {
                        onApp.put(key, onApp.get(key) + totalCurrent.get());
                    }
                }
                if (!timeline.contains(key))
                    timeline.add(key);
            } else if (Objects.equals(type, "month")) {
                if (count >= 12)
                    break;
                String key = createDate.toString().substring(0, createDate.toString().length() - 3);
                // Long key = ChronoUnit.MONTHS.between(createDate, currentDate);
                AtomicReference<Double> totalCurrent = new AtomicReference<>(0D);
                order.getOrderDetails()
                        .forEach(od -> totalCurrent.updateAndGet(v -> v + od.getPrice() * od.getQuantity()));
                if (total.get(key) == null) {
                    total.put(key, totalCurrent.get());
                    count++;
                } else {
                    total.put(key, total.get(key) + totalCurrent.get());
                }
                if (order.getAccount() == null) {
                    if (inStore.get(key) == null) {
                        inStore.put(key, totalCurrent.get());
                    } else {
                        inStore.put(key, inStore.get(key) + totalCurrent.get());
                    }
                } else {
                    if (onApp.get(key) == null) {
                        onApp.put(key, totalCurrent.get());
                    } else {
                        onApp.put(key, onApp.get(key) + totalCurrent.get());
                    }
                }
                if (!timeline.contains(key))
                    timeline.add(key);
            } else if (Objects.equals(type, "year")) {
                int key = createDate.getYear();
                AtomicReference<Double> totalCurrent = new AtomicReference<>(0D);
                order.getOrderDetails()
                        .forEach(od -> totalCurrent.updateAndGet(v -> v + od.getPrice() * od.getQuantity()));
                if (total.get(key) == null) {
                    total.put(key, totalCurrent.get());
                } else {
                    total.put(key, total.get(key) + totalCurrent.get());
                }
                if (order.getAccount() == null) {
                    if (inStore.get(key) == null) {
                        inStore.put(key, totalCurrent.get());
                    } else {
                        inStore.put(key, inStore.get(key) + totalCurrent.get());
                    }
                } else {
                    if (onApp.get(key) == null) {
                        onApp.put(key, totalCurrent.get());
                    } else {
                        onApp.put(key, onApp.get(key) + totalCurrent.get());
                    }
                }
                if (!timeline.contains(key))
                    timeline.add(key);
            }

            profit.put("startTime", order.getCreateDate());
        }
        profit.put("timeLine", timeline);
        profit.put("count", count);
        profit.put("total", total);
        profit.put("inStore", inStore);
        profit.put("onApp", onApp);
        return profit;
    }

}
