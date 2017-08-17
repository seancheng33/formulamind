package au.com.phytoline.interceptor;

import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

import au.com.phytoline.entity.User;

public class LoginInterceptor extends AbstractInterceptor {

	private static final long serialVersionUID = 1L;

	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		ActionContext actionContext = invocation.getInvocationContext();
		Map<String, Object> session =actionContext.getSession();
		User users = (User) session.get("LoginUser");
		//System.out.println(users.getUname());
		
		if(users != null){
			return invocation.invoke();
		}
		return "error";
	}

}
