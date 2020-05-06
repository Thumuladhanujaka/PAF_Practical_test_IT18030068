package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.json.simple.JSONObject;

import connection.DBConnect;


public class labModel {

private int success;
	
	public void addTests(String name,int age,String gender,String date,String test_name) {
		Connection connection;
		PreparedStatement preparedStatement;
		
		try {
			connection = DBConnect.getDBConnection();
			
			//insert value
			preparedStatement = connection.prepareStatement("insert into lab (name,age,gender,date,test_name) values (?,?,?,?,?)");
			preparedStatement.setString(1, name);
			preparedStatement.setInt(2, age);
			preparedStatement.setString(3,gender);
			preparedStatement.setString(4, date);
			preparedStatement.setString(5,test_name);
			preparedStatement.execute();
			preparedStatement.close();
			connection.close();
			setSuccess(1);
		
		}catch (ClassNotFoundException | SQLException  e) {
			setSuccess(0);
			System.out.println(e.getMessage());
		}
	}

	public int getSuccess() {
		return success;
	}

	public void setSuccess(int success) {
		this.success = success;
	}
	
	public String getTests() {
		
		Connection connection;
		PreparedStatement preparedStatement;
		String table="";
		
		try {
			
			connection = DBConnect.getDBConnection();
			preparedStatement = connection.prepareStatement("SELECT * FROM lab");
			
			ResultSet resultSet = preparedStatement.executeQuery();
			
			table = "<table class='table'><thead>"
		            +"<tr>"
		            +"<th class='tableTh'>ID</th>"
		                +"<th class='tableTh'>Name</th>"
		                +"<th class='tableTh'>Age</th>"
		                +"<th class='tableTh'>Gender</th>"
		                +"<th class='tableTh'>Date</th>"
		                +"<th class='tableTh'>Test Name</th>"
		                +"<th class='tableTh'>Action</th>"
		                +"</tr>"
		            +"</thead><tbody>";
			
			while (resultSet.next()) {
				
				String button = "<button type='button' onclick='edit("+resultSet.getString(1)+")' class='btn btn-success'>Edit</button><button type='button' onclick='deletes("+resultSet.getString(1)+")' class='btn btn-danger'>Delete</button>";
				
				table = table+"<tr><td class='tableTh'>"+resultSet.getString(1)+"</td>"
						+ "<td class='tableTh'>"+resultSet.getString(2)+"</td>"
						+ "<td class='tableTh'>"+resultSet.getString(3)+"</td>"
						+ "<td class='tableTh'>"+resultSet.getString(4)+"</td>"
						+ "<td class='tableTh'>"+resultSet.getString(5)+"</td>"
						+ "<td class='tableTh'>"+resultSet.getString(6)+"</td>"
						+ "<td class='tableTh'>"+button+"</td>"
					  + "</tr>";
				
			}
			
			preparedStatement.close();
			connection.close();
			
		}catch (ClassNotFoundException | SQLException  e) {

			System.out.println(e.getMessage());
		}
		
		return table+"</table>";
	}

	public void editTests(String name,int age,String gender,String date,String test_name,int id) {
		Connection connection;
		PreparedStatement preparedStatement;
		
		try {
			connection = DBConnect.getDBConnection();
			
				//update value
				preparedStatement = connection.prepareStatement("UPDATE lab SET name=?,age=?,gender=?,date=?,test_name=? where id=?");
				preparedStatement.setString(1, name);
				preparedStatement.setInt(2, age);
				preparedStatement.setString(3,gender);
				preparedStatement.setString(4, date);
				preparedStatement.setString(5,test_name);
				preparedStatement.setInt(6,id);
				preparedStatement.execute();
				preparedStatement.close();
				connection.close();
				setSuccess(1);
				
		
		}catch (ClassNotFoundException | SQLException  e) {
			setSuccess(0);
			System.out.println(e.getMessage());
		}
	}

	public void deleteTests(int visit) {
		Connection connection;
		PreparedStatement preparedStatement;
		
		try {
			connection = DBConnect.getDBConnection();
			
			//delete labs
			preparedStatement = connection.prepareStatement("DELETE FROM lab WHERE id=?");
			preparedStatement.setInt(1, visit);
			preparedStatement.execute();
			
			setSuccess(1);
		
		}catch (ClassNotFoundException | SQLException  e) {
			setSuccess(0);
		}
	}
	
	public JSONObject getTests(int id) {
		Connection connection;
		PreparedStatement preparedStatement;
		JSONObject json = new JSONObject();
		
		try {
			connection = DBConnect.getDBConnection();
			
			preparedStatement = connection.prepareStatement("SELECT * FROM lab where id=?");
			preparedStatement.setInt(1, id);
			ResultSet rs = preparedStatement.executeQuery();

			while(rs.next())
			{
				json.put("id", rs.getInt(1));
				json.put("name", rs.getString(2));
				json.put("age", rs.getInt(3));
				json.put("gender", rs.getString(4));
				json.put("date", rs.getString(5));
				json.put("test_name", rs.getString(6));
			}
			
		}catch (ClassNotFoundException | SQLException  e) {
			setSuccess(0);
		}
		return json;
	}
	
}
