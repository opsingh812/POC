--------------------------------------------------------
--  DDL for Procedure MOVETOLASTINQUEUE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "MOVETOLASTINQUEUE" 
 (
P_QUEUE_ID IN QUEUE_DETAILS.QUEUEID%TYPE
 )
IS
      V_fname  QUEUE_DETAILS.FNAME%TYPE;
      V_lname QUEUE_DETAILS.LNAME%TYPE;
      V_phone QUEUE_DETAILS.PHONE%TYPE;
      V_type QUEUE_DETAILS.TYPE%TYPE;
      V_reason  QUEUE_DETAILS.REASON%TYPE;
      V_qcomment  QUEUE_DETAILS.QCOMMENT%TYPE;
      v_salesRep QUEUE_DETAILS.SALES_REP_ASSIGNED%TYPE;
      v_naCount QUEUE_DETAILS.NA_COUNT%TYPE;
      v_store_id queue_details.store_id%type;
      
      l_seq_value   NUMBER;
      
 BEGIN
      
      UPDATE QUEUE_DETAILS set NA_COUNT=NA_COUNT+1 where QUEUEID=P_QUEUE_ID;
      
      SELECT FNAME, LNAME,  PHONE,  REASON, TYPE, QCOMMENT,SALES_REP_ASSIGNED,NA_COUNT,STORE_ID
      INTO V_fname,V_lname,V_phone,V_reason,V_type,V_qcomment,v_salesRep,v_naCount,v_store_id
      FROM QUEUE_DETAILS
      WHERE QUEUEID=P_QUEUE_ID AND STATUS='ASSISTING';
      
      IF v_naCount<2 then
      
        GET_DAILY_SEQUENCER (l_seq_value);
        DELETE FROM QUEUE_DETAILS WHERE QUEUEID=P_QUEUE_ID;
        insert into queue_details values(l_seq_value, V_fname,V_lname,V_phone, V_type,V_reason,V_qcomment,SYSDATE,'NEXT AVAILABLE','NOT AVAILABLE',v_naCount,v_store_id);
        UPDATE QUEUE_DETAILS_HISTORY SET NA_TIME=SYSDATE  where QUEUEID=P_QUEUE_ID;
        UPDATE SALES_REP_AVAILABILITY SET ISAVAILABLE='AVAILABLE' WHERE FIRST_NAME=v_salesRep;
      END if;
      
      IF v_naCount>1 then
      
        DELETE FROM QUEUE_DETAILS WHERE QUEUEID=P_QUEUE_ID;
        UPDATE QUEUE_DETAILS_HISTORY SET NA_TIME=SYSDATE  where QUEUEID=P_QUEUE_ID;
        UPDATE SALES_REP_AVAILABILITY SET ISAVAILABLE='AVAILABLE' WHERE FIRST_NAME=v_salesRep;
      END IF;
      
      COMMIT;
      
EXCEPTION
   WHEN others THEN
      dbms_output.put_line('Error!');      
 
 END moveToLastInQueue;

/
