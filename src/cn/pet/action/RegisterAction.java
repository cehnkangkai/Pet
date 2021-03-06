package cn.pet.action;

import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.PrintWriter;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import cn.itcast.vcode.utils.VerifyCode;
import cn.pet.service.RegisterService;
import cn.pet.vo.Register;

@Controller(value = "registerAction")
@Scope(value = "prototype")
public class RegisterAction extends ActionSupport implements ModelDriven<Register> {
	@Resource(name = "registerService")
	private RegisterService registerService;
	private Register register = new Register();

	@Override
	public Register getModel() {
		return register;
	}

	/**
	 * 根据用户名查询
	 * 
	 */
	public String checkName() {
		Register existRegister = registerService.findByName(register.getUsername());
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=UTF-8");
		try {
			PrintWriter writer = response.getWriter();
			if (existRegister != null) {
				writer.print("no");
			} else {
				writer.print("yes");
			}
		} catch (IOException e) {
			e.printStackTrace();
		}

		return NONE;
	}

	/**
	 * 根据邮箱 查询
	 */
	public String checkEmail() {
		Register eRegister = registerService.findByEmail(register.getEmail());
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=UTF-8");
		try {
			PrintWriter writer = response.getWriter();
			if (eRegister != null) {
				writer.print("no");
			} else {
				writer.print("yes");
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return NONE;
	}

	/**
	 * 生成验证码
	 */
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpServletResponse response = ServletActionContext.getResponse();
	public String image() throws IOException {
		/*
		 * 1. 创建验证码类
		 */
		VerifyCode vc = new VerifyCode();
		/*
		 * 2. 得到验证码图片
		 */
		BufferedImage image = vc.getImage();
		/*
		 * 3. 把图片上的文本保存到session中
		 */
	/*	HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();*/
		request.getSession().setAttribute("session_vcode", vc.getText());
		/*
		 * 4. 把图片响应给客户端
		 */
		VerifyCode.output(image, response.getOutputStream());
		return NONE;
		
	}
	/**
	 * 校检验证码
	 */
	public String checkImage() {
	
		String img = request.getParameter("image");
		String imgs = (String) request.getSession().getAttribute("session_vcode");
		try {
			PrintWriter writer = response.getWriter();
			if (img.equals(imgs)) {
				writer.print("yes");
			}else {
				writer.print("no");
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return NONE;
	}
	/**
	 * 用户注册
	 * 
	 */
	public String regist(){
		registerService.save(register);
		return "saveS";
	}
	/**
	 * 用户登录
	 */
	public String login(){
		Register uRegister = registerService.login(register.getEmail(),register.getPassword());
		if (uRegister != null) {
			request.getSession().setAttribute("uRegister", uRegister);
			return "loginS";
		}else{
			return "login";
		}
	
	}
	/**
	 * 宠物详细界面看联系方式登录
	 */
	public String login2(){
		Register uRegister = registerService.login(register.getEmail(),register.getPassword());
		if (uRegister != null) {
			request.getSession().setAttribute("uRegister", uRegister);
			return "loginS2";
		}else{
			return "login";
		}
	
	}
	public String login3(){
		Register uRegister = registerService.login(register.getEmail(),register.getPassword());
		if (uRegister != null) {
			request.getSession().setAttribute("uRegister", uRegister);
			return "loginS3";
		}else{
			return "login";
		}
		
	}
	/**
	 * 用户退出
	 */
	public String exit() {
		ServletActionContext.getRequest().getSession().removeAttribute("uRegister");
		return LOGIN;
	}
}



















