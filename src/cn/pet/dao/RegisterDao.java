package cn.pet.dao;

import cn.pet.vo.Register;

public interface RegisterDao {

	Register findByName(String username);

	Register findByEmail(String email);

	void save(Register register);

	Register login(String email, String password);

}
