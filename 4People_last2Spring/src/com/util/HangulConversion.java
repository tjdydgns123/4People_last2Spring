package com.util;

public class HangulConversion {
	//화면에서 전송한 값을 euc-kr인코딩 으로 컨버전
	public static String toKor(String en) {
		if(en==null) return null;
		try {
			return new String(en.getBytes("8859_1"),"euc-kr");
		} catch (Exception e) {
			return en;
		}
	}
	//다국어 지원|ajax한글처리시
	public static String toUTF(String en) {
		if(en==null) return null;
		try {
			return new String(en.getBytes("8859_1"),"utf-8");
		} catch (Exception e) {
			return en;
		}
	}
}
