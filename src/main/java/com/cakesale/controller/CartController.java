package com.cakesale.controller;

import com.cakesale.enums.ResultEnum;
import com.cakesale.exceptions.OrderException;
import com.cakesale.pojo.Attributes;
import com.cakesale.pojo.BirthDayCard;
import com.cakesale.pojo.CartTO;
import com.cakesale.pojo.ProductSpec;
import com.cakesale.service.ProductSpecService;
import com.cakesale.util.MyKeyUtil;
import com.cakesale.util.OrderConstants;
import com.cakesale.util.ResponseTOUtil;
import com.cakesale.vo.*;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestBody;
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
public class CartController {


    @Autowired
    private ProductSpecService productSpecService;

    /**
     * 跳转至购物车页面
     */
    @RequestMapping("/cart/index.html")
    public String cartIndex(HttpSession session) {
        return "shop/cart-index";
    }


    /**
     * 加入购物车的判断
     *
     * @return 格式固定的json字符串
     */
    @RequestMapping("/cart/add-new.html")
    @ResponseBody
    public ResponseTO addNewCart(@RequestBody List<ItemInfoVO> params,
                                 HttpSession session, HttpServletRequest request) throws OrderException, JsonProcessingException {

        System.out.println("--------- cart/add-new -----------");
        Map<String, String[]> parameterMap = request.getParameterMap();
        for (String s : parameterMap.keySet()) {
            System.out.print(s + "--");
            System.out.println(Arrays.toString(parameterMap.get(s)));
        }
        System.out.println(params.size());
        System.out.println(params.get(0));
        //ItemInfoVO{sku_id='1', amount=1, checked=1, use_bargain_id=null, attributes=null}
        System.out.println("--------- cart/add-new -----------");

        //如果是第一次访问购物车 购物车里没有商品
        CartVO cartvo_session = (CartVO) session.getAttribute(OrderConstants.CART_SESSION);
        if (cartvo_session == null) {
            cartvo_session = new CartVO();
            cartvo_session.setCount(0);
            List<CartTO> buy_list = new ArrayList<>();
            cartvo_session.setBuy_list(buy_list);
        }
        List<CartTO> buy_list = cartvo_session.getBuy_list();

        for (ItemInfoVO param : params) {
            // 1.检查商品规格是否存在 todo 改字段
            ProductSpec productSpec = productSpecService.getProductSpecBySpecId(Integer.parseInt(param.getSku_id()));
            if (productSpec == null) {
                //todo 统一异常处理
                //throw new OrderException(ResultEnum.PRODUCT_NOT_EXIST);
                return ResponseTOUtil.getErrorResult(null, ResultEnum.PRODUCT_NOT_EXIST.getMessage());
            }
            //如果购物车已存在该商品，则数量相加
            boolean flag = false;

            if (buy_list != null) {
                for (CartTO to : buy_list) {
                    if (param.getSku_id().equals(to.getSku_id())) {
                        //如果已存在该商品
                        to.setAmount(to.getAmount() + param.getAmount());
                        to.setTotalPrice(to.getTotalPrice() + to.getSale_price());
                        cartvo_session.setTotalPrice(cartvo_session.getTotalPrice() + to.getSale_price());
                        flag = true;
                        break;
                    }
                }
                if (!flag) {
                    CartTO cartTO = new CartTO();
                    cartTO.setSku_id(param.getSku_id());
                    cartTO.setAmount(param.getAmount());
                    cartTO.setChecked(param.getChecked());
                    cartTO.setGoods_name(productSpec.getProductName());
                    cartTO.setSale_price(productSpec.getPrice());
                    cartTO.setTotalPrice(productSpec.getPrice() * param.getAmount());
                    cartTO.setSpec(productSpec.getTablewareNum());
                    cartTO.setDisplay_spec(productSpec.getTablewareNum());
                    cartTO.setMain_pic(productSpec.getProductImg());
                    cartTO.setGoods_type(1);

                    //代表可填写生日祝福
                    cartTO.setBirthday_flag(1);
                    //代表可选择 切分
                    cartTO.setGoodscut_flag(0);
                    cartTO.setGoodscut_num("9");
                    buy_list.add(cartTO);
                    cartvo_session.setTotalPrice(cartvo_session.getTotalPrice() + productSpec.getPrice());
                }
            }

            // 2.2 如果用户未登录，将购物车信息存入session中
            cartvo_session.setCount(cartvo_session.getCount() + param.getAmount());
        }


        // 2.将商品添加进购物车
        // 2.1 todo 判断用户是否登陆

        // 2.2 todo 如果用户已登录，将购物车信息存入数据库中
        session.setAttribute(OrderConstants.CART_SESSION, cartvo_session);
        ObjectMapper mapper = new ObjectMapper();
        String cartJson = mapper.writeValueAsString(cartvo_session);
        session.setAttribute("shopCar", cartJson);
        return ResponseTOUtil.getSuccessResult(cartvo_session, "");
    }

    /**
     * 更新购物车
     */
    @RequestMapping(value = "/cart/update-new.html")
    @ResponseBody
    public ResponseTO update_new(@RequestBody List<ItemInfoVO> params,
                                 HttpSession session, HttpServletRequest request) throws JsonProcessingException {
        System.out.println("--------- cart/update-new -----------");
        System.out.println(params.size());
        for (ItemInfoVO param : params) {
            System.out.println(param);
        }
        System.out.println("--------- cart/update-new -----------");

        CartVO cartvo_session = (CartVO) session.getAttribute(OrderConstants.CART_SESSION);
        List<CartTO> buy_list = cartvo_session.getBuy_list();

        for (ItemInfoVO param : params) {
            // 1.检查商品规格是否存在
            ProductSpec productSpec = productSpecService.getProductSpecBySpecId(Integer.parseInt(param.getSku_id()));
            if (productSpec == null) {
                //todo 统一异常处理
                //throw new OrderException(ResultEnum.PRODUCT_NOT_EXIST);
                //    return ResponseTOUtil.getErrorResult(null, ResultEnum.PRODUCT_NOT_EXIST.getMessage());
            }

            for (CartTO to : buy_list) {
                if (param.getSku_id().equals(to.getSku_id())) {

                    // check为1代表选中，为0代表未选中
                    int newAmount = param.getAmount();
                    to.setChecked(param.getChecked());

                    if (newAmount > 99) {
                        newAmount = 99;
                    }
                    //amount为0代表删除
                    if (newAmount < 1 ) {
                        buy_list.remove(to);
                        break;
                    }
                    to.setAmount(newAmount);
                    to.setTotalPrice(to.getSale_price() * newAmount);

                    if (param.getAttributes() != null) {
                        Attributes attribute = new Attributes();
                        if (!StringUtils.isEmpty(param.getAttributes().getGoods_cut())) {
                            //goods_cut 代表切分蛋糕块数
                            attribute.setGoods_cut(param.getAttributes().getGoods_cut());
                        } else if (param.getAttributes() != null & !StringUtils.isEmpty(param.getAttributes().getGoods_birthday())) {
                            //goods_birthday 代表生日祝福语
                            attribute.setGoods_birthday(param.getAttributes().getGoods_birthday());

                            List<BirthDayCard> birthDayCardList = cartvo_session.getBirthDayCardList();
                            if (birthDayCardList == null) {
                                birthDayCardList = new ArrayList<>();
                            }
                            BirthDayCard birthDayCard = new BirthDayCard();
                            birthDayCard.setItemID(param.getAttributes().getGoods_birthday());
                            birthDayCard.setItemName(param.getAttributes().getGoods_birthday());
                            birthDayCardList.add(birthDayCard);
                            cartvo_session.setBirthDayCardList(birthDayCardList);
                        }
                        to.setAttributes(attribute);
                    }
                    break;
                }
            }

        }
        cartvo_session.setBuy_list(buy_list);

        double totalPrice = 0;
        int count = 0;
        for (CartTO cartTO : buy_list) {
            if (cartTO.getChecked() == 1) {
                totalPrice +=  cartTO.getTotalPrice();
            }
            count += cartTO.getAmount();
        }
        cartvo_session.setTotalPrice(totalPrice);
        cartvo_session.setCount(count);


        //更新缓存
        session.setAttribute(OrderConstants.CART_SESSION, cartvo_session);

        ObjectMapper mapper = new ObjectMapper();
        String cartJson = mapper.writeValueAsString(cartvo_session);
        session.setAttribute("shopCar", cartJson);
        return ResponseTOUtil.getSuccessResult(cartvo_session, "");
    }

    //商品订单校验
    @RequestMapping(value = "/cart/to-order.html")
    @ResponseBody
    public ResponseTO to_order(@RequestBody List<ItemInfoVO> params,
                               HttpServletRequest request,
                               HttpSession session) throws JsonProcessingException {
        System.out.println("--------- cart/to-order -----------");

        System.out.println(params.size());
        for (ItemInfoVO param : params) {
            System.out.println(param);
        }
        System.out.println("--------- cart/to-order -----------");
        //1.判断用户是否登陆，没登陆跳转至登陆页面

        OrderInfoVO orderInfoVO = new OrderInfoVO();
        for (ItemInfoVO param : params) {
            //2.判断购物车中的商品是否存在
            ProductSpec productSpec = productSpecService.getProductSpecBySpecId(Integer.parseInt(param.getSku_id()));
            if (productSpec == null) {
                //todo 统一异常处理
                //throw new OrderException(ResultEnum.PRODUCT_NOT_EXIST);
                //return ResponseTOUtil.getErrorResult(null, ResultEnum.PRODUCT_NOT_EXIST.getMessage());
            }
            //todo 从数据库中通过sku_id获取总金额

        }
        //从session中获取购物车
        CartVO cartVO = (CartVO) session.getAttribute(OrderConstants.CART_SESSION);
        List<CartTO> buy_list = cartVO.getBuy_list();
        orderInfoVO.setSku_list(buy_list);


        //生成一个buy_id传回前端
        orderInfoVO.setBuy_id(MyKeyUtil.getRandomStr(16));
        orderInfoVO.setAgent_id("KyHToqMRK5fq");
        orderInfoVO.setUid(7531703);
        orderInfoVO.setChannel("website");
        orderInfoVO.setSite_id(287);
        orderInfoVO.setBill_type(1);//???
        orderInfoVO.setBill_source(1);//???
        orderInfoVO.setPayment_id(29);//???
        orderInfoVO.setExtend_flag(0);//???

        //发票信息
        Invoice invoice = new Invoice();
        orderInfoVO.setInvoice(invoice);

        orderInfoVO.setPromo_use_type(0);

        Time_config time_config = new Time_config();
        //todo 当前日期
        time_config.setStart_date("2018-11-15");
        //配送最晚日期
        time_config.setEnd_date("2019-02-11");
        Details details = new Details();
        List<Details> details1 = new ArrayList<>();
        details1.add(details);
        time_config.setDetails(details1);
        orderInfoVO.setTime_config(time_config);

        //todo 从数据库中获取
        double totalPrice = cartVO.getTotalPrice();

        orderInfoVO.setTotal_sale_price(totalPrice); //商品金额
        orderInfoVO.setTotal_buy_price(totalPrice); //???
        orderInfoVO.setTotal_need_points(0);//积分支付
        orderInfoVO.setTotal_balance_paid(0);//本次使用心享值，最大为10
        orderInfoVO.setTotal_cash_pay(totalPrice);//总现金支付金额
        orderInfoVO.setGive_cashback(0);//赠送心享值
        orderInfoVO.setGive_points(totalPrice);//赠送积分
        // 1:商家冷链配送  2:其它快递   默认1
        //为1时请求sitelist.html获取冷链配送范围内的地址
        //为2时请求china-region.html获取全国地址
        orderInfoVO.setDeliver_type(1); //快递类型
        orderInfoVO.setDeliver_fee(0); //运费
        orderInfoVO.setFreight_coupon_paid(0);//运费优惠
        orderInfoVO.setDeliver_coupon_flag(0);//?运费券数量 0:没有,1:一张,2:一张并选定
        // 二进制 001:优惠券  010:诺心蛋糕卡  100:诺心储值卡
        //心享值和蛋糕卡 储值卡不能同时使用
        //3145775 该参数和是否显示时间有关系！！具体什么关系我也不知道
        orderInfoVO.setPromo_flag(3145775);//代表是否支持各种优惠
        orderInfoVO.setMax_pay_cashback(0);//???
        orderInfoVO.setMax_invoice_amount(totalPrice);//开发票，为0时不显示
        User user = new User();
        user.setPrivilege(0);
        Balance balance = new Balance();
        balance.setCashback(0);//账户剩余心享值
        user.setBalance(balance);
        orderInfoVO.setUser(user);


        //更新session中的orderInfo大对象  todo 更新数据库
        session.setAttribute("orderInfoVO", orderInfoVO);//存对象
        ObjectMapper mapper = new ObjectMapper();
        String orderInfoVOJson = mapper.writeValueAsString(orderInfoVO);
        System.out.println("==============================================================");
        System.out.println(orderInfoVOJson);
        System.out.println("==============================================================");
        session.setAttribute("orderInfo", orderInfoVOJson);//存json
        return ResponseTOUtil.getSuccessResult(orderInfoVO, "去结算");
    }

}


