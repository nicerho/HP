package web;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

	



public class Join extends HttpServlet {
	dbconfig dc = null;
	PreparedStatement ps = null;
	private static final long serialVersionUID = 1L;

    public Join() {
        super();
      
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String sid = request.getParameter("sid").intern();
		String sname = request.getParameter("sname").intern();
		String spw = request.getParameter("spw").intern();
		String scorp = request.getParameter("scorp").intern();
		String shp = request.getParameter("shp").intern();
		String smail = request.getParameter("smail").intern();
		PrintWriter pw = response.getWriter(); // 스크립트 출력
		if (sid == "" || sname == "" || spw == "" || scorp == "" || shp == "" || smail == "") {
			pw.write("<Script>alter('Invalid Information'); history.go(-1);</Script>");
		} else {
			try {
				this.dc = new dbconfig();
				Connection con = dbconfig.info();
				String sql = "insert into test values('0',?,?,password(?),?,?,?,now());";
				this.ps = con.prepareStatement(sql);
				this.ps.setString(1, sid);
				this.ps.setString(2, sname);
				this.ps.setString(3, spw);
				this.ps.setString(4, scorp);
				this.ps.setString(5, shp);
				this.ps.setString(6, smail);
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
