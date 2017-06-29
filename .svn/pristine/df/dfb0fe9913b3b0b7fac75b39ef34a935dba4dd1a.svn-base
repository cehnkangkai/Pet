package cn.pet.dao;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import cn.pet.vo.Register;
@Repository(value="registerDaoImpl")
public class RegisterDaoImpl extends HibernateDaoSupport implements RegisterDao{
	@Resource(name="sessionFactory")
	public void setSesstionFactory2(SessionFactory sessionFactory){
		this.setSessionFactory(sessionFactory);
	}

	@Override
	public Register findByName(String username) {
		List<Register> list = (List<Register>) this.getHibernateTemplate().find("from Register where username=?",username);
		if (list != null && list.size()>0) {
			return list.get(0);
		}
		return null;
	}

	@Override
	public Register findByEmail(String email) {
		List<Register> list = (List<Register>) this.getHibernateTemplate().find("from Register where email=?",email);
		if (list != null && list.size()>0) {
			return list.get(0);
		}
		return null;
	}

	@Override
	public void save(Register register) {
		this.getHibernateTemplate().save(register);
	}

	@Override
	
	public Register login(String email, String password) {
		List<Register> uRegisters = (List<Register>) this.getHibernateTemplate().find("from Register where email =? and password =?", email,password);
		if (uRegisters.size()>0 && uRegisters != null) {
			return uRegisters.get(0);
		}
		return null;
	}
}
