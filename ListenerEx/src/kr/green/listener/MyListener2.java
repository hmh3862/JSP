package kr.green.listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

/**
 * 웹 애플리케이션이 시작되거나 종료할때 자동으로 실행된다.
 * 애플리케이션 전체에 해당되는 기본값 들을 초기화 하거나 마무리할때 사용한다.
 */
// @WebListener // 자동 등록
public class MyListener2 implements ServletContextListener {
	/**
     * 웹 애플리케이션이 종료할때 자동으로 실행된다.
     */
    public void contextDestroyed(ServletContextEvent sce)  { 
         System.out.println("웹 애플리케이션 종료!!!!!~~~ 수동등록");
    }

	/**
     * 웹 애플리케이션이 시작할때 자동으로 실행된다.
     */
    public void contextInitialized(ServletContextEvent sce)  { 
    	System.out.println("웹 애플리케이션 시작!!!!!~~~ 수동등록");
    	
    }
	
}
