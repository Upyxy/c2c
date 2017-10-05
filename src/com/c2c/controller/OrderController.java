package com.c2c.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;






import org.springframework.web.servlet.ModelAndView;

import com.c2c.pojo.Order;
import com.c2c.pojo.OrdersExtend;
import com.c2c.pojo.User;
import com.c2c.service.OrderService;




@Controller
@RequestMapping(value ="/order")
public class OrderController {
	@Autowired 
	private OrderService orderService;
@RequestMapping(value = "/enter")
public ModelAndView enterOrder(HttpServletRequest request)
        throws Exception {
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
	 mv.addObject("ordersExtend", ordersExtend);
	 mv.setViewName("goods/order");
	
	return mv;
}


@RequestMapping(value = "/add",produces = {"application/json;charset=UTF-8"})
@ResponseBody
public String addOrders(HttpServletRequest request, Order order)throws Exception {
	String msg="";
    //查询出当前用户cur_user对象，便于使用id
    User cur_user = (User)request.getSession().getAttribute("cur_user");
    int goodsId =Integer.parseInt(request.getParameter("goodsId"));
    float price = Float.parseFloat(request.getParameter("goodsPrice"));
    int sellerId=Integer.parseInt(request.getParameter("sellerId"));
    order.setBuyerId(cur_user.getId());
    order.setGoodsId(goodsId);
    order.setPrice(price);
    order.setSellerId(sellerId);
    int i = orderService.addOrder(order);//在order表中插入订单
    if(i>0){
 	   msg="true";
    }else{
 	   msg="false";
    }
	return msg;
}
}
