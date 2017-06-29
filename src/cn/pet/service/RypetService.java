package cn.pet.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.pet.dao.RypetDao;
import cn.pet.vo.Rypet;

@Transactional
@Service(value="rypetService")
public class RypetService {
	@Autowired
	private RypetDao rypetDao;

	public void savePet(Rypet rypet) {
		rypet.setState(1);//1 表示认领
		rypetDao.savePet(rypet);
	}

	public List<Rypet> findAll() {
		return rypetDao.findAll();
	}

	public Rypet findById(Integer rypet_id) {
		return rypetDao.findById(rypet_id);
	}

	public void savePetAdopt(Rypet rypet) {
		rypet.setState(0);//0表示领养
		rypetDao.savePet(rypet);
	}

	public List<Rypet> findAllAdopt() {
		return rypetDao.findAllAdopt();
	}


	
}
