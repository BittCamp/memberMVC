package member.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

public class WriteFormService implements CommandProcess { // 5번째 [ 김찬영  2023-09-7 오후 02:13:01 ]

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		return "/member/writeForm.jsp";
	};
}
