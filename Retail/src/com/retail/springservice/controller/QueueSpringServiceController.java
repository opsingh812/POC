package com.retail.springservice.controller;


import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;

import com.retail.springservice.dao.QueueService;
import com.retail.springservice.dao.QueueServiceImpl;

import com.retail.springservice.model.ExistingCustomer;
import com.retail.springservice.model.History;
import com.retail.springservice.model.Queue;
import com.retail.springservice.model.SalesRepDetails;


@RestController

@RequestMapping("/service/queue/")
public class QueueSpringServiceController {
 
 QueueService queueService = new QueueServiceImpl();
  
 /*@RequestMapping(value = "/{queueId}", method = RequestMethod.GET,headers="Accept=application/json")
public List<Queue> getCustomer(@PathVariable int queueId) {
	List<Queue> queues= null;
	 try {  
		  queues = queueService.getCustomerByqueueId(queueId);
	 } catch (Exception e) {  
		   e.printStackTrace();  
	 } 
	 
  return queues;
 }
*/
 
@RequestMapping(value = "/{storeId}", method = RequestMethod.GET,headers="Accept=application/json")
 public List<Queue> getCustomer(@PathVariable int storeId) {
 	List<Queue> queues= null;
 	 try {  
 		  queues = queueService.getCustomerByqueueId(storeId);
 	 } catch (Exception e) {  
 		   e.printStackTrace();  
 	 } 
 	 
   return queues;
}
 
 
@RequestMapping(method = RequestMethod.GET,headers="Accept=application/json")
public List<Queue> getAllCustomers() {
	 List<Queue> queues = null;
	 try {  
		 queues = queueService.getAllCustomers();
	 } catch (Exception e) {  
		   e.printStackTrace();  
	 } 
  return queues;
 }
 
 @RequestMapping(value = "/getAllRep/{store_id}", method = RequestMethod.GET,headers="Accept=application/json")
public List<SalesRepDetails> getAllSalesRep(@PathVariable int store_id ) {
	 List<SalesRepDetails> rep=null;
	 try {
		 //System.out.println("Getting all sales rep of ther store");
		 rep=queueService.getAllRep(store_id);
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return rep;
 }
 
@RequestMapping(value = "/getRepQueue/{sales_rep_assigned}/{storeId}", method = RequestMethod.GET,headers="Accept=application/json")
public List<Queue> getRepQueue(@PathVariable String sales_rep_assigned,@PathVariable int storeId)
 {
 	 
 	List<Queue> queues=null;
 	 try {
 		queues=queueService.getRepQueue(sales_rep_assigned,storeId);
 	} catch (Exception e) {
 		// TODO Auto-generated catch block
 		e.printStackTrace();
 	}
 	return queues;
}

@RequestMapping(value = "/getRepNext/{sales_rep_assigned}/{storeId}", method = RequestMethod.GET,headers="Accept=application/json")
public List<Queue> getRepNext(@PathVariable String sales_rep_assigned,@PathVariable int storeId)
 {
 	//System.out.println(sales_rep_assigned); 
 	List<Queue> queues=null;
 	 try {
 		queues=queueService.getRepNext(sales_rep_assigned,storeId);
 	} catch (Exception e) {
 		// TODO Auto-generated catch block
 		e.printStackTrace();
 	}
 	return queues;
}

@RequestMapping(value = "/rmv/{queueId}/{storeId}", method = RequestMethod.GET,headers="Accept=application/json")
public List<Queue> removeCustomer(@PathVariable int queueId,@PathVariable int storeId)
 {
	List<Queue> x=new ArrayList<Queue>();
 

	 try {
		x= queueService.deleteCustomerByqueueId(queueId,storeId);
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
	return x;
 }

@RequestMapping(value = "/repremove/{email}/{store_id}", method = RequestMethod.GET,headers="Accept=application/json")
public List<SalesRepDetails> DeleteRep(@PathVariable String email,@PathVariable int store_id)
 {
	List<SalesRepDetails> x=new ArrayList<SalesRepDetails>();
	
	email=email.replace('&', '.');
	
	try {
		x= queueService.RemoveRep(email,store_id);
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
	return x;
 }

@RequestMapping(value = "/newrep/{repName}/{queueId}/{storeId}", method = RequestMethod.GET,headers="Accept=application/json")
public List<Queue> getAndSetRep(@PathVariable String repName,@PathVariable int queueId,@PathVariable int storeId )
 {
	List<Queue> x=new ArrayList<Queue>();
	 try {
	x=queueService.getAndSetNewRep(repName,queueId,storeId);
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
	return x;
 }

@RequestMapping(value = "/assist/{queueId}/{repName}/{storeId}", method = RequestMethod.GET,headers="Accept=application/json")
public List<Queue> assistCustomer(@PathVariable int queueId, @PathVariable String repName,@PathVariable int storeId)
 {
	List<Queue> x=new ArrayList<Queue>();
	
	//System.out.println("Assist quid: "+queueId); 
	//System.out.println("Assist with :"+repName);
	try {
		x= queueService.assistNextCustomer(queueId,repName,storeId);
		 
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return x;
 }

@RequestMapping(value = "/notFound/{queueId}/{storeId}", method = RequestMethod.GET,headers="Accept=application/json")
public List<Queue> notFoundCustomer(@PathVariable int queueId,@PathVariable int storeId)
 {
	List<Queue> x=new ArrayList<Queue>();
	//System.out.println("remove and add to last in queue!!! Huh... quid: "+queueId); 
	try {
		x=queueService.moveToQueueLast(queueId,storeId);
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
	return x;
 }

@RequestMapping(value = "/stillBrowsing/{queueId}", method = RequestMethod.GET,headers="Accept=application/json")
public void stillBrowsingCustomer(@PathVariable int queueId)
 {
	//System.out.println("The guy is still browsing ... quid: "+queueId); 
	try {
		queueService.setStillBrowsing(queueId);
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
 }
 
@RequestMapping(value = "/login/{email}/{password}", method = RequestMethod.GET,headers="Accept=application/json")
public List<SalesRepDetails> repLoginCheck(@PathVariable String email,@PathVariable String password)
 {
	 List<SalesRepDetails> nameId=null;
	 try {
		 //System.out.println("email= " + email);
		 //System.out.println("pwd= " + password);
		nameId=queueService.repLoginCheck(email, password);
		//System.out.println(nameId);
	} catch (Exception e) {
		
		e.printStackTrace();
	}
	return nameId;
	 
 }

@RequestMapping(value = "/getHistory/{date}/{storeID}", method = RequestMethod.GET,headers="Accept=application/json")
public List<History> getQueueHistory(@PathVariable String date,@PathVariable int storeId)
 {
	System.out.println(date+" "+storeId); 
	List<History> history=null;
	 try {
		 //System.out.println("entered date= " + date);
		 
		 history=queueService.getHistory(date,storeId);
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return history;
	 
 }

@RequestMapping(value = "/checkExe/{phone}/{check}", method = RequestMethod.GET,headers="Accept=application/json")
public List<ExistingCustomer> checkExistingCustomer(@PathVariable String phone,@PathVariable int check)
{
	
	System.out.println(phone+"   "+check);
	List<ExistingCustomer> cec=null;
	
	try {
		cec=queueService.getExistingCustomer(phone,check);
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return cec;
}

@RequestMapping(value="/{fName}/{lName}/{phone}/{reason}/{type}/{qComment}/{selRep}/{storeId}", method = RequestMethod.GET,headers="Accept=application/json")
public List<Queue> saveOrder(
		@PathVariable String fName, 
		@PathVariable String lName, 
		@PathVariable String phone,
		@PathVariable String reason,
		@PathVariable String type,
		@PathVariable String qComment,
		@PathVariable String selRep,
		@PathVariable int storeId
		) throws Exception 
		{	
	 	List<Queue> x=new ArrayList<Queue>();
	 	try {  
		 Queue queue = new Queue();
		 queue.setQueueId(0);
		 queue.setfName(fName);
		 queue.setlName(lName);
		 queue.setPhone(phone);
		 queue.setReason(reason);
		 queue.setType(type);
		 queue.setqComment(qComment);
		 queue.setqDate(null);
		 queue.setStatus("WAITING");
		 queue.setSALES_REP_ASSIGNED(selRep);
		 queue.setStore_id(storeId);
		 //System.out.println(fName+selRep);
		 x=queueService.saveQueue(queue);
		 
	 } catch (Exception e) {  
		   e.printStackTrace();  
	 } 
	return x;
}

@RequestMapping(value="/saveRep/{first_name}/{last_name}/{contact_no}/{desig}/{email}/{password}/{store_id}", method = RequestMethod.GET,headers="Accept=application/json")
public List<SalesRepDetails> saveRep(
		@PathVariable String first_name, 
		@PathVariable String last_name, 
		@PathVariable String contact_no,
		@PathVariable String desig,
		@PathVariable String email,
		@PathVariable String password,
		@PathVariable int store_id
		) throws Exception 
		{	
	 	
		List<SalesRepDetails> x=new ArrayList<SalesRepDetails>();
	 	try {  
	 	SalesRepDetails rep = new SalesRepDetails();
		rep.setSales_rep_id(0);
	 	rep.setFirst_name(first_name);
	 	rep.setLast_name(last_name);
	 	rep.setContact_no(contact_no);
	 	rep.setDesig(desig);
	 	rep.setEmail(email);
	 	rep.setPassword(password);
	 	rep.setStore_id(store_id);
		
	 	//System.out.println("Username:"+first_name+"password: "+password);
	 	x=queueService.saveRepInfo(rep);
		 
	 } catch (Exception e) {  
		   e.printStackTrace();  
	 } 
	return x;
}

}
