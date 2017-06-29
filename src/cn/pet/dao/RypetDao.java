package cn.pet.dao;

import java.util.List;

import cn.pet.vo.Rypet;

public interface RypetDao {

	void savePet(Rypet rypet);

	List<Rypet> findAll();

	Rypet findById(Integer rypet_id);

	List<Rypet> findAllAdopt();




}
