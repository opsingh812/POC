package com.retail.springservice.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

import javassist.bytecode.stackmap.TypeData.ClassName;

import com.retail.springservice.model.Appointment;
import com.retail.springservice.model.ExistingCustomer;
import com.retail.springservice.model.Store;
import com.retail.springservice.model.StoreTime;
import com.retail.springservice.utility.DBUtility;

import com.retail.springservice.dao.QueueService;

public class QueueServiceImpl implements QueueService {

	private Connection connection;
	Logger log = Logger.getLogger(ClassName.class.getName());

	public QueueServiceImpl() {
		connection = DBUtility.getConnection();
	}

	@Override
	public List<Store> getStores(String pin) throws Exception {

		List<Store> cec = new ArrayList<Store>();

		Statement statement = connection.createStatement();

		String qry = "select * from oab_store WHERE store_pin='" + pin + "'";
		ResultSet rs = statement.executeQuery(qry);
		while (rs.next()) {
			Store c = new Store();
			
			c.setStore_id(rs.getInt("store_id"));
			c.setStore_pin(rs.getString("store_pin"));
			c.setStore_name(rs.getString("store_name"));
			
			c.setStore_address1(rs.getString("store_address1"));
			c.setStore_address2(rs.getString("store_address2"));
			c.setStore_phone(rs.getString("store_phone"));
			
			cec.add(c);
		}

		statement.close();
		return cec;
	}

	@Override
	public List<StoreTime> getStoreTime(String id) throws Exception 
	{
		
		List<StoreTime> st = new ArrayList<StoreTime>();
		Statement statement = connection.createStatement();
		String qry="Select * from oab_store_timing where store_id='" + id + "'";
		ResultSet rs = statement.executeQuery(qry);
		while (rs.next()){
			StoreTime c =new StoreTime();
			
			c.setStore_id(rs.getInt("store_id"));
			c.setStore_day(rs.getString("store_day"));
			c.setStore_date(rs.getString("store_date"));
			c.setMorning_time_start(rs.getTime("morning_time_start"));
			c.setMorning_time_end(rs.getTime("morning_time_end"));
			c.setAfternoon_time_start(rs.getTime("afternoon_time_start"));
			c.setAfternoon_time_end(rs.getTime("afternoon_time_end"));
			c.setEvening_time_start(rs.getTime("evening_time_start"));
			c.setEvening_time_end(rs.getTime("evening_time_end"));
			st.add(c);
		}

		statement.close();
		return st;
	}
	

	@Override
	public List<Appointment> saveAppointment(Appointment apmt) throws Exception {
		
		String query = "{ call SAVEAPPOINTMENT(?,?,?,?,?,?,?,?,?) }";
		
		CallableStatement stmt=connection.prepareCall(query);
		stmt.setInt(1,apmt.getStore_id());  
		stmt.setString(2,apmt.getAppointment_time().toString());
		stmt.setString(3,apmt.getAppointment_date());
		stmt.setString(4,apmt.getCust_fname());
		stmt.setString(5,apmt.getCust_lname());
		stmt.setString(6,apmt.getCust_phone());
		stmt.setString(7,apmt.getCust_email());
		stmt.setString(8,apmt.getCust_type());
		stmt.setString(9,apmt.getCust_reason());
		
		stmt.execute();
		//System.out.println(x);
		return getSavedAppointment(apmt.getCust_phone(),apmt.getCust_email());
	}

	
	@Override
	public List<Appointment> getSavedAppointment(String phone, String email) throws Exception {
		
		
		List<Appointment> appList = new ArrayList<Appointment>();
		Statement statement = connection.createStatement();
		
		String qry="Select * from oab_appointment_detail where cust_phone='" + phone + "' AND cust_email='"+email +"' AND APP_STATUS='ACTIVE'";
		ResultSet rs = statement.executeQuery(qry);
		while (rs.next()){
			
			Appointment a=new Appointment();
			
			a.setCust_id(rs.getInt("cust_id"));
			a.setStore_id(rs.getInt("store_id"));
			a.setAppointment_id(rs.getInt("appointment_id"));
			a.setAppointment_date(rs.getString("appointment_date"));
			a.setAppointment_time(rs.getTime("appointment_time"));
			a.setCust_fname(rs.getString("cust_fname"));
			a.setCust_lname(rs.getString("cust_lname"));
			a.setCust_phone(rs.getString("cust_phone"));
			a.setCust_email(rs.getString("cust_email"));
			a.setCust_type(rs.getString("cust_type"));
			a.setCust_reason(rs.getString("cust_reason"));
			
			appList.add(a);
		}

		statement.close();
		return appList;

	}

	@Override
	public List<ExistingCustomer> getExistingCustomer(String phone) throws SQLException {
		
		List<ExistingCustomer> cec = new ArrayList<ExistingCustomer>();
		ExistingCustomer c = new ExistingCustomer();
		
		Statement statement = connection.createStatement();
		String qry1="select * from oab_customer WHERE CUST_PHONE='"+phone+"'";
			
		ResultSet rs = statement.executeQuery(qry1);
			while (rs.next()) 
			{
				c.setCUST_ID(rs.getInt("CUST_ID"));
				c.setCUST_FNAME(rs.getString("CUST_FNAME"));
				c.setCUST_LNAME(rs.getString("CUST_LNAME"));
				c.setCUST_PHONE(rs.getString("CUST_PHONE"));
				c.setCUST_EMAIL(rs.getString("CUST_EMAIL"));
				cec.add(c);
			}
		statement.close();
		return cec;
	}

	@Override
	public List<Appointment> getAllActiveAppointments(String storeId) throws Exception {
		List<Appointment> appList = new ArrayList<Appointment>();
		Statement statement = connection.createStatement();
		
		String qry="Select * from oab_appointment_detail where store_id='" + storeId + "' AND APP_STATUS='ACTIVE'";
		ResultSet rs = statement.executeQuery(qry);
		while (rs.next()){
			
			Appointment a=new Appointment();
			
			a.setCust_id(rs.getInt("cust_id"));
			a.setStore_id(rs.getInt("store_id"));
			a.setAppointment_id(rs.getInt("appointment_id"));
			a.setAppointment_date(rs.getString("appointment_date"));
			a.setAppointment_time(rs.getTime("appointment_time"));
			a.setCust_fname(rs.getString("cust_fname"));
			a.setCust_lname(rs.getString("cust_lname"));
			a.setCust_phone(rs.getString("cust_phone"));
			a.setCust_email(rs.getString("cust_email"));
			a.setCust_type(rs.getString("cust_type"));
			a.setCust_reason(rs.getString("cust_reason"));
			
			appList.add(a);
		}

		statement.close();
		return appList;
	}

	/*@Override
	public void loginCheck(String username, String password) throws Exception {
		
		Statement statement = connection.createStatement();
		
		
		String qry="INSERT INTO users(username,password,enabled) VALUES ('"+username +"','"+ password+"', true)";
		statement.execute(qry);
		statement.close();
	}*/
}

