SELECT bang1.organid, bang1.organname, bang1.educationtypename,bang1.schoolname,bang1.couthead schoolclass 
      ,nvl(bang2.couthead,0)coutGVBM
      ,nvl(bang3.couthead,0)coutGVCN
      ,nvl(bang4.couthead,0)coutNhapDiem
      ,nvl(bang5.couthead,0)coutDiemDanh
      ,nvl(bang6.couthead,0)coutThoiKhoaBieu
  FROM(

        SELECT ORGANID, ORGANNAME,SCHOOLID,SCHOOLNAME,EDUCATIONLEVELID,coutHead,educationtypename
          FROM(
                SELECT MO1.ORGANID, MO1.ORGANNAME, ES.SCHOOLID, ES.SCHOOLNAME,es1.educationtypename,ESE.EDUCATIONLEVELID,
                    count(esn.schoolclassid) coutHead
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
          AND esn.schoolyearid = 21 AND esn.schooltermid = 1
          AND esn.isactive = 1 AND esn.isdeleted = 0
         LEFT 
        JOIN sams.edu_educationtype  es1
          ON es.educationtypeid = es1.educationtypeid
         AND es1.isactive = 1 
         AND es1.isdeleted = 0

          WHERE ES.ISDELETED = 0 AND ES.ISACTIVE = 1
--          AND ESE.EDUCATIONLEVELID = 7
          AND MO1.ORGANID NOT IN(5700)
          AND ES.schoolid NOT IN (1592,1593,1594,1595,1596,1597,1598,1599,1600,1605,1607,1610,1618,1613,1614,1616,1608,1611,1615,1602,1603,1604,1609,1617,1601,1606,1612,1524,1530,10112318,1541,1525,1515,1470,1528,1469)
--                  AND  EXISTS(SELECT 1 FROM sams.edu_schoolclass_teacher  esn1
--                              WHERE esn1.schoolyearid = 21 AND esn1.schooltermid = 1 AND esn1.schoolclassid = esn.schoolclassid AND   esn1.isdeleted = 0)
          GROUP BY MO1.ORGANID, MO1.ORGANNAME, ES.SCHOOLID, ES.SCHOOLNAME,es1.educationtypename,ESE.EDUCATIONLEVELID)
           
          GROUP BY  ORGANID, ORGANNAME, coutHead,SCHOOLNAME,SCHOOLID,educationtypename,EDUCATIONLEVELID
          
          order by ORGANNAME,SCHOOLNAME
        
        ) BANG1
      
      LEFT JOIN
        (
          SELECT SCHOOLID,SCHOOLNAME,coutHead,EDUCATIONLEVELID
                  FROM(
                        SELECT  ES.SCHOOLID, ES.SCHOOLNAME,ESE.EDUCATIONLEVELID,
                            
                            count(esn.schoolclassid) coutHead
                  FROM 
                  SAMS.EDU_SCHOOL ES
                  LEFT JOIN SAMS.EDU_SCHOOL_EDUCATIONLEVEL ESE
                  ON   ESE.SCHOOLID = ES.SCHOOLID                  
                  LEFT JOIN sams.edu_schoolclass_new esn
                  ON esn.schoolid = es.schoolid
                  AND esn.schoolyearid = 21 AND esn.schooltermid = 1
                  AND esn.isactive = 1 AND esn.isdeleted = 0
                 
                  WHERE ES.ISDELETED = 0 AND ES.ISACTIVE = 1
                  
                  AND ES.schoolid NOT IN (1592,1593,1594,1595,1596,1597,1598,1599,1600,1605,1607,1610,1618,1613,1614,1616,1608,1611,1615,1602,1603,1604,1609,1617,1601,1606,1612,1524,1530,10112318,1541,1525,1515,1470,1528,1469)
                          AND  EXISTS(SELECT 1 FROM sams.edu_schoolclass_teacher  esn1
                                      WHERE esn1.schoolyearid = 21 AND esn1.schooltermid = 1 AND esn1.schoolclassid = esn.schoolclassid AND   esn1.isdeleted = 0)
                  GROUP BY  ES.SCHOOLID, ES.SCHOOLNAME,ESE.EDUCATIONLEVELID)
                   
                  GROUP BY EDUCATIONLEVELID,SCHOOLNAME,SCHOOLID,coutHead
                  
                  order by SCHOOLNAME
        ) BANG2
        ON bang1.schoolid = bang2.schoolid
        AND bang1.educationlevelid = bang2.EDUCATIONLEVELID
        LEFT JOIN
        (
          SELECT SCHOOLID,SCHOOLNAME,coutHead,EDUCATIONLEVELID
                  FROM(
                        SELECT  ES.SCHOOLID, ES.SCHOOLNAME,ESE.EDUCATIONLEVELID,
                            
                            count(esn.schoolclassid) coutHead
                  FROM 
                  SAMS.EDU_SCHOOL ES
                  LEFT JOIN SAMS.EDU_SCHOOL_EDUCATIONLEVEL ESE
                  ON   ESE.SCHOOLID = ES.SCHOOLID                 
                  LEFT JOIN sams.edu_schoolclass_new esn
                  ON esn.schoolid = es.schoolid
                  AND esn.schoolyearid = 21 AND esn.schooltermid = 1
                  AND esn.isactive = 1 AND esn.isdeleted = 0              
                  WHERE ES.ISDELETED = 0 AND ES.ISACTIVE = 1
                  AND ES.schoolid NOT IN (1592,1593,1594,1595,1596,1597,1598,1599,1600,1605,1607,1610,1618,1613,1614,1616,1608,1611,1615,1602,1603,1604,1609,1617,1601,1606,1612,1524,1530,10112318,1541,1525,1515,1470,1528,1469)
                          AND  EXISTS(SELECT 1 FROM sams.edu_schoolclass_headteacher   esn1
                                      WHERE esn1.schoolyearid = 21 AND esn1.schooltermid = 1 AND esn1.schoolclassid = esn.schoolclassid AND   esn1.isdeleted = 0)
                  GROUP BY ESE.EDUCATIONLEVELID, ES.SCHOOLID, ES.SCHOOLNAME)                   
                  GROUP BY  EDUCATIONLEVELID, coutHead,SCHOOLNAME,SCHOOLID                  
--                  order by SCHOOLNAME
        ) BANG3
        ON bang1.EDUCATIONLEVELID = bang3.EDUCATIONLEVELID 
        AND bang1.schoolid = bang3.schoolid

        LEFT JOIN
        (
          SELECT EDUCATIONLEVELID,SCHOOLID,SCHOOLNAME,coutHead
                  FROM(
                        SELECT ESE.EDUCATIONLEVELID, ES.SCHOOLID, ES.SCHOOLNAME,
                            
                            count(esn.schoolclassid) coutHead
                  FROM 
                  SAMS.EDU_SCHOOL ES
                  LEFT JOIN SAMS.EDU_SCHOOL_EDUCATIONLEVEL ESE
                  ON   ESE.SCHOOLID = ES.SCHOOLID
                  
                  LEFT JOIN sams.edu_schoolclass_new esn
                  ON esn.schoolid = es.schoolid
                  AND esn.schoolyearid = 21 AND esn.schooltermid = 1
                  AND esn.isactive = 1 AND esn.isdeleted = 0
                 
                  WHERE ES.ISDELETED = 0 AND ES.ISACTIVE = 1
                  
                  AND ES.schoolid NOT IN (1592,1593,1594,1595,1596,1597,1598,1599,1600,1605,1607,1610,1618,1613,1614,1616,1608,1611,1615,1602,1603,1604,1609,1617,1601,1606,1612,1524,1530,10112318,1541,1525,1515,1470,1528,1469)
                          AND  EXISTS(SELECT 1 FROM sams.edu_pupil_markbook   esn1
                                      WHERE esn1.schoolyearid = 21 AND esn1.schooltermid = 1 AND esn1.schoolclassid = esn.schoolclassid AND   esn1.isdeleted = 0)
                  GROUP BY ESE.EDUCATIONLEVELID, ES.SCHOOLID, ES.SCHOOLNAME)
                   
                  GROUP BY  EDUCATIONLEVELID, coutHead,SCHOOLNAME,SCHOOLID
                  
--                  order by SCHOOLNAME
        ) BANG4
        ON bang1.educationlevelid = bang4.educationlevelid 
        AND bang1.schoolid = bang4.schoolid

    LEFT JOIN
        (
          SELECT EDUCATIONLEVELID,SCHOOLID,SCHOOLNAME,coutHead
                  FROM(
                        SELECT ESE.EDUCATIONLEVELID, ES.SCHOOLID, ES.SCHOOLNAME,
                            
                            count(esn.schoolclassid) coutHead
                  FROM 
                  SAMS.EDU_SCHOOL ES
                  LEFT JOIN SAMS.EDU_SCHOOL_EDUCATIONLEVEL ESE
                  ON   ESE.SCHOOLID = ES.SCHOOLID                  
                  LEFT JOIN sams.edu_schoolclass_new esn
                  ON esn.schoolid = es.schoolid
                  AND esn.schoolyearid = 21 AND esn.schooltermid = 1
                  AND esn.isactive = 1 AND esn.isdeleted = 0
                 
                  WHERE ES.ISDELETED = 0 AND ES.ISACTIVE = 1
--                  AND ESE.EDUCATIONLEVELID = 7
                  AND ES.schoolid NOT IN (1592,1593,1594,1595,1596,1597,1598,1599,1600,1605,1607,1610,1618,1613,1614,1616,1608,1611,1615,1602,1603,1604,1609,1617,1601,1606,1612,1524,1530,10112318,1541,1525,1515,1470,1528,1469)
                          AND  EXISTS(SELECT 1 FROM sams.EDU_PUPIL_ATTENDANCE   esn1
                                        JOIN sams.edu_pupil ep
                                          ON ep.pupilid = esn1.pupilid
                                          
                                          AND ep.isactive = 1 AND ep.isdeleted = 0
                                      WHERE esn1.schoolyearid = 21 AND esn1.schooltermid = 1 AND esn.schoolclassid = ep.currentschoolclassid AND   esn1.isdeleted = 0)
                  GROUP BY ESE.EDUCATIONLEVELID, ES.SCHOOLID, ES.SCHOOLNAME)
                   
                  GROUP BY  EDUCATIONLEVELID, coutHead,SCHOOLNAME,SCHOOLID
                  
--                  order by SCHOOLNAME
        ) BANG5
        ON bang1.educationlevelid = bang5.educationlevelid 
        AND bang1.schoolid = bang5.schoolid

   LEFT JOIN
        (
          SELECT EDUCATIONLEVELID,SCHOOLID,SCHOOLNAME,coutHead
                  FROM(
                        SELECT ESE.EDUCATIONLEVELID, ES.SCHOOLID, ES.SCHOOLNAME,
                            
                            count(esn.schoolclassid) coutHead
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
                  AND esn.schoolyearid = 21 AND esn.schooltermid = 1
                  AND esn.isactive = 1 AND esn.isdeleted = 0
                 
                  WHERE ES.ISDELETED = 0 AND ES.ISACTIVE = 1
--                  AND ESE.EDUCATIONLEVELID = 7
                  AND ES.schoolid NOT IN (1592,1593,1594,1595,1596,1597,1598,1599,1600,1605,1607,1610,1618,1613,1614,1616,1608,1611,1615,1602,1603,1604,1609,1617,1601,1606,1612,1524,1530,10112318,1541,1525,1515,1470,1528,1469)
                          AND  EXISTS(SELECT 1 FROM sams.EDU_TIMETABLE   esn1
                                      WHERE esn1.schoolyearid = 21 AND esn1.schooltermid = 1 AND esn1.schoolid = esn.schoolid AND   esn1.isdeleted = 0)
                  GROUP BY ESE.EDUCATIONLEVELID, ES.SCHOOLID, ES.SCHOOLNAME)
                   
                  GROUP BY  EDUCATIONLEVELID, coutHead,SCHOOLNAME,SCHOOLID
                  
--                  order by SCHOOLNAME
        ) BANG6
        ON bang1.educationlevelid = bang6.educationlevelid 
        AND bang1.schoolid = bang6.schoolid
      WHERE bang1.educationlevelid = 7 
      ORDER BY bang1.organid, bang1.schoolname
  ;