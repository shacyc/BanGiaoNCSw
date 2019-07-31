SELECT bang1.schoolid,bang1.schoolname,bang1.couthead schoolclass 
      ,nvl(bang2.couthead,0)coutGVBM
      ,nvl(bang3.couthead,0)coutGVCN
--      ,nvl(bang4.couthead,0)coutNhapDiem
--      ,nvl(bang5.couthead,0)coutDiemDanh
--      ,nvl(bang6.couthead,0)coutThoiKhoaBieu
  FROM(

        SELECT SCHOOLID,SCHOOLNAME,coutHead
          FROM(
                SELECT  ES.SCHOOLID, ES.SCHOOLNAME,
                    
                    count(esn.schoolclassid) coutHead
          FROM 
          SAMS.EDU_SCHOOL ES
         
          LEFT JOIN sams.edu_schoolclass_new esn
          ON esn.schoolid = es.schoolid
          AND esn.schoolyearid = 21 AND esn.schooltermid = 1
          AND esn.isactive = 1 AND esn.isdeleted = 0        

          WHERE ES.ISDELETED = 0 AND ES.ISACTIVE = 1
          AND ES.schoolid IN (
                              '10042272',
'10042211',
'10042467',
'10042255',
'10042235',
'10042295',
'10042280',
'10042137',
'10042227',
'10042414',
'10042292',
'10042215',
'10042220',
'10043115',
'10042299',
'10042177'

          )
--                  AND  EXISTS(SELECT 1 FROM sams.edu_schoolclass_teacher  esn1
--                              WHERE esn1.schoolyearid = 21 AND esn1.schooltermid = 1 AND esn1.schoolclassid = esn.schoolclassid AND   esn1.isdeleted = 0)
          GROUP BY ES.SCHOOLID, ES.SCHOOLNAME)
           
          GROUP BY  coutHead,SCHOOLNAME,SCHOOLID
          
          order by SCHOOLID, SCHOOLNAME
        
        ) BANG1
      
      LEFT JOIN
        (
          SELECT SCHOOLID,SCHOOLNAME,coutHead
                  FROM(
                        SELECT ES.SCHOOLID, ES.SCHOOLNAME,
                            
                            count(esn.schoolclassid) coutHead
                  FROM 
                  SAMS.EDU_SCHOOL ES                  
                  LEFT JOIN sams.edu_schoolclass_new esn
                  ON esn.schoolid = es.schoolid
                  AND esn.schoolyearid = 21 AND esn.schooltermid = 1
                  AND esn.isactive = 1 AND esn.isdeleted = 0
                 
                  WHERE ES.ISDELETED = 0 AND ES.ISACTIVE = 1
                   AND ES.schoolid IN (
                              '10042272',
'10042211',
'10042467',
'10042255',
'10042235',
'10042295',
'10042280',
'10042137',
'10042227',
'10042414',
'10042292',
'10042215',
'10042220',
'10043115',
'10042299',
'10042177'

          )
                          AND  EXISTS(SELECT 1 FROM sams.edu_schoolclass_teacher  esn1
                                      WHERE esn1.schoolyearid = 21 AND esn1.schooltermid = 1 AND esn1.schoolclassid = esn.schoolclassid AND   esn1.isdeleted = 0)
                  GROUP BY  ES.SCHOOLID, ES.SCHOOLNAME)
                   
                  GROUP BY  coutHead,SCHOOLNAME,SCHOOLID
                  
                  order by SCHOOLID,SCHOOLNAME
        ) BANG2
        ON  bang1.schoolid = bang2.schoolid
        LEFT JOIN
        (
          SELECT SCHOOLID,SCHOOLNAME,coutHead
                  FROM(
                        SELECT  ES.SCHOOLID, ES.SCHOOLNAME,
                            
                            count(esn.schoolclassid) coutHead
                  FROM 
                  SAMS.EDU_SCHOOL ES
                 
                  LEFT JOIN sams.edu_schoolclass_new esn
                  ON esn.schoolid = es.schoolid
                  AND esn.schoolyearid = 21 AND esn.schooltermid = 1
                  AND esn.isactive = 1 AND esn.isdeleted = 0
                 
                  WHERE ES.ISDELETED = 0 AND ES.ISACTIVE = 1
                 
                 AND ES.schoolid IN (
                              '10042272',
'10042211',
'10042467',
'10042255',
'10042235',
'10042295',
'10042280',
'10042137',
'10042227',
'10042414',
'10042292',
'10042215',
'10042220',
'10043115',
'10042299',
'10042177'

          )
                          AND  EXISTS(SELECT 1 FROM sams.edu_schoolclass_headteacher   esn1
                                      WHERE esn1.schoolyearid = 21 AND esn1.schooltermid = 1 AND esn1.schoolclassid = esn.schoolclassid AND   esn1.isdeleted = 0)
                  GROUP BY ES.SCHOOLID, ES.SCHOOLNAME)
                   
                  GROUP BY coutHead,SCHOOLNAME,SCHOOLID
                  
                  order by SCHOOLID,SCHOOLNAME
        ) BANG3
        ON bang1.schoolid = bang3.schoolid

--        LEFT JOIN
--        (
--          SELECT ORGANID, ORGANNAME,SCHOOLID,SCHOOLNAME,coutHead
--                  FROM(
--                        SELECT MO1.ORGANID, MO1.ORGANNAME, ES.SCHOOLID, ES.SCHOOLNAME,
--                            
--                            count(esn.schoolclassid) coutHead
--                  FROM 
--                  SAMS.EDU_SCHOOL ES
--                  LEFT JOIN SAMS.EDU_SCHOOL_EDUCATIONLEVEL ESE
--                  ON   ESE.SCHOOLID = ES.SCHOOLID
--                  LEFT JOIN SAMS.MD_ORGAN MO
--                  ON     ES.ORGANID = MO.ORGANID
--                  LEFT JOIN SAMS.MD_ORGAN MO1 
--                  ON MO.PARENTID = MO1.ORGANID
--                  LEFT JOIN sams.edu_schoolclass_new esn
--                  ON esn.schoolid = es.schoolid
--                  AND esn.schoolyearid = 21 AND esn.schooltermid = 1
--                  AND esn.isactive = 1 AND esn.isdeleted = 0
--                 
--                  WHERE ES.ISDELETED = 0 AND ES.ISACTIVE = 1
--                  AND ESE.EDUCATIONLEVELID = 4
--                  AND ES.schoolid NOT IN (1592,1593,1594,1595,1596,1597,1598,1599,1600,1605,1607,1610,1618,1613,1614,1616,1608,1611,1615,1602,1603,1604,1609,1617,1601,1606,1612,1524,1530,10112318,1541,1525,1515,1470,1528,1469)
--                          AND  EXISTS(SELECT 1 FROM sams.edu_pupil_markbook   esn1
--                                      WHERE esn1.schoolyearid = 21 AND esn1.schooltermid = 1 AND esn1.schoolclassid = esn.schoolclassid AND   esn1.isdeleted = 0)
--                  GROUP BY MO1.ORGANID, MO1.ORGANNAME, ES.SCHOOLID, ES.SCHOOLNAME)
--                   
--                  GROUP BY  ORGANID, ORGANNAME, coutHead,SCHOOLNAME,SCHOOLID
--                  
--                  order by ORGANNAME,SCHOOLNAME
--        ) BANG4
--        ON bang1.organid = bang4.organid AND bang1.organname = bang4.organname
--        AND bang1.schoolid = bang4.schoolid
--
--    LEFT JOIN
--        (
--          SELECT ORGANID, ORGANNAME,SCHOOLID,SCHOOLNAME,coutHead
--                  FROM(
--                        SELECT MO1.ORGANID, MO1.ORGANNAME, ES.SCHOOLID, ES.SCHOOLNAME,
--                            
--                            count(esn.schoolclassid) coutHead
--                  FROM 
--                  SAMS.EDU_SCHOOL ES
--                  LEFT JOIN SAMS.EDU_SCHOOL_EDUCATIONLEVEL ESE
--                  ON   ESE.SCHOOLID = ES.SCHOOLID
--                  LEFT JOIN SAMS.MD_ORGAN MO
--                  ON     ES.ORGANID = MO.ORGANID
--                  LEFT JOIN SAMS.MD_ORGAN MO1 
--                  ON MO.PARENTID = MO1.ORGANID
--                  LEFT JOIN sams.edu_schoolclass_new esn
--                  ON esn.schoolid = es.schoolid
--                  AND esn.schoolyearid = 21 AND esn.schooltermid = 1
--                  AND esn.isactive = 1 AND esn.isdeleted = 0
--                 
--                  WHERE ES.ISDELETED = 0 AND ES.ISACTIVE = 1
--                  AND ESE.EDUCATIONLEVELID = 4
--                  AND ES.schoolid NOT IN (1592,1593,1594,1595,1596,1597,1598,1599,1600,1605,1607,1610,1618,1613,1614,1616,1608,1611,1615,1602,1603,1604,1609,1617,1601,1606,1612,1524,1530,10112318,1541,1525,1515,1470,1528,1469)
--                          AND  EXISTS(SELECT 1 FROM sams.EDU_PUPIL_ATTENDANCE   esn1
--                                        JOIN sams.edu_pupil ep
--                                          ON ep.pupilid = esn1.pupilid
--                                          
--                                          AND ep.isactive = 1 AND ep.isdeleted = 0
--                                      WHERE esn1.schoolyearid = 21 AND esn1.schooltermid = 1 AND esn.schoolclassid = ep.currentschoolclassid AND   esn1.isdeleted = 0)
--                  GROUP BY MO1.ORGANID, MO1.ORGANNAME, ES.SCHOOLID, ES.SCHOOLNAME)
--                   
--                  GROUP BY  ORGANID, ORGANNAME, coutHead,SCHOOLNAME,SCHOOLID
--                  
--                  order by ORGANNAME,SCHOOLNAME
--        ) BANG5
--        ON bang1.organid = bang5.organid AND bang1.organname = bang5.organname
--        AND bang1.schoolid = bang5.schoolid
--
--   LEFT JOIN
--        (
--          SELECT ORGANID, ORGANNAME,SCHOOLID,SCHOOLNAME,coutHead
--                  FROM(
--                        SELECT MO1.ORGANID, MO1.ORGANNAME, ES.SCHOOLID, ES.SCHOOLNAME,
--                            
--                            count(esn.schoolclassid) coutHead
--                  FROM 
--                  SAMS.EDU_SCHOOL ES
--                  LEFT JOIN SAMS.EDU_SCHOOL_EDUCATIONLEVEL ESE
--                  ON   ESE.SCHOOLID = ES.SCHOOLID
--                  LEFT JOIN SAMS.MD_ORGAN MO
--                  ON     ES.ORGANID = MO.ORGANID
--                  LEFT JOIN SAMS.MD_ORGAN MO1 
--                  ON MO.PARENTID = MO1.ORGANID
--                  LEFT JOIN sams.edu_schoolclass_new esn
--                  ON esn.schoolid = es.schoolid
--                  AND esn.schoolyearid = 21 AND esn.schooltermid = 1
--                  AND esn.isactive = 1 AND esn.isdeleted = 0
--                 
--                  WHERE ES.ISDELETED = 0 AND ES.ISACTIVE = 1
--                  AND ESE.EDUCATIONLEVELID = 4
--                  AND ES.schoolid NOT IN (1592,1593,1594,1595,1596,1597,1598,1599,1600,1605,1607,1610,1618,1613,1614,1616,1608,1611,1615,1602,1603,1604,1609,1617,1601,1606,1612,1524,1530,10112318,1541,1525,1515,1470,1528,1469)
--                          AND  EXISTS(SELECT 1 FROM sams.EDU_TIMETABLE   esn1
--                                      WHERE esn1.schoolyearid = 21 AND esn1.schooltermid = 1 AND esn1.schoolid = esn.schoolid AND   esn1.isdeleted = 0)
--                  GROUP BY MO1.ORGANID, MO1.ORGANNAME, ES.SCHOOLID, ES.SCHOOLNAME)
--                   
--                  GROUP BY  ORGANID, ORGANNAME, coutHead,SCHOOLNAME,SCHOOLID
--                  
--                  order by ORGANNAME,SCHOOLNAME
--        ) BANG6
--        ON bang1.organid = bang6.organid AND bang1.organname = bang6.organname
--        AND bang1.schoolid = bang6.schoolid

      ORDER BY  bang1.schoolname
  ;