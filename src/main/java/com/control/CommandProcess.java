package com.control;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface CommandProcess { //command.properties 먼저 생성후 4번쨰 [ 김찬영  2023-09-7 오후 02:06:55 ]

	public abstract String requestPro(HttpServletRequest request, HttpServletResponse response);
	// 추상메소드 abstract 생략가능 하고 써도된다.
	//if 절 쓰지 않고 성능개선을 위해서 상속을 가지고 쓴다. 그래서 추상메소드를 쓸것이다.
	
}
