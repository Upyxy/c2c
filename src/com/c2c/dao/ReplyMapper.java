package com.c2c.dao;

import java.util.List;

import com.c2c.pojo.Reply;

public interface ReplyMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Reply record);

    int insertSelective(Reply record);

    Reply selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Reply record);

    int updateByPrimaryKeyWithBLOBs(Reply record);

    int updateByPrimaryKey(Reply record);

	public List<Reply> getReplyByCommentsId(Integer commentsId);

	
}