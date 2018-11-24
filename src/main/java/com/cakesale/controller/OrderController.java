package com.cakesale.controller;

import com.cakesale.util.MyKeyUtil;
import com.cakesale.util.OrderConstants;
import com.cakesale.util.ResponseTOUtil;
import com.cakesale.vo.*;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

@Controller
public class OrderController {


    //跳转至订单页
    @RequestMapping("/order/index.html")
    public String orderIndex(HttpServletRequest request) {
        System.out.println("---------- order/index ----------");
        Map<String, String[]> parameterMap = request.getParameterMap();
        for (String s : parameterMap.keySet()) {
            System.out.print(s + "--");
            System.out.println(Arrays.toString(parameterMap.get(s)));
        }
        System.out.println("---------- order/index ----------");
        return "shop/order-index";
    }

    //获取全国的省市区地址
    @RequestMapping("/order/china-region.html")
    @ResponseBody
    public String china_region(HttpServletRequest request) {
        System.out.println("---------- order/china_region ----------");
        Map<String, String[]> parameterMap = request.getParameterMap();
        for (String s : parameterMap.keySet()) {
            System.out.print(s + "-");
            System.out.println(Arrays.toString(parameterMap.get(s)));
        }
        System.out.println("---------- order/china_region ----------");
        //
        return OrderConstants.addr;
    }

    //获取站点所在区域地址
    @RequestMapping("/order/sitelist.html")
    @ResponseBody
    public ResponseTO siteList(HttpServletRequest request) {
        System.out.println("---------- order/sitelist ----------");
        Map<String, String[]> parameterMap = request.getParameterMap();
        for (String s : parameterMap.keySet()) {
            System.out.print(s + "-");
            System.out.println(Arrays.toString(parameterMap.get(s)));
        }
        System.out.println("---------- order/sitelist ----------");
        //todo 获取所有的省，市，区县 数据
        List<ProvinceVO> provinceVOList = new ArrayList<>();
        ProvinceVO provinceVO = new ProvinceVO();
        provinceVO.setId(1);
        provinceVO.setName("上海");
        List<CityVO> cityVOS = new ArrayList<>();
        CityVO cityVO = new CityVO();
        cityVO.setId(2);
        cityVO.setName("上海市");

        List<CountyVO> CountyVOS = new ArrayList<>();
        CountyVO CountyVO = new CountyVO();
        CountyVO.setId(3);
        CountyVO.setName("昌平区");
        CountyVOS.add(CountyVO);
        CountyVO CountyVO4 = new CountyVO();
        CountyVO.setId(4);
        CountyVO.setName("黄浦区");
        CountyVOS.add(CountyVO4);
        CountyVO CountyVO5 = new CountyVO();
        CountyVO.setId(5);
        CountyVO.setName("海淀区");
        CountyVOS.add(CountyVO5);
        cityVO.setChilds(CountyVOS);

        cityVOS.add(cityVO);
        provinceVO.setChilds(cityVOS);
        provinceVOList.add(provinceVO);
        return ResponseTOUtil.getSuccessResult(provinceVOList, "");
    }


    /**
     * 当传入 buy_id 时，返回当前用户的地址列表
     * 当传入 addressVO 的多个字段时，代表需将该addressVO存入地址列表中，并返回deliver_id
     */
    @RequestMapping("/order/address.html")
    @ResponseBody
    public ResponseTO address(@RequestParam(value = "params[deliverID]", required = false) String deliverID,
                              HttpServletRequest request, HttpSession session) {
        System.out.println("---------- order/address ----------");
        Map<String, String[]> parameterMap = request.getParameterMap();
        for (String s : parameterMap.keySet()) {
            System.out.print(s + "-");
            System.out.println(Arrays.toString(parameterMap.get(s)));
        }
        System.out.println("---------- order/address ----------");

        List<AddressVO> addresses = (List<AddressVO>) session.getAttribute("addresses");
        if (addresses == null) {
            addresses = new ArrayList<>();
        }

        if (deliverID != null) {
            //deliverID为0代表新增地址，不为0代表修改地址
            AddressVO addressVO = null;
            if (deliverID.equals("0")) {
                addressVO = new AddressVO();
                addressVO.setDeliverID(MyKeyUtil.getRandomNum(6));
            } else {
                for (AddressVO address : addresses) {
                    if (address.getDeliver_id().equals(deliverID)) {
                        addressVO = address;
                        //移除掉原来的address
                        addresses.remove(address);
                        break;
                    }
                }
            }
            addressVO.setProvinceid(Integer.parseInt(parameterMap.get("params[provinceid]")[0]));
            addressVO.setCityid(Integer.parseInt(parameterMap.get("params[cityid]")[0]));
            addressVO.setCountyid(Integer.parseInt(parameterMap.get("params[countyid]")[0]));
            addressVO.setCustName(parameterMap.get("params[custName]")[0]);
            addressVO.setMobile(parameterMap.get("params[mobile]")[0]);
            addressVO.setPhone(parameterMap.get("params[phone]")[0]);
            addressVO.setProvinceName(parameterMap.get("params[provinceName]")[0]);
            addressVO.setCityName(parameterMap.get("params[cityName]")[0]);
            addressVO.setTownName(parameterMap.get("params[townName]")[0]);
            addressVO.setAddress(parameterMap.get("params[address]")[0]);
            addressVO.setRoomNo(parameterMap.get("params[roomNo]")[0]);
            addressVO.setPostUseFlg(parameterMap.get("params[postUseFlg]")[0]);
            addressVO.setIsEdit(parameterMap.get("params[isEdit]")[0]);
            addressVO.setBuyId(parameterMap.get("params[buyId]")[0]);
            addressVO.setCountyName(parameterMap.get("params[countyName]")[0]);
            addressVO.setDeliverType(Integer.parseInt(parameterMap.get("params[deliverType]")[0]));

            //修改 session中的addressList
            addresses.add(addressVO);
            //更新session todo 更新数据库中用户的地址
            session.setAttribute("addresses", addresses);
            return ResponseTOUtil.getSuccessResult(addressVO.getDeliver_id(), "");
        }

        return ResponseTOUtil.getSuccessResult(addresses, "");
    }


    /**
     * 配送信息修改
     *
     * @param deliverID      当传入此字段时，从地址列表中通过该id获取地址，并存入orderInfo的user_address中
     * @param buyId
     * @param confirm_switch
     * @return 返回整个OrderInfo大对象
     */
    @RequestMapping("/order/freight.html")
    @ResponseBody
    public ResponseTO freight(@RequestParam(value = "params[deliverID]", required = false) String deliverID,
                              @RequestParam(value = "params[buyId]", required = false) String buyId,
                              @RequestParam(value = "params[confirm_switch]", required = false) String confirm_switch,
                              HttpServletRequest request,
                              HttpSession session) {
        System.out.println("---------- order/freight ----------");
        Map<String, String[]> parameterMap = request.getParameterMap();
        for (String s : parameterMap.keySet()) {
            System.out.print(s + "-");
            System.out.println(Arrays.toString(parameterMap.get(s)));
        }
        System.out.println("deliverID: \t" + deliverID);
        System.out.println("buyId: \t" + buyId);
        System.out.println("confirm_switch: \t" + confirm_switch);
        System.out.println("---------- order/freight ----------");

        OrderInfoVO orderInfoVO = (OrderInfoVO) session.getAttribute("orderInfoVO");
        //1.通过deliverID查询收货地址
        if (!StringUtils.isEmpty(deliverID)) {

            List<AddressVO> addresses = (List<AddressVO>) session.getAttribute("addresses");
            AddressVO addressVO = new AddressVO();
            for (AddressVO address : addresses) {
                if (address.getDeliver_id().equals(deliverID)) {
                    addressVO = address;
                    break;
                }
            }
            //2.通过addressVO构建一个user_address
            User_Address user_address = new User_Address();
            user_address.setAddress(addressVO.getAddress());
            user_address.setAttrs("true");
            user_address.setCity(addressVO.getCityName());
            user_address.setCounty(addressVO.getCountyName());
            user_address.setDeliver_fee(0);
            user_address.setDeliver_id(addressVO.getDeliverID());
            user_address.setFee_code("");
            user_address.setLevel(16);
            user_address.setMobile(addressVO.getMobile());
            user_address.setPhone(addressVO.getPhone());
            user_address.setPostal_code("");
            user_address.setProvince(addressVO.getProvinceName());
            user_address.setReceiver_name(addressVO.getReceiver_name());
            user_address.setRoom_no(addressVO.getRoomNo());
            user_address.setRoute_code("");
            user_address.setTown(addressVO.getTownName());

            //3.将user_address存入orderInfo大对象中
            orderInfoVO.setUser_address(user_address);

        }

        //更改session中的orderInfo todo 更新数据库
        session.setAttribute("orderInfoVO", orderInfoVO);
        return ResponseTOUtil.getSuccessResult(orderInfoVO, "");
    }

    /**
     * 修改配送时间和支付方式
     *
     * @return 同freight方法
     */
    @RequestMapping("/order/change.html")
    @ResponseBody
    public ResponseTO change(HttpSession session, HttpServletRequest request) {
        System.out.println("---------- order/change ----------");
        Map<String, String[]> parameterMap = request.getParameterMap();
        for (String s : parameterMap.keySet()) {
            System.out.print(s + "-");
            System.out.println(Arrays.toString(parameterMap.get(s)));
        }
        System.out.println("---------- order/change ----------");

        OrderInfoVO orderInfoVO = (OrderInfoVO) session.getAttribute("orderInfoVO");
        if (StringUtils.isEmpty(parameterMap.get("params[payment_id]"))) {
            orderInfoVO.setSend_date(parameterMap.get("params[send_date]")[0]);
            orderInfoVO.setSend_start_time(parameterMap.get("params[send_start_time]")[0]);
            orderInfoVO.setSend_end_time(parameterMap.get("params[send_end_time]")[0]);
        } else {
            orderInfoVO.setPayment_id(Integer.parseInt(parameterMap.get("params[payment_id]")[0]));
        }

        //更改session中的orderInfo todo 更新数据库
        session.setAttribute("orderInfoVO", orderInfoVO);
        return ResponseTOUtil.getSuccessResult(orderInfoVO, "");
    }

    /**
     * 修改发票信息
     *
     * @return 同freight方法
     */
    @RequestMapping("/order/invoice.html")
    @ResponseBody
    public ResponseTO invoice(HttpSession session, HttpServletRequest request) {
        System.out.println("---------- order/invoice ----------");
        Map<String, String[]> parameterMap = request.getParameterMap();
        for (String s : parameterMap.keySet()) {
            System.out.print(s + "-");
            System.out.println(Arrays.toString(parameterMap.get(s)));
        }
        System.out.println("---------- order/invoice ----------");

        OrderInfoVO orderInfoVO = (OrderInfoVO) session.getAttribute("orderInfoVO");
        String[] invoiceArr = parameterMap.get("params[invoiceID]");
        if (StringUtils.isEmpty(invoiceArr)) {
            Invoice invoice = new Invoice();
            if ("0".equals(invoiceArr[0])) {
                invoice.setInvoice_id(MyKeyUtil.getRandomNum(6));

            } else {
                invoice.setInvoice_id(invoiceArr[0]);
            }
            invoice.setElectronic_flag(1);
            invoice.setPersonal_flag(1);
            invoice.setContent("393".equals(parameterMap.get("params[invoiceContent]")[0]) ? "蛋糕" : "");
            invoice.setCompany_name("");
            invoice.setTax_number(parameterMap.get("params[taxNumber]")[0]);
            invoice.setReceive_mobile(parameterMap.get("params[getMsg]")[0]);
            if (!StringUtils.isEmpty(parameterMap.get("params[invoiceAction]"))) {
                //todo 发票remove
                invoice.setInvoice_id("0");
            }
            orderInfoVO.setInvoice(invoice);
        }

        //更改session中的orderInfo todo 更新数据库
        session.setAttribute("orderInfoVO", orderInfoVO);
        return ResponseTOUtil.getSuccessResult(orderInfoVO, "");
    }

    /**
     * bill_no :
     * cash_pay.payId :
     *
     * @param request
     * @return
     */
    @RequestMapping("/order/save.html")
    @ResponseBody
    public ResponseTO save(HttpServletRequest request) {
        System.out.println("---------- order/save ----------");
        Map<String, String[]> parameterMap = request.getParameterMap();
        for (String s : parameterMap.keySet()) {
            System.out.print(s + "-");
            System.out.println(Arrays.toString(parameterMap.get(s)));
        }
        System.out.println("---------- order/save ----------");
        //todo 判断商品库存，订单金额，用户id等

        OrderConfig orderConfig = new OrderConfig();
        CashPay cashPay = new CashPay();
        cashPay.setPay_id("1");
        orderConfig.setCash_pay(cashPay);
        //生成bill_no
        orderConfig.setBill_no(MyKeyUtil.getRandomStr(8));
        //todo 将订单入库


        return ResponseTOUtil.getSuccessResult(orderConfig, "");
    }

    @RequestMapping("/shop/payment.html")
    public String payment(String bill_no, String payType, HttpServletRequest request) {
        System.out.println("---------- order/payment ----------");
        Map<String, String[]> parameterMap = request.getParameterMap();
        for (String s : parameterMap.keySet()) {
            System.out.print(s + "-");
            System.out.println(Arrays.toString(parameterMap.get(s)));
        }
        System.out.println("---------- order/payment ----------");
        //todo


        return "shop/payment";
    }

}
