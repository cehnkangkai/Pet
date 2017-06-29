package cn.pet.vo;

import java.util.List;

import cn.pet.vo.Message;
import cn.pet.vo.Pettalk;

public interface UserDao {
	public void sendPetTalk(Pettalk pettalk);
    public List<Pettalk> findAllPetTalk();
    public List<Pettalk> findAll(int a,int b);
    public int findTotalCount();
}
