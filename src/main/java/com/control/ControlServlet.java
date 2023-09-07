package com.control;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//1번 [ 김찬영  2023-09-7 오후 12:29:31 ]
@WebServlet(
		urlPatterns = {"*.do"},
		initParams = {
				@WebInitParam(name="propertyConfig" , value="command.properties")
		}
	)
public class ControlServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Map<String,Object> map = new HashMap<String,Object>();

	@Override
	public void init(ServletConfig config) throws ServletException{
		String propertyConfig = config.getInitParameter("propertyConfig");
		System.out.println("propertyConfig = " + propertyConfig);
		
		//만약에 web.xml을 설정하면 아래의 3줄이 필요없다.
		String realFolder = config.getServletContext().getRealPath("/WEB-INF");
		String realPath = realFolder + "/" + propertyConfig;
		System.out.println("realPath = " + realPath);
		//--------------------------------------
		
		FileInputStream fin = null;
		Properties properties = new Properties();
		
		try {
			//만약에 web.xml로 설정하면 fin = new FileInputStream(propertyConfig);
			fin = new FileInputStream(realPath);
	                  
	         properties.load(fin);
	         System.out.println("properties = "+properties);
	         
	      } catch (IOException e) {
	         e.printStackTrace();
	      }finally{
	         try {
	            fin.close();
	         } catch (IOException e) {
	            e.printStackTrace();
	         }
	      }
	      System.out.println();
	      
	      Iterator it = properties.keySet().iterator();
	      while(it.hasNext()) {
	         String key = (String)it.next();
	         System.out.println("key = "+key);
	         
	         String className = properties.getProperty(key);
	         System.out.println("className = "+className);
	         
	         try {
	            Class<?> classType = Class.forName(className);
	            Object ob = classType.newInstance();
	            
	            System.out.println("ob = "+ob);
	            
	            map.put(key, ob);
	            
	         } catch (ClassNotFoundException e) {
	            e.printStackTrace();
	         } catch (InstantiationException e) {
	            e.printStackTrace();
	         } catch (IllegalAccessException e) {
	            e.printStackTrace();
	         } catch (IllegalArgumentException e) {
	            e.printStackTrace();
	         } 
	         
	         System.out.println();
	      }//while
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		execute(request,response); //get 이든 post든 execute로 모인다.
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		execute(request,response); //get 이든 post든 execute로 모인다.
	}
	
	protected void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//한글처리(단 , 한글은 post일때만 한글처리해주면된다.)
		if(request.getMethod().equals("POST")) { //getMethod() 는 jsp에서 <form method =""> 부분을 가져오라는 말임.
			request.setCharacterEncoding("UTF-8");
		}//if
		//요청이 들어왔을 때 => http://localhost:8080/memberMVC/member/writeForm.do
		String category = request.getServletPath(); //프로젝트명 뒤에있는 애들주소가져온다.
		System.out.println("category = "+category); // 결과가 /member/writeForm.do 나온다.
		
		CommandProcess com = (CommandProcess)map.get(category); //member.service.WriteFormService
		String view = null;
		
		try {
			view = com.requestPro(request, response); // "/member/writeForm.jsp"
		} catch (Throwable e) {
			e.printStackTrace();
		}
		
		//forward
		RequestDispatcher dispatcher = request.getRequestDispatcher(view);//상대번지
		dispatcher.forward(request, response);//제어권 넘기기
		
	}

}
