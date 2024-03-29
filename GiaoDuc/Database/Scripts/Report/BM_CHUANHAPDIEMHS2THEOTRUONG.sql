SELECT mo1.organid, mo1.organname,es.schoolid ,es.schoolname, es1.educationtypename
  ,couNTschoolclass.subjectname,couNTschoolclass.slschoolclass
  ,bang2.slschoolclass
FROM sams.edu_school es
  LEFT JOIN SAMS.EDU_SCHOOL_EDUCATIONLEVEL ESE
    ON   ESE.SCHOOLID = ES.SCHOOLID
JOIN sams.md_organ mo
  ON es.organid = mo.organid
--LEFT
JOIN sams.md_organ mo1
  ON MO1.organid = mo.parentid
  LEFT 
JOIN sams.edu_educationtype  es1
  ON es.educationtypeid = es1.educationtypeid
 AND es1.isactive = 1 
 AND es1.isdeleted = 0
--LEFT 
JOIN (
  SELECT esn.schoolid, edu_subject.subjectname, COUNT(DISTINCT esn.schoolclassid) slschoolclass 
  FROM saMS.edu_schoolclass_new esn
    JOIN sams.edu_schoolclass_subject ess
      ON ess.schoolclassid = esn.schoolclassid
      AND ess.schoolyearid = esn.schoolyearid
      AND ess.schooltermid = esn.schooltermid
      AND ess.isdeleted = 0
    JOIN sams.edu_subject 
      ON edu_subject.subjectid = ess.subjectid
       AND edu_subject.isactive = 1 AND edu_subject.isdeleted = 0 
  WHERE esn.schoolyearid = 21
  AND esn.schooltermid = 1
  AND esn.isdeleted = 0
  AND esn.isactive = 1
     AND esn.classid in (16,17,18,19,20,21,22)
  GROUP BY esn.schoolid, edu_subject.subjectname
  )couNTschoolclass
 ON es.schoolid = couNTschoolclass.schoolid
  
 JOIN (
  SELECT esn.schoolid, edu_subject.subjectname,COUNT(DISTINCT esn.schoolclassid)slschoolclass 
  FROM saMS.edu_schoolclass_new esn
    JOIN sams.edu_schoolclass_subject  epm
      ON epm.schoolclassid = esn.schoolclassid
      AND epm.schoolyearid = esn.schoolyearid
      AND epm.schooltermid = esn.schooltermid
       AND epm.isdeleted = 0     
    JOIN sams.edu_subject 
      ON edu_subject.subjectid = epm.subjectid
       AND edu_subject.isactive = 1 AND edu_subject.isdeleted = 0
  WHERE esn.schoolyearid = 21
  AND esn.schooltermid = 1
  AND esn.isdeleted = 0
  AND esn.isactive = 1
     AND esn.classid in (16,17,18,19,20,21,22)
  AND NOT EXISTS (SELECT * 
                    FROM sams.edu_pupil_markbook
                    WHERE edu_pupil_markbook.schoolclassid = esn.schoolclassid
                          AND edu_pupil_markbook.schoolid = esn.schoolid
                          AND edu_pupil_markbook.markgroupid = 2
                          AND edu_pupil_markbook.schoolyearid = esn.schoolyearid
                          AND edu_pupil_markbook.schooltermid = esn.schooltermid
                          AND edu_pupil_markbook.isactive = 1 AND edu_pupil_markbook.isdeleted =0
                    )
  GROUP BY esn.schoolid,esn.schoolid, edu_subject.subjectname
  )Bang2
 ON es.schoolid = Bang2.schoolid
  AND countschoolclass.subjectname = Bang2.subjectname
WHERE es.isactive = 1 AND es.isdeleted = 0

  and ES.schoolid NOT IN (1592,1593,1594,1595,1596,1597,1598,1599,1600,1605,1607,1610,1618,1613,1614,1616,1608,1611,1615,1602,1603,1604,1609,1617,1601,1606,1612,1524,1530,10112318,1525,1515,1470,1528,1469)
--  AND ES.educationtypeid = 1
  AND ese.educationlevelid IN (7)
ORDER BY mo1.organname,es.schoolname