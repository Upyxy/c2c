package com.c2c.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.c2c.pojo.Comments;
import com.c2c.pojo.Reply;
import com.c2c.pojo.User;
import com.c2c.service.CommentsService;
import com.c2c.service.ReplyService;
import com.c2c.service.UserService;
import com.c2c.util.JsonUtil;
/**
 * 回复
 * <p>Title:ReplyController</p>
 * <p>Description: 回复</p>
 * <p>Company:com.c2c</p>
 * @author Muling
 * @date 2017年10月11日 下午4:07:34
 * @version 1.0
 */
@Controller
@RequestMapping(value = "/reply")
public class ReplyController {
	@Autowired
	private UserService userService;
	@Autowired
	private CommentsService commentsService;
	@Autowired
	private ReplyService replyService;
/*
 * 添加回复
 */
	@RequestMapping(value = "/up", produces = { "application/json;charset=UTF-8" })
	@ResponseBody
	public String addReply(HttpServletRequest request, Reply reply,
			Comments comments) throws Exception {
		String msg = "";
		// 查询出当前用户cur_user对象，便于使用id
		User cur_user = (User) request.getSession().getAttribute("cur_user");
		reply.setUserId(cur_user.getId());
		// 获取当前评论id
		int atuserId = cur_user.getId();
		int commentId = Integer.parseInt(request.getParameter("commentId"));
		String replyContent = request.getParameter("replyContent");
		reply.setContent(replyContent);
		reply.setCommetId(commentId);
		reply.setAtuserId(atuserId);
		int i = replyService.addReply(reply);// 在comments表中插入评论
		if (i > 0) {
			msg = "true";
		} else {
			msg = "false";
		}
		return msg;
	}
//	/*
//	 * 
//	 */
//	@RequestMapping(value = "/updates")
//	public void updateReplys (HttpServletRequest request,HttpServletRequest response)throws Exception {
//		
//		int commentId= Integer.parseInt(request.getParameter("commentId"));
//		Map<String, Object> result = new HashMap<String, Object>();
//		List<Reply> replyList=replyService.getReplyByCommentsId(commentId);
//		result.put("replyList", replyList);
//		result.put("total", "s");
//
//		JsonUtil.writeJSON(result, response);
//	
//		
//		
//	}
	
	@RequestMapping(value = "/update")
	public void updateReply(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int commentId= Integer.parseInt(request.getParameter("commentId"));
		Map<String, Object> result = new HashMap<String, Object>();
		List<Reply> replyList=replyService.getReplyByCommentsId(commentId);
		result.put("replyList", replyList);
		JsonUtil.writeJSON(result, response);
	}
}
