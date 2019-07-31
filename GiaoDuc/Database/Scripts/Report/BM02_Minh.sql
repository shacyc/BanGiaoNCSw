SELECT bang1.schoolid, bang1.schoolname,bang1.TOTALPUPIL
  FROM 
  (
    SELECT SCHOOLID, SCHOOLNAME,EDUCATIONLEVELID, TOTALPUPIL
    FROM(
          SELECT  ES.SCHOOLID, ES.SCHOOLNAME,ESE.EDUCATIONLEVELID, count(eps.pupilid) AS  TOTALPUPIL
    FROM 
    SAMS.EDU_SCHOOL ES
    LEFT JOIN SAMS.EDU_SCHOOL_EDUCATIONLEVEL ESE
    ON   ESE.SCHOOLID = ES.SCHOOLID  
    LEFT JOIN sams.edu_pupil ep
         ON  ep.currentschoolid = es.schoolid
         AND ep.isactive = 1 AND ep.isdeleted = 0
         AND ep.currentpupilstatusid = 1
    LEFT JOIN sams.edu_pupil_studytimeline eps
        ON eps.pupilid = ep.pupilid
        AND eps.schoolid = es.schoolid
        AND eps.schoolyearid = 21 AND eps.schooltermid = 1
        AND eps.isactive = 1 AND eps.isdeleted = 0
        AND eps.currentpupilstatusid = 1
    WHERE ES.ISDELETED = 0 AND ES.ISACTIVE = 1
    AND ESE.EDUCATIONLEVELID = 4
    AND ES.schoolid NOT IN (1592,1593,1594,1595,1596,1597,1598,1599,1600,1605,1607,1610,1618,1613,1614,1616,1608,1611,1615,1602,1603,1604,1609,1617,1601,1606,1612,1524,1530,10112318,1541,1525,1515,1470,1528,1469)
    GROUP BY  ES.SCHOOLID, ES.SCHOOLNAME,ESE.EDUCATIONLEVELID)
     
    GROUP BY  SCHOOLID, SCHOOLNAME,EDUCATIONLEVELID,TOTALPUPIL
    
  ) BANG1
  LEFT JOIN
  (
SELECT SCHOOLID, SCHOOLNAME,EDUCATIONLEVELID, TOTALPUPIL
    FROM(
          SELECT  ES.SCHOOLID, ES.SCHOOLNAME,ESE.EDUCATIONLEVELID, count(eps.pupilid) AS  TOTALPUPIL
    FROM 
    SAMS.EDU_SCHOOL ES
    LEFT JOIN SAMS.EDU_SCHOOL_EDUCATIONLEVEL ESE
    ON   ESE.SCHOOLID = ES.SCHOOLID  
    LEFT JOIN sams.edu_pupil ep
         ON  ep.currentschoolid = es.schoolid
         AND ep.isactive = 1 AND ep.isdeleted = 0
         AND ep.currentpupilstatusid = 1
    LEFT JOIN sams.edu_pupil_studytimeline eps
        ON eps.pupilid = ep.pupilid
        AND eps.schoolid = es.schoolid
        AND eps.schoolyearid = 21 AND eps.schooltermid = 1
        AND eps.isactive = 1 AND eps.isdeleted = 0
        AND eps.currentpupilstatusid = 1
    
    WHERE ES.ISDELETED = 0 AND ES.ISACTIVE = 1
    AND ESE.EDUCATIONLEVELID = 4
    AND ES.schoolid NOT IN (1592,1593,1594,1595,1596,1597,1598,1599,1600,1605,1607,1610,1618,1613,1614,1616,1608,1611,1615,1602,1603,1604,1609,1617,1601,1606,1612,1524,1530,10112318,1541,1525,1515,1470,1528,1469)
    AND 
    GROUP BY  ES.SCHOOLID, ES.SCHOOLNAME,ESE.EDUCATIONLEVELID)
     
    GROUP BY  SCHOOLID, SCHOOLNAME,EDUCATIONLEVELID,TOTALPUPIL
  )BANG2
  ON bang1.schoolid = bang2.schoolid AND bang1.educationlevelid = bang2.educationlevelid

  ORDER BY bang1.schoolname
;