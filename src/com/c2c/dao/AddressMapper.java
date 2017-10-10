package com.c2c.dao;

import java.util.List;

import com.c2c.pojo.Address;


public interface AddressMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Address record);

    int insertSelective(Address record);

    Address selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Address record);

    int updateByPrimaryKey(Address record);
    
    public List<Address> selectAddressByUserId(Integer id);
}