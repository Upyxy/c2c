package com.c2c.service.impl;

import com.github.pagehelper.PageHelper;
import com.c2c.dao.UserMapper;
import com.c2c.pojo.User;
import com.c2c.service.UserService;
import com.c2c.util.WriteExcel;

import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

@Service("userService")
public class UserServiceImpl implements UserService {

    @Resource
    private UserMapper userMapper;

    public void addUser(User user) {
        userMapper.insert(user);
    }

    public User getUserByPhone(String phone) {
        User user  = userMapper.getUserByPhone(phone);
        return  user;
    }

    public void updateUserName(User  user) {
        userMapper.updateByPrimaryKey(user);
    }

    public int updateGoodsNum(Integer id,Integer goodsNum) {
        return userMapper.updateGoodsNum(id,goodsNum);
    }

    public User selectByPrimaryKey(Integer id) {
        User user = userMapper.selectByPrimaryKey(id);
        return user;
    }
    public String getUserNameById(Integer id){
    	String username = userMapper.getUserNameById(id);
    	return username;
    }

    //获取出当前页用户
    public List<User> getPageUser(int pageNum, int pageSize) {
        PageHelper.startPage(pageNum,pageSize);//分页核心代码
        List<User> data= userMapper.getUserList();
        return data;
    }

    //获取出用户的数量
    public int getUserNum() {
        List<User> users = userMapper.getUserList();
        return users.size();
    }

    public InputStream getInputStream() throws Exception {
        String[] title=new String[]{"ID","账号","昵称","QQ","创建时间","发布商品数量","账号类型","最后上线时间","状态"};
        List<User> list=userMapper.getUserList();
        List<Object[]>  dataList = new ArrayList<Object[]>();
        for(int i=0;i<list.size();i++){
            Object[] obj=new Object[9];
            obj[0]=list.get(i).getId();
            obj[1]=list.get(i).getPhone();
            obj[2]=list.get(i).getUsername();
            obj[3]=list.get(i).getQq();
            obj[4]=list.get(i).getCreateAt();
            obj[5]=list.get(i).getGoodsNum();
            obj[6]=list.get(i).getPower()==10? "普通用户":"管理员";
            obj[7]=list.get(i).getLastLogin();
            obj[8]=list.get(i).getStatus()==1?"禁用":"启用";
            dataList.add(obj);
        }
        WriteExcel ex = new WriteExcel(title, dataList);
        InputStream in;
        in = ex.export();
        return in;
    }

    public static HttpSession getSession() {
        HttpSession session = null;
        try {
            session = getRequest().getSession();
        } catch (Exception e) {}
        return session;
    }

    public static HttpServletRequest getRequest() {
        ServletRequestAttributes attrs =(ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        return attrs.getRequest();
    }

	/**
	 * 管理端用户列表
	 */
	public List<User> getUserLists(String keyword,int currentPage, int pageSize) {
		 List<User> users = userMapper.getUserLists(keyword,currentPage,pageSize);
		return users;
	}
	/**
	 * 查询这个条件下一共有多少条数据
	 */
	public int getKeywordCount(String keyword) {
		int KeywordCount =userMapper.getKeywordCount(keyword);
		return KeywordCount;
	}
	/**
	 * 更新用户信息
	 */
	public int updateByPrimaryKeySelective(User record){
		int i = userMapper.updateByPrimaryKeySelective(record);
		return i;
	}
}