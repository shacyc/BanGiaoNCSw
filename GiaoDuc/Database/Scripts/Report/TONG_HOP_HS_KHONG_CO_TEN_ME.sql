SELECT ORGANNAME
      ,TIEU_HOC
      ,THCS
      ,THPT
      ,GDTX
      ,(TIEU_HOC + THCS + THPT + GDTX) TONG_CONG
       FROM
  (
SELECT 
 
  parentorgan.organname
  ,parentorgan.organid
  ,SUM( CASE WHEN edu_class.educationlevelid = 2 THEN 1 ELSE 0 END) TIEU_HOC
  ,SUM( CASE WHEN (edu_class.educationlevelid = 3 OR edu_class.classid IN (19,20,21,22)) THEN 1 ELSE 0 END) THCS
  ,SUM( CASE WHEN (edu_class.educationlevelid = 4 OR edu_class.classid IN (16,17,18)) THEN 1 ELSE 0 END) THPT
  ,SUM( CASE WHEN edu_class.educationlevelid = 7 THEN 1 ELSE 0 END) GDTX
,parentorgan.orderindex
 FROM SAMS.EDU_PUPIL_STUDYTIMELINE
  
LEFT JOIN SAMS.EDU_PUPIL
  ON SAMS.EDU_PUPIL.PUPILID = SAMS.EDU_PUPIL_STUDYTIMELINE.PUPILID
LEFT JOIN SAMS.EDU_SCHOOL
  ON SAMS.EDU_SCHOOL.SCHOOLID = SAMS.EDU_PUPIL_STUDYTIMELINE.SCHOOLID
LEFT JOIN SAMS.EDU_SCHOOLCLASS_NEW
  ON SAMS.EDU_SCHOOLCLASS_NEW.SCHOOLCLASSID = SAMS.EDU_PUPIL_STUDYTIMELINE.SCHOOLCLASSID
LEFT JOIN SAMS.EDU_CLASS
  ON SAMS.EDU_CLASS.CLASSID = SAMS.EDU_SCHOOLCLASS_NEW.CLASSID
LEFT JOIN SAMS.edu_educationlevel
  ON SAMS.edu_educationlevel.educationlevelid = sams.edu_class.educationlevelid
LEFT JOIN SAMS.md_organ
  ON SAMS.md_organ.organid = SAMS.EDU_SCHOOL.organid
 LEFT JOIN sams.md_organ PARENTORGAN
  ON parentorgan.organid = md_organ.parentid
WHERE 
SAMS.EDU_PUPIL.ISACTIVE = 1
  AND SAMS.EDU_PUPIL.ISDELETED = 0
   AND SAMS.EDU_SCHOOLCLASS_NEW.SCHOOLYEARID = 2
  AND SAMS.EDU_SCHOOLCLASS_NEW.SCHOOLTERMID = 2
  AND SAMS.EDU_SCHOOLCLASS_NEW.isactive = 1
  AND SAMS.EDU_SCHOOLCLASS_NEW.isdeleted = 0

  AND SAMS.EDU_CLASS.isactive = 1
  AND SAMS.EDU_CLASS.isdeleted = 0
  AND SAMS.EDU_PUPIL_STUDYTIMELINE.SCHOOLYEARID = 2
  AND SAMS.EDU_PUPIL_STUDYTIMELINE.SCHOOLTERMID = 2
  AND SAMS.EDU_PUPIL_STUDYTIMELINE.ISACTIVE = 1
  AND SAMS.EDU_PUPIL_STUDYTIMELINE.ISDELETED = 0
  AND (
  SAMS.edu_pupil.motherfullname IS NULL
  )

    AND EDU_SCHOOL.schoolid NOT IN (1524,1530,10112318,1541,1525,1515,1470,1469,1528)
  AND upper(sams.edu_school.schoolname) NOT LIKE '%T? DO%'
   AND edu_pupil.currentpupilstatusid = 1 -- dang hoc
  AND edu_pupil_studytimeline.currentpupilstatusid = 1
  AND EDU_CLASS.educationlevelid > 1 -- TIEU HOO

GROUP BY SAMS.parentorgan.organid,parentorgan.organname,parentorgan.orderindex
  ORDER BY parentorgan.orderindex
);
SELECT ORGANNAME
      ,THPT
       FROM
  (
SELECT 
 
  md_organ.organname
  ,SUM( CASE WHEN (edu_class.educationlevelid = 4 OR edu_class.classid IN (16,17,18)) THEN 1 ELSE 0 END) THPT
,md_organ.orderindex
 FROM SAMS.EDU_PUPIL_STUDYTIMELINE
  
LEFT JOIN SAMS.EDU_PUPIL
  ON SAMS.EDU_PUPIL.PUPILID = SAMS.EDU_PUPIL_STUDYTIMELINE.PUPILID
LEFT JOIN SAMS.EDU_SCHOOL
  ON SAMS.EDU_SCHOOL.SCHOOLID = SAMS.EDU_PUPIL_STUDYTIMELINE.SCHOOLID
LEFT JOIN SAMS.EDU_SCHOOLCLASS_NEW
  ON SAMS.EDU_SCHOOLCLASS_NEW.SCHOOLCLASSID = SAMS.EDU_PUPIL_STUDYTIMELINE.SCHOOLCLASSID
LEFT JOIN SAMS.EDU_CLASS
  ON SAMS.EDU_CLASS.CLASSID = SAMS.EDU_SCHOOLCLASS_NEW.CLASSID
LEFT JOIN SAMS.edu_educationlevel
  ON SAMS.edu_educationlevel.educationlevelid = sams.edu_class.educationlevelid
LEFT JOIN SAMS.md_organ
  ON SAMS.md_organ.organid = SAMS.EDU_SCHOOL.organid
 LEFT JOIN sams.md_organ PARENTORGAN
  ON parentorgan.organid = md_organ.parentid
WHERE 
SAMS.EDU_PUPIL.ISACTIVE = 1
  AND SAMS.EDU_PUPIL.ISDELETED = 0
   AND SAMS.EDU_SCHOOLCLASS_NEW.SCHOOLYEARID = 2
  AND SAMS.EDU_SCHOOLCLASS_NEW.SCHOOLTERMID = 2
  AND SAMS.EDU_SCHOOLCLASS_NEW.isactive = 1
  AND SAMS.EDU_SCHOOLCLASS_NEW.isdeleted = 0

  AND SAMS.EDU_CLASS.isactive = 1
  AND SAMS.EDU_CLASS.isdeleted = 0
  AND SAMS.EDU_PUPIL_STUDYTIMELINE.SCHOOLYEARID = 2
  AND SAMS.EDU_PUPIL_STUDYTIMELINE.SCHOOLTERMID = 2
  AND SAMS.EDU_PUPIL_STUDYTIMELINE.ISACTIVE = 1
  AND SAMS.EDU_PUPIL_STUDYTIMELINE.ISDELETED = 0
  AND (
  SAMS.edu_pupil.motherfullname IS NULL
  )

    AND EDU_SCHOOL.schoolid NOT IN (1524,1530,10112318,1541,1525,1515,1470,1469,1528)
  AND upper(sams.edu_school.schoolname) NOT LIKE '%T? DO%'
  AND edu_pupil.currentpupilstatusid = 1 -- dang hoc
  AND edu_pupil_studytimeline.currentpupilstatusid = 1
  AND EDU_CLASS.educationlevelid = 4 -- thpt

GROUP BY md_organ.organname,md_organ.orderindex
  ORDER BY md_organ.orderindex
)


;