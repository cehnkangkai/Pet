package cn.pet.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.pet.vo.Pettalk;
import cn.pet.vo.UserDaoImpl;
@Service(value="userService")
@Transactional
public class UserService {
	@Autowired
	private UserDaoImpl userDaoImpl;

	public UserService() {

	}

	
	public void  sendPetTalk(Pettalk pettalk){//发说说
		System.out.println("userService方法执行了");
		userDaoImpl.sendPetTalk(pettalk);
	}
	public List<Pettalk> findAllPetTalk() {
		return userDaoImpl.findAllPetTalk();
		
	}

	public List<Pettalk> findAll(int pageNow,int pageSize) {//查询从pageNow到pageNow+pageSize
		return userDaoImpl.findAll(pageNow, pageSize);	
	}
	
	public int findTotalCount() {// 获得总页数
		return userDaoImpl.findTotalCount();

	}



	public Pettalk findByIdTalk(Integer id) {
		return userDaoImpl.findByIdTalk(id);
	}


	public void deleteTalkById(Pettalk pettalk) {
		userDaoImpl.deleteTalkById(pettalk);
	}

}
