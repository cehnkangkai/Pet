package cn.pet.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.pet.dao.MessageDaoImpl;
import cn.pet.vo.Comment;
import cn.pet.vo.Message;
import cn.pet.vo.Pettalk;


@Service(value="messageService")
@Transactional
public class MessageService {
	@Autowired
	private MessageDaoImpl messageDaoImpl;

	public void sendComment(Comment comment) {
		messageDaoImpl.sendComment(comment);
		
	}

	public Pettalk getPettalkByid(Integer talkid) {
		
		return messageDaoImpl.getPettalkById(talkid);
	}

	public Comment findCommentByPettalkid(Integer id) {
		
		return messageDaoImpl.findCommentByPettalkid(id);
	}

}
