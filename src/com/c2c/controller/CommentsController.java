package com.c2c.controller;


import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.c2c.pojo.Comments;
import com.c2c.pojo.Goods;
import com.c2c.pojo.User;
import com.c2c.service.CommentsService;
import com.c2c.service.GoodsService;
import com.c2c.service.UserService;
/**
 *  评论类
 * <p>Title:CommentsController</p>
 * <p>Description: 评论类</p>
 * <p>Company:com.c2c</p>
 * @author Muling
 * @date 2017年10月11日 下午4:02:24
 * @version 1.0
 */
@Controller
@RequestMapping(value = "/comments")
public class CommentsController {
	   @Autowired
	    private UserService userService;
	    @Resource
	    private GoodsService goodsService;
	   @Resource 
	   private CommentsService commentsService;
	   
	   @RequestMapping(value = "/up",produces = {"application/json;charset=UTF-8"})
	   @ResponseBody
	   public String updateComments(HttpServletRequest request,Goods goods,Comments comments)
	            throws Exception {
		   String msg="";
	        //查询出当前用户cur_user对象，便于使用id
	        User cur_user = (User)request.getSession().getAttribute("cur_user");
           comments.setUserId(cur_user.getId());
	        //获取当前货物id
	        int goodsId =Integer.parseInt(request.getParameter("goodsId"));
	        String content = request.getParameter("content");
	        comments.setContent(content);
	        comments.setGoodsId(goodsId);
	        int i = commentsService.addComments(comments);//在comments表中插入评论
	       if(i>0){
	    	   msg="true";
	       }else{
	    	   msg="false";
	       }
	        return msg;
	    }












}
