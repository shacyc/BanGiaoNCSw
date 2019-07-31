SELECT bang1.organid, bang1.ORGANNAME,bang1.schoolid,bang1.schoolname,bang2.TOTALK12,bang3.TOTALPUPILNOCMND
  FROM 
  (
    SELECT ORGANID, ORGANNAME,SCHOOLID,SCHOOLNAME,EDUCATIONLEVELID
    FROM(
          SELECT MO1.ORGANID, MO1.ORGANNAME, ES.SCHOOLID, ES.SCHOOLNAME,ESE.EDUCATIONLEVELID
    FROM 
    SAMS.EDU_SCHOOL ES
    LEFT JOIN SAMS.EDU_SCHOOL_EDUCATIONLEVEL ESE
    ON   ESE.SCHOOLID = ES.SCHOOLID
    LEFT JOIN SAMS.MD_ORGAN MO
    ON     ES.ORGANID = MO.ORGANID
    LEFT JOIN SAMS.MD_ORGAN MO1 
    ON MO.PARENTID = MO1.ORGANID
    WHERE ES.ISDELETED = 0 AND ES.ISACTIVE = 1
    AND ESE.EDUCATIONLEVELID IN( 4,7)
    AND ES.schoolid NOT IN (1592,1593,1594,1595,1596,1597,1598,1599,1600,1605,1607,1610,1618,1613,1614,1616,1608,1611,1615,1602,1603,1604,1609,1617,1601,1606,1612,1524,1530,10112318,1525,1515,1470,1528,1469)
    GROUP BY MO1.ORGANID, MO1.ORGANNAME, ES.SCHOOLID, ES.SCHOOLNAME,ESE.EDUCATIONLEVELID)
     
    GROUP BY  ORGANID, ORGANNAME,EDUCATIONLEVELID,SCHOOLID,SCHOOLNAME
  ) BANG1
   JOIN
    (SELECT ORGANID,SCHOOLID,SCHOOLNAME,ORGANNAME, nvl(TOTALK12,0) TOTALK12
  FROM(
        SELECT MO1.ORGANID, MO1.ORGANNAME, ES.SCHOOLID, ES.SCHOOLNAME, count(DISTINCT ep.pupilid) TOTALK12
        FROM SAMS.EDU_PUPIL EP
          JOIN SAMS.EDU_PUPIL_STUDYTIMELINE EPS
          ON EP.PUPILID = EPS.PUPILID
          AND EPS.SCHOOLID = EP.CURRENTSCHOOLID
          AND EPS.CURRENTPUPILSTATUSID = 1 
          AND EPS.SCHOOLYEARID = 21
          AND EPS.SCHOOLTERMID = 2
          AND EPS.ISACTIVE = 1 AND EPS.ISDELETED = 0
          JOIN SAMS.EDU_SCHOOL ES
          ON ES.SCHOOLID = EP.CURRENTSCHOOLID
          AND ES.ISACTIVE = 1 AND ES.ISDELETED = 0
               
        JOIN SAMS.EDU_SCHOOL_EDUCATIONLEVEL ESE
        ON   ESE.SCHOOLID = ES.SCHOOLID
        LEFT JOIN SAMS.MD_ORGAN MO
        ON     ES.ORGANID = MO.ORGANID
        LEFT JOIN SAMS.MD_ORGAN MO1 
        ON MO.PARENTID = MO1.ORGANID
        
        WHERE ES.ISDELETED = 0 AND ES.ISACTIVE = 1
        AND ESE.EDUCATIONLEVELID IN(4,7)
        AND ep.isactive = 1 AND ep.isdeleted = 0
        AND EP.CURRENTPUPILSTATUSID = 1 
          AND EP.CURRENTCLASSID IN (15,18)
--          AND EP.IDCARD IS  NULL
        AND ES.schoolid NOT IN (1592,1593,1594,1595,1596,1597,1598,1599,1600,1605,1607,1610,1618,1613,1614,1616,1608,1611,1615,1602,1603,1604,1609,1617,1601,1606,1612,1524,1530,10112318,1525,1515,1470,1528,1469)
        GROUP BY MO1.ORGANID, MO1.ORGANNAME, ES.SCHOOLID, ES.SCHOOLNAME)      
        GROUP BY  ORGANID, ORGANNAME,TOTALK12,SCHOOLID,SCHOOLNAME
      )BANG2
      ON bang1.organid = bang2.organid AND  bang1.schoolid = bang2.schoolid
LEFT JOIN
    (SELECT ORGANID, ORGANNAME, SCHOOLID,SCHOOLNAME,nvl( TOTALPUPILNOCMND,0) TOTALPUPILNOCMND
  FROM(
        SELECT MO1.ORGANID, MO1.ORGANNAME, ES.SCHOOLID, ES.SCHOOLNAME, count(DISTINCT ep.pupilid) TOTALPUPILNOCMND
        FROM SAMS.EDU_PUPIL EP
          JOIN SAMS.EDU_PUPIL_STUDYTIMELINE EPS
          ON EP.PUPILID = EPS.PUPILID
          AND EPS.SCHOOLID = EP.CURRENTSCHOOLID
          AND EPS.CURRENTPUPILSTATUSID = 1 
          AND EPS.SCHOOLYEARID = 21
          AND EPS.SCHOOLTERMID = 2
          AND EPS.ISACTIVE = 1 AND EPS.ISDELETED = 0
          JOIN SAMS.EDU_SCHOOL ES
          ON ES.SCHOOLID = EP.CURRENTSCHOOLID
          AND ES.ISACTIVE = 1 AND ES.ISDELETED = 0
               
        JOIN SAMS.EDU_SCHOOL_EDUCATIONLEVEL ESE
        ON   ESE.SCHOOLID = ES.SCHOOLID
        LEFT JOIN SAMS.MD_ORGAN MO
        ON     ES.ORGANID = MO.ORGANID
        LEFT JOIN SAMS.MD_ORGAN MO1 
        ON MO.PARENTID = MO1.ORGANID
        
        WHERE ES.ISDELETED = 0 AND ES.ISACTIVE = 1
        AND ESE.EDUCATIONLEVELID IN(4,7)
        AND ep.isactive = 1 AND ep.isdeleted = 0
        AND EP.CURRENTPUPILSTATUSID = 1 
          AND EP.CURRENTCLASSID IN (15,18)
          AND EP.IDCARD IS  NULL
        AND ES.schoolid NOT IN (1592,1593,1594,1595,1596,1597,1598,1599,1600,1605,1607,1610,1618,1613,1614,1616,1608,1611,1615,1602,1603,1604,1609,1617,1601,1606,1612,1524,1530,10112318,1525,1515,1470,1528,1469)
        GROUP BY MO1.ORGANID, MO1.ORGANNAME, ES.SCHOOLID, ES.SCHOOLNAME)      
        GROUP BY  ORGANID, ORGANNAME,TOTALPUPILNOCMND, SCHOOLID,SCHOOLNAME
      )BANG3
      ON bang1.organid = bang3.organid AND  bang1.schoolid = bang3.schoolid
      WHERE bang2.totalk12 > 0 
  GROUP BY bang1.organid, bang1.ORGANNAME,bang1.schoolid,bang1.schoolname,bang2.TOTALK12,bang3.TOTALPUPILNOCMND
  ORDER BY bang1.schoolname
;