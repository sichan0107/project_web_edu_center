package registration.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import registration.model.dao.Service;
import registration.model.dto.StudentDTO;
import registration.model.dto.TeacherDTO;

@WebServlet("/CourseCheck")
public class CourseCheck extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "showError.jsp";

		request.setCharacterEncoding("utf-8");
		String command = request.getParameter("command");
		HttpSession session = request.getSession();
		StudentDTO studentId = (StudentDTO) session.getAttribute("student");
		TeacherDTO teacherId = (TeacherDTO) session.getAttribute("teacher");
		if (studentId == null && teacherId == null) {
			request.setAttribute("errorMsg", "로그인이 필요한 서비스입니다.");
			request.getRequestDispatcher(url).forward(request, response);
		} else {
			if (command.equals("courses")) {
				courses(request, response);
			} else if (command.equals("coursesById")) {
				coursesById(request, response);
			} else if (command.equals("courseList")) {
				courseList(request, response);
			} else if (command.equals("admissions")) {
				admissions(request, response);
			} else if (command.equals("courseSingle")) {
				courseSingle(request, response);
			} else if (command.equals("evaluation")) {
				evaluation(request, response);
			} else if (command.equals("writeEvaluation")) {
				writeEvaluation(request, response);
			}
		}

	}

	protected void courses(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "showError.jsp";
		String classCode = request.getParameter("classCode");
		try {
			request.setAttribute("list", Service.getRegistration(classCode));
			url = "courses.jsp";
		} catch (Exception e) {
			request.setAttribute("errorMsg", "문제가 발생하였습니다.");
			e.printStackTrace();
		}
		request.getRequestDispatcher(url).forward(request, response);
	}
	
	protected void coursesById(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "showError.jsp";
		String studentId = request.getParameter("studentId");
		try {
			request.setAttribute("list", Service.getRegistrationById(studentId));
			url = "courses.jsp";
		} catch (Exception e) {
			request.setAttribute("errorMsg", "문제가 발생하였습니다.");
			e.printStackTrace();
		}
		request.getRequestDispatcher(url).forward(request, response);
	}
	
	

	protected void courseList(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "showError.jsp";
		String teacherName = request.getParameter("teacherName");
		try {
			request.setAttribute("list", Service.getClassById(teacherName));
			url = "courseList.jsp";
		} catch (Exception e) {
			request.setAttribute("errorMsg", "문제가 발생하였습니다.");
			e.printStackTrace();
		}
		request.getRequestDispatcher(url).forward(request, response);
	}

	protected void admissions(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "showError.jsp";
		try {
			request.setAttribute("list", Service.getAllClass());
			request.setAttribute("getAllChartData", Service.getAllChartData());
			url = "admissions.jsp";
		} catch (Exception e) {
			request.setAttribute("errorMsg", "문제가 발생하였습니다.");
			e.printStackTrace();
		}
		request.getRequestDispatcher(url).forward(request, response);
	}

	protected void courseSingle(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "showError.jsp";

		try {
			url = "courseSingle.jsp";
		} catch (Exception e) {
			request.setAttribute("errorMsg", "문제가 발생하였습니다.");
			e.printStackTrace();
		}
		request.getRequestDispatcher(url).forward(request, response);
	}

	protected void evaluation(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "showError.jsp";
		try {
			String classCode = request.getParameter("classCode");
			request.setAttribute("classCode", classCode);
			request.setAttribute("list", Service.getEvaluation(classCode));
			url = "evaluation.jsp";
		} catch (Exception e) {
			request.setAttribute("errorMsg", "문제가 발생하였습니다.");
			e.printStackTrace();
		}
		request.getRequestDispatcher(url).forward(request, response);
	}

	protected void writeEvaluation(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "showError.jsp";
		try {
			String classCode = request.getParameter("classCode");
			request.setAttribute("classCode", classCode);
			url = "writeEvaluation.jsp";
		} catch (Exception e) {
			request.setAttribute("errorMsg", "문제가 발생하였습니다.");
			e.printStackTrace();
		}
		request.getRequestDispatcher(url).forward(request, response);
	}

}
