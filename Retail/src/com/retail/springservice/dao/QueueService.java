package com.retail.springservice.dao;

import java.sql.SQLException;
import java.util.List;
import com.retail.springservice.model.ExistingCustomer;
import com.retail.springservice.model.History;
import com.retail.springservice.model.Queue;
import com.retail.springservice.model.SalesRepDetails;


public interface QueueService 
{
	public List<Queue> getAllCustomers() throws Exception;
	
	public List<SalesRepDetails> getAllRep(int store_id) throws Exception;
	
	public List<Queue> getCustomerByqueueId(int storeId) throws Exception;
	public List<Queue> deleteCustomerByqueueId(int queueId,int storeId)throws Exception;
	public List<Queue> saveQueue(Queue queue) throws Exception;
	public List<Queue> getRepQueue(String sales_rep_assigned,int storeId)throws Exception;//for home page of specific rep 
	
	public List<SalesRepDetails> repLoginCheck(String email,String pwd)throws Exception;
	
	public List<Queue> assistNextCustomer(int queueId, String repName,int storeId)throws Exception;
	public List<Queue> moveToQueueLast(int queueId,int storeId)throws Exception;
	
	public void setStillBrowsing(int queueId)throws Exception;
	
	public List<Queue> getAndSetNewRep( String repName,int queueId,int storeId) throws Exception;
	public List<Queue> getRepNext(String sales_rep_assigned,int storeId)throws Exception;
	
	public List<History> getHistory(String date,int storeId)throws Exception;

	public List<SalesRepDetails> saveRepInfo(SalesRepDetails rep)throws Exception;
	
	public List<SalesRepDetails> RemoveRep(String email,int store_id)throws Exception;

	public List<ExistingCustomer> getExistingCustomer(String phone, int check)throws Exception;
	
	
}
