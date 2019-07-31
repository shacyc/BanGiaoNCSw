
SELECT 

--  SAMS.MD_DISTRICT.districtname,
--  schoolname,
--  classname,
--  count(edu_pupil.pupilid),
--  edu_school.orderindex
  edu_pupil.pupilid MA_HS
  ,edu_pupil.FULLNAME HO_TEN
  ,edu_pupil.birthday NGAY_SINH
  ,DECODE(edu_pupil.gender,0,'NAM','NU') GIOI_TINH
  ,districtname QUAN
  ,schoolname TRUONG
  ,schoolclassname LOP
  ,classname KHOI
  ,SAMS.edu_educationlevel.educationlevelname CAP_HOC
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
LEFT JOIN SAMS.MD_DISTRICT
  ON SAMS.MD_DISTRICT.DISTRICTID = SAMS.EDU_SCHOOL.districtid
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

  ORDER BY SAMS.edu_educationlevel.educationlevelname,md_district.orderindex,edu_school.orderindex,edu_class.orderindex,edu_schoolclass_new.orderindex

--  GROUP BY districtname,edu_school.schoolname,classname,edu_school.orderindex;

