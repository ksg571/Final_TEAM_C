package kr.co.jejuolle.mvc.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.jejuolle.mvc.dao.Users_Imple;
import kr.co.jejuolle.mvc.vo.UsersVO;

@Controller
public class Register_Controller {

	@Autowired
	private Users_Imple users_Dao;

	// 회원가입창으로 들어간다.
	@RequestMapping("/registerForm")
	public String register() {
		System.out.println("----------");
		System.out.println("회원가입창");
		return "header/register";
	}

	// 일반 회원 회원가입
	@RequestMapping("/register")
	public String userRegister(UsersVO vo, HttpServletRequest req) {
		String img_path = "resources/img/user/";
		String r_path = req.getRealPath("/");
		String oriFnhimage = vo.getUserImg().getOriginalFilename();
		StringBuffer pathhimage = new StringBuffer();

		pathhimage.append(r_path).append(img_path).append("\\");
		pathhimage.append(oriFnhimage);

		File fimage = new File(pathhimage.toString());
		System.out.println("사진경로 : "+pathhimage.toString());

		try {
			vo.getUserImg().transferTo(fimage);
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}

		vo.setuImg(vo.getUserImg().getOriginalFilename());
		users_Dao.addUser(vo);
		System.out.println("----------");
		System.out.println("회원가입완료");
		return "main/main";
	}
	//아이디 중복확인
	@GetMapping("/idcheck")
	public String idCheck(Model m, String uuId) {
		System.out.println("----------");
		System.out.println("아이디중복확인");
		int cnt=users_Dao.idCheck(uuId);
		m.addAttribute("cnt", cnt);
		return "idchk";
	}

}
