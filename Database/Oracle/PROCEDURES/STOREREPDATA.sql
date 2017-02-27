--------------------------------------------------------
--  DDL for Procedure STOREREPDATA
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "STOREREPDATA" 
(

first_name in  SALES_REP_AVAILABILITY.FIRST_NAME%TYPE,
last_name in SALES_REP_AVAILABILITY.LAST_NAME%TYPE, 
contact_no in SALES_REP_AVAILABILITY.CONTACT_NO%TYPE,
desig in SALES_REP_AVAILABILITY.DESIG%TYPE,
email in SALES_REP_AVAILABILITY.EMAIL%TYPE,
password in SALES_REP_AVAILABILITY.PASSWORD%TYPE,
store_id in  sales_rep_availability.store_id%TYPE
)
is
Begin
  insert into SALES_REP_AVAILABILITY values(SEQ_REP.NEXTVAL,first_name,last_name,contact_no,'AVAILABLE',email,password,desig,store_id);

EXCEPTION
   WHEN others THEN
      dbms_output.put_line('Error!');
End storeRepData;

/
