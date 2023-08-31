package web;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public Login() {
		super();
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String uid = request.getParameter("mid");
		String upw = request.getParameter("mpw");

		try {
			HttpSession session = request.getSession();
			PreparedStatement ps = null;
			dbconfig db = new dbconfig();
			Connection con = db.info();
			String password = "select password('" + upw + "') as pwd";
			ps = con.prepareStatement(password);
			ResultSet result = ps.executeQuery(); // executeQuery -> select 전용 ResultSet 타입으로 받는다 배열형태로
			String user_pw = "";
//			user_pw = result.getString("pwd");
			while (result.next()) {
				user_pw = (result.getString("pwd"));
			}

			con.close();
			Connection con2 = db.info();
			String sql = "select * from test where id=?";
			ps = con2.prepareStatement(sql);
			ps.setString(1, uid); // 아디값
			ResultSet result2 = ps.executeQuery();
			String sql_id = ""; // DB에 저장된 사용자 아이디와 사용자 패스워드
			String sql_pw = "";
			while (result2.next()) {
				sql_id = result2.getString("id");
				sql_pw = result2.getString("pass");
			}
			con2.close();
			ps.close();
			PrintWriter pw = response.getWriter();

			if (sql_id.intern() == "") {
				pw.write("<script>alert('');history.go(-1)</script>");
			} else {
				if (sql_pw.intern() == user_pw.intern()) {
					session.setAttribute("perid", uid);
					session.setAttribute("pernm", "홍길동");
					pw.write("<script>alert('ok');location.href='./index.jsp';</script>");
					pw.close();
				} else {
					System.out.println(sql_pw + " " + user_pw);
					pw.write("<script>alert('패스워드 틀림');history.go(-1);</script>");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	
	}

}
