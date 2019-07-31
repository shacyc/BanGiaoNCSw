SELECT  mo1.organid, mo1.organname,es.schoolid ,es.schoolname, es1.educationtypename
 ,bang2.schoolclassid,bang2.schoolclassname ,bang2.subjectid,bang2.subjectname
--  ,bang2.fullname
FROM sams.edu_school es
JOIN sams.md_organ mo
  ON es.organid = mo.organid
   LEFT 
JOIN sams.edu_educationtype  es1
  ON es.educationtypeid = es1.educationtypeid
 AND es1.isactive = 1 
 AND es1.isdeleted = 0
--LEFT
JOIN sams.md_organ mo1
  ON MO1.organid = mo.parentid
 LEFT JOIN SAMS.EDU_SCHOOL_EDUCATIONLEVEL ESE
    ON   ESE.SCHOOLID = ES.SCHOOLID
 JOIN (
  SELECT esn.schoolid, edu_subject.subjectid,edu_subject.subjectname,esn.schoolclassid,esn.schoolclassname
--    ,su.fullname
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
--     JOIN sams.edu_schoolclass_teacher est
--       ON epm.subjectid = est.subjectid
--        AND est.schoolyearid = esn.schoolyearid
--        AND est.schooltermid = esn.schooltermid
--        AND est.isdeleted = 0
--     JOIN sams.sys_user su
--      ON su.username = est.teacher
--      AND su.isactive = 1 AND su.isdeleted = 0
  WHERE esn.schoolyearid = 21
  AND esn.schooltermid = 1
  AND esn.isdeleted = 0
  AND esn.isactive = 1
  AND ec.educationlevelid = 4
--  AND esn.classid in (16,17,18,19,20,21,22)
--  AND esn.classid in (9,10,11,12)
  AND NOT EXISTS (SELECT esn.schoolclassid,esn.schoolid
                    FROM sams.edu_pupil_mark

                    WHERE edu_pupil_mark.schoolclassid = esn.schoolclassid
                          AND edu_pupil_mark.schoolid = esn.schoolid
                          AND edu_pupil_mark.subjectid = edu_subject.subjectid
                          AND edu_pupil_mark.firsttermmark IS NOT NULL
                          AND edu_pupil_mark.schoolyearid = esn.schoolyearid
--                     AND TO_CHAR(edu_pupil_mark.createddate, 'YYYYMMDD') <= '20181224'
                          AND edu_pupil_mark.isactive = 1 AND edu_pupil_mark.isdeleted =0
                    )
    AND NOT EXISTS (SELECT * 
                    FROM sams.edu_pupil_studyhistory eps
                    WHERE eps.schoolclassid = esn.schoolclassid
                          AND eps.schoolid = esn.schoolid
                          AND eps.firsttermaveragemark IS NOT NULL
                          AND eps.schoolyearid = esn.schoolyearid
                          AND eps.isactive = 1 AND eps.isdeleted =0
--                          AND TO_CHAR(eps.createddate, 'YYYYMMDD') <= '20181224'
                    )
  GROUP BY esn.schoolid, edu_subject.subjectname,esn.schoolclassid,esn.schoolclassname,edu_subject.subjectid
--    ,su.fullname
  )Bang2
 ON es.schoolid = Bang2.schoolid
WHERE es.isactive = 1 AND es.isdeleted = 0
  and ES.schoolid NOT IN (1592,1593,1594,1595,1596,1597,1598,1599,1600,1605,1607,1610,1618,1613,1614,1616,1608,1611,1615,1602,1603,1604
                            ,1609,1617,1601,1606,1612,1524,1530,10112318,1525,1515,1470,1528,1469,1799,1810,1786,1789,1818,1797,1819,1798,1689,1823,1809,1814,1787,1811,1820,1808,1821)
  AND ese.educationlevelid = 4

ORDER BY mo1.organname,es.schoolname,bang2.schoolclassname