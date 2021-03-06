package com.callor.todo.service.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.callor.todo.config.DBConnect;
import com.callor.todo.model.TodoVO;
import com.callor.todo.service.TodoService;
import com.mysql.cj.x.protobuf.MysqlxPrepare.Prepare;

public class TodoServiceImplV1 implements TodoService {

	protected Connection dbConn;

	public TodoServiceImplV1() {

		dbConn = DBConnect.getDB();

	}

	protected List<TodoVO> select(PreparedStatement pStr) throws SQLException {

		List<TodoVO> tdList = new ArrayList<TodoVO>();
		ResultSet rSet = pStr.executeQuery();
		
		while (rSet.next()) {

			TodoVO tdVO = new TodoVO();

			tdVO.setTd_content(rSet.getString("td_content"));
			tdVO.setTd_date(rSet.getString("td_date"));
			tdVO.setTd_place(rSet.getString("td_place"));
			tdVO.setTd_time(rSet.getString("td_time"));
			tdVO.setTd_seq(rSet.getLong("td_seq"));
			tdList.add(tdVO);

		}

		return tdList;
	}

	@Override
	public List<TodoVO> selectAll() {
		// TODO Auto-generated method stub

		String sql = " SELECT * FROM tbl_todo ";

		PreparedStatement pStr = null;

		try {

			pStr = dbConn.prepareStatement(sql);
			List<TodoVO> tdList = this.select(pStr);
			

			return tdList;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return null;
	}

	@Override
	public TodoVO findById(Long td_seq) {
		// TODO Auto-generated method stub

		String sql = " SELECT * FROM tbl_todo ";
		sql += " WHERE td_seq = ? ";

		PreparedStatement pStr = null;

		try {
			pStr = dbConn.prepareStatement(sql);
			pStr.setLong(1, td_seq);
			
			List<TodoVO> tdList = this.select(pStr);
			
			if(tdList != null && tdList.size() > 0) {
				
				return tdList.get(0);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return null;
	}

	@Override
	public Integer insert(TodoVO tdVO) {
		// TODO Auto-generated method stub
		
		String sql = " INSERT INTO tbl_todo ";
		sql += " (td_content, td_date, td_time, td_place) ";
		sql += " VALUES(?,?,?,?) ";
		
		PreparedStatement pStr = null;
		
		try {
			pStr = dbConn.prepareStatement(sql);
			pStr.setString(1, tdVO.getTd_content());
			pStr.setString(2, tdVO.getTd_date());
			pStr.setString(3, tdVO.getTd_time());
			pStr.setString(4, tdVO.getTd_place());
			
			return pStr.executeUpdate();
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null;
	}

	@Override
	public Integer update(TodoVO tdVO) {
		// TODO Auto-generated method stub
		
		String sql = " UPDATE tbl_todo SET ";
		sql += " td_content = ?, ";
		sql += " td_date = ?, ";
		sql += " td_time = ?, ";
		sql += " td_place = ? ";
		sql += " WHERE td_seq = ? ";
		
		PreparedStatement pStr = null;
		
		try {
			pStr = dbConn.prepareStatement(sql);
			pStr.setString(1, tdVO.getTd_content());
			pStr.setString(2, tdVO.getTd_date());
			pStr.setString(3, tdVO.getTd_time());
			pStr.setString(4, tdVO.getTd_place());
			pStr.setLong(5, tdVO.getTd_seq());
			
			
			return pStr.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null;
	}

	@Override
	public Integer delete(Long td_seq) {
		// TODO Auto-generated method stub
		
		String sql = " DELETE FROM tbl_todo ";
		sql += " WHERE td_seq = ? ";
	
		PreparedStatement pStr = null;
		
		try {
			pStr = dbConn.prepareStatement(sql);
			pStr.setLong(1, td_seq);
			
			return pStr.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		

		
		return null;
	}

}
