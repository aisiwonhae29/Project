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

}
