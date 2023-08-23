package web;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class cal extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public cal() {
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String a = request.getParameter("data1");
		String b = request.getParameter("data2");
		Index i = new Index();
		// 문자값을 문자메소드로 전달 - > 최종값을 문자로 받는다
		// String result = i.test(a, b);
		// 문자값을 숫자로 변환 후 module로 값을 전달 후 결과값을 문자로 받는 형태
		String result = i.test2(Integer.parseInt(a), Integer.parseInt(b));
		request.setAttribute("total", result); // Controller - > View 로 가상의 객체 전달
		String username = "ㅋㅋ";
		request.setAttribute("name",username);
		// RequestDispatcher : View 실제 파일을 로드하여 해당 Controller 에서 보여지도록 하는 클래스
		RequestDispatcher rd = request.getRequestDispatcher("./index2.jsp");
		//해당 결과값 및 데이터를 모두 View에 전달
		rd.forward(request, response);
	}
}
