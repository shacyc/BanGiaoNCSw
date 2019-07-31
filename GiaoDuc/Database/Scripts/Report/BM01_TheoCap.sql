SELECT bang1.EDUCATIONLEVELID, bang1.totalschool,bang2.totalpino,bang3.totalgvbm,
        bang4.totalgvcn,bang5.totalmarkbook
--  ,bang6.totaldiemdanh
  ,bang7.totaltkb
  ,bang9.totalsms
  FROM 
  (
    SELECT  TOTALSCHOOL,EDUCATIONLEVELID
    FROM(
          SELECT count(DISTINCT es.schoolid) TOTALSCHOOL,ESE.EDUCATIONLEVELID
    FROM 
    SAMS.EDU_SCHOOL ES
    LEFT JOIN SAMS.EDU_SCHOOL_EDUCATIONLEVEL ESE
    ON   ESE.SCHOOLID = ES.SCHOOLID
    LEFT JOIN SAMS.MD_ORGAN MO
    ON     ES.ORGANID = MO.ORGANID
    LEFT JOIN SAMS.MD_ORGAN MO1 
    ON MO.PARENTID = MO1.ORGANID
    WHERE ES.ISDELETED = 0 AND ES.ISACTIVE = 1
    AND ESE.EDUCATIONLEVELID = 2
    AND ES.schoolid NOT IN (1592,1593,1594,1595,1596,1597,1598,1599,1600,1605,1607,1610,1618,1613,1614,1616,1608,1611,1615,1602,1603,1604,1609,1617,1601,1606,1612,1524,1530,10112318,1525,1515,1470,1528,1469)
    GROUP BY ESE.EDUCATIONLEVELID)
     
    GROUP BY  EDUCATIONLEVELID,TOTALSCHOOL
  ) BANG1
  LEFT JOIN
    (SELECT  TOTALPINO,educationlevelid
  FROM(
        SELECT count(DISTINCT es.schoolid) TOTALPINO,ESE.educationlevelid
        FROM 
        SAMS.EDU_SCHOOL ES
        LEFT JOIN SAMS.EDU_SCHOOL_EDUCATIONLEVEL ESE
        ON   ESE.SCHOOLID = ES.SCHOOLID
        LEFT JOIN SAMS.MD_ORGAN MO
        ON     ES.ORGANID = MO.ORGANID
        LEFT JOIN SAMS.MD_ORGAN MO1 
        ON MO.PARENTID = MO1.ORGANID
         JOIN sams.edu_pupil ep
          ON ep.currentschoolid = es.schoolid
         JOIN sams.sys_EPUPILLOGINLOG sys
        ON ep.pupilid = sys.pupilid
        WHERE ES.ISDELETED = 0 AND ES.ISACTIVE = 1
        AND ESE.EDUCATIONLEVELID = 2
        AND ES.schoolid NOT IN (1592,1593,1594,1595,1596,1597,1598,1599,1600,1605,1607,1610,1618,1613,1614,1616,1608,1611,1615,1602,1603,1604,1609,1617,1601,1606,1612,1524,1530,10112318,1525,1515,1470,1528,1469)
        GROUP BY ESE.educationlevelid)      
        GROUP BY  educationlevelid,TOTALPINO
      )BANG2
      ON bang1.educationlevelid = bang2.educationlevelid 
LEFT JOIN
    (
        SELECT educationlevelid, TOTALGVBM
          FROM(
                SELECT count(DISTINCT es.schoolid) TOTALGVBM,ese.educationlevelid
          FROM 
          SAMS.EDU_SCHOOL ES
          LEFT JOIN SAMS.EDU_SCHOOL_EDUCATIONLEVEL ESE
          ON   ESE.SCHOOLID = ES.SCHOOLID
          LEFT JOIN SAMS.MD_ORGAN MO
          ON     ES.ORGANID = MO.ORGANID
          LEFT JOIN SAMS.MD_ORGAN MO1 
          ON MO.PARENTID = MO1.ORGANID
          LEFT JOIN sams.edu_schoolclass_new esn
                  ON esn.schoolid = es.schoolid
                  AND esn.schoolyearid = 21 AND esn.schooltermid = 2 AND esn.isactive = 1 AND esn.isdeleted = 0
           JOIN sams.EDU_SCHOOLCLASS_TEACHER ep
            ON ep.schoolclassid = esn.schoolclassid
            AND ep.schoolyearid = 21 AND ep.schooltermid = 2
          WHERE ES.ISDELETED = 0 AND ES.ISACTIVE = 1
          AND ESE.EDUCATIONLEVELID = 2
          AND ES.schoolid NOT IN (1592,1593,1594,1595,1596,1597,1598,1599,1600,1605,1607,1610,1618,1613,1614,1616,1608,1611,1615,1602,1603,1604,1609,1617,1601,1606,1612,1524,1530,10112318,1525,1515,1470,1528,1469)
          GROUP BY ese.educationlevelid)
           
          GROUP BY educationlevelid,TOTALGVBM
      )BANG3
      ON bang1.educationlevelid = bang3.educationlevelid 
LEFT JOIN
    (
        SELECT educationlevelid,TOTALGVCN
          FROM(
                SELECT count(DISTINCT es.schoolid) TOTALGVCN,ese.educationlevelid
          FROM 
          SAMS.EDU_SCHOOL ES
          LEFT JOIN SAMS.EDU_SCHOOL_EDUCATIONLEVEL ESE
          ON   ESE.SCHOOLID = ES.SCHOOLID
          LEFT JOIN SAMS.MD_ORGAN MO
          ON     ES.ORGANID = MO.ORGANID
          LEFT JOIN SAMS.MD_ORGAN MO1 
          ON MO.PARENTID = MO1.ORGANID
          LEFT JOIN sams.edu_schoolclass_new esn
                  ON esn.schoolid = es.schoolid
                  AND esn.schoolyearid = 21 AND esn.schooltermid = 1 AND esn.isactive = 1 AND esn.isdeleted = 0
           JOIN sams.edu_schoolclass_headteacher  ep
            ON ep.schoolclassid = esn.schoolclassid
            AND ep.schoolyearid = 21 AND ep.schooltermid = 2
          WHERE ES.ISDELETED = 0 AND ES.ISACTIVE = 1
          AND ESE.EDUCATIONLEVELID = 2
          AND ES.schoolid NOT IN (1592,1593,1594,1595,1596,1597,1598,1599,1600,1605,1607,1610,1618,1613,1614,1616,1608,1611,1615,1602,1603,1604,1609,1617,1601,1606,1612,1524,1530,10112318,1525,1515,1470,1528,1469)
          GROUP BY ese.educationlevelid)
           
          GROUP BY educationlevelid,TOTALGVCN
      )BANG4
      ON bang1.educationlevelid = bang4.educationlevelid 

LEFT JOIN
    (
        SELECT educationlevelid, TOTALMARKBOOK
  FROM(
        SELECT count(DISTINCT es.schoolid) TOTALMARKBOOK,ese.educationlevelid
  FROM 
  SAMS.EDU_SCHOOL ES
  LEFT JOIN SAMS.EDU_SCHOOL_EDUCATIONLEVEL ESE
  ON   ESE.SCHOOLID = ES.SCHOOLID
  LEFT JOIN SAMS.MD_ORGAN MO
  ON     ES.ORGANID = MO.ORGANID
  LEFT JOIN SAMS.MD_ORGAN MO1 

  ON MO.PARENTID = MO1.ORGANID
 
  LEFT JOIN sams.edu_schoolclass_new esn
          ON esn.schoolid = es.schoolid
          AND esn.schoolyearid = 21 AND esn.schooltermid = 1 AND esn.isactive = 1 AND esn.isdeleted = 0
    JOIN sams.edu_pupil_markbook 
    ON edu_pupil_markbook.schoolclassid = esn.schoolclassid
    AND edu_pupil_markbook.isactive = 1 AND es.isdeleted = 0
    AND edu_pupil_markbook.schoolyearid = 21 AND edu_pupil_markbook.schooltermid = 2
  WHERE ES.ISDELETED = 0 AND ES.ISACTIVE = 1
  AND ESE.EDUCATIONLEVELID = 2
  AND ES.schoolid NOT IN (1592,1593,1594,1595,1596,1597,1598,1599,1600,1605,1607,1610,1618,1613,1614,1616,1608,1611,1615,1602,1603,1604,1609,1617,1601,1606,1612,1524,1530,10112318,1525,1515,1470,1528,1469)
 GROUP BY ese.educationlevelid
 )
   
  GROUP BY  educationlevelid,TOTALMARKBOOK
      )BANG5
      ON bang1.educationlevelid = bang5.educationlevelid 
--LEFT JOIN
--    (
--       SELECT ORGANID, ORGANNAME,count(1) TOTALDIEMDANH
--          FROM(
--                SELECT MO1.ORGANID, MO1.ORGANNAME, ES.SCHOOLID, ES.SCHOOLNAME, 1
--          FROM 
--          SAMS.EDU_SCHOOL ES
--          LEFT JOIN SAMS.EDU_SCHOOL_EDUCATIONLEVEL ESE
--          ON   ESE.SCHOOLID = ES.SCHOOLID
--          LEFT JOIN SAMS.MD_ORGAN MO
--          ON     ES.ORGANID = MO.ORGANID
--          LEFT JOIN SAMS.MD_ORGAN MO1 
--        
--          ON MO.PARENTID = MO1.ORGANID
--         
--          LEFT JOIN sams.edu_pupil ep
--                  ON ep.currentschoolid = es.schoolid
--                  AND ep.isactive = 1 AND ep.isdeleted = 0
--            JOIN sams.EDU_PUPIL_ATTENDANCE 
--            ON EDU_PUPIL_ATTENDANCE.pupilid = ep.pupilid
--             AND EDU_PUPIL_ATTENDANCE.isdeleted = 0
--            AND EDU_PUPIL_ATTENDANCE.schoolyearid = 21 AND EDU_PUPIL_ATTENDANCE.schooltermid = 1
--          WHERE ES.ISDELETED = 0 AND ES.ISACTIVE = 1
--          AND ESE.EDUCATIONLEVELID = 4
--          AND ES.schoolid NOT IN (1524,1530,10112318,1541,1525,1515,1470,1528,1469)
--          GROUP BY MO1.ORGANID, MO1.ORGANNAME, ES.SCHOOLID, ES.SCHOOLNAME)
--           
--          GROUP BY  ORGANID, ORGANNAME
--      )BANG6
--      ON bang1.organid = bang6.organid 
LEFT JOIN
    (
       SELECT educationlevelid, TOTALTKB
        FROM(
              SELECT count(DISTINCT es.schoolid) TOTALTKB,ese.educationlevelid
        FROM 
        SAMS.EDU_SCHOOL ES
        LEFT JOIN SAMS.EDU_SCHOOL_EDUCATIONLEVEL ESE
        ON   ESE.SCHOOLID = ES.SCHOOLID
        LEFT JOIN SAMS.MD_ORGAN MO
        ON     ES.ORGANID = MO.ORGANID
        LEFT JOIN SAMS.MD_ORGAN MO1 
        ON MO.PARENTID = MO1.ORGANID
          JOIN sams.EDU_TIMETABLE 
          ON EDU_TIMETABLE.schoolid = es.schoolid
           AND EDU_TIMETABLE.isdeleted = 0
          AND EDU_TIMETABLE.schoolyearid = 21 AND EDU_TIMETABLE.schooltermid = 1
        WHERE ES.ISDELETED = 0 AND ES.ISACTIVE = 1
        AND ESE.EDUCATIONLEVELID =  2
        AND ES.schoolid NOT IN (1592,1593,1594,1595,1596,1597,1598,1599,1600,1605,1607,1610,1618,1613,1614,1616,1608,1611,1615,1602,1603,1604,1609,1617,1601,1606,1612,1524,1530,10112318,1525,1515,1470,1528,1469)
        GROUP BY ese.educationlevelid
        )
         
        GROUP BY  educationlevelid,TOTALTKB
      )BANG7
      ON bang1.educationlevelid = bang7.educationlevelid 

LEFT JOIN
    (
       SELECT educationlevelid, TOTALSMS
        FROM(
              SELECT count(DISTINCT es.schoolid) TOTALSMS,ese.educationlevelid
        FROM 
        SAMS.EDU_SCHOOL ES
        LEFT JOIN SAMS.EDU_SCHOOL_EDUCATIONLEVEL ESE
        ON   ESE.SCHOOLID = ES.SCHOOLID
        LEFT JOIN SAMS.MD_ORGAN MO
        ON     ES.ORGANID = MO.ORGANID
        LEFT JOIN SAMS.MD_ORGAN MO1 
        ON MO.PARENTID = MO1.ORGANID
           JOIN sams.edu_sendmsgrequest 
          ON edu_sendmsgrequest.organid = es.organid
           AND edu_sendmsgrequest.isdeleted = 0
          AND edu_sendmsgrequest.issentmsg =  1
          AND edu_sendmsgrequest.sendmsgrequesttypeid IN( 1,2)
        WHERE ES.ISDELETED = 0 AND ES.ISACTIVE = 1
           AND     ESE.educationlevelid = 2
        AND ES.schoolid NOT IN (1592,1593,1594,1595,1596,1597,1598,1599,1600,1605,1607,1610,1618,1613,1614,1616,1608,1611,1615,1602,1603,1604,1609,1617,1601,1606,1612,1524,1530,10112318,1525,1515,1470,1528,1469)
        
        GROUP BY ese.educationlevelid)         
        GROUP BY  educationlevelid,TOTALSMS
      )BANG9
      ON bang1.educationlevelid = bang9.educationlevelid 
;