package cn.pet.vo;


public class Comment {
	private Integer comment_id;//自身id
	private String datetime;//时间
	private String pcontent;//评论内容	
	private String username;//记录评论对应的用户
	private Pettalk pettalk;
	
	
	public Integer getComment_id() {
		return comment_id;
	}
	public void setComment_id(Integer comment_id) {
		this.comment_id = comment_id;
	}
	
	public String getDatetime() {
		return datetime;
	}
	public void setDatetime(String datetime) {
		this.datetime = datetime;
	}


	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	
	public String getPcontent() {
		return pcontent;
	}
	public void setPcontent(String pcontent) {
		this.pcontent = pcontent;
	}
	public Pettalk getPettalk() {
		return pettalk;
	}
	public void setPettalk(Pettalk pettalk) {
		this.pettalk = pettalk;
	}
	

}
