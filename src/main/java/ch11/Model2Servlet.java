package ch11;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ch08.KicMember;
import ch08.MemberDao;
import ch12.CommandHandler;

//@WebServlet("/memberInfo")
public class Model2Servlet implements  CommandHandler {

	

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// TODO Auto-generated method stub
		// TODO Auto-generated method stub
				MemberDao md = new MemberDao();
				KicMember mem=null;
				try {
					mem = md.oneMember("55");
					System.out.println(mem);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				req.setAttribute("mem", mem);
				
				return "/chap11_servlet/memberInfo.jsp";
	}
}
