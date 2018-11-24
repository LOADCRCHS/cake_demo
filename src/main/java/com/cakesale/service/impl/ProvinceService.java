package com.cakesale.service.impl;

import com.cakesale.dao.ProvinceDao;
import com.cakesale.pojo.City;
import com.cakesale.pojo.Province;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProvinceService {
    @Autowired
    private ProvinceDao provinceDao;

    public List<Province> getProvince() {
        return provinceDao.getProvince();
    }

    public List<City> getCityBypId(int pid) {
        return provinceDao.getCityByPid(pid);
    }

}
