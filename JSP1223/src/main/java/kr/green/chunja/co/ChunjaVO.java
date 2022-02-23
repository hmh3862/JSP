package kr.green.chunja.co;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class ChunjaVO {
	private int index;
	private String h;
	private String k;
	
	@Override
	public String toString() {
		return index + ". " + h + "(" + k + ")";
	}
}
