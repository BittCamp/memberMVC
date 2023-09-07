package member.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.control.CommandProcess;

public class LogoutService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession(); //세션생성
		
		session.removeAttribute("memname");
		session.removeAttribute("memEmail");
		
		session.invalidate();  //무효화
		
		return "/member/logout.jsp";
	}

}
