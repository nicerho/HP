package web;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Reserve extends HttpServlet{
	dbconfig dc = null;
	PreparedStatement ps = null;
	private static final long serialVersionUID = 1L;

    public Reserve() {
        super();
      
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String id = request.getParameter("pid").intern();
		String name = request.getParameter("pname").intern();
		String room = request.getParameter("room");
		String person = request.getParameter("person").intern();
		String reserve = request.getParameter("reserve");
		
		PrintWriter pw = response.getWriter(); // 스크립트 출력
		if (id == "" || name == "" ) {
			pw.write("<Script>alter('Invalid Information'); history.go(-1);</Script>");
		} else {
			try {
				this.dc = new dbconfig();
				Connection con = dbconfig.info();
				String sql = "insert into reserve values('0',?,?,?,?,?);";
				this.ps = con.prepareStatement(sql);
				this.ps.setString(1, name);
				this.ps.setString(2, id);
				this.ps.setString(3, room);
				this.ps.setString(4, person);
				this.ps.setString(5, reserve);
				int call = this.ps.executeUpdate();
				String msg = "";
				if (call > 0) {
					msg = "Ok";
					this.ps.close();
					con.close();
					
				} else {
					msg = "SQL Error";
				}
				pw.write("<script>alert('"+msg+"'); location.href='./index.jsp';</script>");
				pw.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

}
