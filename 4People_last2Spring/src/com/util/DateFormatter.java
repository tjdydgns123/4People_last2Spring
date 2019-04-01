package com.util;

import java.util.Map;

public class DateFormatter {

	
	public Map<String, Object> calc_date(Map<String, Object> rMap){
		//Map<String, Object> calc_date(){
		//들어오는 데이터 포맷
		//Mon Feb 25 2019 00:00:00 GMT 0900 (한국 표준시)
	  String cal_startdate = (String)rMap.get("cal_startdate");
	  String cal_enddate = (String)rMap.get("cal_enddate");
		//Map<String, Object> rMap = null;
	//	String cal_startdate = "Mon Feb 25 2019 00:00:00 GMT 0900 (한국 표준시)";
		String cal_calcstartdate = null;
		String cal_calcenddate = null;
		//String cal_enddate = (String)rMap.get("cal_enddate");
		for(int i=0; i<cal_startdate.split(" ").length; i++) {
			String[] s_count = cal_startdate.split(" ");
			String[] e_count = cal_enddate.split(" ");
			cal_calcstartdate = s_count[3]+"/"+s_count[1]+"/"+s_count[2];//+"/"+s_count[0];
			cal_calcenddate = e_count[3]+"/"+e_count[1]+"/"+e_count[2];//+"/"+e_count[0];
		//System.out.println(count[i]);//.split("  ").toString());
		}
		System.out.println(cal_calcstartdate);
		System.out.println(cal_calcenddate);
		rMap.put("cal_startdate", cal_calcstartdate);
		rMap.put("cal_enddate", cal_calcenddate);
		//rMap.put("cal_startdate", cal_startdate);
		//rMap.put("cal_enddate", cal_enddate);
		
		return rMap;
	}
		/*
	public static void main(String[] args) {
		DateFormatter df = new DateFormatter();
		df.calc_date();
	}*/
}
