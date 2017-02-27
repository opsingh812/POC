package com.retail.springservice.model;

import java.sql.Time;

public class Appointment {

	private int cust_id;
	private int store_id;
	private int appointment_id;
	private Time appointment_time;
	private String appointment_date;
	private String cust_fname;
	private String cust_lname;
	private String cust_phone;
	private String cust_email;
	private String cust_type;
	private String cust_reason;
	
	public int getCust_id() {
		return cust_id;
	}
	public void setCust_id(int cust_id) {
		this.cust_id = cust_id;
	}
	public int getStore_id() {
		return store_id;
	}
	public void setStore_id(int store_id) {
		this.store_id = store_id;
	}
	public int getAppointment_id() {
		return appointment_id;
	}
	public void setAppointment_id(int appointment_id) {
		this.appointment_id = appointment_id;
	}
	public Time getAppointment_time() {
		return appointment_time;
	}
	public void setAppointment_time(Time appointment_time) {
		this.appointment_time = appointment_time;
	}
	public String getAppointment_date() {
		return appointment_date;
	}
	public void setAppointment_date(String appointment_date) {
		this.appointment_date = appointment_date;
	}
	public String getCust_fname() {
		return cust_fname;
	}
	public void setCust_fname(String cust_fname) {
		this.cust_fname = cust_fname;
	}
	public String getCust_lname() {
		return cust_lname;
	}
	public void setCust_lname(String cust_lname) {
		this.cust_lname = cust_lname;
	}
	public String getCust_phone() {
		return cust_phone;
	}
	public void setCust_phone(String cust_phone) {
		this.cust_phone = cust_phone;
	}
	public String getCust_email() {
		return cust_email;
	}
	public void setCust_email(String cust_email) {
		this.cust_email = cust_email;
	}
	public String getCust_type() {
		return cust_type;
	}
	public void setCust_type(String cust_type) {
		this.cust_type = cust_type;
	}
	public String getCust_reason() {
		return cust_reason;
	}
	public void setCust_reason(String cust_reason) {
		this.cust_reason = cust_reason;
	}
	
}
