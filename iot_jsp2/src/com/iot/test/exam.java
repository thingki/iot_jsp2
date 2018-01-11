package com.iot.test;

import java.lang.reflect.Method;

public class exam {
	 
	public static void main(String[] args) {
		try {
			Class c = Class.forName("com.iot.test.vo.ClassInfo");
			
			Method[] ms = c.getDeclaredMethods();
			for(Method m : ms) {
				System.out.print("메소드 이름 : "+m.getName());
				System.out.print(", 파라메터 타입 : " + m.getParameterTypes());
				System.out.println(", 리턴 타입 : " + m.getReturnType());
			}
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

}
