package com.c2c.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.c2c.dao.AddressMapper;
import com.c2c.pojo.Address;
import com.c2c.pojo.Comments;
import com.c2c.service.AddressService;

@Service("addressService")
public class AddressServiceImpl implements AddressService{
	@Resource
	private AddressMapper addressMapper;
	
	@Override
	public int addAddress(Address address){
		
		return addressMapper.insert(address);
	}
	
	public List<Address> selectAddressByUserId(Integer id){
		List<Address> addressList = addressMapper.selectAddressByUserId(id);
		return  addressList;
	}
	public int deleteByPrimaryKey(Integer id){
		int i =addressMapper.deleteByPrimaryKey(id);
		return i ;
	}
}
