package registration.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import registration.model.dao.Service;
import registration.model.dto.PastRegistrationDTO;

@WebServlet("/PastRegistrationCheck")
public class PastRegistrationCheck extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url="showError.jsp";
		String studentId = "${sessionScope.student}";
		String classCode = "${requestScope.classCode}";
		
		PastRegistrationDTO pastRegistration = new PastRegistrationDTO(studentId,classCode);
		try {
			ArrayList<PastRegistrationDTO> allList = Service.getAllPastRegistration();
			if(allList.contains(pastRegistration)) {
				url="writeEvaluation.jsp";
				request.getRequestDispatcher(url).forward(request, response);
			}else {
				request.setAttribute("errorMsg", "수강이력이 없습니다.");
				request.getRequestDispatcher(url).forward(request, response);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			e.getMessage();
		}
		request.getRequestDispatcher(url).forward(request, response);
	}
}
