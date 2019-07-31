SELECT 

  SAMS.mp_eduschool.moetschoolid MA_TRUONG_BO,
  --sams.edu_school.schoolid MA_ESAMS,
  SAMS.mp_educlass.moetclassid MA_KHOI_BO,
   SAMS.EDU_SCHOOLCLASS_NEW.schoolclassid MA_LOP,
    schoolclassname TEN_LOP, 
  ' ' THU_TU,
  sams.edu_schoolclass_headteacher.headteacher GVCN,
  SAMS.EDU_EDUCATIONLEVEL.EDUCATIONLEVELNAME
--  ,
--   
--  edu_school.schoolid


  FROM SAMS.EDU_SCHOOLCLASS_NEW
  LEFT JOIN SAMS.MP_EDUCLASS
    ON SAMS.MP_EDUCLASS.CLASSID = SAMS.EDU_SCHOOLCLASS_NEW.CLASSID
  LEFT JOIN SAMS.mp_eduschool
    ON SAMS.mp_eduschool.schoolid = SAMS.EDU_SCHOOLCLASS_NEW.schoolid
  LEFT JOIN SAMS.EDU_CLASS
    ON SAMS.EDU_CLASS.CLASSID = SAMS.EDU_SCHOOLCLASS_NEW.CLASSID
  LEFT JOIN sams.edu_school
    ON sams.edu_school.schoolid = SAMS.edu_schoolclass_new.schoolid
  LEFT JOIN SAMS.EDU_EDUCATIONLEVEL
    ON SAMS.EDU_EDUCATIONLEVEL.EDUCATIONLEVELID = SAMS.EDU_CLASS.educationlevelid
  LEFT JOIN sams.edu_schoolclass_headteacher
    ON sams.edu_schoolclass_headteacher.schoolclassid = SAMS.EDU_SCHOOLCLASS_NEW.schoolclassid
  AND sams.edu_schoolclass_headteacher.schoolyearid = SAMS.EDU_SCHOOLCLASS_NEW.schoolyearid
  AND sams.edu_schoolclass_headteacher.schooltermid = SAMS.EDU_SCHOOLCLASS_NEW.schooltermid
  WHERE SAMS.EDU_SCHOOLCLASS_NEW.ISACTIVE = 1
  AND SAMS.EDU_SCHOOLCLASS_NEW.ISDELETED = 0
  AND SAMS.EDU_SCHOOLCLASS_NEW.SCHOOLYEARID = 2
  AND SAMS.EDU_SCHOOLCLASS_NEW.SCHOOLTERMID = 2
  AND sams.edu_school.isactive = 1
  AND sams.edu_school.isdeleted =0 
  AND sams.edu_class.isactive = 1
  AND sams.edu_class.isdeleted = 0
  AND sams.edu_educationlevel.isactive = 1
 AND sams.edu_educationlevel.isdeleted = 0
  AND sams.edu_schoolclass_headteacher.isdeleted = 0
-- AND sams.edu_educationlevel.educationlevelid > 1
  AND EDU_SCHOOL.schoolid NOT IN (1524,1530,10112318,1541,1525,1515,1470,1469,1528)
  AND upper(sams.edu_school.schoolname) NOT LIKE '%T? DO%'
  --AND MOETSCHOOLID IS NULL
 -- and  EDU_SCHOOL.schoolid = 1624
ORDER BY 
  
 --SAMS.EDU_EDUCATIONLEVEL.orderindex,
  sams.edu_school.schoolid,
  SAMS.mp_eduschool.moetschoolid,
  SAMS.mp_educlass.moetclassid,
  SAMS.EDU_SCHOOLCLASS_NEW.orderindex