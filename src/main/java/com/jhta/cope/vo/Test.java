package com.jhta.cope.vo;

public class Test {
	
	private static void overRide(int no) {
		System.out.println(no+"하나의 값이 들어옴");
	}
	private static void overRide(int no,String str) {
		System.out.println(no+str+"두개의 값이 들어옴");
	}
	
	
	
	public static void main(String[] args) {
		overRide(1,"ss");
	}

}
