package registration.model.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ChartDTO {
	private String className;
	private int cntStudent;
	
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("['");
		builder.append(className);
		builder.append("', '");
		builder.append(cntStudent);
		builder.append("']");
		return builder.toString();

	}
}
