package cn.pet.action;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import cn.pet.service.MessageService;
import cn.pet.utils.FastJsonUtil;
import cn.pet.utils.UtilsFactory;
import cn.pet.vo.Comment;
import cn.pet.vo.Message;
import cn.pet.vo.Pettalk;
import cn.pet.vo.Register;


@Controller(value="commentAction")
@Scope(value="prototype")
public class CommentAction extends ActionSupport implements ModelDriven<Comment>{
	@Resource(name="messageService")
	private MessageService messageService;
	private Comment comment=new Comment();

	@Override
	public Comment getModel() {
		
		return comment;
	}

	
	public String sendComment() throws Exception{//1:�����û�����
		HttpServletRequest request=ServletActionContext.getRequest();
		HttpSession session=request.getSession();	
		Register register=(Register) session.getAttribute("uRegister");//�õ���ǰ�û���Ϣ
		if (register == null) {
			return "login";
		}else{
			
			Integer talkid=Integer.parseInt(request.getParameter("pettalkid"));
			request.setAttribute("pettalk_id", talkid);
			Pettalk pettalk=messageService.getPettalkByid(talkid);
			String username=register.getUsername();//����û�����
			String datetime=UtilsFactory.getDate();//��õ�ǰʱ��
			comment.setDatetime(datetime);
			comment.setUsername(username);	
			comment.setPettalk(pettalk);
			messageService.sendComment(comment);
			return findCommentByPettalkid();	
		}
	}
	
	public String findCommentByPettalkid() throws Exception{//2:�鿴��˵˵�µ�����
		HttpServletRequest request=ServletActionContext.getRequest();
		Integer id=(Integer) request.getAttribute("pettalk_id");
		comment = messageService.findCommentByPettalkid(id);
		
		HttpServletResponse response=ServletActionContext.getResponse();
		
		String jsonString = FastJsonUtil.toJSONString(comment);
		FastJsonUtil.write_json(response, jsonString);
     	return NONE;
		}
	
    public String showMap(){//3:��ʾ��ͼ
    	HttpServletResponse response=ServletActionContext.getResponse();
    	response.setContentType("text/html;charset=utf-8");
		return "map";
    	
    }
    

}
