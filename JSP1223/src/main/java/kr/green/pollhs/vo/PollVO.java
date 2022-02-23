package kr.green.pollhs.vo;
/*
{
	"title": "김중운은 어떤사람?",
	"items": [
		"좋은사람",
		"보통사람",
		"나쁜사람",
		"내사람"
	],
	"counts": [
		0,
		0,
		0,
		0
	]


 */
import java.util.List;

import lombok.Data;

@Data             //-해석 : lombok이 있어야 사용가능하며 이 @Data를 사용했을때 get set을 안적어도 그 메소드를 사용할 수 있다.
public class PollVO {
	private String title; // -해석 : 제목은 하나밖에 없기 때문에 하나만 넣는게 맞다
	private List<String> items; //-해석 : json에서 []는 배열 따라서 List를 쓰는게 맞다
	private List<Integer> counts; // -해석 : 투표수를 배열로 잡았다.
	
	// 총투표수를 구하는 메서드
	public int getTotalCount() {  //-해석 :  총 투표를 구해야하기 때문에 getTotalcount라는 메소드를 추가
		int totalCount = 0;   // -해석 : 총득표수를 넣을 변수 추가
		for(int i : counts)   //-해석 :  i의 값은 counts의 값으로 가져온다.
			totalCount += i; // -해석 : i 즉 counts(득표수)가 값이 생길때마다 getTotalcount(총 득표)에 계속 값을 넣어준다 = 총득표수가 됩니다.  
		return totalCount; // -해석 : 그렇게 해서 총 득표수를 가져온다고 생각하심됩니다.
	}
	// 득표율을 구하는 메서드
	public String getPercent(int i) {// -해석 : 자 그럼 평균값도 구해야겠죠?
		if(getTotalCount()!=0)// -해석 : 만약에 총 득표수가 0이 아니면
			// %자체를 출력하기 위해서는 %%를 쓴다.
			return String.format("%.2f%%", (double)counts.get(i)/getTotalCount() * 100); 
		//- 해석 :  평균값을 구한다. 이제 (총 득표/투표한갯수)*100 (ex: 좋은사람 5표면 (총득표/5)*100) 으로 하되 소수점을 구해야하기 때문에 double을 준다.
		else
			return "0.00%";//-해석 : 총 득표가 0이면 0%다.
	}
}
