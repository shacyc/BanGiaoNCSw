SELECT bang1.organid, bang1.ORGANNAME,bang1.schoolname,bang9.TotalPupil
  FROM 
  (
    SELECT ORGANID, ORGANNAME,count(1) TOTALSCHOOL,schoolid,schoolname
    FROM(
          SELECT MO1.ORGANID, MO1.ORGANNAME, es.schoolid,es.schoolname, 1
    FROM 
    SAMS.EDU_SCHOOL ES
    LEFT JOIN SAMS.MD_ORGAN MO
    ON     ES.ORGANID = MO.ORGANID
    LEFT JOIN SAMS.MD_ORGAN MO1 
    ON MO.PARENTID = MO1.ORGANID
    WHERE ES.ISDELETED = 0 AND ES.ISACTIVE = 1
  
    AND ES.schoolid NOT IN (1592,1593,1594,1595,1596,1597,1598,1599,1600,1605,1607,1610,1618,1613,1614,1616,1608,1611,1615,1602,1603,1604,1609,1617,1601,1606,1612,1524,1530,10112318,1541,1525,1515,1470,1528,1469)
    GROUP BY MO1.ORGANID, MO1.ORGANNAME, ES.SCHOOLID, ES.SCHOOLNAME)
     
    GROUP BY  ORGANID, ORGANNAME,schoolid,schoolname
  ) BANG1
   JOIN
    (SELECT ORGANID, ORGANNAME,TotalPupil,schoolid,schoolname
  FROM(
        SELECT MO1.ORGANID, MO1.ORGANNAME,es.schoolid,es.schoolname, count(DISTINCT ep.pupilid) TotalPupil
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
          edu_pupil_studytimeline.schoolyearid = 21 AND edu_pupil_studytimeline.schooltermid = 2   
          AND   ep.currentclassid = 12
        WHERE ES.ISDELETED = 0 AND ES.ISACTIVE = 1
        AND ES.schoolid NOT IN (1592,1593,1594,1595,1596,1597,1598,1599,1600,1605,1607,1610,1618,1613,1614,1616,1608,1611,1615,1602,1603,1604,1609,1617,1601,1606,1612,1524,1530,10112318,1541,1525,1515,1470,1528,1469)
        GROUP BY MO1.ORGANID, MO1.ORGANNAME,es.schoolid,es.schoolname)      
        GROUP BY  ORGANID, ORGANNAME,TotalPupil,schoolid,schoolname
      )BANG9
      ON bang1.organid = bang9.organid 
      AND bang1.schoolid = bang9.schoolid
    ORDER BY bang1.organname, bang1.schoolname

;