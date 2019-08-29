package registration.model.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class IntroductionDTO {

	private String classCode;
	private String introVideo;
	private String introDay;
	private String introContent;
}
