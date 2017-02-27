--------------------------------------------------------
--  DDL for Procedure UPDATEDQUEUEDATA
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "UPDATEDQUEUEDATA" 
(
  p_queueId IN QUEUE_DETAILS.QUEUEID%TYPE
)
IS
  v_repname QUEUE_DETAILS.SALES_REP_ASSIGNED%TYPE;
 
  v_count number(5);
BEGIN
    SELECT SALES_REP_ASSIGNED INTO V_REPNAME FROM QUEUE_DETAILS WHERE QUEUEID=p_queueId;
      
    UPDATE QUEUE_DETAILS SET STATUS='CLOSE' WHERE QUEUEID=p_queueId;
    UPDATE QUEUE_DETAILS_HISTORY SET CLOSE_TIME=SYSDATE WHERE QUEUEID=p_queueId;
    
    select count(*) into v_count from QUEUE_DETAILS where SALES_REP_ASSIGNED=v_repname and status='OPEN';
    
    if (v_count=0) then
      UPDATE SALES_REP_AVAILABILITY  set isavailable='AVAILABLE' where first_name=v_repName;
  end if;
    
    commit;
EXCEPTION
   WHEN others THEN
      dbms_output.put_line('Error!');
END updatedQueueData;

/
