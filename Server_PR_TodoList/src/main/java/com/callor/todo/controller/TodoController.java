package com.callor.todo.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.callor.todo.model.TodoVO;
import com.callor.todo.service.TodoService;
import com.callor.todo.service.impl.TodoServiceImplV1;

@WebServlet("/todo/*")
public class TodoController extends HttpServlet{
	
	protected TodoService tdService;
	
	public TodoController() {
		
		tdService = new TodoServiceImplV1();
		
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String path = req.getPathInfo();
		
		if(path.equals("/view")) {
			
			String strSeq = req.getParameter("td_seq");
			Long td_seq = Long.valueOf(strSeq);
			
			TodoVO tdVO = tdService.findById(td_seq);
			
			req.setAttribute("TD", tdVO);
			
			ReqController.forward(resp, req, "view");
			
		} else if(path.equals("/update")){
			
			String strSeq = req.getParameter("td_seq");
			Long td_seq = Long.valueOf(strSeq);
			
			SimpleDateFormat sDate = new SimpleDateFormat("yyyy-MM-dd");
			SimpleDateFormat sTime = new SimpleDateFormat("HH:mm:ss");
			Date date = new Date();
			
			TodoVO tdVO = tdService.findById(td_seq);
			tdVO.setTd_date(sDate.format(date));
			tdVO.setTd_time(sTime.format(date));
			
			req.setAttribute("TD", tdVO);
			
			ReqController.forward(resp, req, "update");
			
		} else if(path.equals("/delete")){
			
			String strSeq = req.getParameter("td_seq");
			Long td_seq = Long.valueOf(strSeq);
			tdService.delete(td_seq);
			
			resp.sendRedirect("/todo/");
		
		}
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		req.setCharacterEncoding("UTF-8");
		
		String td_date = req.getParameter("td_date");
		String td_content = req.getParameter("td_content");
		String td_time = req.getParameter("td_time");
		String td_place = req.getParameter("td_place");
		String strSeq = req.getParameter("td_seq");
		Long td_seq = Long.valueOf(strSeq);
		
		TodoVO tdVO = new TodoVO();
		
		tdVO.setTd_content(td_content);
		tdVO.setTd_date(td_date);
		tdVO.setTd_place(td_place);
		tdVO.setTd_time(td_time);
		tdVO.setTd_seq(td_seq);
		
		tdService.update(tdVO);
		
		System.out.println(tdVO.toString());
		
		resp.sendRedirect("/todo/");
		
		
	}

	
	
}
