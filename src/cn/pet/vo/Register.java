package cn.pet.vo;

public class Register {
	/**
	 * register_id          int not null,
   username             varchar(20),
   email                varchar(20),
   password             varchar(20),
   primary key (register_id)
	 */
	private Integer user_id;
	private String username;
	private String email;
	private String password;
	private User user;
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Integer getUser_id() {
		return user_id;
	}
	public void setUser_id(Integer user_id) {
		this.user_id = user_id;
	}
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
}
