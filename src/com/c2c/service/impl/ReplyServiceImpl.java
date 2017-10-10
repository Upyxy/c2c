package com.c2c.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.c2c.dao.ReplyMapper;
import com.c2c.pojo.Reply;
import com.c2c.service.ReplyService;
import com.c2c.util.DateUtil;

@Service("replyService")
public class ReplyServiceImpl implements ReplyService {
	@Resource
	private ReplyMapper replyMapper;
	
	@Override
	public  int addReply(Reply reply){
		String createAt = DateUtil.getNowDay();
		reply.setCreateAt(createAt);
		return replyMapper.insert(reply);
	}
	public List<Reply> getReplyByCommentsId(Integer commentsId){
		List<Reply> replyList=replyMapper.getReplyByCommentsId(commentsId);
		return replyList;
	}
}
