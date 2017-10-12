package com.c2c.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;






import org.springframework.web.servlet.ModelAndView;

import com.c2c.pojo.Address;
import com.c2c.pojo.Goods;
import com.c2c.pojo.Order;
import com.c2c.pojo.OrdersExtend;
import com.c2c.pojo.User;
import com.c2c.service.AddressService;
import com.c2c.service.GoodsService;
import com.c2c.service.OrderService;



/**
 * 订单页
 * <p>Title:OrderController</p>
 * <p>Description:订单页</p>
 * <p>Company:com.c2c</p>
 * @author Muling
 * @date 2017年10月11日 下午4:06:51
 * @version 1.0
 */
@Controller
@RequestMapping(value ="/order")
public class OrderController {
	@Autowired 
	private OrderService orderService;
	@Autowired
	private AddressService addressService;
	@Autowired
	private GoodsService goodsService;
	
	/*
	 * 进入购买界面
	 */
@RequestMapping(value = "/enter")
public ModelAndView enterOrder(HttpServletRequest request,Address address)
        throws Exception {
	 //获取当前用户
	 User cur_user = (User)request.getSession().getAttribute("cur_user");
	 //根据用户Id查询用户添加的地址信息
	 List<Address> addressList =addressService.selectAddressByUserId(cur_user.getId());
	 int goodsId=Integer.parseInt(request.getParameter("goodsId"));
	 int sellerId=Integer.parseInt(request.getParameter("sellerId"));
	 String goodsName=request.getParameter("goodsName");
	 float goodsPrice=Float.parseFloat(request.getParameter("goodsPrice"));
	 String image=request.getParameter("image");;
	 String goodsDescrible=request.getParameter("goodsDescrible");;
	 OrdersExtend ordersExtend = new OrdersExtend();
	 ordersExtend.setGoodsDescrible(goodsDescrible);
	 ordersExtend.setGoodsId(goodsId);
	 ordersExtend.setGoodsPrice(goodsPrice);
	 ordersExtend.setImage(image);
	 ordersExtend.setGoodsName(goodsName);
	 ordersExtend.setSellerId(sellerId);
	 ModelAndView mv = new ModelAndView();
	 mv.addObject("addressList",addressList);
	 mv.addObject("ordersExtend", ordersExtend);
	 mv.setViewName("goods/order");
	
	return mv;
}

/*
 * 把购买的东西放到数据库中
 */
@RequestMapping(value = "/add",produces = {"application/json;charset=UTF-8"})
@ResponseBody
public String addOrders(HttpServletRequest request, Order order,Goods goods)throws Exception {
	String msg="";
    //查询出当前用户cur_user对象，便于使用id
    User cur_user = (User)request.getSession().getAttribute("cur_user");
    int goodsId =Integer.parseInt(request.getParameter("goodsId"));
    float price = Float.parseFloat(request.getParameter("goodsPrice"));
    int sellerId=Integer.parseInt(request.getParameter("sellerId"));
    int addressId=Integer.parseInt(request.getParameter("addressId"));
    order.setBuyerId(cur_user.getId());
    order.setGoodsId(goodsId);
    order.setPrice(price);
    order.setSellerId(sellerId);
    order.setAddressId(addressId);
    int i = orderService.addOrder(order);//在order表中插入订单
    if(i==0){
 	   msg="true";
 	   //如果添加成功，更改商品状态为已卖出
     goodsService.updateStatusBygoodsId(goodsId);
    }else{
 	   msg="false";
    }
	return msg;
}
/*
 * 订单页面添加Address
 */
@RequestMapping(value = "/address",produces = {"application/json;charset=UTF-8"})
@ResponseBody
public String addAddress(HttpServletRequest request,Address address)throws Exception {
	String msg="";
    //查询出当前用户cur_user对象，便于使用id
	 User cur_user = (User)request.getSession().getAttribute("cur_user");
     address.setUserId(cur_user.getId());
     String buyerName=request.getParameter("buyerName");
     String buyerPhone = request.getParameter("buyerPhone");
     String address1=request.getParameter("address1");
     String address2=request.getParameter("address2");
     String addressContent=address1+address2;
     address.setAddressContent(addressContent);
     address.setBuyerName(buyerName);
     address.setBuyerPhone(buyerPhone);
     int i = addressService.addAddress(address);
    if(i>0){
 	   msg="true";
    }else{
 	   msg="false";
    }
	return msg;
}
}
