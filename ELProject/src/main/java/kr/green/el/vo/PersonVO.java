package kr.green.el.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
public class PersonVO {
	private String name;
	private int age;
	private boolean gender;
	
	@Override
	public String toString() {
		return name + "(" + age + "세, " + (gender ? "남자":"여자") + ")";
	}
}
