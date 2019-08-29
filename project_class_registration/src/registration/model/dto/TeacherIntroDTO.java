package registration.model.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class TeacherIntroDTO extends TeacherDTO {

	private String teacherIntro;
	public TeacherIntroDTO(String teacherId, String teacherPw, String teacherName , String teacherIntro) {
		super();
		this.teacherIntro = teacherIntro;
	}

}
