package member.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import member.dao.MemberDAO;

public class CheckIdService implements CommandProcess {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		//데이터
		String id = request.getParameter("id");
		//DB
		MemberDAO memberDAO = new MemberDAO();
		boolean idcheck = memberDAO.isExistId(id);
		
		//응답
		if(idcheck == true) {
			return "/member/checkIdFail.jsp";
		}else {
			
			return "/member/checkIdOk.jsp";
		}
		
	};
}
