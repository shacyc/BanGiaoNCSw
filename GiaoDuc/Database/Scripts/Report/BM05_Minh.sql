SELECT bang1.organid, bang1.ORGANNAME,bang9.TotalPupil,bang2.totalpino,bang3.totalgvcn
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
  
    AND ES.schoolid NOT IN (1592,1593,1594,1595,1596,1597,1598,1599,1600,1605,1607,1610,1618,1613,1614,1616,1608,1611,1615,1602,1603,1604,1609,1617,1601,1606,1612,1524,1530,10112318,1525,1515,1470,1528,1469)
    
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
        AND ES.schoolid NOT IN (1592,1593,1594,1595,1596,1597,1598,1599,1600,1605,1607,1610,1618,1613,1614,1616,1608,1611,1615,1602,1603,1604,1609,1617,1601,1606,1612,1524,1530,10112318,1525,1515,1470,1528,1469)
        GROUP BY MO1.ORGANID, MO1.ORGANNAME)      
        GROUP BY  ORGANID, ORGANNAME,TotalPupil
      )BANG9
      ON bang1.organid = bang9.organid 
  LEFT JOIN
    (SELECT ORGANID, ORGANNAME,TotalPINO
  FROM(
        SELECT MO1.ORGANID, MO1.ORGANNAME, count(DISTINCT sys.pupilid) TotalPINO
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
        AND sys.egovchanelid IN (2,3)
        WHERE ES.ISDELETED = 0 AND ES.ISACTIVE = 1
        AND ES.schoolid NOT IN (1592,1593,1594,1595,1596,1597,1598,1599,1600,1605,1607,1610,1618,1613,1614,1616,1608,1611,1615,1602,1603,1604,1609,1617,1601,1606,1612,1524,1530,10112318,1525,1515,1470,1528,1469)
        GROUP BY MO1.ORGANID, MO1.ORGANNAME)      
        GROUP BY  ORGANID, ORGANNAME,TotalPINO
      )BANG2
      ON bang1.organid = bang2.organid 
 LEFT JOIN
    (
       SELECT ORGANID, TOTALGVCN
        FROM(
              SELECT MO1.ORGANID, count(edu_sendmsgrequest.sendmsgrequestid) TOTALGVCN
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
          AND edu_sendmsgrequest.sendmsgrequesttypeid = 1
        WHERE ES.ISDELETED = 0 AND ES.ISACTIVE = 1
        AND ES.schoolid NOT IN (1592,1593,1594,1595,1596,1597,1598,1599,1600,1605,1607,1610,1618,1613,1614,1616,1608,1611,1615,1602,1603,1604,1609,1617,1601,1606,1612,1524,1530,10112318,1525,1515,1470,1528,1469)
        
        GROUP BY MO1.ORGANID)         
        GROUP BY  ORGANID,totalgvcn
      )BANG3
      ON bang1.ORGANID = bang3.ORGANID    
      WHERE bang1.organid NOT IN (5700)


    ORDER BY bang1.organname
;