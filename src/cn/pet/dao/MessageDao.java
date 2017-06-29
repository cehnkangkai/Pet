package cn.pet.dao;

import java.util.List;

import cn.pet.vo.Comment;
import cn.pet.vo.Message;
import cn.pet.vo.Pettalk;


public interface MessageDao {
	void sendComment(Comment message);
	
	Pettalk getPettalkById(Integer id);
	
	Comment  findCommentByPettalkid(Integer id);

}
