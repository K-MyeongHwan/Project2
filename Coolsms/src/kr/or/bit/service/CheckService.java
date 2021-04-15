package kr.or.bit.service;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

public class CheckService implements Action{
		@Override
		public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
			
			String random = request.getParameter("random");
			String phoneNm = request.getParameter("phoneNm");
			System.out.println(random);
			System.out.println(phoneNm);
			
 			String msg = "당신의 인증번호는 " + random + " 입니다.";
			

			String api_key = "NCSQVZHUUXWP6BSJ";
			String api_secret = "8IHVRGHGUYX2FIE7VWIGXBCHYXHSOQAR";
			Message coolsms = new Message(api_key, api_secret);

			// 4 params(to, from, type, text) are mandatory. must be filled
			HashMap<String, String> params = new HashMap<String, String>();
			params.put("to", phoneNm );
			params.put("from", "01023953883");
			params.put("type", "SMS");
			params.put("text", msg);
			params.put("app_version", "test app 1.2"); // application name and version

			try {
				JSONObject obj = (JSONObject) coolsms.send(params);
				System.out.println(obj.toString());
			} catch (CoolsmsException e) {
				System.out.println(e.getMessage());
				System.out.println(e.getCode());
			}
		
			request.setAttribute("random", random);
			
			ActionForward forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("WEB-INF/views/CheckOk.jsp");
			
			return forward;
		}
}
