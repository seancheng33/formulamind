package au.com.phytoline.action;

import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;

import au.com.phytoline.entity.User;
import au.com.phytoline.service.UserService;

public class UserAction extends ActionSupport implements SessionAware, RequestAware {
	private static final long serialVersionUID = 1L;
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

	public String checkLogin() {
		List<?> list;
		User condition = new User();
		condition = user;
		if(user.getUname() == null||user.getUname().isEmpty()){
			request.put("LoginTip", "Username is null!");
			return "retry";
		}
		if(user.getUpassword() == null||user.getUpassword().isEmpty()){
			request.put("LoginTip", "Password is null!");
			return "retry";
		}

		list = userService.login(condition);
		if (list.size() > 0) {
			//校验成功后的对象需要保存到session中，完成登录
			//拦截器是根据session中有没有LoginUser的对象决定拦截
			session.put("LoginUser", condition);
			return "login";
		} else {
			request.put("LoginTip", "Incorrect username or password!");
			return "retry";
		}
	}

	public String logOut() {
		//移除session中的LoginUser的对象，达到退出登录的目的
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
