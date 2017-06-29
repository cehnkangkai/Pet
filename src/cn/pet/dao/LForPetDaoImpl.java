package cn.pet.dao;

import javax.annotation.Resource;

import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import cn.pet.vo.LookForPet;
@Repository(value="lForPetDaoImpl")
public class LForPetDaoImpl extends HibernateDaoSupport implements LForPetDao{
	@Resource(name="sessionFactory")
	public void setSesstionFactory2(SessionFactory sessionFactory){
		this.setSessionFactory(sessionFactory);
	}

	@Override
	public void saveLfPet(LookForPet lookForPet) {
		this.getHibernateTemplate().save(lookForPet);
	}
}
