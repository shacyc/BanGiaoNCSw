SELECT es.schoolname, md.districtname 
--  , es1.educationtypename
--  ,couNTschoolclass.subjectname
  ,NVL(TONGSOLOPKHOI6.slschoolclass,0) TSLOPKHOI6
  ,NVL(tongsolopdanhapk6.slschoolclass,0)TSlopdanhapk6
  ,NVL(round((tongsolopdanhapk6.slschoolclass)*100/(TONGSOLOPKHOI6.slschoolclass),2),0) TLK6  
   ,NVL(TONGSOLOPKHOI7.slschoolclass,0) TSLOPKHOI7
  ,NVL(tongsolopdanhapk7.slschoolclass,0)TSlopdanhapk7
   ,NVL(round((tongsolopdanhapk7.slschoolclass)*100/(TONGSOLOPKHOI7.slschoolclass),2),0) TLK7  
   ,NVL(TONGSOLOPKHOI8.slschoolclass,0) TSLOPKHOI8
  ,NVL(tongsolopdanhapk8.slschoolclass,0)TSlopdanhapk8
   ,NVL(round((tongsolopdanhapk8.slschoolclass)*100/(TONGSOLOPKHOI8.slschoolclass),2),0) TLK8  
   ,NVL(TONGSOLOPKHOI9.slschoolclass,0) TSLOPKHOI9
  ,NVL(tongsolopdanhapk9.slschoolclass,0)TSlopdanhapk9
   ,NVL(round((tongsolopdanhapk9.slschoolclass)*100/(TONGSOLOPKHOI9.slschoolclass),2),0) TLK9  
   ,NVL(TONGSOLOPKHOI10.slschoolclass,0) TSLOPKHOI10
  ,NVL(tongsolopdanhapk10.slschoolclass,0)TSlopdanhapk10
   ,NVL(round((tongsolopdanhapk10.slschoolclass)*100/(TONGSOLOPKHOI10.slschoolclass),2),0) TLK10  
   ,NVL(TONGSOLOPKHOI11.slschoolclass,0) TSLOPKHOI11
  ,NVL(tongsolopdanhapk11.slschoolclass,0)TSlopdanhapk11
   ,NVL(round((tongsolopdanhapk11.slschoolclass)*100/(TONGSOLOPKHOI11.slschoolclass),2),0) TLK11 
  ,NVL(TONGSOLOPKHOI12.slschoolclass,0) TSLOPKHOI12
  ,NVL(tongsolopdanhapk12.slschoolclass,0)TSlopdanhapk12
   ,NVL(round((tongsolopdanhapk12.slschoolclass)*100/(TONGSOLOPKHOI12.slschoolclass),2),0) TLK12  
  ,bang1.slschoolclass TSLOP
  ,bang2.slschoolclass TSlopdanhap
  ,NVL(round((bang2.slschoolclass)*100/(bang1.slschoolclass),2),0) TLTT 
FROM sams.edu_school es
  LEFT JOIN SAMS.EDU_SCHOOL_EDUCATIONLEVEL ESE
    ON   ESE.SCHOOLID = ES.SCHOOLID
JOIN sams.md_organ mo
  ON es.organid = mo.organid
--LEFT
JOIN sams.md_district md
  ON md.districtid = mo.districtid
--  LEFT 
--JOIN sams.edu_educationtype  es1
--  ON es.educationtypeid = es1.educationtypeid
-- AND es1.isactive = 1 
-- AND es1.isdeleted = 0
--LEFT 
LEFT JOIN (
  SELECT esn.schoolid, COUNT(DISTINCT esn.schoolclassid) slschoolclass 
  FROM saMS.edu_schoolclass_new esn
    JOIN sams.edu_schoolclass_subject ess
      ON ess.schoolclassid = esn.schoolclassid
      AND ess.schoolyearid = esn.schoolyearid
      AND ess.schooltermid = esn.schooltermid
      AND ess.isdeleted = 0
    JOIN sams.edu_subject 
      ON edu_subject.subjectid = ess.subjectid
       AND edu_subject.isactive = 1 AND edu_subject.isdeleted = 0 
    JOIN sams.edu_class ec
    ON   ec.classid = esn.classid
    AND ec.isactive = 1 AND ec.isdeleted = 0
  WHERE esn.schoolyearid = 21
  AND esn.schooltermid = 1
  AND esn.isdeleted = 0
  AND esn.isactive = 1
  AND ec.educationlevelid = 7
--     AND esn.classid in (16,17,18,19,20,21,22)
  GROUP BY esn.schoolid
  )BANG1
 ON es.schoolid = BANG1.schoolid
  
LEFT JOIN (
  SELECT esn.schoolid,COUNT(DISTINCT esn.schoolclassid)slschoolclass 
--    , edu_subject.subjectname
  FROM saMS.edu_schoolclass_new esn
    JOIN sams.edu_schoolclass_subject  epm
      ON epm.schoolclassid = esn.schoolclassid
      AND epm.schoolyearid = esn.schoolyearid
      AND epm.schooltermid = esn.schooltermid
       AND epm.isdeleted = 0     
    JOIN sams.edu_subject 
      ON edu_subject.subjectid = epm.subjectid
       AND edu_subject.isactive = 1 AND edu_subject.isdeleted = 0
    JOIN sams.edu_class ec
    ON   ec.classid = esn.classid
    AND ec.isactive = 1 AND ec.isdeleted = 0
  WHERE esn.schoolyearid = 21
  AND esn.schooltermid = 1
  AND esn.isdeleted = 0
  AND esn.isactive = 1
  AND ec.educationlevelid = 7
--     AND esn.classid in (16,17,18,19,20,21,22)
  AND  EXISTS (SELECT * 
                    FROM sams.edu_pupil_studyhistory eps
                    WHERE eps.schoolclassid = esn.schoolclassid
                          AND eps.schoolid = esn.schoolid
                          AND eps.firsttermconductrankid > 0
                          AND eps.schoolyearid = esn.schoolyearid
                          AND eps.isactive = 1 AND eps.isdeleted =0
--                          AND TO_CHAR(eps.createddate, 'YYYYMMDD') <= '20181224'
                    )
  GROUP BY esn.schoolid,esn.schoolid
  )Bang2
 ON es.schoolid = Bang2.schoolid
  

LEFT JOIN (
  SELECT esn.schoolid,  nvl(COUNT(DISTINCT esn.schoolclassid),0) slschoolclass 
  FROM saMS.edu_schoolclass_new esn
    JOIN sams.edu_schoolclass_subject ess
      ON ess.schoolclassid = esn.schoolclassid
      AND ess.schoolyearid = esn.schoolyearid
      AND ess.schooltermid = esn.schooltermid
      AND ess.isdeleted = 0
   
    JOIN sams.edu_class ec
    ON   ec.classid = esn.classid
    AND ec.isactive = 1 AND ec.isdeleted = 0
  WHERE esn.schoolyearid = 21
  AND esn.schooltermid = 1
  AND esn.isdeleted = 0
  AND esn.isactive = 1
  AND esn.classid = 19
--     AND esn.classid in (16,17,18,19,20,21,22)
  GROUP BY esn.schoolid
  )TONGSOLOPKHOI6
 ON es.schoolid = TONGSOLOPKHOI6.schoolid
  
 LEFT JOIN (
  SELECT esn.schoolid,nvl(COUNT(DISTINCT esn.schoolclassid),0) slschoolclass 
  FROM saMS.edu_schoolclass_new esn
    
    JOIN sams.edu_class ec
    ON   ec.classid = esn.classid
    AND ec.isactive = 1 AND ec.isdeleted = 0
  WHERE esn.schoolyearid = 21
  AND esn.schooltermid = 1
  AND esn.isdeleted = 0
  AND esn.isactive = 1
  AND esn.classid = 19
--     AND esn.classid in (16,17,18,19,20,21,22)
  AND  EXISTS (SELECT * 
                    FROM sams.edu_pupil_studyhistory eps
                    WHERE eps.schoolclassid = esn.schoolclassid
                          AND eps.schoolid = esn.schoolid
                          AND eps.firsttermconductrankid >0
                          AND eps.schoolyearid = esn.schoolyearid
                          AND eps.isactive = 1 AND eps.isdeleted =0
--                          AND TO_CHAR(eps.createddate, 'YYYYMMDD') <= '20181224'
                    )
  GROUP BY esn.schoolid,esn.schoolid
  )TONGSOLOPDANHAPK6
 ON es.schoolid = TONGSOLOPDANHAPK6.schoolid
--- KHOI 7
LEFT JOIN (
  SELECT esn.schoolid, nvl(COUNT(DISTINCT esn.schoolclassid),0) slschoolclass 
  FROM saMS.edu_schoolclass_new esn
    JOIN sams.edu_schoolclass_subject ess
      ON ess.schoolclassid = esn.schoolclassid
      AND ess.schoolyearid = esn.schoolyearid
      AND ess.schooltermid = esn.schooltermid
      AND ess.isdeleted = 0
   
    JOIN sams.edu_class ec
    ON   ec.classid = esn.classid
    AND ec.isactive = 1 AND ec.isdeleted = 0
  WHERE esn.schoolyearid = 21
  AND esn.schooltermid = 1
  AND esn.isdeleted = 0
  AND esn.isactive = 1
  AND esn.classid = 20
--     AND esn.classid in (16,17,18,19,20,21,22)
  GROUP BY esn.schoolid
  )TONGSOLOPKHOI7
 ON es.schoolid = TONGSOLOPKHOI7.schoolid
  
 LEFT JOIN (
  SELECT esn.schoolid,nvl(COUNT(DISTINCT esn.schoolclassid),0) slschoolclass 
  FROM saMS.edu_schoolclass_new esn
    
    JOIN sams.edu_class ec
    ON   ec.classid = esn.classid
    AND ec.isactive = 1 AND ec.isdeleted = 0
  WHERE esn.schoolyearid = 21
  AND esn.schooltermid = 1
  AND esn.isdeleted = 0
  AND esn.isactive = 1
  AND esn.classid = 20
--     AND esn.classid in (16,17,18,19,20,21,22)
  AND  EXISTS (SELECT * 
                    FROM sams.edu_pupil_studyhistory eps
                    WHERE eps.schoolclassid = esn.schoolclassid
                          AND eps.schoolid = esn.schoolid
                          AND eps.firsttermconductrankid  > 0
                          AND eps.schoolyearid = esn.schoolyearid
                          AND eps.isactive = 1 AND eps.isdeleted =0
--                          AND TO_CHAR(eps.createddate, 'YYYYMMDD') <= '20181224'
                    )
  GROUP BY esn.schoolid,esn.schoolid
  )TONGSOLOPDANHAPK7
 ON es.schoolid = TONGSOLOPDANHAPK7.schoolid


  --- KHOI 8
  LEFT JOIN (
  SELECT esn.schoolid, nvl(COUNT(DISTINCT esn.schoolclassid),0) slschoolclass 
  FROM saMS.edu_schoolclass_new esn
    JOIN sams.edu_schoolclass_subject ess
      ON ess.schoolclassid = esn.schoolclassid
      AND ess.schoolyearid = esn.schoolyearid
      AND ess.schooltermid = esn.schooltermid
      AND ess.isdeleted = 0
   
    JOIN sams.edu_class ec
    ON   ec.classid = esn.classid
    AND ec.isactive = 1 AND ec.isdeleted = 0
  WHERE esn.schoolyearid = 21
  AND esn.schooltermid = 1
  AND esn.isdeleted = 0
  AND esn.isactive = 1
  AND esn.classid = 21
--     AND esn.classid in (16,17,18,19,20,21,22)
  GROUP BY esn.schoolid
  )TONGSOLOPKHOI8
 ON es.schoolid = TONGSOLOPKHOI8.schoolid
  
 LEFT JOIN (
  SELECT esn.schoolid,nvl(COUNT(DISTINCT esn.schoolclassid),0) slschoolclass 
  FROM saMS.edu_schoolclass_new esn
    
    JOIN sams.edu_class ec
    ON   ec.classid = esn.classid
    AND ec.isactive = 1 AND ec.isdeleted = 0
  WHERE esn.schoolyearid = 21
  AND esn.schooltermid = 1
  AND esn.isdeleted = 0
  AND esn.isactive = 1
  AND esn.classid = 21
--     AND esn.classid in (16,17,18,19,20,21,22)
  AND  EXISTS (SELECT * 
                    FROM sams.edu_pupil_studyhistory eps
                    WHERE eps.schoolclassid = esn.schoolclassid
                          AND eps.schoolid = esn.schoolid
                          AND eps.firsttermconductrankid  > 0
                          AND eps.schoolyearid = esn.schoolyearid
                          AND eps.isactive = 1 AND eps.isdeleted =0
--                          AND TO_CHAR(eps.createddate, 'YYYYMMDD') <= '20181224'
                    )
  GROUP BY esn.schoolid,esn.schoolid
  )TONGSOLOPDANHAPK8
 ON es.schoolid = TONGSOLOPDANHAPK8.schoolid
--- KHOI 9
  LEFT JOIN (
  SELECT esn.schoolid, nvl(COUNT(DISTINCT esn.schoolclassid),0) slschoolclass 
  FROM saMS.edu_schoolclass_new esn
    JOIN sams.edu_schoolclass_subject ess
      ON ess.schoolclassid = esn.schoolclassid
      AND ess.schoolyearid = esn.schoolyearid
      AND ess.schooltermid = esn.schooltermid
      AND ess.isdeleted = 0
   
    JOIN sams.edu_class ec
    ON   ec.classid = esn.classid
    AND ec.isactive = 1 AND ec.isdeleted = 0
  WHERE esn.schoolyearid = 21
  AND esn.schooltermid = 1
  AND esn.isdeleted = 0
  AND esn.isactive = 1
  AND esn.classid = 22
--     AND esn.classid in (16,17,18,19,20,21,22)
  GROUP BY esn.schoolid
  )TONGSOLOPKHOI9
 ON es.schoolid = TONGSOLOPKHOI9.schoolid
  
 LEFT JOIN (
  SELECT esn.schoolid,nvl(COUNT(DISTINCT esn.schoolclassid),0) slschoolclass 
  FROM saMS.edu_schoolclass_new esn
    
    JOIN sams.edu_class ec
    ON   ec.classid = esn.classid
    AND ec.isactive = 1 AND ec.isdeleted = 0
  WHERE esn.schoolyearid = 21
  AND esn.schooltermid = 1
  AND esn.isdeleted = 0
  AND esn.isactive = 1
  AND esn.classid = 22
--     AND esn.classid in (16,17,18,19,20,21,22)
  AND  EXISTS (SELECT * 
                    FROM sams.edu_pupil_studyhistory eps
                    WHERE eps.schoolclassid = esn.schoolclassid
                          AND eps.schoolid = esn.schoolid
                          AND eps.firsttermconductrankid >0
                          AND eps.schoolyearid = esn.schoolyearid
                          AND eps.isactive = 1 AND eps.isdeleted =0
--                          AND TO_CHAR(eps.createddate, 'YYYYMMDD') <= '20181224'
                    )
  GROUP BY esn.schoolid,esn.schoolid
  )TONGSOLOPDANHAPK9
 ON es.schoolid = TONGSOLOPDANHAPK9.schoolid
-- KHOI 10
  LEFT JOIN (
  SELECT esn.schoolid, nvl(COUNT(DISTINCT esn.schoolclassid),0) slschoolclass 
  FROM saMS.edu_schoolclass_new esn
    JOIN sams.edu_schoolclass_subject ess
      ON ess.schoolclassid = esn.schoolclassid
      AND ess.schoolyearid = esn.schoolyearid
      AND ess.schooltermid = esn.schooltermid
      AND ess.isdeleted = 0
   
    JOIN sams.edu_class ec
    ON   ec.classid = esn.classid
    AND ec.isactive = 1 AND ec.isdeleted = 0
  WHERE esn.schoolyearid = 21
  AND esn.schooltermid = 1
  AND esn.isdeleted = 0
  AND esn.isactive = 1
  AND esn.classid = 16
--     AND esn.classid in (16,17,18,19,20,21,22)
  GROUP BY esn.schoolid
  )TONGSOLOPKHOI10
 ON es.schoolid = TONGSOLOPKHOI10.schoolid
  
 LEFT JOIN (
  SELECT esn.schoolid,nvl(COUNT(DISTINCT esn.schoolclassid),0) slschoolclass 
  FROM saMS.edu_schoolclass_new esn
    
    JOIN sams.edu_class ec
    ON   ec.classid = esn.classid
    AND ec.isactive = 1 AND ec.isdeleted = 0
  WHERE esn.schoolyearid = 21
  AND esn.schooltermid = 1
  AND esn.isdeleted = 0
  AND esn.isactive = 1
  AND esn.classid = 16
--     AND esn.classid in (16,17,18,19,20,21,22)
  AND  EXISTS (SELECT * 
                    FROM sams.edu_pupil_studyhistory eps
                    WHERE eps.schoolclassid = esn.schoolclassid
                          AND eps.schoolid = esn.schoolid
                          AND eps.firsttermconductrankid  > 0
                          AND eps.schoolyearid = esn.schoolyearid
                          AND eps.isactive = 1 AND eps.isdeleted =0
--                          AND TO_CHAR(eps.createddate, 'YYYYMMDD') <= '20181224'
                    )
  GROUP BY esn.schoolid,esn.schoolid
  )TONGSOLOPDANHAPK10
 ON es.schoolid = TONGSOLOPDANHAPK10.schoolid
-- K11
  LEFT JOIN (
  SELECT esn.schoolid, nvl(COUNT(DISTINCT esn.schoolclassid),0) slschoolclass 
  FROM saMS.edu_schoolclass_new esn
    JOIN sams.edu_schoolclass_subject ess
      ON ess.schoolclassid = esn.schoolclassid
      AND ess.schoolyearid = esn.schoolyearid
      AND ess.schooltermid = esn.schooltermid
      AND ess.isdeleted = 0
   
    JOIN sams.edu_class ec
    ON   ec.classid = esn.classid
    AND ec.isactive = 1 AND ec.isdeleted = 0
  WHERE esn.schoolyearid = 21
  AND esn.schooltermid = 1
  AND esn.isdeleted = 0
  AND esn.isactive = 1
  AND esn.classid = 17
--     AND esn.classid in (16,17,18,19,20,21,22)
  GROUP BY esn.schoolid
  )TONGSOLOPKHOI11
 ON es.schoolid = TONGSOLOPKHOI11.schoolid
  
 LEFT JOIN (
  SELECT esn.schoolid,nvl(COUNT(DISTINCT esn.schoolclassid),0) slschoolclass 
  FROM saMS.edu_schoolclass_new esn
    
    JOIN sams.edu_class ec
    ON   ec.classid = esn.classid
    AND ec.isactive = 1 AND ec.isdeleted = 0
  WHERE esn.schoolyearid = 21
  AND esn.schooltermid = 1
  AND esn.isdeleted = 0
  AND esn.isactive = 1
  AND esn.classid = 17
--     AND esn.classid in (16,17,18,19,20,21,22)
  AND  EXISTS (SELECT * 
                    FROM sams.edu_pupil_studyhistory eps
                    WHERE eps.schoolclassid = esn.schoolclassid
                          AND eps.schoolid = esn.schoolid
                          AND eps.firsttermconductrankid >0
                          AND eps.schoolyearid = esn.schoolyearid
                          AND eps.isactive = 1 AND eps.isdeleted =0
--                          AND TO_CHAR(eps.createddate, 'YYYYMMDD') <= '20181224'
                    )
  GROUP BY esn.schoolid,esn.schoolid
  )TONGSOLOPDANHAPK11
 ON es.schoolid = TONGSOLOPDANHAPK11.schoolid
--K12
  LEFT JOIN (
  SELECT esn.schoolid, nvl(COUNT(DISTINCT esn.schoolclassid),0) slschoolclass 
  FROM saMS.edu_schoolclass_new esn
    JOIN sams.edu_schoolclass_subject ess
      ON ess.schoolclassid = esn.schoolclassid
      AND ess.schoolyearid = esn.schoolyearid
      AND ess.schooltermid = esn.schooltermid
      AND ess.isdeleted = 0
   
    JOIN sams.edu_class ec
    ON   ec.classid = esn.classid
    AND ec.isactive = 1 AND ec.isdeleted = 0
  WHERE esn.schoolyearid = 21
  AND esn.schooltermid = 1
  AND esn.isdeleted = 0
  AND esn.isactive = 1
  AND esn.classid = 18
--     AND esn.classid in (16,17,18,19,20,21,22)
  GROUP BY esn.schoolid
  )TONGSOLOPKHOI12
 ON es.schoolid = TONGSOLOPKHOI12.schoolid
  
 LEFT JOIN (
  SELECT esn.schoolid,nvl(COUNT(DISTINCT esn.schoolclassid),0) slschoolclass 
  FROM saMS.edu_schoolclass_new esn
    
    JOIN sams.edu_class ec
    ON   ec.classid = esn.classid
    AND ec.isactive = 1 AND ec.isdeleted = 0
  WHERE esn.schoolyearid = 21
  AND esn.schooltermid = 1
  AND esn.isdeleted = 0
  AND esn.isactive = 1
  AND esn.classid = 18
--     AND esn.classid in (16,17,18,19,20,21,22)
  AND  EXISTS (SELECT * 
                    FROM sams.edu_pupil_studyhistory eps
                    WHERE eps.schoolclassid = esn.schoolclassid
                          AND eps.schoolid = esn.schoolid
                          AND eps.firsttermconductrankid >0
                          AND eps.schoolyearid = esn.schoolyearid
                          AND eps.isactive = 1 AND eps.isdeleted =0
--                          AND TO_CHAR(eps.createddate, 'YYYYMMDD') <= '20181224'
                    )
  GROUP BY esn.schoolid,esn.schoolid
  )TONGSOLOPDANHAPK12
 ON es.schoolid = TONGSOLOPDANHAPK12.schoolid


WHERE es.isactive = 1 AND es.isdeleted = 0

    and ES.schoolid NOT IN (1592,1593,1594,1595,1596,1597,1598,1599,1600,1605,1607,1610,1618,1613,1614,1616,1608,1611,1615,1602,1603,1604
                            ,1609,1617,1601,1606,1612,1524,1530,10112318,1525,1515,1470,1528,1469,1799,1810,1786,1789,1818,1797,1819,1798,1689,1823,1809,1814,1787,1811,1820,1808,1821)
--  AND ES.educationtypeid = 1
  AND ese.educationlevelid = 7
--  AND es.schoolid = '10060005'
ORDER BY MD.districtname,es.schoolname