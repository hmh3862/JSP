package kr.green.chunja.co;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class Chunja2VO {
	private int index;
	private String h;
	private String k;
	private String t;
	
	@Override
	public String toString() {
		return index + ". " + h + "(" + k + ") : " + t;
	}
}
