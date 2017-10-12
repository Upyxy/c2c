package com.c2c.controller;

import com.c2c.pojo.Goods;
import com.c2c.pojo.User;
import com.c2c.util.JsonUtil;
import com.c2c.util.UserGrid;
import com.c2c.service.GoodsService;
import com.c2c.service.ImageService;
import com.c2c.service.UserService;

import org.apache.commons.io.IOUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 管理端
 * <p>Title:AdminController</p>
 * <p>Description: </p>
 * <p>Company:com.c2c</p>
 * @author Muling
 * @date 2017年10月11日 下午4:00:50
 * @version 1.0
 */
@Controller
@RequestMapping(value = "/admin")
public class AdminController {

	@Resource
	private UserService userService;

	@Resource
	private GoodsService goodsService;

	@Resource
	private ImageService imageservice;
	
	@RequestMapping(value = "/adminIndex", method = RequestMethod.GET)
	public String adminIndex() {
		return "/admin/adminIndex";
	}

	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String userHome() {
		return "/admin/home";
	}

	@RequestMapping(value = "/userList", method = RequestMethod.GET)
	public String userList() {
		return "/admin/userList";
	}
	@RequestMapping(value = "/goodsSh", method = RequestMethod.GET)
	public String goodsSh() {
		return "/admin/goodsSh";
	}

	@RequestMapping(value = "/goodsList", method = RequestMethod.GET)
	public String goodsList() {
		return "/admin/goodsList";
	}

	
	@RequestMapping(value = "/getUserInfo", produces = { "application/json;charset=UTF-8" })
	@ResponseBody
	public User getUserById(@RequestParam("userId") int userId) {
		User user = userService.selectByPrimaryKey(userId);
		return user;
	}

	@RequestMapping(value = "/users", produces = { "application/json;charset=UTF-8" })
	@ResponseBody
	public UserGrid getUserList(@RequestParam("current") int current,
			@RequestParam("rowCount") int rowCount) {
		int total = userService.getUserNum();
		List<User> list = userService.getPageUser(current, rowCount);
		UserGrid userGrid = new UserGrid();
		userGrid.setCurrent(current);
		userGrid.setRowCount(rowCount);
		userGrid.setRows(list);
		userGrid.setTotal(total);
		return userGrid;
	}

	/**

	 * 管理端商品列表

	 * 
	 * @param request
	 * @return
	 * @throws IOException
	 */

	@RequestMapping(value = "/getGoodsLists")

	public void getUserLists(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		Map<String, Object> result = new HashMap<String, Object>();

		int currentPage = Integer.parseInt(request.getParameter("currentPage"));
		int pageSize = Integer.parseInt(request.getParameter("pageSize"));
		String keyword = request.getParameter("keyword");

		List<Goods> goodslist = goodsService.getGoodsLists(keyword, currentPage,pageSize);
		
		int total = goodsService.getKeywordCount(keyword);

		result.put("rows", goodslist);
		result.put("total", total);
		
		JsonUtil.writeJSON(result, response);
	}
	
	/**

	 * 管理端商品审核
	 * 
	 * @param request
	 * @return
	 * @throws IOException
	 */

	@RequestMapping(value = "/GoodsListsSh")
	public void GoodsListsSh(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		Map<String, Object> result = new HashMap<String, Object>();

		int currentPage = Integer.parseInt(request.getParameter("currentPage"));
		int pageSize = Integer.parseInt(request.getParameter("pageSize"));
		String keyword = request.getParameter("keyword");

		List<Goods> goodslist = goodsService.GoodsListsSh(keyword, currentPage,pageSize);
		
		int total = goodsService.getKeywordCountSh(keyword);

		result.put("rows", goodslist);
		result.put("total", total);
		
		JsonUtil.writeJSON(result, response);
	}

	/**

	 * 管理端用户管理
	 * 
	 * @param request
	 * @param responsegetGoodsLists
	 * @throws IOException
	 */
	@RequestMapping(value = "/getUserLists")

	public void getGoodsLists(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		Map<String, Object> result = new HashMap<String, Object>();
		int currentPage = Integer.parseInt(request.getParameter("currentPage"));
		int pageSize = Integer.parseInt(request.getParameter("pageSize"));
		String keyword = request.getParameter("keyword");

		List<User> list = userService.getUserLists(keyword, currentPage, pageSize);


		int total = userService.getKeywordCount(keyword);

		result.put("rows", list);
		result.put("total", total);
		JsonUtil.writeJSON(result, response);
	}

	/**
	 * 管理端用户列表导出
	 * 
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping("/exportUser")
	public void export(HttpServletResponse response) throws Exception {
		InputStream is = userService.getInputStream();
		response.setContentType("application/vnd.ms-excel");
		response.setHeader("contentDisposition",
				"attachment;filename=AllUsers.xls");
		ServletOutputStream output = response.getOutputStream();
		IOUtils.copy(is, output);
	}

	/**
	 * 修改用户状态
	 * 
	 * @param id
	 * @param pd
	 * @return
	 */
	@RequestMapping(value = "/update", produces = { "application/json;charset=UTF-8" })
	@ResponseBody
	public String updateUserStatus(@RequestParam("id") int id,
			@RequestParam("pd") String pd) {
		String result = "";
		User record = new User();
		int i = 0;
		if (pd.equals("j")) {
			record.setId(id);
			record.setStatus(new Byte("1"));
			i = userService.updateByPrimaryKeySelective(record);
		} else {
			record.setId(id);
			record.setStatus(new Byte("0"));
			i = userService.updateByPrimaryKeySelective(record);
		}
		if (i > 0) {
			result = "true";
		} else {
			result = "false";
		}
		return result;
	}
	
	/**
	 * 商品审核
	 * 
	 * @param id
	 * @param pd
	 * @return
	 */
	@RequestMapping(value = "/tjshGoods", produces = { "application/json;charset=UTF-8" })
	@ResponseBody
	public String tjshGoods(@RequestParam("good_status") String good_status,@RequestParam("id") int id) {
		String result = "";
		goodsService.updateGoodsStatusBygoodsId(good_status,id);
		int i = 0;
		if (i > 0) {
			result = "true";
		} else {
			result = "false";
		}
		return result;
	}
	
	/**
	 * 下架商品
	 * 
	 * @param id
	 * @param pd
	 * @return
	 */
	@RequestMapping(value = "/xjGoods", produces = { "application/json;charset=UTF-8" })
	@ResponseBody
	public String xjGoods(@RequestParam("goodsId") int goodsId,HttpServletRequest request){
		User cur_user = (User)request.getSession().getAttribute("cur_user");
		String result = "";
		Goods goods = goodsService.getGoodsByPrimaryKey(goodsId);
		goodsService.deleteGoodsByPrimaryKey(goodsId);
		int imgid = imageservice.getImagesId(goodsId);
		imageservice.deleteImagesByGoodsPrimaryKey(imgid);
		User user = userService.selectByPrimaryKey(goods.getUserId());
//		System.out.println(user.getGoodsNum());
//		int number = user.getGoodsNum()-1;
		
//		 uset.setGoodsNum(user-1);
//	     request.getSession().setAttribute("cur_user",cur_user);//修改session值
		
		int i = userService.updateGoodsNum(user.getId(),user.getGoodsNum()-1);
		if (i > 0) {
			result = "true";
		} else {
			result = "false";
		}
		return result;
	}
}