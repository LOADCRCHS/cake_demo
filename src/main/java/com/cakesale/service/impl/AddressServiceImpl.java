package com.cakesale.service.impl;

import com.cakesale.dao.AddressDAO;
import com.cakesale.pojo.Address;
import com.cakesale.pojo.City;
import com.cakesale.pojo.Order;
import com.cakesale.pojo.Province;
import com.cakesale.service.AddressService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AddressServiceImpl implements AddressService {
    @Autowired
    private AddressDAO addressDAO;


    @Override
    public List<Address> getAddressListByUserId(Integer userId) {
        return addressDAO.getAddressListByUserId(userId);
    }

    @Override
    public void addAddress(Address address) {
        addressDAO.addAddress(address);
    }

    @Override
    public void delAddressById(Integer addressId) {
        addressDAO.delAddressById(addressId);
    }

    @Override
    public List<Province> getProvince() {
        return addressDAO.getProvince();
    }

    @Override
    public List<City> getCity(Integer pid) {
        return addressDAO.getCity(pid);
    }

    @Override
    public Address getAddressListByOrderId(Integer order_id) {
        return addressDAO.getAddressListByOrderId(order_id);
    }
}
