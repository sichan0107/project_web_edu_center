package registration.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import registration.model.dao.Service;
import registration.model.dto.ClassDTO;
import registration.model.dto.EvaluationDTO;
import registration.model.dto.IntroductionDTO;
import registration.model.dto.PastRegistrationDTO;
import registration.model.dto.QuestionDTO;
import registration.model.dto.RegistrationDTO;
import registration.model.dto.StudentDTO;
import registration.model.dto.TeacherDTO;

@WebServlet("/Controller")
public class FrontController extends HttpServlet {

	public FrontController() {
		super();
	}

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		process(request, response);
	}

	protected void process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		// command pattern
		String command = request.getParameter("command");
		try {

			// student
			if (command.equals("createStudent")) {
				createStudent(request, response);
			} else if (command.equals("getAllStudent")) {
				getAllStudent(request, response);
			} else if (command.equals("getStudent")) {
				getStudent(request, response);
			} else if (command.equals("studentUpdate")) {
				studentUpdate(request, response);
			} else if (command.equals("studentDelete")) {
				studentDelete(request, response);
			}
			// class
			else if (command.equals("createClass")) {
				createClass(request, response);
			} else if (command.equals("getAllClass")) {
				getAllClass(request, response);
			} else if (command.equals("getClass")) {
				getClass(request, response);
			} else if (command.equals("classUpdate")) {
				classUpdate(request, response);
			} else if (command.equals("classDelete")) {
				classDelete(request, response);
			} else if (command.equals("getClassById")) {
				getClassById(request, response);
			} else if (command.equals("getAllChart")) {
				getAllChart(request, response);
			}
			// registration
			else if (command.equals("createRegistration")) {
				createRegistration(request, response);
			} else if (command.equals("getAllRegistration")) {
				getAllRegistration(request, response);
			} else if (command.equals("getRegistration")) {
				getRegistration(request, response);
			} else if (command.equals("registrationDelete")) {
				registrationDelete(request, response);
			}
			// evaluation
			else if (command.equals("getEvaluation")) {
				getEvaluation(request, response);
			} else if (command.equals("createEvaluation")) {
				createEvaluation(request, response);
			} else if (command.equals("updateEvaluation")) {
				updateEvaluation(request, response);
			} else if (command.equals("deleteEvaluation")) {
				deleteEvaluation(request, response);
			}
			// introduction
			else if (command.equals("createIntroduction")) {
				createIntroduction(request, response);
			} else if (command.equals("getIntroduction")) {
				getIntroduction(request, response);
			} else if (command.equals("updateIntroduction")) {
				updateIntroduction(request, response);
			} else if (command.equals("deleteIntroduction")) {
				deleteIntroduction(request, response);
			}
			// teacher
			else if (command.equals("getAllTeacher")) {
				getAllTeacher(request, response);
			} else if (command.equals("getTeacher")) {
				getTeacher(request, response);
			} else if (command.equals("createTeacher")) {
				createTeacher(request, response);
			} else if (command.equals("updateTeacher")) {
				updateTeacher(request, response);
			} else if (command.equals("deleteTeacher")) {
				deleteTeacher(request, response);
			}
			// pastRegistration
			 else if (command.equals("createQuestion")) {
				createQuestion(request, response);
			} else if (command.equals("getAllQuestion")) {
				getAllQuestion(request, response);
			}

		} catch (Exception s) {
			s.printStackTrace();
			request.setAttribute("errorMsg", s.getMessage());
			request.getRequestDispatcher("showError.jsp").forward(request, response);
		}
	}

	// ======================== Student =========================

	// sign up student
	protected void createStudent(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "showError.jsp";
		String studentId = request.getParameter("studentId");
		String studentName = request.getParameter("studentName");
		String studentPw = request.getParameter("studentPw");
		if (studentId != null && studentId.length() != 0 || studentPw != null && studentPw.length() != 0
				|| studentName != null && studentName.length() != 0) {

		}

		StudentDTO student = new StudentDTO(studentId, studentName, studentPw);
		try {
			boolean result = Service.addStudent(student);
			if (result) {
				request.setAttribute("studentId", studentId);
				request.setAttribute("successMsg", "가입 완료");
				url = "registerSuccess.jsp";
			} else {
				request.setAttribute("errorMsg", "다시 시도하세요");
			}
		} catch (Exception s) {
			request.setAttribute("errorMsg", "이미 존재하는 아이디입니다.");
			s.printStackTrace();
		}
		request.getRequestDispatcher(url).forward(request, response);
	}

	// search all students
	public void getAllStudent(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "showError.jsp";
		try {
			request.setAttribute("getAllStudent", Service.getAllStudent());
			url = "모든학생.jsp";
		} catch (Exception s) {
			s.printStackTrace();
			request.setAttribute("errorMsg", s.getMessage());
		}
		request.getRequestDispatcher(url).forward(request, response);
	}

	// search student
	public void getStudent(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "showError.jsp";
		String id = request.getParameter("id");
		try {
			request.setAttribute("getStudent", Service.getStudent(id));
			url = "특정학생.jsp";
		} catch (Exception s) {
			s.printStackTrace();
			request.setAttribute("errorMsg", s.getMessage());
		}
		request.getRequestDispatcher(url).forward(request, response);
	}

	// update student info
	public void studentUpdate(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "showError.jsp";
		String studentId = request.getParameter("id");
		String studentPw = request.getParameter("studentPw");
		String phoneNumber = request.getParameter("phoneNumber");
		try {
			Service.updateStudent(studentId, studentPw, phoneNumber);
			url = "수정완료.jsp";
		} catch (Exception s) {
			s.printStackTrace();
			request.setAttribute("errorMsg", s.getMessage());
		}
		request.getRequestDispatcher(url).forward(request, response);
	}

	// delete student
	public void studentDelete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "showError.jsp";
		String studentId = request.getParameter("id");
		if (studentId == null || studentId.trim().length() == 0) {
			response.sendRedirect(url);
		}
		boolean result = false;
		try {
			result = Service.deleteStudent(studentId);
			url = "탈퇴완료.jsp";
		} catch (Exception s) {
			s.printStackTrace();
			request.setAttribute("errorMsg", s.getMessage());
		}
		if (result) {
			response.sendRedirect("index.jsp");
		} else {
			request.getRequestDispatcher(url).forward(request, response);
		}
	}

	// ======================== Class =========================

	// add class info
	protected void createClass(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "showError.jsp";

		String classCode = request.getParameter("classCode");
		int classPrice = Integer.parseInt(request.getParameter("classPrice"));
		String className = request.getParameter("className");
		String classTime = request.getParameter("classTime");
		String teacherName = request.getParameter("teacherName");
		String startDay = request.getParameter("startDay");
		String endDay = request.getParameter("endDay");
		String simpleIntro = request.getParameter("simpleIntro");
		String detailIntro = request.getParameter("detailIntro");
		int maxStudent = Integer.parseInt(request.getParameter("maxStudent"));
		if (classCode != null && classCode.trim().length() != 0 || className != null && className.length() != 0
				|| classTime != null && classTime.length() != 0
				|| teacherName != null && teacherName.trim().length() != 0 || classPrice != 0 || maxStudent != 0
				|| startDay != null && startDay.trim().length() != 0 || endDay != null && endDay.length() != 0
				|| simpleIntro != null && simpleIntro.length() != 0
				|| detailIntro != null && detailIntro.length() != 0) {

		}

		ClassDTO newclass = new ClassDTO(classCode, classPrice, className, classTime, teacherName, startDay, endDay,
				simpleIntro, detailIntro, maxStudent);
		try {
			boolean result = Service.addClass(newclass);
			if (result) {
				request.setAttribute("class", newclass);
				request.setAttribute("successMsg", "강의 추가 완료");
				url = "CourseCheck?command=courseList&teacherName=" + teacherName;
			} else {
				request.setAttribute("errorMsg", "다시 시도하세요");
			}
		} catch (Exception s) {
			request.setAttribute("errorMsg", s.getMessage());
			s.printStackTrace();
		}
		request.getRequestDispatcher(url).forward(request, response);
	}

	// search all classes
	public void getAllClass(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "showError.jsp";
		try {
			request.setAttribute("getAllClass", Service.getAllClass());
			url = "모든강의.jsp";
		} catch (Exception s) {
			s.printStackTrace();
			request.setAttribute("errorMsg", s.getMessage());
		}
		request.getRequestDispatcher(url).forward(request, response);
	}

	// search a class
	public void getClass(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "showError.jsp";
		String classCode = request.getParameter("classCode");
		try {
			request.setAttribute("getClass", Service.getClass(classCode));
			url = "course-single.jsp";
		} catch (Exception s) {
			s.printStackTrace();
			request.setAttribute("errorMsg", s.getMessage());
		}
		request.getRequestDispatcher(url).forward(request, response);
	}

	public void getClassById(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "showError.jsp";
		String teacherName = request.getParameter("teacherName");
		try {
			request.setAttribute("list", Service.getClassById(teacherName));
			url = "courseList.jsp";
		} catch (Exception s) {
			s.printStackTrace();
			request.setAttribute("errorMsg", s.getMessage());
		}
		request.getRequestDispatcher(url).forward(request, response);
	}

	public void classUpdate(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "showError.jsp";
		String classCode = request.getParameter("classCode");
		String classPrice = request.getParameter("classPrice");
		String className = request.getParameter("className");
		String classTime = request.getParameter("classTime");
		String teacherName = request.getParameter("teacherName");
		String startDay = request.getParameter("startDay");
		String endDay = request.getParameter("endDay");
		String simpleIntro = request.getParameter("simpleIntro");
		String detailIntro = request.getParameter("detailIntro");
		String maxStudent = request.getParameter("maxStudent");

		try {
			Service.updateClass(classCode, classPrice, className, classTime, teacherName, startDay, endDay, simpleIntro,
					detailIntro, maxStudent);
			url = "강의수정완료.jsp";
		} catch (Exception s) {
			s.printStackTrace();
			request.setAttribute("errorMsg", s.getMessage());
		}
		request.getRequestDispatcher(url).forward(request, response);
	}

	public void classDelete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "showError.jsp";
		String classCode = request.getParameter("classCode");
		if (classCode == null || classCode.trim().length() == 0) {
			response.sendRedirect(url);
		}
		boolean result = false;
		try {
			result = Service.deleteClass(classCode);
			url = "강의수정완료.jsp";
		} catch (Exception s) {
			s.printStackTrace();
			request.setAttribute("errorMsg", s.getMessage());
		}
		if (result) {
			response.sendRedirect("index.jsp");
			return;
		} else {
			request.getRequestDispatcher(url).forward(request, response);
		}
	}

	public void getAllChart(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "showError.jsp";
		try {
			request.setAttribute("getAllChartData", Service.getAllChartData());
			url = "admissions.jsp";
			request.getRequestDispatcher(url).forward(request, response);
		} catch (Exception s) {
			s.printStackTrace();
			request.setAttribute("errorMsg", s.getMessage());
		}
		request.getRequestDispatcher(url).forward(request, response);
	}

	// ======================== Registration =========================

	protected void createRegistration(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "showError.jsp";
		String classCode = request.getParameter("classCode");
		String studentId = request.getParameter("studentId");
		ClassDTO class1 = null;
		String result = "1";
		try {
			class1 = Service.getClass(classCode);
		} catch (Exception e) {
			e.printStackTrace();
		}
		ArrayList<String> idList = Service.idList(classCode);
		if (class1 == null) {
			request.setAttribute("errorMsg", "다시 시도하세요");
		}
		RegistrationDTO registration = new RegistrationDTO(classCode, class1.getClassName(), studentId,
				class1.getTeacherName(), class1.getStartDay(), class1.getEndDay(), result);
		if (idList.contains(studentId)) {
			request.setAttribute("errorMsg", "이미 수강신청한 과목입니다.");
		} else {
			try {
				boolean result1 = Service.addRegistration(registration);
				if (result1) {
					request.setAttribute("registration", registration);

					request.setAttribute("successMsg", Service.getClass(classCode).getClassName() + "  과목 신청 하였습니다.");
					request.setAttribute("successMsg1", "수강내역에서 등록여부를 확인해주세요.");
					url = "registrationSuccess.jsp";
				} else {
					request.setAttribute("errorMsg", "다시 시도하세요");
				}
			} catch (Exception s) {
				s.printStackTrace();
				request.setAttribute("errorMsg", s.getMessage());
			}
		}
		request.getRequestDispatcher(url).forward(request, response);
	}

	public void getAllRegistration(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "showError.jsp";
		try {
			request.setAttribute("getAllRegistration", Service.getAllRegistration());
			url = "신청 목록 전체.jsp";
		} catch (Exception s) {
			s.printStackTrace();
			request.setAttribute("errorMsg", s.getMessage());
		}
		request.getRequestDispatcher(url).forward(request, response);
	}

	public void getRegistration(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "showError.jsp";
		String studentId = request.getParameter("studentId");
		try {
			request.setAttribute("list", Service.getRegistration(studentId));
			url = "courses.jsp";
		} catch (Exception s) {
			s.printStackTrace();
			request.setAttribute("errorMsg", s.getMessage());
		}
		request.getRequestDispatcher(url).forward(request, response);
	}

	public void registrationDelete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "showError.jsp";
		String studentId = request.getParameter("studentId");
		String classCode = request.getParameter("classCode");
		if (studentId == null || studentId.trim().length() == 0) {
			response.sendRedirect(url);
		}
		boolean result = false;
		try {
			result = Service.deleteRegistration(studentId, classCode);
			request.setAttribute("errorMsg", "신청 취소 완료");
		} catch (Exception s) {
			s.printStackTrace();
			request.setAttribute("errorMsg", s.getMessage());
		}
		if (result) {
			url = "registrationSuccess.jsp";
		}
		request.getRequestDispatcher(url).forward(request, response);
	}

	// ======================== Evaluation =========================

	protected void createEvaluation(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "showError.jsp";

		String classCode = request.getParameter("classCode");
		String studentId = request.getParameter("studentId");
		String evaluationContent = request.getParameter("evaluationContent");
		String evaluationDay = request.getParameter("evaluationDay");
		if (classCode != null && classCode.trim().length() != 0 || studentId != null && studentId.length() != 0
				|| evaluationContent != null && evaluationContent.length() != 0
				|| evaluationDay != null && evaluationDay.length() != 0) {

		}
		EvaluationDTO evaluation = new EvaluationDTO(classCode, studentId, evaluationContent, evaluationDay);
		try {
			boolean result1 = Service.addEvaluation(evaluation);
			if (result1) {
				request.setAttribute("evaluation", evaluation);
				request.setAttribute("successMsg", "평가 작성 완료");
				url = "CourseCheck?command=evaluation&classCode=" + classCode;
			} else {
				request.setAttribute("errorMsg", "다시 시도하세요");
			}
		} catch (Exception s) {
			request.setAttribute("errorMsg", s.getMessage());
			s.printStackTrace();
		}
		request.getRequestDispatcher(url).forward(request, response);
	}

	public void getEvaluation(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "showError.jsp";
		String studentId = request.getParameter("studentId");
		try {
			request.setAttribute("list", Service.getEvaluation(studentId));
			url = "evaluation.jsp";
		} catch (Exception s) {
			s.printStackTrace();
			request.setAttribute("errorMsg", s.getMessage());
		}
		request.getRequestDispatcher(url).forward(request, response);
	}

	public void updateEvaluation(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "showError.jsp";
		String classCode = request.getParameter("classCode");
		String studentId = request.getParameter("studentId");
		String evaluationContent = request.getParameter("evaluationContent");
		String evaluationDay = request.getParameter("evaluationDay");
		try {
			Service.updateEvaluation(classCode, studentId, evaluationContent, evaluationDay);
			url = "수정완료.jsp";
		} catch (Exception s) {
			s.printStackTrace();
			request.setAttribute("errorMsg", s.getMessage());
		}
		request.getRequestDispatcher(url).forward(request, response);
	}

	public void deleteEvaluation(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "showError.jsp";
		String studentId = request.getParameter("id");
		if (studentId == null || studentId.trim().length() == 0) {
			response.sendRedirect(url);
		}
		boolean result = false;
		try {
			result = Service.deleteStudent(studentId);
			url = "평가 삭제 완료.jsp";
		} catch (Exception s) {
			s.printStackTrace();
			request.setAttribute("errorMsg", s.getMessage());
		}
		if (result) {
			response.sendRedirect("index.jsp");
			return;
		} else {
			request.getRequestDispatcher(url).forward(request, response);
		}
	}

	// ======================== Introduction =========================

	protected void createIntroduction(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "showError.jsp";

		String classCode = request.getParameter("classCode");
		String introVideo = request.getParameter("introVideo");
		String introDay = request.getParameter("introDay");
		String introContent = request.getParameter("introContent");

		if (classCode != null && classCode.trim().length() != 0 || introVideo != null && introVideo.length() != 0
				|| introDay != null && introDay.length() != 0 || introContent != null && introContent.length() != 0) {
			response.sendRedirect(url);
		}

		IntroductionDTO introduction = new IntroductionDTO(classCode, introVideo, introDay, introContent);
		try {
			boolean result1 = Service.addIntroduction(introduction);
			if (result1) {
				request.setAttribute("introduction", introduction);
				request.setAttribute("successMsg", "신청 완료");
				url = "소개 글 작성 완료.jsp";
			} else {
				request.setAttribute("errorMsg", "다시 시도하세요");
			}
		} catch (Exception s) {
			request.setAttribute("errorMsg", s.getMessage());
			s.printStackTrace();
		}
		request.getRequestDispatcher(url).forward(request, response);
	}

	public void getIntroduction(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "showError.jsp";
		String classCode = request.getParameter("classCode");
		try {
			request.setAttribute("getStudent", Service.getIntroduction(classCode));
			url = "특정 소개.jsp";
		} catch (Exception s) {
			s.printStackTrace();
			request.setAttribute("errorMsg", s.getMessage());
		}
		request.getRequestDispatcher(url).forward(request, response);
	}

	public void updateIntroduction(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "showError.jsp";
		String classCode = request.getParameter("classCode");
		String introVideo = request.getParameter("introVideo");
		String introDay = request.getParameter("introDay");
		String introContent = request.getParameter("introContent");
		try {
			Service.updateEvaluation(classCode, introVideo, introDay, introContent);
			url = "수정완료.jsp";
		} catch (Exception s) {
			s.printStackTrace();
			request.setAttribute("errorMsg", s.getMessage());
		}
		request.getRequestDispatcher(url).forward(request, response);
	}

	public void deleteIntroduction(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "showError.jsp";
		String studentId = request.getParameter("id");
		if (studentId == null || studentId.trim().length() == 0) {
			response.sendRedirect(url);
		}
		boolean result = false;
		try {
			result = Service.deleteStudent(studentId);
			url = "소개글 삭제 완료.jsp";
		} catch (Exception s) {
			s.printStackTrace();
			request.setAttribute("errorMsg", s.getMessage());
		}
		if (result) {
			response.sendRedirect("index.jsp");
			return;
		} else {
			request.getRequestDispatcher(url).forward(request, response);
		}
	}

	// ======================== Teacher =========================

	protected void createTeacher(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "showError.jsp";

		String teacherId = request.getParameter("teacherId");
		String teacherPw = request.getParameter("teacherPw");
		String teacherName = request.getParameter("teacherName");

		if (teacherId != null && teacherId.trim().length() != 0 || teacherPw != null && teacherPw.length() != 0
				|| teacherName != null && teacherName.length() != 0) {
		}

		TeacherDTO teacher = new TeacherDTO(teacherId, teacherName, teacherPw);
		try {
			boolean result = Service.addTeacher(teacher);
			if (result) {
				request.setAttribute("teacherId", teacherId);
				request.setAttribute("successMsg", "가입 완료");
				url = "registerSuccess.jsp";
			} else {
				request.setAttribute("errorMsg", "다시 시도하세요");
			}
		} catch (Exception s) {
			request.setAttribute("errorMsg", "이미 존재하는 아이디입니다.");
			s.printStackTrace();
		}
		request.getRequestDispatcher(url).forward(request, response);
	}

	public void getTeacher(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "showError.jsp";
		try {
			request.setAttribute("getAllStudent", Service.getAllStudent());
			url = "모든 강사.jsp";
		} catch (Exception s) {
			s.printStackTrace();
			request.setAttribute("errorMsg", s.getMessage());
		}
		request.getRequestDispatcher(url).forward(request, response);
	}

	public void getAllTeacher(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "showError.jsp";
		String teacherId = request.getParameter("teacherId");
		try {
			request.setAttribute("getStudent", Service.getStudent(teacherId));
			url = "특정강사.jsp";
		} catch (Exception s) {
			s.printStackTrace();
			request.setAttribute("errorMsg", s.getMessage());
		}
		request.getRequestDispatcher(url).forward(request, response);
	}

	public void updateTeacher(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "showError.jsp";
		String teacherId = request.getParameter("teacherId");
		String teacherPw = request.getParameter("teacherPw");
		String teacherIntro = request.getParameter("teacherIntro");
		String teacherName = request.getParameter("teacherName");
		try {
			Service.updateTeacher(teacherId, teacherPw, teacherIntro, teacherName);
			url = "수정완료.jsp";
		} catch (Exception s) {
			s.printStackTrace();
			request.setAttribute("errorMsg", s.getMessage());
		}
		request.getRequestDispatcher(url).forward(request, response);
	}

	public void deleteTeacher(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "showError.jsp";
		String teacherId = request.getParameter("teacherId");
		if (teacherId == null || teacherId.trim().length() == 0) {
			response.sendRedirect(url);
		}
		boolean result = false;
		try {
			result = Service.deleteStudent(teacherId);
			url = "강사 탈퇴 완료.jsp";
		} catch (Exception s) {
			s.printStackTrace();
			request.setAttribute("errorMsg", s.getMessage());
		}
		if (result) {
			response.sendRedirect("index.jsp");
		} else {
			request.getRequestDispatcher(url).forward(request, response);
		}
	}

	public void createQuestion(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String url = "showError.jsp";
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String content = request.getParameter("content");

		if (content != null && content.length() != 0 || email != null && email.length() != 0
				|| name != null && name.length() != 0) {

		}
		QuestionDTO question = new QuestionDTO(name, email, content);

		try {
			boolean result = Service.addQuestion(question);
			if (result) {
				request.setAttribute("question", question);
				request.setAttribute("successMsg", "작성 완료");
				url = "registerSuccess.jsp";
			} else {
				request.setAttribute("errorMsg", "다시 시도하세요");
			}
		} catch (Exception s) {
			request.setAttribute("errorMsg", "오류가 발생하였습니다.");
			s.printStackTrace();
		}
		request.getRequestDispatcher(url).forward(request, response);
	}

	public void getAllQuestion(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "showError.jsp";
		try {
			request.setAttribute("list", Service.getAllQuestion());
			url = "questionsList.jsp";
		} catch (Exception s) {
			s.printStackTrace();
			request.setAttribute("errorMsg", s.getMessage());
		}
		request.getRequestDispatcher(url).forward(request, response);
	}
}
