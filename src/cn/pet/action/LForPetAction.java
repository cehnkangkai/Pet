package cn.pet.action;

import java.io.File;
import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.Servlet;

import org.apache.struts2.ServletActionContext;
import org.aspectj.util.FileUtil;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import cn.pet.service.LForPetSrvice;
import cn.pet.utils.UploadUtils;
import cn.pet.vo.LookForPet;
import cn.pet.vo.Register;

@Controller(value = "lForPetAction")
@Scope(value = "prototype")
public class LForPetAction extends ActionSupport implements ModelDriven<LookForPet> {
	@Resource(name = "lForPetSrvice")
	private LForPetSrvice lForPetSrvice;
	private LookForPet lookForPet = new LookForPet();

	@Override
	public LookForPet getModel() {
		return lookForPet;
	}

	private File upload;
	private String uploadFileName;
	private String uploadContentType;

	/**
	 * —∞’“≥ËŒÔ±£¥Ê
	 */
	public void setUpload(File upload) {
		this.upload = upload;
	}

	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}

	public void setUploadContentType(String uploadContentType) {
		this.uploadContentType = uploadContentType;
	}

	public String saveLfPet() throws IOException {
		Register register = (Register) ServletActionContext.getRequest().getSession().getAttribute("uRegister");
		if (register != null) {

			if (uploadFileName != null) {
				String uuidName = UploadUtils.getUUIDName(uploadFileName);
//				String path = "D:\\java_softwore\\tomcat\\webapps\\upload\\";
				String path = "\\usr\\java\\tomcat\\upload\\";
				File file = new File(path + uuidName);
				FileUtil.copyFile(upload, file);
				lookForPet.setLookforImag(uuidName);
			}

			lookForPet.setRegister(register);
			String newname = lookForPet.getLookforAddr().replace(",", "-");
			lookForPet.setLookforAddr(newname);
			lForPetSrvice.saveLfPet(lookForPet);
			return "saveLfPetS";
		}
		return LOGIN;
	}
}
