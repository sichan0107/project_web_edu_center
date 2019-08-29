package registration.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import registration.model.dao.Service;

@WebServlet("/TeacherIdCheck")
public class TeacherIdCheck extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "showError.jsp";

		String teacherId = request.getParameter("teacherId");
		String teacherPw = request.getParameter("teacherPw");
		response.setContentType("text/html;charset=utf-8");

		ArrayList<String> ids = Service.teacherIdList();
		ArrayList<HashMap<String, String>> idAndPw = Service.teacherIdCheck();

		if (!ids.contains(teacherId)) {
			request.setAttribute("errorMsg", "아이디가 존재하지 않습니다.");
			request.getRequestDispatcher(url).forward(request, response);
			return;
		} else {

			try {
				if (idAndPw.get(ids.indexOf(teacherId)).get(teacherId).equals(teacherPw)) {
					url="index.jsp";
					Cookie log = new Cookie(teacherId, teacherPw);
					log.setMaxAge(60 * 60 * 24 * 7);
					HttpSession session = request.getSession();
					session.setAttribute("teacher", Service.getTeacher(teacherId));
					response.addCookie(log);
					request.getRequestDispatcher(url).forward(request, response);
					return;
				} else {
					request.setAttribute("errorMsg", "비밀번호가 틀렸습니다.");
					request.getRequestDispatcher(url).forward(request, response);
					return;
				}

			} catch (Exception e) {
				e.getMessage();
				response.sendRedirect(url);
			}
		}
		request.getRequestDispatcher(url).forward(request, response);
	}
}
