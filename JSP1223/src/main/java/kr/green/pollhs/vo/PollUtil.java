package kr.green.pollhs.vo;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

import kr.green.poll.vo.PollVO;


// 일단 PollVO를 읽어야하는 클래스가 있어야하기 때문에 이 클래스를 생성합니다.

public class PollUtil {
	// json파일을 읽어서 PollVO를 리턴하는 메서드
	public static PollVO readPollVO(String path, String fileName) {
		PollVO pollVO = null;
		Gson gson = new Gson();
		// try ~ catch는 에러가 나도 실행되게끔 하는겁니다.
		// FileReader 이건 poll1폴더에 있는 pollForm 확인 해주세요. 어우 계속 나오니까 해석하는 저도 확실히 이해가 되네요 이건.
		try(FileReader fr = new FileReader(path + File.separator + fileName);){
			pollVO = gson.fromJson(fr, PollVO.class);
		} catch (FileNotFoundException e) { // 에외처리 하는 명령문입니다.
			e.printStackTrace();
		} catch (IOException e) {// 에외처리 하는 명령문입니다.
			e.printStackTrace();
		}
		return pollVO;
	}
	
	/* 정리 : 
	1. json파일을 읽어서 PollVO를 리턴하는 메서드 생성
	2. PollVO를 pollVO로 지정하고 그 안에 값은 비운다.
	3. Gson라이브러리를 추가
	4. FileReader이랑 try catch부분은 아실꺼같으니까 넘길께요. (try catch 혹시 몰라 위에 해석 달아놨어요, 그리고 try catch는 예외처리하는거라고 이해하시면되는거라 저건 직접 입력해봐야합니다.)
	5. static으로 줬기 떄문에 return값이 필요합니다.
	
	*/
	
	
	
	
	
	// PollVO를 받아 json으로 저장하는 메서드
	public static void savePollVO(String path, String fileName, PollVO pollVO) {
		Gson gson = new Gson();
		try(PrintWriter pw = new PrintWriter(path + File.separator + fileName);){// 해석 : PrintWriter은 poll1폴더에 pollOK 36번 줄부터 보심됩니다.
			gson.toJson(pollVO, pw);
			pw.flush();                // 해석 : pw의 값을 싹다 보내준다.
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	
	/*
	 정리 :
	1. PollVO를 받아 json으로 저장하는 메서드 생성
	2. Gson 라이브러리 생성
	3. poll1번 폴더 pollOK 36번줄 부터 읽으시면 PrintWriter에 관련된 해석 있으니까 그거 보시면서 해석해보세요~ try catch는 넘어갑니다.
		예외처리문이라고 생각하심됩니다. 위에 해석 있어요
	
	*/
	
	//-----------------------------------------------------------------------------------------
	// pollList.json파일을 읽어 List<PollVO>로 리턴하는 메서드
	public static List<PollVO> readPollList(String path) {
		List<PollVO> list = null;
		Gson gson = new Gson();
		try(FileReader fr = new FileReader(path + File.separator + "pollList.json");){
			list = gson.fromJson(fr, new TypeToken<List<PollVO>>(){}.getType());
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return list;
	}
	/*
	해석 : 
	1.   pollList.json파일을 읽어 List<PollVO>로 리턴하는 메서드 생성
	2. List<PollVO> 배열을 생성하여 list라는 단어로 바꾸고 그 안의 값을 비운다.
	3. Gson 라이브러리 생성
	4. 또.. fileReader... 이젠 어느정도 이해하셨을꺼라생각하고 굳이 해석 적지 않겠습니다. 아직 모르겠으면 poll1번 폴더 pollForm 확인하세요.
	5. try catch도 넘어가겠습니다.
	6. static으로 만들어서 return값이 필요.
	 
	 */
	
	
	
	
	
	
	// List<PollVO>를 받아 pollList.json파일로 저장하는 메서드
	public static void savePollList(String path,  List<PollVO> list) {
		Gson gson = new Gson();
		try(PrintWriter pw = new PrintWriter(path + File.separator + "pollList.json");){
			gson.toJson(list, pw);
			pw.flush();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}
		
		
		/*
		해석 : 
		1.  List<PollVO>를 받아 pollList.json파일로 저장하는 메서드
		2. Gson 라이브러리 생성
		3. 또.. fileReader... 이젠 어느정도 이해하셨을꺼라생각하고 굳이 해석 적지 않겠습니다. 아직 모르겠으면 poll1번 폴더 pollForm 확인하세요.
		4. try catch도 넘어가겠습니다.
		5. void가 들어갈 경우 return값이 없어도 됩니다.
		 
		 */
	}
}
