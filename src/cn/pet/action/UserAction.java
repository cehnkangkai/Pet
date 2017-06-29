package cn.pet.action;

import java.io.File;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.persistence.Id;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FileUtils;
import org.apache.logging.log4j.core.util.UuidUtil;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import cn.pet.service.UserService;
import cn.pet.utils.UploadUtils;
import cn.pet.utils.UtilsFactory;
import cn.pet.vo.Message;
import cn.pet.vo.Pettalk;
import cn.pet.vo.Register;
import cn.pet.vo.User;

@Controller(value = "userAction")
@Scope(value = "prototype")
public class UserAction extends ActionSupport implements ModelDriven<Pettalk> {
	@Resource(name = "userService")
	private UserService userService;
	private Pettalk pettalk = new Pettalk();
	private List<Pettalk> list;
	private int pageNow = 1;// ��ǰҳ��
	private int pageSize = 1;// ҳ���������ʾ

	HttpServletRequest request;

	public int getPageNow() {
		return pageNow;
	}

	public void setPageNow(int pageNow) {
		this.pageNow = pageNow;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	// ������Ƭ��Ҫ��Action���ṩ��������:
	private File[] upload;// ���ڽ����ļ�
	private String[] uploadContentType;// �ļ���MIME����
	private String[] uploadFileName;// �ļ���
	// �ṩ�������Ե�set����:

	@Override
	public Pettalk getModel() {
		return pettalk;
	}

	public void setUpload(File[] upload) {
		this.upload = upload;
	}

	public void setUploadContentType(String[] uploadContentType) {
		this.uploadContentType = uploadContentType;
	}

	public void setUploadFileName(String[] uploadFileName) {
		this.uploadFileName = uploadFileName;
	}

	public List<Pettalk> getList() {
		return list;
	}

	public String sendPetTalk() throws Exception {// 1:��˵˵(����ͼƬ) // ����ļ���:

		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		if (session.getAttribute("uRegister") != null) {// δ��½���ܷ�˵˵
			ServletContext application = ServletActionContext.getServletContext();
			String path = application.getRealPath("").replace("Pet", "upload");
			String[] arryName = new String[4];
			for (int i = 0; i < upload.length; i++) {
				// ����ļ�����:
				String newName = UploadUtils.getUUIDName(uploadFileName[i]);// ͼƬ��������

				// ����һ���ļ����͵Ķ���.
				// ����ʱ�����ı��ļ�������
				File diskFile = new File(path + "/" + newName);
				// ��commons-io������һ��������:
				FileUtils.copyFile(upload[i], diskFile);// ���ļ��ŵ��������˵�����ļ�����
				arryName[i] = newName;
			}
			pettalk.setPhotoName(arryName[0].toString());// ��һ��ͼƬ·��
			pettalk.setPhotoPath(arryName[1].toString());// ��2��ͼƬ·��
			pettalk.setPhotoPathTwo(arryName[2].toString());//��3��ͼƬ·��
			pettalk.setPhotoPathThere(arryName[3].toString());//��4��ͼƬ·��
			pettalk.setDt(UtilsFactory.getDate());// ʱ��
			pettalk.setRegister((Register) session.getAttribute("uRegister"));
			userService.sendPetTalk(pettalk);// ����ҵ���
			return findAllPetTalk();
		} else {
			return LOGIN;
		}

	}

	public String findAllPetTalk() {// 2:��ѯ����˵˵
		list = userService.findAllPetTalk();
		return "findAllPetTalkSuccess";
		/*
		 * if(list!=null){
		 * 
		 * }else{ return ERROR; }
		 */
	}
	//��ѯ����˵˵
	public String findAll() {// ��ѯ��pageNow��pageSize��˵˵
		int total = userService.findTotalCount();
		System.out.println("��ҳ" + total);
		list = userService.findAll(pageNow, pageSize);
		HttpServletRequest request = ServletActionContext.getRequest();
		request.setAttribute("pageNow", pageNow);
		request.setAttribute("totalPage", total);// ����������request����
		return "findAllSuccess";
	}
	//ͨ��Idɾ��˵˵
	public String deleteTalk() {
		Integer id = pettalk.getPettalk_id();
		pettalk = userService.findByIdTalk(id);
		userService.deleteTalkById(pettalk);
		return findAllPetTalk();
	}
}


















