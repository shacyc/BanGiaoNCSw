SELECT bang1.organid, bang1.ORGANNAME,bang1.totalschool
--  ,nvl( bang2.subjectname,'') subjectname
  ,nvl(bang2.slschoolclass,0) slschoolclass
  FROM 
  (
    SELECT ORGANID, ORGANNAME,count(1) TOTALSCHOOL
    FROM(
          SELECT MO1.ORGANID, MO1.ORGANNAME, ES.SCHOOLID, ES.SCHOOLNAME, 1
    FROM 
    SAMS.EDU_SCHOOL ES
    LEFT JOIN SAMS.EDU_SCHOOL_EDUCATIONLEVEL ESE
    ON   ESE.SCHOOLID = ES.SCHOOLID

    LEFT JOIN SAMS.MD_ORGAN MO
    ON     ES.ORGANID = MO.ORGANID
    LEFT JOIN SAMS.MD_ORGAN MO1 
    ON MO.PARENTID = MO1.ORGANID
    WHERE ES.ISDELETED = 0 AND ES.ISACTIVE = 1
             AND ese.educationlevelid = 3
    AND ES.schoolid NOT IN (1592,1593,1594,1595,1596,1597,1598,1599,1600,1605,1607,1610,1618,1613,1614,1616,1608,1611,1615,1602,1603,1604,1609,1617,1601,1606,1612,1524
                             ,1530,10112318,1541,1525,1515,1470,1528,1469,1799,1810,1786,1789,1818,1797,1819,1798,1689,1823,1809,1814,1787,1811,1820,1808,1821)
    GROUP BY MO1.ORGANID, MO1.ORGANNAME, ES.SCHOOLID, ES.SCHOOLNAME)
     
    GROUP BY  ORGANID, ORGANNAME
  ) BANG1
  LEFT JOIN (
  SELECT MO1.ORGANID,COUNT(DISTINCT esn.schoolid)slschoolclass 
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
    JOIN SAMS.EDU_SCHOOL ES
      ON ES.schoolid = esn.schoolid
      AND es.isactive = 1 AND es.isdeleted = 0
     JOIN SAMS.EDU_SCHOOL_EDUCATIONLEVEL ESE
    ON   ESE.SCHOOLID = ES.SCHOOLID
    LEFT JOIN SAMS.MD_ORGAN MO
    ON     ES.ORGANID = MO.ORGANID
    LEFT JOIN SAMS.MD_ORGAN MO1 
    ON MO.PARENTID = MO1.ORGANID
    JOIN sams.edu_class ec
    ON   ec.classid = esn.classid
    AND ec.isactive = 1 AND ec.isdeleted = 0

  WHERE esn.schoolyearid = 21
  AND esn.schooltermid = 1
  AND esn.isdeleted = 0
  AND esn.isactive = 1
  AND ec.educationlevelid = 3
--  AND esn.classid in (16,17,18,19,20,21,22) -- Cap GDTX
  AND NOT EXISTS (SELECT * 
                    FROM sams.edu_pupil_studyhistory eps
                    WHERE eps.schoolclassid = esn.schoolclassid
                          AND eps.schoolid = esn.schoolid
                          AND eps.firsttermaveragemark IS NOT NULL
                          AND eps.schoolyearid = esn.schoolyearid
                          AND eps.isactive = 1 AND eps.isdeleted =0
--                          AND TO_CHAR(eps.createddate, 'YYYYMMDD') <= '20181224'
                    )
   and ES.schoolid NOT IN (1592,1593,1594,1595,1596,1597,1598,1599,1600,1605,1607,1610,1618,1613,1614,1616,1608,1611,1615,1602,1603,1604
                            ,1609,1617,1601,1606,1612,1524,1530,10112318,1525,1515,1470,1528,1469,1799,1810,1786,1789,1818,1797,1819,1798,1689,1823,1809,1814,1787,1811,1820,1808,1821)
--  AND ES.educationtypeid = 1
 
  GROUP BY MO1.ORGANID
--    , edu_subject.subjectname
  )Bang2
 ON bang1.ORGANID = Bang2.ORGANID
  ORDER BY bang1.organname
;