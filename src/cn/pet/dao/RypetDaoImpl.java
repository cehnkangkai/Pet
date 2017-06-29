package cn.pet.dao;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import cn.pet.vo.Rypet;

@Repository(value="rypetDaoImpl")
public class RypetDaoImpl extends HibernateDaoSupport implements RypetDao{
	@Resource(name="sessionFactory")
	public void set2SessionFactory(SessionFactory sessionFactory){
		this.setSessionFactory(sessionFactory);
	}

	@Override
	public void savePet(Rypet rypet) {
		this.getHibernateTemplate().save(rypet);
	}

	@Override
	public List<Rypet> findAll() {
		return (List<Rypet>) this.getHibernateTemplate().find("from Rypet where state =?",1);
	}

	@Override
	public Rypet findById(Integer rypet_id) {
		List<Rypet> list = (List<Rypet>) this.getHibernateTemplate().find("from Rypet where rypet_id = ?", rypet_id);
		if (list.size()>0 && list != null) {
			return list.get(0);
		}
		return null;
	}

	@Override
	public List<Rypet> findAllAdopt() {
		
		return (List<Rypet>) this.getHibernateTemplate().find("from Rypet where state = ?", 0);
	}

/*	@Override
	public Rypet findById(Integer rypet_id) {
		List<Rypet> list = (List<Rypet>) this.getHibernateTemplate().find("from Rypet where rypet_id = ?", rypet_id);
		if (list.size()>0 && list != null) {
			return list.get(0);
		}
		return null;
	}*/
}
