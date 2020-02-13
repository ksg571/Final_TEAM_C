package kr.co.jejuolle.mvc.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.co.jejuolle.mvc.dao.SearchFilterinterdao;
import kr.co.jejuolle.mvc.vo.SearchLoggerDTO;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
@RestController
public class JsonController {
	
	@Autowired
	private SearchFilterinterdao dao;
	
	@RequestMapping("searchrank")
	public JSONArray searchrank(HttpServletRequest request,HttpServletResponse response) {
		response.setHeader("Content-Type", "text/xml; charset=EUC-KR");
		int cnt = 1;
		System.out.println("searchrank의 컨트롤");
		JSONArray list = new JSONArray();
		JSONObject object = null;
		List<SearchLoggerDTO> hlist = dao.searchrank();
			for(SearchLoggerDTO e : hlist) {
				if(cnt <= 10) {
				object = new JSONObject();
				object.put("data",e.getSword());
				list.add(object);
				System.out.println(e.getSword());
				cnt++;
				}
			}

		return list;
	}
	
}
