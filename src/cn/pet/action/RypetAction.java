package cn.pet.action;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.aspectj.util.FileUtil;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.mchange.io.FileUtils;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.util.ValueStack;
import com.sun.org.apache.bcel.internal.generic.NEW;

import cn.pet.service.RypetService;
import cn.pet.utils.UploadUtils;
import cn.pet.utils.UploadUtils2;
import cn.pet.vo.Register;
import cn.pet.vo.Rypet;
import cn.pet.vo.User;

@Controller(value = "rypetAction")
@Scope(value = "prototype")
public class RypetAction extends ActionSupport implements ModelDriven<Rypet> {
	@Resource(name = "rypetService")
	private RypetService rypetService;
	private Rypet rypet = new Rypet();

	@Override
	public Rypet getModel() {
		return rypet;
	}

	// 图片上传
	private File[] upload;
	private String[] uploadFileName;
	private String[] uploadContentType;

	public void setUpload(File[] upload) {
		this.upload = upload;
	}

	public void setUploadFileName(String[] uploadFileName) {
		this.uploadFileName = uploadFileName;
	}

	public void setUploadContentType(String[] uploadContentType) {
		this.uploadContentType = uploadContentType;
	}

	List<String> list = new ArrayList<String>();
	String newName;
	String substringName;
	HttpSession session = ServletActionContext.getRequest().getSession();

	/**
	 * 发布领养宠物信息
	 * 
	 * @throws IOException
	 */
	public String adoptPet() throws IOException {
		Register existUser = (Register) session.getAttribute("uRegister");
		if (existUser != null) {

			String[] arryName = new String[3];
			for (int i = 0; i < upload.length; i++) {
				String uuidName = UploadUtils.getUUIDName(uploadFileName[i]);
//				String path = "\\usr\\java\\tomcat\\upload\\";
				String path = "D:\\java_softwore\\tomcat\\webapps\\upload\\";
				File file = new File(path + uuidName);
				FileUtil.copyFile(upload[i], file);
				// newName = new String(uuidName);
				arryName[i] = uuidName;

			}
			// 设置本机时间
			Date date = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
			String str = sdf.format(date);
			rypet.setPetFindImage(arryName[0].toString());
			rypet.setPetFindfimg(arryName[1].toString());
			rypet.setPetFindfimg2(arryName[2].toString());
			rypet.setRegister(existUser);
			rypet.setUserName(existUser.getUsername());
			rypet.setPutTime(str);
			rypetService.savePetAdopt(rypet);
			return "adoptPetS";
		}
		return LOGIN;
	}

	/**
	 * 通过主键查询领养的宠物
	 */
	public String findAdoptById() {
		rypet = rypetService.findById(rypet.getRypet_id());
		return "findAdoptByIdS";
	}

	/**
	 * 查询所有的领养动物
	 */
	public String findPetAllAdopt() {
		List<Rypet> list = rypetService.findAllAdopt();
		ValueStack valueStack = ServletActionContext.getContext().getValueStack();
		valueStack.set("list", list);
		return "findPetAllAdoptS";
	}

	/**
	 * 发布认领宠物信息
	 * 
	 * @throws IOException
	 */
	public String savePet() throws IOException {
		Register existUser = (Register) session.getAttribute("uRegister");
		String[] image = new String[3];
		if (existUser != null) {

			for (int i = 0; i < upload.length; i++) {

				String uuidName = UploadUtils.getUUIDName(uploadFileName[i]);
				String path = "D:\\java_softwore\\tomcat\\webapps\\upload\\";
				File file = new File(path + uuidName);
				FileUtil.copyFile(upload[i], file);
				image[i] = uuidName;
				// newName = new String(uuidName);
				// list.add(newName);

			}
			rypet.setPetFindImage(image[0].toString());
			rypet.setPetFindfimg(image[1].toString());
			rypet.setPetFindfimg2(image[2].toString());

			// rypet.setPetFindImage(list.toString().substring(1,
			// list.get(0).length() * 2 + 3));
			String newAddress = rypet.getPetFindAddr().substring(2).replace(",", "-");

			rypet.setRegister(existUser);

			rypet.setPetFindAddr(newAddress);
			rypetService.savePet(rypet);

			return "savePetS";
		}
		return LOGIN;
	}

	/**
	 * 查询所有的宠物认领
	 */
	public String findPetAll() {
		List<String> list2 = new ArrayList<>();
		List<Rypet> list1 = rypetService.findAll();
		/*
		 * for (Rypet rypet : list1) { String petFindImage =
		 * rypet.getPetFindImage(); String[] split = petFindImage.split(", ");
		 * 
		 * String image1 = split[0].toString(); String image2 =
		 * split[1].toString();
		 * 
		 * list2.add(image1); //
		 * ServletActionContext.getRequest().getSession().setAttribute("image1",
		 * // image1);
		 * 
		 * }
		 */
		/*
		 * for(int i=0;i<list1.size();i++){ String petFindImage =
		 * rypet.getPetFindImage(); String[] split = petFindImage.split(", ");
		 * 
		 * String image1 = split[i].toString(); // list1.add(image1); }
		 */

		ValueStack valueStack = ServletActionContext.getContext().getValueStack();
		valueStack.set("list", list1);
		// valueStack.set("list2", list2);
		return "findAllS";
	}

	/**
	 * 通过主键查找pet
	 */
	public String findPetById() {
		rypet = rypetService.findById(rypet.getRypet_id());

		return "findPetByIdS";
	}
}
