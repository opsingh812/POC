--------------------------------------------------------
--  DDL for Procedure GET_DAILY_SEQUENCER
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "GET_DAILY_SEQUENCER" (p_seq_value OUT number)
IS
BEGIN
   DECLARE
      l_seq_cnt     NUMBER;
      l_seq_date    DATE;
      l_seq_value   NUMBER;
      l_day_diff    NUMBER;
      busy_exception exception;
      PRAGMA EXCEPTION_INIT (busy_exception, -54);
   BEGIN
      SELECT seq_daily.NEXTVAL
      INTO l_seq_value
      FROM DUAL;

      SELECT TRUNC (SYSDATE - seq_date)
      INTO l_day_diff
      FROM tab_seq_daily;

      --DBMS_OUTPUT.put_line ('l_day_diff=' || l_day_diff);
      IF l_day_diff > 0
      THEN
         --DBMS_OUTPUT.put_line ('start of reset sequence');
         SELECT seq_date
         INTO l_seq_date
         FROM tab_seq_daily
         FOR UPDATE NOWAIT;

         EXECUTE IMMEDIATE 'ALTER SEQUENCE seq_daily INCREMENT BY -' || (l_seq_value - 1);
         

         SELECT seq_daily.NEXTVAL
         INTO l_seq_value
         FROM DUAL;

         EXECUTE IMMEDIATE 'ALTER SEQUENCE seq_daily INCREMENT BY 1';

         UPDATE tab_seq_daily
         SET seq_date    = TO_DATE (TO_CHAR (SYSDATE, 'YYYY/MM/DD'), 'YYYY/MM/DD');
        
          execute immediate 'truncate table queue_details';
          execute immediate 'delete from QUEUE_DETAILS_HISTORY where CLOSE_TIME is NULL';
          
        
         COMMIT;
      END IF;

      p_seq_value   := l_seq_value;
   EXCEPTION
      WHEN NO_DATA_FOUND
      THEN
         --DBMS_OUTPUT.put_line ('no data found');
         INSERT INTO tab_seq_daily (seq_date)
         VALUES (TO_DATE (TO_CHAR (SYSDATE, 'YYYY/MM/DD'), 'YYYY/MM/DD'));

         COMMIT;
         p_seq_value   := l_seq_value;
      WHEN busy_exception
      THEN
         --DBMS_OUTPUT.put_line ('resource busy and acquire with NOWAIT specified');
         p_seq_value   := -1;
      WHEN OTHERS
      THEN
         --DBMS_OUTPUT.put_line ('Code    erreur : ' || TO_CHAR (SQLCODE));
         --DBMS_OUTPUT.put_line ('libellé erreur : ' || TO_CHAR (SQLERRM));
         p_seq_value   := -1;
   END;
END get_daily_sequencer;

/
