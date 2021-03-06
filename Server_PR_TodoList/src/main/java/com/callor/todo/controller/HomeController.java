package com.callor.todo.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.callor.todo.model.TodoVO;
import com.callor.todo.service.TodoService;
import com.callor.todo.service.impl.TodoServiceImplV1;

@WebServlet("/")
public class HomeController extends HttpServlet{
	
	protected TodoService tdService;
	
	public HomeController() {
		
		tdService = new TodoServiceImplV1();
		
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		List<TodoVO> tdList = tdService.selectAll();
		
		req.setAttribute("TDLIST", tdList);
		
		SimpleDateFormat sDate = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat sTime = new SimpleDateFormat("HH:mm:ss");
		Date date = new Date(System.currentTimeMillis());
		
		TodoVO tdVO = new TodoVO();
		
		tdVO.setTd_date(sDate.format(date));
		tdVO.setTd_time(sTime.format(date));
		
		req.setAttribute("TD", tdVO);
		
		ReqController.forward(resp, req, "home");
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		req.setCharacterEncoding("UTF-8");
		
		String td_date = req.getParameter("td_date");
		String td_content = req.getParameter("td_content");
		String td_time = req.getParameter("td_time");
		String td_place = req.getParameter("td_place");
		
		TodoVO tdVO = new TodoVO();
		
		tdVO.setTd_content(td_content);
		tdVO.setTd_date(td_date);
		tdVO.setTd_place(td_place);
		tdVO.setTd_time(td_time);
		
		tdService.insert(tdVO);
		
		System.out.println(tdVO.toString());
		
		resp.sendRedirect("/todo/");
		
	}

}
