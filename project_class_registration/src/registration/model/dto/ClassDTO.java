package registration.model.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ClassDTO {

	private String classCode;
	private int classPrice;
	private String className;
	private String classTime;
	private String teacherName;
	private String startDay;
	private String endDay;
	private String simpleIntro;
	private String detailIntro;
	private int maxStudent;
}
