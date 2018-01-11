package com.iot.test;


import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

import com.iot.test.vo.ClassInfo;

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
			Constructor[] cons = c.getDeclaredConstructors();
			ClassInfo ci = null;
			for(Constructor con : cons) {
				System.out.println("생성자명 : " + con.getName());
				ci = (ClassInfo)con.newInstance();
			}
			Class[] params = new Class[1];
			params[0] = Integer.TYPE;
			Method setCiNo	= c.getMethod("setCiNo", params);
			Object[] p = new Object[1];
			p[0]=new Integer(1);
			setCiNo.invoke(ci, p);
			
			if(ci!=null) {
				System.out.println(ci);
			}
		} catch (ClassNotFoundException | SecurityException | InstantiationException | IllegalAccessException | IllegalArgumentException | InvocationTargetException | NoSuchMethodException e) {
			e.printStackTrace();
		}
	}

}
