package registration.model.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import exception.NotExistException;
import registration.model.dto.ChartDTO;
import registration.model.dto.ClassDTO;
import registration.model.dto.EvaluationDTO;
import registration.model.dto.IntroductionDTO;
import registration.model.dto.PastRegistrationDTO;
import registration.model.dto.QuestionDTO;
import registration.model.dto.RegistrationDTO;
import registration.model.dto.StudentDTO;
import registration.model.dto.TeacherDTO;

public class Service {
	
	//싱글톤
	private static Service instance = new Service();
	
	private Service() {};
	
	public static Service getInstance() {
		return instance;
	}
	
	//--------------------------Student CRUD-------------------------
	
		public static void notExistStudent(String studentId) throws NotExistException, SQLException{
			StudentDTO studentInfo = StudentDAO.getStudent(studentId);
			if(studentInfo == null){
				throw new NotExistException("검색하신 학생 정보가 없습니다.");
			}
		}
		
		
		//학생 로그인 아이디 비밀번호 짝
		public static ArrayList<HashMap<String,String>> studentIdCheck(){
			ArrayList<HashMap<String,String>> idAndPw = new ArrayList<>();
			ArrayList<StudentDTO> allStudent = null;
			try {
				allStudent = getAllStudent();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			for(int i = 0 ;  i< allStudent.size(); i++) {
				HashMap<String,String> student = new HashMap<>();
				student.put(allStudent.get(i).getStudentId(), allStudent.get(i).getStudentPw());
				idAndPw.add(student);
			}
			return idAndPw;
		}
		//모든 학생아이디 검색
		public static ArrayList<String> studentIdList(){
			ArrayList<String> idList = new ArrayList<>();;
			try {
				for(int i = 0 ; i < getAllStudent().size(); i++) {
					idList.add(getAllStudent().get(i).getStudentId());
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return idList;
		}
		
		
		
		public static StudentDTO getStudent(String studentId) throws SQLException, NotExistException{
			StudentDTO studentInfo = StudentDAO.getStudent(studentId);
			if(studentInfo == null){
				throw new NotExistException("검색하신 학생 정보가 없습니다.");
			}
			return studentInfo;
		}
		
		public static ArrayList<StudentDTO> getAllStudent() throws SQLException{
			return StudentDAO.getAllStudent();
		}
		
		public static boolean addStudent(StudentDTO studentId) throws SQLException{
			return StudentDAO.addStudent(studentId);
		}
		
		public static boolean deleteStudent(String studentId) throws SQLException, NotExistException{
			return StudentDAO.deleteStudent(studentId);
		}
		
		public static boolean updateStudent(String studentId, String studentPw, String phoneNumber) throws SQLException, NotExistException{
			return StudentDAO.updateStudent(studentId, studentPw, phoneNumber);
		}
	
	//--------------------------Class CRUD-------------------------
	
	
	public static void notExistClass(String classCode) throws NotExistException, SQLException{
		ClassDTO classInfo = ClassDAO.getClass(classCode);
		if(classInfo == null){
			throw new NotExistException("검색하신 강의 정보가 없습니다.");
		}
	}
	
	
	public static ArrayList<ClassDTO> getAllClass() throws SQLException{
		return ClassDAO.getAllClass();
	}
	
	
	public static ClassDTO getClass(String classCode) throws SQLException, NotExistException{
		ClassDTO classInfo = ClassDAO.getClass(classCode);
		if(classInfo == null){
			throw new NotExistException("검색하신 강의 정보가 없습니다.");
		}
		return classInfo;
	}
	
	   public static String getAllChartData() throws SQLException{
		   	String answer ="[['className' , 'Student']";
		   ArrayList<ChartDTO> refer = ChartDAO.getAllChart();
		   for(int i = 0 ; i<refer.size(); i++) {
			   answer = answer + ",[ '" + refer.get(i).getClassName() +"',"+refer.get(i).getCntStudent()+"]";
		   }
		   answer = answer +"]";
		    return answer;
		   }
	
	public static ArrayList<ClassDTO> getClassById(String teacherName) throws SQLException, NotExistException{
		ArrayList<ClassDTO> classInfo = ClassDAO.getClassById(teacherName);
		if(classInfo == null){
			throw new NotExistException("검색하신 강의 정보가 없습니다.");
		}
		return classInfo;
	}

	public static boolean addClass(ClassDTO classInfo) throws SQLException{
		return ClassDAO.addClass(classInfo);
	}

	public static boolean updateClass(String classCode, String classPrice , String className, String classTime,  String teacherName,
			String startDay, String endDay, String simpleIntro, String detailIntro, String maxStudent) throws SQLException, NotExistException{
		return ClassDAO.updateClass(classCode, classPrice, className, classTime, teacherName,startDay,endDay,simpleIntro,detailIntro ,maxStudent);
	}
	
	public static boolean deleteClass(String classCode) throws SQLException, NotExistException{
		return ClassDAO.deleteClass(classCode);
	}

	
	//--------------------------Registeration CRUD-------------------------
	
	
	public static void notExistRegistration(String classCode) throws NotExistException, SQLException{
		ArrayList<RegistrationDTO> registrationInfo = RegistrationDAO.getRegistration(classCode);
		if(registrationInfo == null){
			throw new NotExistException("검색하신 수강신청 정보가 없습니다.");
		}
	}
	
	public static ArrayList<RegistrationDTO> getAllRegistration() throws SQLException{
		return RegistrationDAO.getAllResitration();
	}
	
	public static ArrayList<String> idList(String classCode){
		ArrayList<String> idList = new ArrayList<>();
		try {
			 ArrayList<RegistrationDTO> list = getRegistration(classCode);
			for(int i = 0; i< list.size(); i++) {
				idList.add(list.get(i).getStudentId());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return idList;
	}

	
	public static ArrayList<RegistrationDTO> getRegistration(String classCode) throws SQLException, NotExistException{
		ArrayList<RegistrationDTO> registrationInfo = RegistrationDAO.getRegistration(classCode);
		if(registrationInfo == null){
			throw new NotExistException("검색하신 수강신청 정보가 없습니다.");
		}
		return registrationInfo;
	}
	
	public static ArrayList<RegistrationDTO> getRegistrationById(String studentId) throws SQLException, NotExistException{
		ArrayList<RegistrationDTO> registrationInfo = RegistrationDAO.getRegistrationById(studentId);
		if(registrationInfo == null){
			throw new NotExistException("검색하신 수강신청 정보가 없습니다.");
		}
		return registrationInfo;
	}
	
	public static boolean addRegistration(RegistrationDTO registration) throws SQLException{
		return RegistrationDAO.addRegistration(registration);
	}
	
	public static boolean deleteRegistration(String studentId,String classCode) throws SQLException, NotExistException{
		return RegistrationDAO.deleteRegistration(studentId,classCode);
	}
	
	
	
	
	
	//--------------------------Evaluation CRUD-------------------------
	
	
	public static void notExistEvaluation(String classCode) throws NotExistException, SQLException{
		 ArrayList<EvaluationDTO> evaluationInfo = EvaluationDAO.getEvaluation(classCode);
		if(evaluationInfo == null){
			throw new NotExistException("검색하신 수강평 정보가 없습니다.");
		}
	}
	
	public static ArrayList<EvaluationDTO> getEvaluation(String classCode) throws SQLException, NotExistException{
		 ArrayList<EvaluationDTO> evaluationInfo = EvaluationDAO.getEvaluation(classCode);
		if(evaluationInfo == null){
			throw new NotExistException("검색하신 수강평 정보가 없습니다.");
		}
		return evaluationInfo;
	}
	
	public static boolean addEvaluation(EvaluationDTO evaluation) throws SQLException{
		return EvaluationDAO.addEvaluation(evaluation);
	}
	
	public boolean deleteEvaluation(String studentId) throws SQLException, NotExistException{
		return EvaluationDAO.deleteEvaluation(studentId);
	}
	
	public static boolean updateEvaluation(String evaluationDay, String evaluationContent , String classCode, String studentId) throws SQLException, NotExistException{
		return EvaluationDAO.updateEvaluation(evaluationDay, evaluationContent, classCode, studentId);
	}
	
	//--------------------------Introduction CRUD-------------------------
	
	
		public static void notExistIntroduction(String classCode) throws NotExistException, SQLException{
			IntroductionDTO introductionInfo = IntroductionDAO.getIntroduction(classCode);
			if(introductionInfo == null){
				throw new NotExistException("검색하신 강의소개글 정보가 없습니다.");
			}
		}
		
		public static IntroductionDTO getIntroduction(String classCode) throws SQLException, NotExistException{
			IntroductionDTO introductionInfo = IntroductionDAO.getIntroduction(classCode);
			if(introductionInfo == null){
				throw new NotExistException("검색하신 강의소개글 정보가 없습니다.");
			}
			return introductionInfo;
		}
		
		public static boolean addIntroduction(IntroductionDTO introduction) throws SQLException{
			return IntroductionDAO.addIntroduction(introduction);
		}
		
		public boolean deleteIntroduction(String classCode) throws SQLException, NotExistException{
			return IntroductionDAO.deleteIntroduction(classCode);
		}
		
		public static boolean updateIntroductionContent(String classCode, String introVideo, String introDay, String introContent) throws SQLException, NotExistException{
			return IntroductionDAO.updateIntroduction(classCode,introVideo,introDay, introContent);
		}

	
	
	//--------------------------Teacher CRUD-------------------------
	
	public static void notExistTeacher(String teacherId) throws NotExistException, SQLException{
		TeacherDTO teacherInfo = TeacherDAO.getTeacher(teacherId);
		if(teacherInfo == null){
			throw new NotExistException("검색하신 강사 정보가 없습니다.");
		}
	}
	
	public static ArrayList<HashMap<String,String>> teacherIdCheck(){
		ArrayList<HashMap<String,String>> idAndPw = new ArrayList<>();
		ArrayList<TeacherDTO> allTeacher = null;
		try {
			allTeacher = getAllTeacher();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		for(int i = 0 ;  i< allTeacher.size(); i++) {
			HashMap<String,String> teacher = new HashMap<>();
			teacher.put(allTeacher.get(i).getTeacherId(), allTeacher.get(i).getTeacherPw());
			idAndPw.add(teacher);
		}
		return idAndPw;
	}
	public static ArrayList<String> teacherIdList(){
		ArrayList<String> idList = new ArrayList<>();;
		try {
			for(int i = 0 ; i < getAllTeacher().size(); i++) {
				idList.add(getAllTeacher().get(i).getTeacherId());
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return idList;
	}
	
	public static TeacherDTO getTeacher(String teacherId) throws SQLException, NotExistException{
		TeacherDTO teacherInfo = TeacherDAO.getTeacher(teacherId);
		if(teacherInfo == null){
			throw new NotExistException("검색하신 강사 정보가 없습니다.");
		}
		return teacherInfo;
	}
	
	public static ArrayList<TeacherDTO> getAllTeacher() throws SQLException{
		return TeacherDAO.getAllTeacher();
	}
	
	public static boolean addTeacher(TeacherDTO teacherId) throws SQLException{
		return TeacherDAO.addTeacher(teacherId);
	}
	
	public boolean deleteTeacher(String teacherId) throws SQLException, NotExistException{
		return TeacherDAO.deleteTeacher(teacherId);
	}
	
	public static boolean updateTeacher(String teahcerId, String teahcerPw, String teahcerIntro, String teacherName) throws SQLException, NotExistException{
		return TeacherDAO.updateTeacher(teahcerId, teahcerPw, teahcerIntro, teacherName);
	}
	


		//------------------Question------------------------
	public static boolean addQuestion(QuestionDTO question) throws SQLException{
		return QuestionDAO.addQuestion(question);
	}
	public static ArrayList<QuestionDTO> getAllQuestion() throws SQLException{
		return QuestionDAO.getAllQuestion();
	}
}
