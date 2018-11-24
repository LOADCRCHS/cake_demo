package com.cakesale.dao;

import com.cakesale.pojo.City;
import com.cakesale.pojo.Province;

import java.util.List;

public interface ProvinceDao {
    List<Province> getProvince();

    List<City> getCityByPid(int pid);
}
