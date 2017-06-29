package cn.pet.vo;

/*


*/public class Pettalk {
	private Integer pettalk_id;
	private String photoName; // 存储在服务器的文件名称
	private String dt;// 时间
	private String photoPath;// 相对路径
	private String photoPathTwo;// 相对路径
	private String photoPathThere;// 相对路径
	
	private String content;// 说说内容
	private Register register;
	public String getPhotoPathTwo() {
		return photoPathTwo;
	}
	public void setPhotoPathTwo(String photoPathTwo) {
		this.photoPathTwo = photoPathTwo;
	}
	public String getPhotoPathThere() {
		return photoPathThere;
	}
	public void setPhotoPathThere(String photoPathThere) {
		this.photoPathThere = photoPathThere;
	}
	public Integer getPettalk_id() {
		return pettalk_id;
	}
	public void setPettalk_id(Integer pettalk_id) {
		this.pettalk_id = pettalk_id;
	}
	public String getPhotoName() {
		return photoName;
	}
	public void setPhotoName(String photoName) {
		this.photoName = photoName;
	}
	public String getDt() {
		return dt;
	}
	public void setDt(String dt) {
		this.dt = dt;
	}
	public String getPhotoPath() {
		return photoPath;
	}
	public void setPhotoPath(String photoPath) {
		this.photoPath = photoPath;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	public Register getRegister() {
		return register;
	}
	public void setRegister(Register register) {
		this.register = register;
	}

	

}
