SELECT bang1.organid, bang1.ORGANNAME,bang1.totalschool
  ,nvl( bang2.subjectname,'') subjectname
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
             AND ese.educationlevelid IN (7)
    AND ES.schoolid NOT IN (1592,1593,1594,1595,1596,1597,1598,1599,1600,1605,1607,1610,1618,1613,1614,1616,1608,1611,1615,1602,1603,1604,1609,1617,1601,1606,1612,1524,1530,10112318,1541,1525,1515,1470,1528,1469)
    GROUP BY MO1.ORGANID, MO1.ORGANNAME, ES.SCHOOLID, ES.SCHOOLNAME)
     
    GROUP BY  ORGANID, ORGANNAME
  ) BANG1
  LEFT JOIN (
  SELECT MO1.ORGANID, edu_subject.subjectname,COUNT(DISTINCT esn.schoolid)slschoolclass 
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
  WHERE esn.schoolyearid = 21
  AND esn.schooltermid = 1
  AND esn.isdeleted = 0
  AND esn.isactive = 1
  AND esn.classid in (16,17,18,19,20,21,22)
  AND NOT EXISTS (SELECT * 
                    FROM sams.edu_pupil_markbook
                    WHERE edu_pupil_markbook.schoolclassid = esn.schoolclassid
                          AND edu_pupil_markbook.schoolid = es.schoolid
                          AND edu_pupil_markbook.markgroupid = 2
                          AND edu_pupil_markbook.schoolyearid = esn.schoolyearid
                          AND edu_pupil_markbook.schooltermid = esn.schooltermid
                          AND edu_pupil_markbook.isactive = 1 AND edu_pupil_markbook.isdeleted =0
                    )
   and ES.schoolid NOT IN (1592,1593,1594,1595,1596,1597,1598,1599,1600,1605,1607,1610,1618,1613,1614,1616,1608,1611,1615,1602,1603,1604,1609,1617,1601,1606,1612,1524,1530,10112318,1525,1515,1470,1528,1469)
--  AND ES.educationtypeid = 1
 
  GROUP BY MO1.ORGANID, edu_subject.subjectname
  )Bang2
 ON bang1.ORGANID = Bang2.ORGANID
  ORDER BY bang1.organname
;