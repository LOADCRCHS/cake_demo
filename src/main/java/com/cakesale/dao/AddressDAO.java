package com.cakesale.dao;

import com.cakesale.pojo.Address;
import com.cakesale.pojo.City;
import com.cakesale.pojo.Province;

import java.util.List;

public interface AddressDAO {

    /**
     * 根据用户ID查找全部地址信息
     * @param userId
     * @return
     */
    List<Address> getAddressListByUserId(Integer userId);

    /**
     * 添加收货地址
     * @param address
     */
    void addAddress(Address address);

    void delAddressById(Integer addressId);

    /**
     * 得到省份信息
     * @return
     */
    List<Province> getProvince();

    /**
     * 通过省份ID查找城市
     * @param pid
     * @return
     */
    List<City> getCity(Integer pid);

    /**
     * 根据订单ID查找全部地址信息
     * @param order_id
     * @return
     */
    Address getAddressListByOrderId(Integer order_id);
}
