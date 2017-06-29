package cn.pet.dao;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import cn.pet.vo.Comment;
import cn.pet.vo.Message;
import cn.pet.vo.Pettalk;
import cn.pet.vo.Register;

@Repository(value="messageDaoImpl")
public class MessageDaoImpl extends HibernateDaoSupport implements MessageDao{
	@Resource(name="sessionFactory")
	public void setSesstionFactory2(SessionFactory sessionFactory){
		this.setSessionFactory(sessionFactory);
	}

	@Override
	public void sendComment(Comment comment) {
		this.getHibernateTemplate().save(comment);//��������
	}

	@Override
	public Pettalk getPettalkById(Integer talkid) {//����Id���Ҷ�Ӧ��˵˵����
		List<Pettalk> pettalks = (List<Pettalk>) this.getHibernateTemplate().find("from Pettalk where pettalk_id =?",talkid);
		if (pettalks.size()>0 && pettalks != null) {
			return pettalks.get(0);
		}
		return null;
	}

	public Comment findCommentByPettalkid(Integer id) {
		List<Comment> list = (List<Comment>) this.getHibernateTemplate().find("from Comment where pettalk_id =?", id);
		if (list != null ) {
			Comment comment = list.get(0);
			return comment;
		}
		return null;//����pettalk_id����ѯ��˵˵�µ���������
	}


	

	
}
