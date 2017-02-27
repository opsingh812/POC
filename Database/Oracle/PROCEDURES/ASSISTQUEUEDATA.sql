--------------------------------------------------------
--  DDL for Procedure ASSISTQUEUEDATA
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "ASSISTQUEUEDATA" 
(
  p_queueId IN QUEUE_DETAILS.QUEUEID%TYPE,
  p_repName IN QUEUE_DETAILS.SALES_REP_ASSIGNED%TYPE
)
IS
  v_AVAILIBILITY SALES_REP_AVAILABILITY.ISAVAILABLE %TYPE;
BEGIN
    
    SELECT  ISAVAILABLE INTO v_AVAILIBILITY FROM SALES_REP_AVAILABILITY WHERE FIRST_NAME=p_repName;
    
    IF v_AVAILIBILITY='AVAILABLE' THEN
        UPDATE SALES_REP_AVAILABILITY  set isavailable='NOT AVAILABLE' where first_name=p_repName;
    
        UPDATE QUEUE_DETAILS SET SALES_REP_ASSIGNED=p_repName, STATUS='ASSISTING' where QUEUEID=p_queueId AND STATUS<>'CLOSE';
    
        UPDATE QUEUE_DETAILS_HISTORY SET ASSIST_TIME=SYSDATE , SALES_REP_ASSIGNED=p_repName where QUEUEID=p_queueId;
    END IF;
    
    commit;

EXCEPTION
   WHEN others THEN
      dbms_output.put_line('Error!');
END assistQueueData;

/
