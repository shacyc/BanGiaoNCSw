SELECT bang1.organid, bang1.ORGANNAME,bang9.TotalPupil,bang1.totalschool,bang2.totalpino,nvl(bang3.totalgvbm,0) totalgvbm,
       nvl(bang4.totalgvcn,0) totalgvcn,nvl(bang5.totalmarkbook,0) totalmarkbook,
       nvl(bang6.totaldiemdanh,0) totaldiemdanh,nvl(bang7.totaltkb,0)totaltkb
      ,nvl(bang8.totaltkb,0)totalThongbao
  FROM 
  (
    SELECT ORGANID, ORGANNAME,count(1) TOTALSCHOOL
    FROM(
          SELECT MO1.ORGANID, MO1.ORGANNAME, ES.SCHOOLID, ES.SCHOOLNAME, 1
    FROM 
    SAMS.EDU_SCHOOL ES
    LEFT JOIN SAMS.MD_ORGAN MO
    ON     ES.ORGANID = MO.ORGANID
    LEFT JOIN SAMS.MD_ORGAN MO1 
    ON MO.PARENTID = MO1.ORGANID
    WHERE ES.ISDELETED = 0 AND ES.ISACTIVE = 1
  
    AND ES.schoolid NOT IN (1592,1593,1594,1595,1596,1597,1598,1599,1600,1605,1607,1610,1618,1613,1614,1616,1608,1611,1615,1602,1603,1604,1609,1617,1601,1606,1612,1524,1530,10112318,1541,1525,1515,1470,1528,1469)
    GROUP BY MO1.ORGANID, MO1.ORGANNAME, ES.SCHOOLID, ES.SCHOOLNAME)
     
    GROUP BY  ORGANID, ORGANNAME
  ) BANG1
  LEFT JOIN
    (SELECT ORGANID, ORGANNAME,TotalPupil
  FROM(
        SELECT MO1.ORGANID, MO1.ORGANNAME, count(DISTINCT ep.pupilid) TotalPupil
        FROM 
        SAMS.EDU_SCHOOL ES
        LEFT JOIN SAMS.MD_ORGAN MO
        ON     ES.ORGANID = MO.ORGANID
        LEFT JOIN SAMS.MD_ORGAN MO1 
        ON MO.PARENTID = MO1.ORGANID
         JOIN sams.edu_pupil ep
          ON ep.currentschoolid = es.schoolid
          AND ep.isactive = 1 AND ep.isdeleted = 0
          AND ep.currentschoolid = es.schoolid

          JOIN sams.edu_pupil_studytimeline
          ON   edu_pupil_studytimeline.pupilid = ep.pupilid
          AND edu_pupil_studytimeline.schoolid = es.schoolid
          AND edu_pupil_studytimeline.isactive = 1 AND edu_pupil_studytimeline.isdeleted = 0
          AND edu_pupil_studytimeline.currentpupilstatusid = 1 AND
          edu_pupil_studytimeline.schoolyearid = 21 AND edu_pupil_studytimeline.schooltermid = 1       
        WHERE ES.ISDELETED = 0 AND ES.ISACTIVE = 1
        AND ES.schoolid NOT IN (1592,1593,1594,1595,1596,1597,1598,1599,1600,1605,1607,1610,1618,1613,1614,1616,1608,1611,1615,1602,1603,1604,1609,1617,1601,1606,1612,1524,1530,10112318,1541,1525,1515,1470,1528,1469)
        GROUP BY MO1.ORGANID, MO1.ORGANNAME)      
        GROUP BY  ORGANID, ORGANNAME,TotalPupil
      )BANG9
      ON bang1.organid = bang9.organid 
  LEFT JOIN
    (SELECT ORGANID, ORGANNAME,TotalPINO
  FROM(
        SELECT MO1.ORGANID, MO1.ORGANNAME, count(sys.pupilid) TotalPINO
        FROM 
        SAMS.EDU_SCHOOL ES
        LEFT JOIN SAMS.MD_ORGAN MO
        ON     ES.ORGANID = MO.ORGANID
        LEFT JOIN SAMS.MD_ORGAN MO1 
        ON MO.PARENTID = MO1.ORGANID
         JOIN sams.edu_pupil ep
          ON ep.currentschoolid = es.schoolid
         JOIN sams.sys_EPUPILLOGINLOG sys
        ON ep.pupilid = sys.pupilid
        WHERE ES.ISDELETED = 0 AND ES.ISACTIVE = 1
        AND ES.schoolid NOT IN (1592,1593,1594,1595,1596,1597,1598,1599,1600,1605,1607,1610,1618,1613,1614,1616,1608,1611,1615,1602,1603,1604,1609,1617,1601,1606,1612,1524,1530,10112318,1541,1525,1515,1470,1528,1469)
        GROUP BY MO1.ORGANID, MO1.ORGANNAME)      
        GROUP BY  ORGANID, ORGANNAME,TotalPINO
      )BANG2
      ON bang1.organid = bang2.organid 
LEFT JOIN
    (
        SELECT ORGANID, ORGANNAME,count(1) TOTALGVBM
          FROM(
                SELECT MO1.ORGANID, MO1.ORGANNAME, ES.SCHOOLID, ES.SCHOOLNAME, 1
          FROM 
          SAMS.EDU_SCHOOL ES
          LEFT JOIN SAMS.MD_ORGAN MO
          ON     ES.ORGANID = MO.ORGANID
          LEFT JOIN SAMS.MD_ORGAN MO1 
          ON MO.PARENTID = MO1.ORGANID
          LEFT JOIN sams.edu_schoolclass_new esn
                  ON esn.schoolid = es.schoolid
                  AND esn.schoolyearid = 21 AND esn.schooltermid = 1 AND esn.isactive = 1 AND esn.isdeleted = 0
           JOIN sams.EDU_SCHOOLCLASS_TEACHER ep
            ON ep.schoolclassid = esn.schoolclassid
            AND ep.schoolyearid = 21 AND ep.schooltermid = 1
          WHERE ES.ISDELETED = 0 AND ES.ISACTIVE = 1
          AND ES.schoolid NOT IN (1592,1593,1594,1595,1596,1597,1598,1599,1600,1605,1607,1610,1618,1613,1614,1616,1608,1611,1615,1602,1603,1604,1609,1617,1601,1606,1612,1524,1530,10112318,1541,1525,1515,1470,1528,1469)
          GROUP BY MO1.ORGANID, MO1.ORGANNAME, ES.SCHOOLID, ES.SCHOOLNAME)
           
          GROUP BY  ORGANID, ORGANNAME
      )BANG3
      ON bang1.organid = bang3.organid 
LEFT JOIN
    (
        SELECT ORGANID, ORGANNAME,count(1) TOTALGVCN
          FROM(
                SELECT MO1.ORGANID, MO1.ORGANNAME, ES.SCHOOLID, ES.SCHOOLNAME, 1
          FROM 
          SAMS.EDU_SCHOOL ES
          LEFT JOIN SAMS.MD_ORGAN MO
          ON     ES.ORGANID = MO.ORGANID
          LEFT JOIN SAMS.MD_ORGAN MO1 
          ON MO.PARENTID = MO1.ORGANID
          LEFT JOIN sams.edu_schoolclass_new esn
                  ON esn.schoolid = es.schoolid
                  AND esn.schoolyearid = 21 AND esn.schooltermid = 1 AND esn.isactive = 1 AND esn.isdeleted = 0
           JOIN sams.edu_schoolclass_headteacher  ep
            ON ep.schoolclassid = esn.schoolclassid
            AND ep.schoolyearid = 21 AND ep.schooltermid = 1
          WHERE ES.ISDELETED = 0 AND ES.ISACTIVE = 1
          AND ES.schoolid NOT IN (1592,1593,1594,1595,1596,1597,1598,1599,1600,1605,1607,1610,1618,1613,1614,1616,1608,1611,1615,1602,1603,1604,1609,1617,1601,1606,1612,1524,1530,10112318,1541,1525,1515,1470,1528,1469)
          GROUP BY MO1.ORGANID, MO1.ORGANNAME, ES.SCHOOLID, ES.SCHOOLNAME)
           
          GROUP BY  ORGANID, ORGANNAME
      )BANG4
      ON bang1.organid = bang4.organid 

LEFT JOIN
    (
        SELECT ORGANID, ORGANNAME,count(1) TOTALMARKBOOK
  FROM(
        SELECT MO1.ORGANID, MO1.ORGANNAME, ES.SCHOOLID, ES.SCHOOLNAME, 1
  FROM 
  SAMS.EDU_SCHOOL ES
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
    AND edu_pupil_markbook.schoolyearid = 21 AND edu_pupil_markbook.schooltermid = 1
  WHERE ES.ISDELETED = 0 AND ES.ISACTIVE = 1
  AND ES.schoolid NOT IN (1592,1593,1594,1595,1596,1597,1598,1599,1600,1605,1607,1610,1618,1613,1614,1616,1608,1611,1615,1602,1603,1604,1609,1617,1601,1606,1612,1524,1530,10112318,1541,1525,1515,1470,1528,1469)
  GROUP BY MO1.ORGANID, MO1.ORGANNAME, ES.SCHOOLID, ES.SCHOOLNAME)
   
  GROUP BY  ORGANID, ORGANNAME
      )BANG5
      ON bang1.organid = bang5.organid 
LEFT JOIN
    (
       SELECT ORGANID, ORGANNAME,count(1) TOTALDIEMDANH
          FROM(
                SELECT MO1.ORGANID, MO1.ORGANNAME, ES.SCHOOLID, ES.SCHOOLNAME, 1
          FROM 
          SAMS.EDU_SCHOOL ES
          LEFT JOIN SAMS.MD_ORGAN MO
          ON     ES.ORGANID = MO.ORGANID
          LEFT JOIN SAMS.MD_ORGAN MO1 
        
          ON MO.PARENTID = MO1.ORGANID
         
          LEFT JOIN sams.edu_pupil ep
                  ON ep.currentschoolid = es.schoolid
                  AND ep.isactive = 1 AND ep.isdeleted = 0
            JOIN sams.EDU_PUPIL_ATTENDANCE 
            ON EDU_PUPIL_ATTENDANCE.pupilid = ep.pupilid
             AND EDU_PUPIL_ATTENDANCE.isdeleted = 0
            AND EDU_PUPIL_ATTENDANCE.schoolyearid = 21 AND EDU_PUPIL_ATTENDANCE.schooltermid = 1
          WHERE ES.ISDELETED = 0 AND ES.ISACTIVE = 1
         AND ES.schoolid NOT IN (1592,1593,1594,1595,1596,1597,1598,1599,1600,1605,1607,1610,1618,1613,1614,1616,1608,1611,1615,1602,1603,1604,1609,1617,1601,1606,1612,1524,1530,10112318,1541,1525,1515,1470,1528,1469)
          GROUP BY MO1.ORGANID, MO1.ORGANNAME, ES.SCHOOLID, ES.SCHOOLNAME)
           
          GROUP BY  ORGANID, ORGANNAME
      )BANG6
      ON bang1.organid = bang6.organid 
LEFT JOIN
    (
       SELECT ORGANID, ORGANNAME,count(1) TOTALTKB
        FROM(
              SELECT MO1.ORGANID, MO1.ORGANNAME, ES.SCHOOLID, ES.SCHOOLNAME, 1
        FROM 
        SAMS.EDU_SCHOOL ES
        LEFT JOIN SAMS.MD_ORGAN MO
        ON     ES.ORGANID = MO.ORGANID
        LEFT JOIN SAMS.MD_ORGAN MO1 
        ON MO.PARENTID = MO1.ORGANID
          JOIN sams.EDU_TIMETABLE 
          ON EDU_TIMETABLE.schoolid = es.schoolid
           AND EDU_TIMETABLE.isdeleted = 0
          AND EDU_TIMETABLE.schoolyearid = 21 AND EDU_TIMETABLE.schooltermid = 1
        WHERE ES.ISDELETED = 0 AND ES.ISACTIVE = 1
        AND ES.schoolid NOT IN (1592,1593,1594,1595,1596,1597,1598,1599,1600,1605,1607,1610,1618,1613,1614,1616,1608,1611,1615,1602,1603,1604,1609,1617,1601,1606,1612,1524,1530,10112318,1541,1525,1515,1470,1528,1469)
        GROUP BY MO1.ORGANID, MO1.ORGANNAME, ES.SCHOOLID, ES.SCHOOLNAME)
         
        GROUP BY  ORGANID, ORGANNAME
      )BANG7
      ON bang1.organid = bang7.organid 
LEFT JOIN
    (
       SELECT ORGANID, ORGANNAME,count(1) TOTALTKB
        FROM(
              SELECT MO1.ORGANID, MO1.ORGANNAME, ES.SCHOOLID, ES.SCHOOLNAME, 1
        FROM 
        SAMS.EDU_SCHOOL ES
        LEFT JOIN SAMS.MD_ORGAN MO
        ON     ES.ORGANID = MO.ORGANID
        LEFT JOIN SAMS.MD_ORGAN MO1 
        ON MO.PARENTID = MO1.ORGANID
           JOIN sams.edu_sendmsgrequest 
          ON edu_sendmsgrequest.organid = es.organid
           AND edu_sendmsgrequest.isdeleted = 0
          AND edu_sendmsgrequest.issentmsg =  1
        WHERE ES.ISDELETED = 0 AND ES.ISACTIVE = 1
        AND ES.schoolid NOT IN (1592,1593,1594,1595,1596,1597,1598,1599,1600,1605,1607,1610,1618,1613,1614,1616,1608,1611,1615,1602,1603,1604,1609,1617,1601,1606,1612,1524,1530,10112318,1541,1525,1515,1470,1528,1469)
        GROUP BY MO1.ORGANID, MO1.ORGANNAME, ES.SCHOOLID, ES.SCHOOLNAME)
         
        GROUP BY  ORGANID, ORGANNAME
      )BANG8
      ON bang1.organid = bang8.organid 
    ORDER BY bang1.organname
;