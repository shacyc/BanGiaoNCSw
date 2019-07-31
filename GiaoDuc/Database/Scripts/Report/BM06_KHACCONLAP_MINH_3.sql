SELECT bang1.schoolid, bang1.schoolname,bang1.TOTALPUPIL,nvl(bang2.coutHead,0) TotalXepLop
       ,nvl(bang3.coutHead,0) TotalHeso1van , nvl(bang4.coutHead,0) TotalHeso2van
      ,nvl(bang5.coutHead,0) TotalHeso1Toan , nvl(bang6.coutHead,0) TotalHeso2Toan
      ,nvl(bang7.coutHead,0) TotalHeso1Toan , nvl(bang8.coutHead,0) TotalHeso2Toan
      ,nvl(bang9.coutHead,0) TotalHeso1Toan , nvl(bang10.coutHead,0) TotalHeso2Toan
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
    AND es.educationtypeid <> 1
--    AND es.educationtypeid = 1
    AND ES.schoolid NOT IN (1592,1593,1594,1595,1596,1597,1598,1599,1600,1605,1607,1610,1618,1613,1614,1616,1608,1611,1615,1602,1603,1604,1609,1617,1601,1606,1612,1524,1530,10112318,1541,1525,1515,1470,1528,1469)
    GROUP BY  ES.SCHOOLID, ES.SCHOOLNAME,ESE.EDUCATIONLEVELID)
     
    GROUP BY  SCHOOLID, SCHOOLNAME,EDUCATIONLEVELID,TOTALPUPIL
    
  ) BANG1
  LEFT JOIN
  (
    SELECT SCHOOLID, SCHOOLNAME,EDUCATIONLEVELID, coutHead
        FROM(
              SELECT  ES.SCHOOLID, ES.SCHOOLNAME,ESE.EDUCATIONLEVELID, count(eps.schoolclassid) coutHead
        FROM 
        SAMS.EDU_SCHOOL ES
        LEFT JOIN SAMS.EDU_SCHOOL_EDUCATIONLEVEL ESE
        ON   ESE.SCHOOLID = ES.SCHOOLID          
        JOIN sams.edu_pupil ep
         ON  ep.currentschoolid = es.schoolid
         AND ep.isactive = 1 AND ep.isdeleted = 0
         AND ep.currentpupilstatusid = 1                    
        JOIN sams.edu_pupil_studytimeline eps
            ON eps.schoolid = es.schoolid  
            AND ep.pupilid = eps.pupilid           
            AND eps.schoolyearid = 21 AND eps.schooltermid = 1
            AND eps.isactive = 1 AND eps.isdeleted = 0
            AND eps.currentpupilstatusid = 1
        
        WHERE ES.ISDELETED = 0 AND ES.ISACTIVE = 1
        AND ESE.EDUCATIONLEVELID = 4
                AND es.educationtypeid <> 1
        AND ES.schoolid NOT IN (1592,1593,1594,1595,1596,1597,1598,1599,1600,1605,1607,1610,1618,1613,1614,1616,1608,1611,1615,1602,1603,1604,1609,1617,1601,1606,1612,1524,1530,10112318,1541,1525,1515,1470,1528,1469)
        AND eps.schoolclassid > 0
        GROUP BY  ES.SCHOOLID, ES.SCHOOLNAME,ESE.EDUCATIONLEVELID)
         
        GROUP BY  SCHOOLID, SCHOOLNAME,EDUCATIONLEVELID,coutHead
  )BANG2
  ON bang1.schoolid = bang2.schoolid AND bang1.educationlevelid = bang2.educationlevelid

  LEFT JOIN
  (
    SELECT SCHOOLID, SCHOOLNAME,EDUCATIONLEVELID, coutHead
        FROM(
              SELECT  ES.SCHOOLID, ES.SCHOOLNAME,ESE.EDUCATIONLEVELID, count(eps.pupilid) coutHead
        FROM 
        SAMS.EDU_SCHOOL ES
        LEFT JOIN SAMS.EDU_SCHOOL_EDUCATIONLEVEL ESE
        ON   ESE.SCHOOLID = ES.SCHOOLID          
        JOIN sams.edu_pupil_studytimeline eps
            ON eps.schoolid = es.schoolid             
            AND eps.schoolyearid = 21 AND eps.schooltermid = 1
            AND eps.isactive = 1 AND eps.isdeleted = 0
            AND eps.currentpupilstatusid = 1
        
        WHERE ES.ISDELETED = 0 AND ES.ISACTIVE = 1
        AND ESE.EDUCATIONLEVELID = 4
                AND es.educationtypeid <> 1
        AND ES.schoolid NOT IN (1592,1593,1594,1595,1596,1597,1598,1599,1600,1605,1607,1610,1618,1613,1614,1616,1608,1611,1615,1602,1603,1604,1609,1617,1601,1606,1612,1524,1530,10112318,1541,1525,1515,1470,1528,1469)
        AND eps.schoolclassid > 0
        AND EXISTS(SELECT 1 FROM sams.edu_pupil_markbook  epm  
                                      WHERE epm.schoolyearid = 21 
                                      AND epm.schoolclassid = eps.schoolclassid AND   epm.isdeleted = 0
                                      AND epm.subjectid = 9 AND epm.markgroupid = 1
                                      )

        GROUP BY  ES.SCHOOLID, ES.SCHOOLNAME,ESE.EDUCATIONLEVELID)
         
        GROUP BY  SCHOOLID, SCHOOLNAME,EDUCATIONLEVELID,coutHead
  )BANG3
  ON bang1.schoolid = bang3.schoolid AND bang1.educationlevelid = bang3.educationlevelid
  LEFT JOIN
  (
    SELECT SCHOOLID, SCHOOLNAME,EDUCATIONLEVELID, coutHead
        FROM(
              SELECT  ES.SCHOOLID, ES.SCHOOLNAME,ESE.EDUCATIONLEVELID, count(eps.pupilid) coutHead
        FROM 
        SAMS.EDU_SCHOOL ES
        LEFT JOIN SAMS.EDU_SCHOOL_EDUCATIONLEVEL ESE
        ON   ESE.SCHOOLID = ES.SCHOOLID          
        JOIN sams.edu_pupil_studytimeline eps
            ON eps.schoolid = es.schoolid             
            AND eps.schoolyearid = 21 AND eps.schooltermid = 1
            AND eps.isactive = 1 AND eps.isdeleted = 0
            AND eps.currentpupilstatusid = 1
        
        WHERE ES.ISDELETED = 0 AND ES.ISACTIVE = 1
        AND ESE.EDUCATIONLEVELID = 4
        AND ES.schoolid NOT IN (1592,1593,1594,1595,1596,1597,1598,1599,1600,1605,1607,1610,1618,1613,1614,1616,1608,1611,1615,1602,1603,1604,1609,1617,1601,1606,1612,1524,1530,10112318,1541,1525,1515,1470,1528,1469)
        AND eps.schoolclassid > 0
                AND es.educationtypeid <> 1
        AND EXISTS(SELECT 1 FROM sams.edu_pupil_markbook  epm  
                                      WHERE epm.schoolyearid = 21 
                                      AND epm.schoolclassid = eps.schoolclassid AND   epm.isdeleted = 0
                                      AND epm.subjectid = 9 AND epm.markgroupid = 2)

        GROUP BY  ES.SCHOOLID, ES.SCHOOLNAME,ESE.EDUCATIONLEVELID)
         
        GROUP BY  SCHOOLID, SCHOOLNAME,EDUCATIONLEVELID,coutHead
  )BANG4
  ON bang1.schoolid = bang4.schoolid AND bang1.educationlevelid = bang4.educationlevelid

  
  LEFT JOIN
  (
    SELECT SCHOOLID, SCHOOLNAME,EDUCATIONLEVELID, coutHead
        FROM(
              SELECT  ES.SCHOOLID, ES.SCHOOLNAME,ESE.EDUCATIONLEVELID, count(eps.pupilid) coutHead
        FROM 
        SAMS.EDU_SCHOOL ES
        LEFT JOIN SAMS.EDU_SCHOOL_EDUCATIONLEVEL ESE
        ON   ESE.SCHOOLID = ES.SCHOOLID          
        JOIN sams.edu_pupil_studytimeline eps
            ON eps.schoolid = es.schoolid             
            AND eps.schoolyearid = 21 AND eps.schooltermid = 1
            AND eps.isactive = 1 AND eps.isdeleted = 0
            AND eps.currentpupilstatusid = 1
        
        WHERE ES.ISDELETED = 0 AND ES.ISACTIVE = 1
        AND ESE.EDUCATIONLEVELID = 4
                AND es.educationtypeid <> 1
        AND ES.schoolid NOT IN (1592,1593,1594,1595,1596,1597,1598,1599,1600,1605,1607,1610,1618,1613,1614,1616,1608,1611,1615,1602,1603,1604,1609,1617,1601,1606,1612,1524,1530,10112318,1541,1525,1515,1470,1528,1469)
        AND eps.schoolclassid > 0
        AND EXISTS(SELECT 1 FROM sams.edu_pupil_markbook  epm  
                                      WHERE epm.schoolyearid = 21 
                                      AND epm.schoolclassid = eps.schoolclassid AND   epm.isdeleted = 0
                                      AND epm.subjectid = 11 AND epm.markgroupid = 1)

        GROUP BY  ES.SCHOOLID, ES.SCHOOLNAME,ESE.EDUCATIONLEVELID)
         
        GROUP BY  SCHOOLID, SCHOOLNAME,EDUCATIONLEVELID,coutHead
  )BANG5
  ON bang1.schoolid = bang5.schoolid AND bang1.educationlevelid = bang5.educationlevelid
  LEFT JOIN
  (
    SELECT SCHOOLID, SCHOOLNAME,EDUCATIONLEVELID, coutHead
        FROM(
              SELECT  ES.SCHOOLID, ES.SCHOOLNAME,ESE.EDUCATIONLEVELID, count(eps.pupilid) coutHead
        FROM 
        SAMS.EDU_SCHOOL ES
        LEFT JOIN SAMS.EDU_SCHOOL_EDUCATIONLEVEL ESE
        ON   ESE.SCHOOLID = ES.SCHOOLID          
        JOIN sams.edu_pupil_studytimeline eps
            ON eps.schoolid = es.schoolid             
            AND eps.schoolyearid = 21 AND eps.schooltermid = 1
            AND eps.isactive = 1 AND eps.isdeleted = 0
            AND eps.currentpupilstatusid = 1
        
        WHERE ES.ISDELETED = 0 AND ES.ISACTIVE = 1
        AND ESE.EDUCATIONLEVELID = 4
        AND ES.schoolid NOT IN (1592,1593,1594,1595,1596,1597,1598,1599,1600,1605,1607,1610,1618,1613,1614,1616,1608,1611,1615,1602,1603,1604,1609,1617,1601,1606,1612,1524,1530,10112318,1541,1525,1515,1470,1528,1469)
        AND eps.schoolclassid > 0
                AND es.educationtypeid <> 1
        AND EXISTS(SELECT 1 FROM sams.edu_pupil_markbook  epm  
                                      WHERE epm.schoolyearid = 21 
                                      AND epm.schoolclassid = eps.schoolclassid AND   epm.isdeleted = 0
                                      AND epm.subjectid = 11 AND epm.markgroupid = 2)

        GROUP BY  ES.SCHOOLID, ES.SCHOOLNAME,ESE.EDUCATIONLEVELID)
         
        GROUP BY  SCHOOLID, SCHOOLNAME,EDUCATIONLEVELID,coutHead
  )BANG6
  ON bang1.schoolid = bang6.schoolid AND bang1.educationlevelid = bang6.educationlevelid




  LEFT JOIN
  (
    SELECT SCHOOLID, SCHOOLNAME,EDUCATIONLEVELID, coutHead
        FROM(
              SELECT  ES.SCHOOLID, ES.SCHOOLNAME,ESE.EDUCATIONLEVELID, count(eps.pupilid) coutHead
        FROM 
        SAMS.EDU_SCHOOL ES
        LEFT JOIN SAMS.EDU_SCHOOL_EDUCATIONLEVEL ESE
        ON   ESE.SCHOOLID = ES.SCHOOLID          
        JOIN sams.edu_pupil_studytimeline eps
            ON eps.schoolid = es.schoolid             
            AND eps.schoolyearid = 21 AND eps.schooltermid = 1
            AND eps.isactive = 1 AND eps.isdeleted = 0
            AND eps.currentpupilstatusid = 1
        
        WHERE ES.ISDELETED = 0 AND ES.ISACTIVE = 1
        AND ESE.EDUCATIONLEVELID = 4
                AND es.educationtypeid <> 1
        AND ES.schoolid NOT IN (1592,1593,1594,1595,1596,1597,1598,1599,1600,1605,1607,1610,1618,1613,1614,1616,1608,1611,1615,1602,1603,1604,1609,1617,1601,1606,1612,1524,1530,10112318,1541,1525,1515,1470,1528,1469)
        AND eps.schoolclassid > 0
        AND EXISTS(SELECT 1 FROM sams.edu_pupil_markbook  epm  
                                      WHERE epm.schoolyearid = 21 
                                      AND epm.schoolclassid = eps.schoolclassid AND   epm.isdeleted = 0
                                      AND epm.subjectid = 14 AND epm.markgroupid = 1
                                      )

        GROUP BY  ES.SCHOOLID, ES.SCHOOLNAME,ESE.EDUCATIONLEVELID)
         
        GROUP BY  SCHOOLID, SCHOOLNAME,EDUCATIONLEVELID,coutHead
  )BANG7
  ON bang1.schoolid = bang7.schoolid AND bang1.educationlevelid = bang7.educationlevelid
  LEFT JOIN
  (
    SELECT SCHOOLID, SCHOOLNAME,EDUCATIONLEVELID, coutHead
        FROM(
              SELECT  ES.SCHOOLID, ES.SCHOOLNAME,ESE.EDUCATIONLEVELID, count(eps.pupilid) coutHead
        FROM 
        SAMS.EDU_SCHOOL ES
        LEFT JOIN SAMS.EDU_SCHOOL_EDUCATIONLEVEL ESE
        ON   ESE.SCHOOLID = ES.SCHOOLID          
        JOIN sams.edu_pupil_studytimeline eps
            ON eps.schoolid = es.schoolid             
            AND eps.schoolyearid = 21 AND eps.schooltermid = 1
            AND eps.isactive = 1 AND eps.isdeleted = 0
            AND eps.currentpupilstatusid = 1
        
        WHERE ES.ISDELETED = 0 AND ES.ISACTIVE = 1
        AND ESE.EDUCATIONLEVELID = 4
        AND ES.schoolid NOT IN (1592,1593,1594,1595,1596,1597,1598,1599,1600,1605,1607,1610,1618,1613,1614,1616,1608,1611,1615,1602,1603,1604,1609,1617,1601,1606,1612,1524,1530,10112318,1541,1525,1515,1470,1528,1469)
        AND eps.schoolclassid > 0
                AND es.educationtypeid <> 1
        AND EXISTS(SELECT 1 FROM sams.edu_pupil_markbook  epm  
                                      WHERE epm.schoolyearid = 21 
                                      AND epm.schoolclassid = eps.schoolclassid AND   epm.isdeleted = 0
                                      AND epm.subjectid = 14 AND epm.markgroupid = 2)

        GROUP BY  ES.SCHOOLID, ES.SCHOOLNAME,ESE.EDUCATIONLEVELID)
         
        GROUP BY  SCHOOLID, SCHOOLNAME,EDUCATIONLEVELID,coutHead
  )BANG8
  ON bang1.schoolid = bang8.schoolid AND bang1.educationlevelid = bang8.educationlevelid

  
  LEFT JOIN
  (
    SELECT SCHOOLID, SCHOOLNAME,EDUCATIONLEVELID, coutHead
        FROM(
              SELECT  ES.SCHOOLID, ES.SCHOOLNAME,ESE.EDUCATIONLEVELID, count(eps.pupilid) coutHead
        FROM 
        SAMS.EDU_SCHOOL ES
        LEFT JOIN SAMS.EDU_SCHOOL_EDUCATIONLEVEL ESE
        ON   ESE.SCHOOLID = ES.SCHOOLID          
        JOIN sams.edu_pupil_studytimeline eps
            ON eps.schoolid = es.schoolid             
            AND eps.schoolyearid = 21 AND eps.schooltermid = 1
            AND eps.isactive = 1 AND eps.isdeleted = 0
            AND eps.currentpupilstatusid = 1
        
        WHERE ES.ISDELETED = 0 AND ES.ISACTIVE = 1
        AND ESE.EDUCATIONLEVELID = 4
                AND es.educationtypeid <> 1
        AND ES.schoolid NOT IN (1592,1593,1594,1595,1596,1597,1598,1599,1600,1605,1607,1610,1618,1613,1614,1616,1608,1611,1615,1602,1603,1604,1609,1617,1601,1606,1612,1524,1530,10112318,1541,1525,1515,1470,1528,1469)
        AND eps.schoolclassid > 0
        AND EXISTS(SELECT 1 FROM sams.edu_pupil_markbook  epm  
                                      WHERE epm.schoolyearid = 21 
                                      AND epm.schoolclassid = eps.schoolclassid AND   epm.isdeleted = 0
                                      AND epm.subjectid = 55 AND epm.markgroupid = 1)

        GROUP BY  ES.SCHOOLID, ES.SCHOOLNAME,ESE.EDUCATIONLEVELID)
         
        GROUP BY  SCHOOLID, SCHOOLNAME,EDUCATIONLEVELID,coutHead
  )BANG9
  ON bang1.schoolid = bang9.schoolid AND bang1.educationlevelid = bang9.educationlevelid
  LEFT JOIN
  (
    SELECT SCHOOLID, SCHOOLNAME,EDUCATIONLEVELID, coutHead
        FROM(
              SELECT  ES.SCHOOLID, ES.SCHOOLNAME,ESE.EDUCATIONLEVELID, count(eps.pupilid) coutHead
        FROM 
        SAMS.EDU_SCHOOL ES
        LEFT JOIN SAMS.EDU_SCHOOL_EDUCATIONLEVEL ESE
        ON   ESE.SCHOOLID = ES.SCHOOLID          
        JOIN sams.edu_pupil_studytimeline eps
            ON eps.schoolid = es.schoolid             
            AND eps.schoolyearid = 21 AND eps.schooltermid = 1
            AND eps.isactive = 1 AND eps.isdeleted = 0
            AND eps.currentpupilstatusid = 1
        
        WHERE ES.ISDELETED = 0 AND ES.ISACTIVE = 1
        AND ESE.EDUCATIONLEVELID = 4
        AND ES.schoolid NOT IN (1592,1593,1594,1595,1596,1597,1598,1599,1600,1605,1607,1610,1618,1613,1614,1616,1608,1611,1615,1602,1603,1604,1609,1617,1601,1606,1612,1524,1530,10112318,1541,1525,1515,1470,1528,1469)
        AND eps.schoolclassid > 0
                AND es.educationtypeid <> 1
        AND EXISTS(SELECT 1 FROM sams.edu_pupil_markbook  epm  
                                      WHERE epm.schoolyearid = 21 
                                      AND epm.schoolclassid = eps.schoolclassid AND   epm.isdeleted = 0
                                      AND epm.subjectid = 55 AND epm.markgroupid = 2)

        GROUP BY  ES.SCHOOLID, ES.SCHOOLNAME,ESE.EDUCATIONLEVELID)
         
        GROUP BY  SCHOOLID, SCHOOLNAME,EDUCATIONLEVELID,coutHead
  )BANG10
  ON bang1.schoolid = bang10.schoolid AND bang1.educationlevelid = bang10.educationlevelid

  ORDER BY bang1.schoolname
;