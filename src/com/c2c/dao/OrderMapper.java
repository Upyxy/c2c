package com.c2c.dao;


import java.util.List;

import com.c2c.pojo.Order;

public interface OrderMapper {
	void inser(Order record);

	List<Order> selectOrderByUserId(Integer id);
}
