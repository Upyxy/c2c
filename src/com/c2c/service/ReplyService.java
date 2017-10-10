package com.c2c.service;

import java.util.List;

import com.c2c.pojo.Reply;

public interface ReplyService {

	int addReply(Reply reply);

	List<Reply> getReplyByCommentsId(Integer commentsId);

}
