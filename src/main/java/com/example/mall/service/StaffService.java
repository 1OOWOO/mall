package com.example.mall.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.mall.mapper.StaffMapper;
import com.example.mall.vo.Staff;

@Service
public class StaffService {

	@Autowired
	private StaffMapper staffMapper; // StaffMapper 주입

	public Staff login(String staffId, String staffPw) {
		return staffMapper.staffLogin(staffId, staffPw); // 메서드 이름 변경
	}
}
