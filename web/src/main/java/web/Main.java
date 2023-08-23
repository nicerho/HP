package web;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//controller 파트
public class Main extends HttpServlet {
	// 웹 통신에 사용하기 위한 암호화된 페에지 명시한 메모리 형태의 명령어
	private static final long serialVersionUID = 1L;

	public Main() {
		super();
	}

	// doGet은 html에서 get을 받는다
//	protected void doGet(HttpServletRequest request, HttpServletResponse response)
//			throws ServletException, IOException {
//		String a = request.getParameter("data");
//		System.out.println(a);
//	}
	// doPost은 html에서 Post를 받는다

	/*
	 * HttpServletRequest : Front에서 값을 넘겨 받는 통신 언어 
	 * HttpServletResponse : 결과값을 출력 또는 Front로 return 하는 통신 언어 
	 * getParameter : Front에 사용하는 'name'의 이름(모든 데이터는 String 또는 boolean 타입으로 구성된다) 
	 *  
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String a = request.getParameter("data");
		System.out.println(a);
	}

}
