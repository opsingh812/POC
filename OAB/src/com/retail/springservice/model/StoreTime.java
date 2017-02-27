package com.retail.springservice.model;

import java.sql.Time;

public class StoreTime

{
	private int store_id;
	public int getStore_id() {
		return store_id;
	}

	public void setStore_id(int store_id) {
		this.store_id = store_id;
	}

	public String getStore_day() {
		return store_day;
	}

	public void setStore_day(String store_day) {
		this.store_day = store_day;
	}

	public String getStore_date() {
		return store_date;
	}

	public void setStore_date(String store_date) {
		this.store_date = store_date;
	}

	private String store_day;
	private String store_date;
	
	private Time morning_time_start;
	
	private Time morning_time_end;
	
	private Time afternoon_time_start;
	
	private Time afternoon_time_end;
	
	private Time evening_time_start;
	
	private Time evening_time_end;

	public Time getMorning_time_start() {
		return morning_time_start;
	}

	public void setMorning_time_start(Time morning_time_start) {
		this.morning_time_start = morning_time_start;
	}

	public Time getMorning_time_end() {
		return morning_time_end;
	}

	public void setMorning_time_end(Time morning_time_end) {
		this.morning_time_end = morning_time_end;
	}

	public Time getAfternoon_time_start() {
		return afternoon_time_start;
	}

	public void setAfternoon_time_start(Time afternoon_time_start) {
		this.afternoon_time_start = afternoon_time_start;
	}

	public Time getAfternoon_time_end() {
		return afternoon_time_end;
	}

	public void setAfternoon_time_end(Time afternoon_time_end) {
		this.afternoon_time_end = afternoon_time_end;
	}

	public Time getEvening_time_start() {
		return evening_time_start;
	}

	public void setEvening_time_start(Time evening_time_start) {
		this.evening_time_start = evening_time_start;
	}

	public Time getEvening_time_end() {
		return evening_time_end;
	}

	public void setEvening_time_end(Time evening_time_end) {
		this.evening_time_end = evening_time_end;
	}
	
	

}
