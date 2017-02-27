package com.retail.springservice.dao;

import java.util.List;

import com.retail.springservice.model.Appointment;
import com.retail.springservice.model.ExistingCustomer;
import com.retail.springservice.model.Store;
import com.retail.springservice.model.StoreTime;


public interface QueueService 
{
	public List<Store> getStores(String pin) throws Exception;
	
	public List<StoreTime> getStoreTime(String id) throws Exception;
	
	public List<Appointment> saveAppointment(Appointment apmt) throws Exception;
	//public List<Appointment> getAllAppointments() throws Exception;
	public List<Appointment> getSavedAppointment(String phone,String email) throws Exception;

	public List<ExistingCustomer> getExistingCustomer(String phone)throws Exception;

	public List<Appointment> getAllActiveAppointments(String storeId)throws Exception;

	/*public void loginCheck(String username, String password)throws Exception;*/
	
}
