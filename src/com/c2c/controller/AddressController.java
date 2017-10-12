package com.c2c.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.c2c.pojo.Address;
import com.c2c.pojo.Comments;
import com.c2c.pojo.Goods;
import com.c2c.pojo.User;
import com.c2c.service.AddressService;

/**
 * 地址类
 * <p>Title:AddressController</p>
 * <p>Description:地址类 </p>
 * <p>Company:com.c2c</p>
 * @author Muling
 * @date 2017年10月11日 下午4:00:21
 * @version 1.0
 */
@Controller
@RequestMapping(value="/address")
public class AddressController {
	@Autowired AddressService addressService;
	
	@RequestMapping(value="/add")
    
    public String addAddress(HttpServletRequest request,Address address) throws Exception{
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
       addressService.addAddress(address);
      
        return "redirect:/user/address";
	}
	@RequestMapping(value = "/deleted",produces = {"application/json;charset=UTF-8"})
	   @ResponseBody
	   public String updateComments(HttpServletRequest request,Address address)
	            throws Exception {
		   String msg="";
	       
	        int id =Integer.parseInt(request.getParameter("addressId"));
	       int i = addressService.deleteByPrimaryKey(id);//删除该条地址
	       if(i>0){
	    	   msg="true";
	       }else{
	    	   msg="false";
	       }
	        return msg;
	    }
}
