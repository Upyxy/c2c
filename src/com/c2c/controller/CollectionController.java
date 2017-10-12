package com.c2c.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.c2c.pojo.Collection;
import com.c2c.pojo.Goods;
import com.c2c.pojo.GoodsExtend;
import com.c2c.pojo.Image;
import com.c2c.pojo.User;
import com.c2c.service.CollectionService;
import com.c2c.service.UserService;
/**
 * 收藏类
 * <p>Title:CollectionController</p>
 * <p>Description: </p>
 * <p>Company:com.c2c</p>
 * @author Muling
 * @date 2017年10月11日 下午4:01:29
 * @version 1.0
 */

@Controller
@RequestMapping(value = "/collection")
public class CollectionController {

	@Autowired
	private CollectionService collectionservice;
	@Autowired
	private UserService userservice; 
	/**
	 * 商品收藏
	 * 
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/shoucang", produces = { "application/json;charset=UTF-8" })
	@ResponseBody
	public String shoucang(HttpServletRequest request) {
		String msg = "";
		int goodsid = Integer.parseInt(request.getParameter("goodsid"));
		String img_url = request.getParameter("img_url");
		String goods_name = request.getParameter("goods_name");
		String goods_describle = request.getParameter("goods_describle");
		User cur_user = (User) request.getSession().getAttribute("cur_user");
		int i = collectionservice.addCollection(goodsid, cur_user.getId(),img_url,goods_name,goods_describle);
		if (i > 0) {
			msg = "true";
		} else {
			msg = "false";
		}
		return msg;
	}
	
	/**
	 * 个人中心收藏显示
	 * 
	 * @param request
	 * @return
	 * @throws Exception
	 */
    @RequestMapping(value = "/scList")
    public ModelAndView scList(HttpServletRequest request) throws Exception {
        ModelAndView modelAndView = new ModelAndView();
        User cur_user = (User)request.getSession().getAttribute("cur_user");
		List<Collection> collection = collectionservice.scList(cur_user.getId());
		modelAndView.addObject("collection", collection);
		
		modelAndView.setViewName("user/sclist");
        return modelAndView;
    }
    

	
}
