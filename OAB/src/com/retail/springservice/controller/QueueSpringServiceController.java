package com.retail.springservice.controller;


import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;



import java.util.List;

import com.retail.springservice.dao.QueueService;
import com.retail.springservice.dao.QueueServiceImpl;
import com.retail.springservice.model.Appointment;
import com.retail.springservice.model.ExistingCustomer;
import com.retail.springservice.model.Store;
import com.retail.springservice.model.StoreTime;


@RestController
@EnableWebSecurity
@RequestMapping("/service/oab/")
public class QueueSpringServiceController {
 
 QueueService queueService = new QueueServiceImpl();
  
@RequestMapping(value = "/getStores/{pin}", method = RequestMethod.GET,headers="Accept=application/json")
public List<Store> getStoreDetails(@PathVariable String pin) {
	
	 List<Store> queues= null;
	 try {  
		 
		  queues = queueService.getStores(pin);
	 } catch (Exception e) {  
		   e.printStackTrace();  
	 } 
	 
  return queues;
 }
 
@RequestMapping(value = "/getStoreTime/{id}", method = RequestMethod.GET,headers="Accept=application/json")
public List<StoreTime> getStoreTime(@PathVariable String id){
	
	 List<StoreTime> queues= null;
	 try {  
		 
		  queues = queueService.getStoreTime(id);
	 } catch (Exception e) {  
		   e.printStackTrace();  
	 } 
	 
  return queues;
}

@RequestMapping(value = "/saveAppointment/save", method = RequestMethod.POST)
public List<Appointment> saveAppointmentForm(@RequestBody Appointment apmtForm) {
	
	List<Appointment> AppDetail=null; 
			
	try {
		AppDetail=queueService.saveAppointment(apmtForm);
	} catch (Exception e) {
		
		e.printStackTrace();
	}
	
	return AppDetail;
	
}


@RequestMapping(value = "/checkExe/{phone}", method = RequestMethod.GET,headers="Accept=application/json")
public List<ExistingCustomer> checkExistingCustomer(@PathVariable String phone)
{
	List<ExistingCustomer> cec=null;
	
	try {
		cec=queueService.getExistingCustomer(phone);
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return cec;
}

@RequestMapping(value = "/activeSlots/{storeId}", method = RequestMethod.GET,headers="Accept=application/json")
public List<Appointment> activeAppSlots(@PathVariable String storeId)
{
	List<Appointment> AppDetail=null; 
	
	try {
		AppDetail=queueService.getAllActiveAppointments(storeId);
	} catch (Exception e) {
		
		e.printStackTrace();
	}
	
	return AppDetail;
}

/*@RequestMapping(value = "/login/{username}/{password}", method = RequestMethod.GET,headers="Accept=application/json")
public void login(@PathVariable String username,@PathVariable String password)
{
	BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
	String hashedPassword = passwordEncoder.encode(password);
	try {
		queueService.loginCheck(username,hashedPassword);
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
}
*/

}
