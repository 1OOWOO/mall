package com.example.mall.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.mall.service.DashBoardService;

@Controller
public class DashBoardController {

    @Autowired
    private DashBoardService dashboardService;

    // 대시보드 페이지를 렌더링
    @GetMapping("/admin/dashBoard")
    public String getDashboardPage(Model model) {
        // 서비스에서 대시보드 데이터를 가져옴
        Map<String, Object> summary = dashboardService.getDashboardSummary();

        // 데이터를 모델에 추가
        model.addAttribute("summary", summary);

        // 뷰 이름 반환 
        return "admin/dashBoard";
    }
}
