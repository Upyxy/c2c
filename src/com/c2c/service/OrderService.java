package com.c2c.service;



import java.util.List;

import com.c2c.pojo.Order;

public interface OrderService {

	int addOrder(Order order) ;

	List<Order> selectOrderByUserId(Integer id);

}
