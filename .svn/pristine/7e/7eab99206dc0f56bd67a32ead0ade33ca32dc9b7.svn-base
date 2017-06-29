package cn.pet.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.pet.dao.RegisterDao;
import cn.pet.vo.Register;
@Service(value="registerService")
@Transactional
public class RegisterService {
	@Autowired
	private RegisterDao registerDao;

	public Register findByName(String username) {
		return registerDao.findByName(username);
	}

	public Register findByEmail(String email) {
		return registerDao.findByEmail(email);
	}

	public void save(Register register) {
		
		registerDao.save(register);
	}

	public Register login(String email, String password) {
		return registerDao.login(email,password);
	}
}
