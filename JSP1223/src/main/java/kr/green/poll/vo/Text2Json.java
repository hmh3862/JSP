package kr.green.poll.vo;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

import com.google.gson.Gson;

import kr.green.chunja.co.ChunjaVO;

public class Text2Json {
	public static void main(String[] args) {
		List<ChunjaVO> list = new ArrayList<>();
		try(Scanner sc = new Scanner(new File("src/main/resources/chunja.txt"));
			PrintWriter pw = new PrintWriter("src/main/resources/chunja.json");	
			){
			while(sc.hasNextLine()) {
				String[] lines = sc.nextLine().split("\\|");
				ChunjaVO vo =new ChunjaVO();
				vo.setIndex(Integer.parseInt(lines[0]));
				vo.setH(lines[1]);
				vo.setK(lines[3]);
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
