package com.KoreaIT.sw.demo.vo;

import java.util.Map;

import com.KoreaIT.sw.demo.util.Ut;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class ResultData<DT> {
	//ResultData class makes general Controller return msg
	
	private String resultCode;
	private String msg;
	private DT data1;
	private String data1Name;
	private Object data2;
	private String data2Name;
	private Map<String, Object> body;

	public ResultData(String resultCode, String msg, Object... args) {
		this.resultCode = resultCode;
		this.msg = msg;
		this.body = Ut.mapOf(args);
	}
	
	public static<DT> ResultData<DT> from(String resultCode, String msg){
		return from(resultCode, msg, null, null);
	}

	public static<DT> ResultData<DT> from(String resultCode, String msg, String data1Name, DT data1) {
		ResultData<DT> rd = new ResultData<DT>();
		rd.resultCode = resultCode;
		rd.msg = msg;
		rd.data1 = data1;
		rd.data1Name = data1Name;
		
		return rd;
	}
	
	public boolean isSuccess() {				//deal with service class check authorize the user can delete or modify
		return resultCode.startsWith("S-");
	}
	
	public boolean isFail() {
		return isSuccess() == false;
	}
	
	public static <DT> ResultData<DT> newData(ResultData rd, String data1Name, DT newData){
		return from(rd.getResultCode(), rd.getMsg(), data1Name, newData);
	}
	public void setData2(String data2Name, Object data2) {
		this.data2Name = data2Name;
		this.data2 = data2;
	}

}
