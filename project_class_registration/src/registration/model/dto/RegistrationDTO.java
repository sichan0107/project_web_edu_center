package registration.model.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class RegistrationDTO {
	
	private String classCode;
	private String className;
	private String studentId;
	private String teacherName;
	private String startDay;
	private String endDay;
	private String result;
}
