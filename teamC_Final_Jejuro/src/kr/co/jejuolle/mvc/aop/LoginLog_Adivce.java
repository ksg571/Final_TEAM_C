package kr.co.jejuolle.mvc.aop;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import kr.co.jejuolle.mvc.dao.Users_Inter;
import kr.co.jejuolle.mvc.vo.LoginLogVO;

@Component
@Aspect
public class LoginLog_Adivce {

	@Autowired
	private Users_Inter user_inter;

	@Around("execution(* kr.co.jejuolle.mvc.controller.Login_Controller.loginf*(..))")
	public ModelAndView arAdivce(ProceedingJoinPoint pjp) throws Throwable {
		Object[] fd = pjp.getArgs();
		ModelAndView rpath = null;
		String methodName = pjp.getSignature().getName();
		System.out.println("----------");
		System.out.println("로그인로그");
		if (methodName.equals("loginf")) {
			LoginLogVO vo = new LoginLogVO();
			rpath = (ModelAndView) pjp.proceed();
			if (fd[0] instanceof HttpSession && fd[1] instanceof HttpServletRequest) {
				HttpSession session = (HttpSession) fd[0];
				Integer uno = (Integer) session.getAttribute("uNo");
				if (uno == null) {// 로그인 했지만 세션의 값이 없을 때
				} else {
					vo.setuNo(uno);
					vo.setlStatus("login");
					user_inter.addLoginLogging(vo);
				}

			}
		} else if (methodName.equals("loginfout")) {
			LoginLogVO vo = new LoginLogVO();
			if (fd[0] instanceof HttpSession && fd[1] instanceof HttpServletRequest) {
				HttpSession session = (HttpSession) fd[0];
				Integer uno = (Integer) session.getAttribute("uNo");
				if (uno == null) {// 로그인 했지만 세션의 값이 없을 때
					System.out.println("세션값없음");
				} else {
					System.out.println("----------");
					System.out.println("로그아웃로그");
					vo.setuNo(uno);
					vo.setlStatus("logout");
					user_inter.addLoginLogging(vo);
				}
			}
			rpath = (ModelAndView) pjp.proceed();
		}
		return rpath;
	}
}
