package com.KoreaIT.sw.demo.util;

public class Ut {

	public static String f(String format, Object... args) {
		return String.format(format,  args);
	}
	
	public static String jsHitoryBack(String string, String msg) {
		if(msg == null) {
			msg = "";
		}
	/* Set return value to use in javascript HistoryBack method with 
	  easy way used this used in Rq for history back  */
		return Ut.f("""
				<script>
					const msg='%s'.trim();
					if(msg.length > 0){
						alert(msg)
					}
					history.back();
				</script>
				
				""", msg );
	}
 
	public static String jsReplace(String msg, String uri) {
		if(msg==null) {
			msg="";
		}
		if(uri==null) {
			uri="/";
		}
		return Ut.f("""
				<script>
				const msg='%s'.trim();
				if( msg.lenth >0){
					alert(msg);
				}
				location.replace('%s');
				</script>
				""", msg, uri);
	}
	public static String jsReplace(String resultCode, String msg, String uri) {
		if(msg==null) {
			msg="";
		}
		if(uri==null) {
			uri="/";
		}
		return Ut.f("""
				<script>
				const msg = '%s'.trim();
				if ( msg.length > 0){
					alert(msg);
				}
				location.replace('%s');
				</script>
				""", msg, uri);
	}

}
