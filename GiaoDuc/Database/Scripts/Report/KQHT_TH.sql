SELECT * FROM
(
  (
  SELECT 
  
  SAMS.MP_EDUSCHOOL.MOETSCHOOLID ma_truong
  ,SAMS.EDU_SCHOOLCLASS_NEW.SCHOOLCLASSNAME MA_LOP
  ,SAMS.edu_pupil.PUPILID MA_HS
  ,FULLNAME TEN_HS
  ,TO_CHAR(BIRTHDAY,'DD/MM/YYYY') NGAY_SINH
  --,DECODE(gender,0,'Nam','N?') GIOI_TINH
    ,SAMS.edu_subject.subjectid
    ,SAMS.edu_pupil_subjectassess.examtermmark
    ,sams.edu_pupilassesslevel.pupilassesslevelname
  
--     ,sams.edu_pupil_studyhistory.wholeyearaveragemark DTB
--    ,sams.edu_studyrank.studyrankname HOC_LUC
--    ,sams.edu_conductrank.conductrankname HANH_KIEM
--    ,(CASE 
--    WHEN (edu_studyrank.studyrankid = 1 AND sams.edu_conductrank.conductrankid IN (1,5)) THEN 'Gi?i'
--    WHEN (edu_studyrank.studyrankid IN (1,2) AND sams.edu_conductrank.conductrankid IN (1,2,5)) THEN 'Tiên ti?n'
--    else '' END)
--    DANH_HIEU
----    ,SAMS.GETTOTALATTENDANCE(SAMS.EDU_PUPIL.PUPILID,2,-1,2) + SAMS.GETTOTALATTENDANCE(SAMS.EDU_PUPIL.PUPILID,3,-1,2) TS_NGAY_NGHI_CA_NAM
    ,CASE WHEN sams.edu_passclassrequest.ispassclass = 1 AND sams.edu_passclasstype.ISPASSCLASS = 1 AND edu_class.classid = 8 THEN 'x' ELSE ' ' END HOAN_THANH_CT_TIEU_HOC
    ,CASE WHEN sams.edu_passclassrequest.ispassclass = 1 AND sams.edu_passclasstype.ISPASSCLASS = 1 THEN 'x' ELSE ' 'END DUOC_LEN_LOP
--    ,CASE WHEN (sams.edu_pupil_studyhistory.RECHECKSTUDYRANKID > 0
--    OR sams.edu_pupil_studyhistory.RETRAINCONDUCTRANKID > 0) 
--    theN 1 ELSE 0 END REN_LUYEN_LAI

 FROM SAMS.EDU_PUPIL_STUDYTIMELINE
  
JOIN SAMS.EDU_PUPIL
  ON SAMS.EDU_PUPIL.PUPILID = SAMS.EDU_PUPIL_STUDYTIMELINE.PUPILID
JOIN SAMS.EDU_SCHOOL
  ON SAMS.EDU_SCHOOL.SCHOOLID = SAMS.EDU_PUPIL_STUDYTIMELINE.SCHOOLID
JOIN SAMS.EDU_SCHOOLCLASS_NEW
  ON SAMS.EDU_SCHOOLCLASS_NEW.SCHOOLCLASSID = SAMS.EDU_PUPIL_STUDYTIMELINE.SCHOOLCLASSID
JOIN SAMS.EDU_CLASS
  ON SAMS.EDU_CLASS.CLASSID = SAMS.EDU_SCHOOLCLASS_NEW.CLASSID
  LEFT JOIN SAMS.MP_EDUSCHOOL
    ON SAMS.MP_EDUSCHOOL.SCHOOLID = EDU_PUPIL_STUDYTIMELINE.SCHOOLID
    AND SAMS.MP_EDUSCHOOL.EDUCATIONLEVELID = SAMS.EDU_CLASS.EDUCATIONLEVELID
 left  JOIN SAMS.edu_pupil_subjectassess
    ON SAMS.edu_pupil.pupilid = SAMS.edu_pupil_subjectassess.pupilid 
    AND sams.edu_pupil_subjectassess.schoolyearid = 2
    AND SAMS.edu_pupil_subjectassess.pupilassesstermid = 4
    JOIN SAMS.edu_subject
    ON sams.edu_subject.subjectid = SAMS.edu_pupil_subjectassess.subjectid
LEFT JOIN sams.edu_pupilassesslevel
  ON sams.edu_pupilassesslevel.pupilassesslevelid = SAMS.edu_pupil_subjectassess.studyaccesslevelid
--LEFT JOIN sams.edu_pupil_studyhistory
--    ON sams.edu_pupil_studyhistory.pupilid = SAMS.edu_pupil.pupilid
--    AND sams.edu_pupil_studyhistory.schoolclassid = SAMS.EDU_SCHOOLCLASS_NEW.schoolclassid
--    AND sams.edu_pupil_studyhistory.schoolyearid = 2
--    LEFT JOIN sams.edu_conductrank
--    ON sams.edu_pupil_studyhistory.wholeyearconductrankid = sams.edu_conductrank.conductrankid
--LEFT JOIN sams.edu_studyrank
--    ON sams.edu_pupil_studyhistory.wholeyearstudyrankid = sams.edu_studyrank.studyrankid
LEFT JOIN sams.edu_passclassrequest_pupil
    ON sams.edu_passclassrequest_pupil.pupilid = SAMS.EDU_PUPIL.pupilid
LEFT JOIN sams.edu_passclassrequest
    ON sams.edu_passclassrequest.passclassrequestid = sams.edu_passclassrequest_pupil.passclassrequestid
    AND sams.edu_passclassrequest.schoolyearid = 2
LEFT JOIN sams.edu_passclasstype
    ON sams.edu_passclasstype.passclasstypeid = sams.edu_passclassrequest_pupil.passclasstypeid

--LEFT JOIN SAMS.edu_pupil_attendance
--    ON SAMS.edu_pupil_attendance.pupilid = SAMS.EDU_PUPIL.pupilid
--    AND SAMS.edu_pupil_attendance.schoolyearid = 2
--    LEFT JOIN sams.edu_passclassrequest_pupil
--    ON sams.edu_passclassrequest_pupil.pupilid = SAMS.EDU_PUPIL.pupilid
--    LEFT JOIN sams.edu_passclassrequest
--    ON sams.edu_passclassrequest.passclassrequestid = sams.edu_passclassrequest_pupil.passclassrequestid
--    AND 

WHERE 
 SAMS.EDU_PUPIL.ISACTIVE = 1
  AND SAMS.EDU_PUPIL.ISDELETED = 0
  AND SAMS.EDU_SCHOOLCLASS_NEW.SCHOOLYEARID = 2
  AND SAMS.EDU_SCHOOLCLASS_NEW.SCHOOLTERMID = 2
  AND SAMS.EDU_SCHOOLCLASS_NEW.ISACTIVE = 1
  AND SAMS.EDU_SCHOOLCLASS_NEW.ISDELETED = 0
  AND SAMS.EDU_CLASS.EDUCATIONLEVELID = 2
  AND SAMS.EDU_CLASS.ISACTIVE = 1
  AND SAMS.EDU_CLASS.ISDELETED = 0
  AND SAMS.EDU_PUPIL_STUDYTIMELINE.SCHOOLYEARID = 2
  AND SAMS.EDU_PUPIL_STUDYTIMELINE.SCHOOLTERMID = 2
  AND SAMS.EDU_PUPIL_STUDYTIMELINE.ISACTIVE = 1
  AND SAMS.EDU_PUPIL_STUDYTIMELINE.ISDELETED = 0
  AND SAMS.EDU_PUPIL_STUDYTIMELINE.CURRENTPUPILSTATUSID = 1
  --AND SAMS.EDU_PUPIL.PUPILID = '012733211           '
  and sams.edu_passclassrequest.ISDELETED = 0
  AND UPPER(edu_school.schoolname) NOT LIKE '%T? DO%'
  AND edu_school.schoolid NOT IN (1524,1530,10112318,1541,1525,1515,1470,1469,1528)
    )
)
PIVOT
(
  max(pupilassesslevelname) AS MUC_DAT_DUOC,
  MAX(examtermmark) as DIEM_KTDK
  FOR SUBJECTID IN (29 TIENG_VIET,2 TOAN,28 KHOA_HOC,35 LICH_SU_DIA_LY,9 TIENG_ANH,23 TIENG_NHAT,55 TIN_HOC,66 TIENG_DAN_TOC, 40 DAO_DUC, 26 AM_NHAC, 25 MY_THUAT, 37 KY_THUAT, 14 THE_DUC)
);

SELECT * FROM
(
  (
  SELECT 
  SAMS.edu_pupil.PUPILID MA_HS
  ,sams.edu_school.schoolname ma_truong
  ,SAMS.EDU_SCHOOLCLASS_NEW.SCHOOLCLASSNAME MA_LOP
  ,FULLNAME TEN_HS
  ,TO_CHAR(BIRTHDAY,'DD/MM/YYYY') NGAY_SINH
  --,DECODE(gender,0,'Nam','N?') GIOI_TINH
  ,SAMS.edu_pupil_assess_ability.abilitytypeid
  ,sams.edu_pupilassesslevel.pupilassesslevelname

--     ,sams.edu_pupil_studyhistory.wholeyearaveragemark DTB
--    ,sams.edu_studyrank.studyrankname HOC_LUC
--    ,sams.edu_conductrank.conductrankname HANH_KIEM
--    ,(CASE 
--    WHEN (edu_studyrank.studyrankid = 1 AND sams.edu_conductrank.conductrankid IN (1,5)) THEN 'Gi?i'
--    WHEN (edu_studyrank.studyrankid IN (1,2) AND sams.edu_conductrank.conductrankid IN (1,2,5)) THEN 'Tiên ti?n'
--    else '' END)
--    DANH_HIEU
----    ,SAMS.GETTOTALATTENDANCE(SAMS.EDU_PUPIL.PUPILID,2,-1,2) + SAMS.GETTOTALATTENDANCE(SAMS.EDU_PUPIL.PUPILID,3,-1,2) TS_NGAY_NGHI_CA_NAM
--    ,CASE WHEN sams.edu_passclassrequest.ispassclass = 1 AND sams.edu_passclasstype.ISPASSCLASS = 1 THEN 1 ELSE 0 END DUOC_LEN_LOP
--    ,CASE WHEN (sams.edu_pupil_studyhistory.RECHECKSTUDYRANKID > 0
--    OR sams.edu_pupil_studyhistory.RETRAINCONDUCTRANKID > 0) 
--    theN 1 ELSE 0 END REN_LUYEN_LAI

 FROM SAMS.EDU_PUPIL_STUDYTIMELINE

JOIN SAMS.EDU_PUPIL
  ON SAMS.EDU_PUPIL.PUPILID = SAMS.EDU_PUPIL_STUDYTIMELINE.PUPILID
JOIN SAMS.EDU_SCHOOL
  ON SAMS.EDU_SCHOOL.SCHOOLID = SAMS.EDU_PUPIL_STUDYTIMELINE.SCHOOLID
JOIN SAMS.EDU_SCHOOLCLASS_NEW
  ON SAMS.EDU_SCHOOLCLASS_NEW.SCHOOLCLASSID = SAMS.EDU_PUPIL_STUDYTIMELINE.SCHOOLCLASSID
JOIN SAMS.EDU_CLASS
  ON SAMS.EDU_CLASS.CLASSID = SAMS.EDU_SCHOOLCLASS_NEW.CLASSID
 left  JOIN SAMS.edu_pupil_assess_ability
    ON SAMS.edu_pupil.pupilid = SAMS.edu_pupil_assess_ability.pupilid 
    AND sams.edu_pupil_assess_ability.schoolyearid = 2
    AND SAMS.edu_pupil_assess_ability.pupilassesstermid = 4
  LEFT JOIN sams.edu_pupilassesslevel
    ON sams.edu_pupilassesslevel.pupilassesslevelid = SAMS.edu_pupil_assess_ability.abilityassesslevelid
--LEFT JOIN sams.edu_pupilassesslevel
--  ON sams.edu_pupilassesslevel.pupilassesslevelid = SAMS.edu_pupil_subjectassess.studyaccesslevelid


WHERE 
SAMS.EDU_PUPIL.ISACTIVE = 1
  AND SAMS.EDU_PUPIL.ISDELETED = 0
  AND SAMS.EDU_SCHOOLCLASS_NEW.SCHOOLYEARID = 2
  AND SAMS.EDU_SCHOOLCLASS_NEW.SCHOOLTERMID = 2
  AND SAMS.EDU_SCHOOLCLASS_NEW.ISACTIVE = 1
  AND SAMS.EDU_SCHOOLCLASS_NEW.ISDELETED = 0
  AND SAMS.EDU_CLASS.EDUCATIONLEVELID = 2
  AND SAMS.EDU_CLASS.ISACTIVE = 1
  AND SAMS.EDU_CLASS.ISDELETED = 0
  AND SAMS.EDU_PUPIL_STUDYTIMELINE.SCHOOLYEARID = 2
  AND SAMS.EDU_PUPIL_STUDYTIMELINE.SCHOOLTERMID = 2
  AND SAMS.EDU_PUPIL_STUDYTIMELINE.ISACTIVE = 1
  AND SAMS.EDU_PUPIL_STUDYTIMELINE.ISDELETED = 0
    AND UPPER(edu_school.schoolname) NOT LIKE '%T? DO%'
  AND edu_school.schoolid NOT IN (1524,1530,10112318,1541,1525,1515,1470,1469,1528)
    )
)
PIVOT
(
  MAX(pupilassesslevelname)
  FOR abilitytypeid IN (1 TU_PHUC_VU_TU_QUAN, 2 HOP_TAC, 3 TU_HOC_VA_GQVD, 5 TU_GIAO_TIEP_TOT)
);

SELECT * FROM
(
  (
  SELECT 
  SAMS.edu_pupil.PUPILID MA_HS
  ,sams.edu_school.schoolname ma_truong
  ,SAMS.EDU_SCHOOLCLASS_NEW.SCHOOLCLASSNAME MA_LOP
  ,FULLNAME TEN_HS
  ,TO_CHAR(BIRTHDAY,'DD/MM/YYYY') NGAY_SINH
  ,DECODE(gender,0,'Nam','N?') GIOI_TINH
  ,SAMS.edu_pupil_assess_quality.personalqualitytypeid
  ,sams.edu_pupilassesslevel.pupilassesslevelname

--     ,sams.edu_pupil_studyhistory.wholeyearaveragemark DTB
--    ,sams.edu_studyrank.studyrankname HOC_LUC
--    ,sams.edu_conductrank.conductrankname HANH_KIEM
--    ,(CASE 
--    WHEN (edu_studyrank.studyrankid = 1 AND sams.edu_conductrank.conductrankid IN (1,5)) THEN 'Gi?i'
--    WHEN (edu_studyrank.studyrankid IN (1,2) AND sams.edu_conductrank.conductrankid IN (1,2,5)) THEN 'Tiên ti?n'
--    else '' END)
--    DANH_HIEU
----    ,SAMS.GETTOTALATTENDANCE(SAMS.EDU_PUPIL.PUPILID,2,-1,2) + SAMS.GETTOTALATTENDANCE(SAMS.EDU_PUPIL.PUPILID,3,-1,2) TS_NGAY_NGHI_CA_NAM
--    ,CASE WHEN sams.edu_passclassrequest.ispassclass = 1 AND sams.edu_passclasstype.ISPASSCLASS = 1 THEN 1 ELSE 0 END DUOC_LEN_LOP
--    ,CASE WHEN (sams.edu_pupil_studyhistory.RECHECKSTUDYRANKID > 0
--    OR sams.edu_pupil_studyhistory.RETRAINCONDUCTRANKID > 0) 
--    theN 1 ELSE 0 END REN_LUYEN_LAI

 FROM SAMS.EDU_PUPIL_STUDYTIMELINE

JOIN SAMS.EDU_PUPIL
  ON SAMS.EDU_PUPIL.PUPILID = SAMS.EDU_PUPIL_STUDYTIMELINE.PUPILID
JOIN SAMS.EDU_SCHOOL
  ON SAMS.EDU_SCHOOL.SCHOOLID = SAMS.EDU_PUPIL_STUDYTIMELINE.SCHOOLID
JOIN SAMS.EDU_SCHOOLCLASS_NEW
  ON SAMS.EDU_SCHOOLCLASS_NEW.SCHOOLCLASSID = SAMS.EDU_PUPIL_STUDYTIMELINE.SCHOOLCLASSID
JOIN SAMS.EDU_CLASS
  ON SAMS.EDU_CLASS.CLASSID = SAMS.EDU_SCHOOLCLASS_NEW.CLASSID
 left  JOIN SAMS.edu_pupil_assess_quality
    ON SAMS.edu_pupil.pupilid = SAMS.edu_pupil_assess_quality.pupilid 
    AND sams.edu_pupil_assess_quality.schoolyearid = 2
    AND SAMS.edu_pupil_assess_quality.pupilassesstermid = 4
  LEFT JOIN sams.edu_pupilassesslevel
    ON sams.edu_pupilassesslevel.pupilassesslevelid = SAMS.edu_pupil_assess_quality.personalqualityassesslevelid
--LEFT JOIN sams.edu_pupilassesslevel
--  ON sams.edu_pupilassesslevel.pupilassesslevelid = SAMS.edu_pupil_subjectassess.studyaccesslevelid


WHERE 
SAMS.EDU_PUPIL.ISACTIVE = 1
  AND SAMS.EDU_PUPIL.ISDELETED = 0
  AND SAMS.EDU_SCHOOLCLASS_NEW.SCHOOLYEARID = 2
  AND SAMS.EDU_SCHOOLCLASS_NEW.SCHOOLTERMID = 2
  AND SAMS.EDU_SCHOOLCLASS_NEW.ISACTIVE = 1
  AND SAMS.EDU_SCHOOLCLASS_NEW.ISDELETED = 0
  AND SAMS.EDU_CLASS.EDUCATIONLEVELID = 2
  AND SAMS.EDU_CLASS.ISACTIVE = 1
  AND SAMS.EDU_CLASS.ISDELETED = 0
  AND SAMS.EDU_PUPIL_STUDYTIMELINE.SCHOOLYEARID = 2
  AND SAMS.EDU_PUPIL_STUDYTIMELINE.SCHOOLTERMID = 2
  AND SAMS.EDU_PUPIL_STUDYTIMELINE.ISACTIVE = 1
  AND SAMS.EDU_PUPIL_STUDYTIMELINE.ISDELETED = 0
    AND UPPER(edu_school.schoolname) NOT LIKE '%T? DO%'
  AND edu_school.schoolid NOT IN (1524,1530,10112318,1541,1525,1515,1470,1469,1528)
    )
)
PIVOT
(
  MAX(pupilassesslevelname)
  FOR personalqualitytypeid IN (1 CHAM_HOC_CHAM_LAM, 2 TU_TIN_TRACH_NHIEM, 3 TRUNG_THUC_KY_LUAT, 4 DOAN_KEY_YEU_THUONG)
);
