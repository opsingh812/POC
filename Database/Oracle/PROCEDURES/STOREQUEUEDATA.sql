--------------------------------------------------------
--  DDL for Procedure STOREQUEUEDATA
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "STOREQUEUEDATA" (
	   p_fname IN QUEUE_DETAILS.FNAME%TYPE,
	   p_lname IN QUEUE_DETAILS.LNAME%TYPE,
     p_phone IN QUEUE_DETAILS.PHONE%TYPE,
     p_type IN QUEUE_DETAILS.TYPE%TYPE,
     p_reason IN QUEUE_DETAILS.REASON%TYPE,
     p_qcomment IN QUEUE_DETAILS.QCOMMENT%TYPE,
     p_qdate IN QUEUE_DETAILS.QDATE%TYPE,
     p_repName IN QUEUE_DETAILS.SALES_REP_ASSIGNED%TYPE,
     p_storeId IN QUEUE_DETAILS.STORE_ID%TYPE
     )
IS
    l_seq_value   NUMBER;
BEGIN
      GET_DAILY_SEQUENCER (l_seq_value);
      
      insert into queue_details values(l_seq_value, p_fname,p_lname,p_phone, p_type,p_reason,p_qcomment,p_qdate,p_repName,'WAITING',0,p_storeId);

      insert into QUEUE_DETAILS_HISTORY values(l_seq_value,p_fname,p_lname,p_phone,sysdate,null,null,null,p_repName,sysdate,p_reason,p_storeid);
      commit;

EXCEPTION
   WHEN others THEN
      dbms_output.put_line('Error!');
END storeQueueData;

/
