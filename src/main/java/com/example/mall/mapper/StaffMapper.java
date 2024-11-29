package com.example.mall.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.example.mall.vo.Staff;

@Mapper
public interface StaffMapper {
    Staff staffLogin(String staffId, String staffPw);
}
