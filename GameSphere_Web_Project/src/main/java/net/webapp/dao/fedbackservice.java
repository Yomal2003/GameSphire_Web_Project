package net.webapp.dao;

import java.lang.reflect.Array;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import net.webapp.dao.DBConnect;
import net.webapp.model.feedback;

public class fedbackservice {

	public void addMsg(feedback fa ) {
		
		try {
			
			String query =  "INSERT INTO feedback VALUES('"+fa.getEmail()+"' , '"+fa.getName()+"' , '"+fa.getGname()+"' , '"+fa.getMsg()+"')";
			Statement stat = DBConnect.getConnection().createStatement();
			stat.executeUpdate(query);
			
			
		} catch (Exception e) {
            e.printStackTrace();		}
		
		
	}
	
	
	
	public ArrayList<feedback> getAllFeedBacks(){
		ArrayList<feedback> feedList  = new ArrayList<feedback>();
		
	try {
		
		String querey = "Select * from feedback";
		Statement stat = DBConnect.getConnection().createStatement();
		ResultSet rs = stat.executeQuery(querey);
		
		
		while(rs.next()) {
			
			feedback fd = new feedback();
			fd.setEmail(rs.getString("email"));
			fd.setName(rs.getString("name"));
			fd.setGname(rs.getString("Gname"));
			fd.setMsg(rs.getString("Msg"));
			feedList.add(fd);
			
		}
		
		return feedList;
		
	} catch (Exception e) {
        e.printStackTrace();
	    return null ;
	}
	
	
	}
	
	public void Updatefeed(feedback fd) {
		
		try {
			String query = "UPDATE feedback SET  name = '"+fd.getName()+"' , Gname = '"+fd.getGname()+"' , Msg = '"+fd.getMsg()+"' WHERE email = '"+fd.getEmail()+"'";
			Statement stat = DBConnect.getConnection().createStatement();
			stat.executeUpdate(query);
		} catch (Exception e) {
               e.printStackTrace();
 }
	}
	
	
	
	
	public feedback getSingle(feedback fd) {
		
		try {
			
			String query = "SELECT * from feedback WHERE email ='"+fd.getEmail()+"'";
			Statement stat = DBConnect.getConnection().createStatement();
			ResultSet rs = stat.executeQuery(query);
			
			
			if(rs.next()) {
				
				fd.setEmail(rs.getString("email"));
				fd.setName(rs.getString("name"));
				fd.setGname(rs.getString("Gname"));
				fd.setMsg(rs.getString("Msg"));
			}
			
			return fd ;
			
		} catch (Exception e) {
              e.printStackTrace();
		}
		return null;
	}
	
	
	
	
	
	
	public void deleteFeed(feedback fb) {
		
		try {
			
			String query = "DELETE from feedback WHERE email ='"+fb.getEmail()+"'";
			Statement stat = DBConnect.getConnection().createStatement();
			stat.executeUpdate(query);
			
		} catch (Exception e) {
 
		e.printStackTrace();
		}
	}
	
	
	
	
	
}
