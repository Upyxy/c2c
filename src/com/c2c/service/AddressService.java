package com.c2c.service;

import java.util.List;

import com.c2c.pojo.Address;

public interface AddressService {

	int addAddress(Address address);

	List<Address> selectAddressByUserId(Integer id);

	int deleteByPrimaryKey(Integer id);

}
