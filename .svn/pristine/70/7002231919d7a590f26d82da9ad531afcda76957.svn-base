package cn.pet.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.pet.dao.LForPetDao;
import cn.pet.vo.LookForPet;

@Transactional
@Service(value="lForPetSrvice")
public class LForPetSrvice {
	@Autowired
	private LForPetDao lForPetDao;

	public void saveLfPet(LookForPet lookForPet) {
		lForPetDao.saveLfPet(lookForPet);
	}
}
