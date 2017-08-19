package au.com.phytoline.interceptor;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.StrutsStatics;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

import au.com.phytoline.entity.User;

public class LoginInterceptor extends AbstractInterceptor {

	private static final long serialVersionUID = 1L;

	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		ActionContext actionContext = invocation.getInvocationContext();
		//获取session
		Map<String, Object> session =actionContext.getSession();
		//获取request，用于后面再返回错误跳转到登录页面是，传值没有权限，需要登录的提示
		HttpServletRequest request= (HttpServletRequest) actionContext.get(StrutsStatics.HTTP_REQUEST);
		
		User users = (User) session.get("LoginUser");
		if(users == null){
			//如果session中没有user，就是没有登录，将提示没有权限，返回错误，跳转到登录页面
			request.setAttribute("LoginTip", "No access,Sign-in you account!");
			return "error";
		}
		
		return invocation.invoke();
	}

}
