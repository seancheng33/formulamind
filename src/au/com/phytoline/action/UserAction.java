package au.com.phytoline.action;

import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;

import au.com.phytoline.entity.User;
import au.com.phytoline.service.UserService;

public class UserAction extends ActionSupport implements SessionAware, RequestAware {
	User user;
	UserService userService;
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	Map<String, Object> session;
	Map<String, Object> request;


	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	
	
	public String checkLogin(){
		List list;
		User condition = new User();
		condition.setUname(user.getUname());
		condition.setUpassword(user.getUpassword());
		list =userService.login(condition);
		if(list.size()>0){
			session.put("LoginUser", condition);
		}
		return "login";
	}
	public String logOut(){
		session.remove("LoginUser");
		return "logout";
	}

	@Override
	public void setRequest(Map<String, Object> request) {
		this.request = request;
	}

	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

}
