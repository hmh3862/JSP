package kr.green.poll.vo;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

import com.google.gson.Gson;

import kr.green.chunja.co.Chunja2VO;

public class Text2Json2 {
	public static void main(String[] args) {
		List<Chunja2VO> list = new ArrayList<>();
		try(Scanner sc = new Scanner(new File("src/main/resources/chunja2.txt"));
			PrintWriter pw = new PrintWriter("src/main/resources/chunja2.json");	
			){
			while(sc.hasNextLine()) {
				String[] lines = sc.nextLine().split("\\|");
				Chunja2VO vo =new Chunja2VO();
				vo.setIndex(Integer.parseInt(lines[0]));
				vo.setH(lines[1]);
				vo.setK(lines[2]);
				vo.setT(lines[4]);
				list.add(vo);
			}
			System.out.println(list.size() + "개 읽음");
			Gson gson = new Gson();
			gson.toJson(list, pw);
			pw.flush();
			System.out.println("저장 완료!!!");
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}
	}
}
