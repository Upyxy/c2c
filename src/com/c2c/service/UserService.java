package com.c2c.service;

import com.c2c.pojo.User;

import java.io.InputStream;
import java.util.List;

public interface UserService {
    public void addUser(User user);
    public User getUserByPhone(String phone);
    public void updateUserName(User user);
    int updateGoodsNum(Integer id,Integer goodsNum);
    User selectByPrimaryKey(Integer id);
    public List<User> getPageUser(int pageNum,int pageSize);
    public int getUserNum();
    InputStream getInputStream() throws Exception;
    public String getUserNameById(Integer id);
    /**
     * 用户列表分页
     * @param keyword
     * @param currentPage
     * @param pageSize
     * @return
     */
	public List<User> getUserLists(String keyword,int currentPage, int pageSize);
	/**
	 * 分页查询记录总条数
	 * @param keyword
	 * @return
	 */
	public int getKeywordCount(String keyword);
	/**
	 * 更新用户信息
	 * @param record
	 * @return
	 */
	public int updateByPrimaryKeySelective(User record);
	
}