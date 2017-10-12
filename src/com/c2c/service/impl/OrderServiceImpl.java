package com.c2c.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;






import com.c2c.dao.OrderMapper;
import com.c2c.pojo.Order;
import com.c2c.service.OrderService;
import com.c2c.util.DateUtil;



@Service ("orderService")
public class OrderServiceImpl implements OrderService {
	@Resource
	private OrderMapper orderMapper;

	@Override
	public int addOrder(Order order) {
		// TODO Auto-generated method stub
		 String createAt = DateUtil.getNowDay();
		 order.setCreateAt(createAt);
		 orderMapper.inser(order);
		 return 0;
	}
	
	public List<Order> selectOrderByUserId(Integer id){
		List<Order> orderList= orderMapper.selectOrderByUserId(id);
		return orderList;
	}
}
