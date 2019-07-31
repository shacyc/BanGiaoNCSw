
SELECT 
TMP.ma_truong
,TMP.MA_LOP
,TMP.MA_HS
,TMP.TEN_HS
,TMP.NGAY_SINH
/*
--GDTX
--2 TOAN,3 LY,4 HOA,5 SINH,1 VAN,6 SU,7 DIA, 55 TIN_HOC,9 TIENG_ANH,8 GDCD
,MAX(DECODE(subjectid, 2 , wholeyearmark)) AS TOAN 
,MAX(DECODE(subjectid, 3 , wholeyearmark)) AS LY 
,MAX(DECODE(subjectid, 4 , wholeyearmark)) AS HOA
,MAX(DECODE(subjectid, 5 , wholeyearmark)) AS SINH
,MAX(DECODE(subjectid, 1 , wholeyearmark)) AS VAN
,MAX(DECODE(subjectid, 6 , wholeyearmark)) AS SU
,MAX(DECODE(subjectid, 7 , wholeyearmark)) AS DIA
,MAX(DECODE(subjectid, 55 , wholeyearmark)) AS TIN_HOC
,MAX(DECODE(subjectid, 9 , wholeyearmark)) AS TIENG_ANH
,MAX(DECODE(subjectid, 8 , wholeyearmark)) AS GDCD
*/
/*
--THPT
--2 TOAN,3 LY,4 HOA,5 SINH,1 VAN,6 SU,7 DIA, 55 TIN_HOC,9 TIENG_ANH,11 CONG_NGHE,56 GDQP,14 THE_DUC,59 NGHE,NN2,8 GDCD
,MAX(DECODE(subjectid, 2 ,wholeyearmark)) AS TOAN 
,MAX(DECODE(subjectid, 3 , wholeyearmark)) AS LY 
,MAX(DECODE(subjectid, 4 , wholeyearmark)) AS HOA
,MAX(DECODE(subjectid, 5 , wholeyearmark)) AS SINH
,MAX(DECODE(subjectid, 55 , wholeyearmark)) AS TIN_HOC
,MAX(DECODE(subjectid, 1 , wholeyearmark)) AS VAN
,MAX(DECODE(subjectid, 6 , wholeyearmark)) AS SU
,MAX(DECODE(subjectid, 7 , wholeyearmark)) AS DIA
,MAX(DECODE(subjectid, 9 , wholeyearmark)) AS TIENG_ANH
,MAX(DECODE(subjectid, 11 , wholeyearmark)) AS CONG_NGHE
,MAX(DECODE(subjectid, 56 , wholeyearmark)) AS GDQP
,MAX(DECODE(subjectid, 14 , wholeyearmark)) AS THE_DUC
,MAX(CASE WHEN (TMP.ISOPTIONALSUBJECT = 1 AND TMP.ISFOREIGNLANGUAGESUBJECT = 1 AND subjectid <> 9) THEN wholeyearmark END) NN2
,MAX(DECODE(subjectid, 59 , wholeyearmark)) AS NGHE
,MAX(DECODE(subjectid, 8 , wholeyearmark)) AS GDCD
*/


--THCS
--2 TOAN,3 LY,4 HOA,5 SINH,1 VAN,6 SU,7 DIA,9 TIENG_ANH,11 CONG_NGHE,56 GDQP,14 THE_DUC,59 NGHE,NN2,8 GDCD
,MAX(DECODE(subjectid, 2 ,wholeyearmark)) AS TOAN 
,MAX(DECODE(subjectid, 3 , wholeyearmark)) AS LY 
,MAX(DECODE(subjectid, 4 , wholeyearmark)) AS HOA
,MAX(DECODE(subjectid, 5 , wholeyearmark)) AS SINH
,MAX(DECODE(subjectid, 1 , wholeyearmark)) AS VAN
,MAX(DECODE(subjectid, 6 , wholeyearmark)) AS SU
,MAX(DECODE(subjectid, 7 , wholeyearmark)) AS DIA
,MAX(DECODE(subjectid, 9 , wholeyearmark)) AS TIENG_ANH
,MAX(DECODE(subjectid, 11 , wholeyearmark)) AS CONG_NGHE
,MAX(DECODE(subjectid, 14 , wholeyearmark)) AS THE_DUC
,MAX(DECODE(subjectid, 26 , wholeyearmark)) AS MY_THUAT
,MAX(DECODE(subjectid, 25 , wholeyearmark)) AS AM_NHAC
,MAX(DECODE(subjectid, 8 , wholeyearmark)) AS GDCD
,MAX(DECODE(subjectid, 55 , wholeyearmark)) AS TIN_HOC
,MAX(CASE WHEN (TMP.ISOPTIONALSUBJECT = 1 AND TMP.ISFOREIGNLANGUAGESUBJECT = 1 AND subjectid <> 9) THEN wholeyearmark END) NN2
,' ' MON_KHAC


,TMP.DTB
,TMP.HOC_LUC
,TMP.HANH_KIEM
,TMP.DANH_HIEU
,COUNT(TMP.TS_NGAY_NGHI_CA_NAM )
,TMP.DUOC_LEN_LOP
,TMP.REN_LUYEN_LAI   


FROM
(
  (SELECT   
  SAMS.MP_EDUSCHOOL.MOETSCHOOLID ma_truong
  ,SAMS.EDU_SCHOOLCLASS_NEW.SCHOOLCLASSNAME MA_LOP
  ,SAMS.edu_pupil.PUPILID MA_HS
  ,FULLNAME TEN_HS
  ,TO_CHAR(BIRTHDAY,'DD/MM/YYYY') NGAY_SINH
--  ,DECODE(gender,0,'Nam','N?') GIOI_TINH
    ,SAMS.edu_subject.subjectid
    ,SAMS.edu_pupil_mark.wholeyearmark
     ,sams.edu_pupil_studyhistory.wholeyearaveragemark DTB
    ,sams.edu_studyrank.STUDYRANKSHORTNAME HOC_LUC
    ,sams.edu_conductrank.CONDUCTRANKSHORTNAME HANH_KIEM
    ,(CASE 
    WHEN (edu_studyrank.studyrankid = 1 AND sams.edu_conductrank.conductrankid IN (1,5)) THEN 'Gi?i'
    WHEN (edu_studyrank.studyrankid IN (1,2) AND sams.edu_conductrank.conductrankid IN (1,2,5)) THEN 'Tiên ti?n'
    else '' END)
    DANH_HIEU
   ,
   CASE WHEN (SAMS.edu_pupil_attendance.PUPILATTENDANCESTATUSID = 2 OR  SAMS.edu_pupil_attendance.PUPILATTENDANCESTATUSID = 3)  THEN 1 END 

   TS_NGAY_NGHI_CA_NAM
    ,CASE WHEN sams.edu_passclassrequest.ispassclass = 1 AND sams.edu_passclasstype.ISPASSCLASS = 1 THEN 'x' ELSE ' ' END DUOC_LEN_LOP
    ,CASE WHEN (sams.edu_pupil_studyhistory.RECHECKSTUDYRANKID > 0
    OR sams.edu_pupil_studyhistory.RETRAINCONDUCTRANKID > 0) 
    theN 'x' ELSE ' ' END REN_LUYEN_LAI
    ,SAMS.EDU_SCHOOLCLASS_SUBJECT.ISOPTIONALSUBJECT
    ,SAMS.edu_subject.ISFOREIGNLANGUAGESUBJECT

  FROM SAMS.EDU_PUPIL_STUDYTIMELINE
  
LEFT JOIN SAMS.EDU_PUPIL
  ON SAMS.EDU_PUPIL.PUPILID = SAMS.EDU_PUPIL_STUDYTIMELINE.PUPILID
LEFT JOIN SAMS.EDU_SCHOOL
  ON SAMS.EDU_SCHOOL.SCHOOLID = SAMS.EDU_PUPIL_STUDYTIMELINE.SCHOOLID
LEFT JOIN SAMS.EDU_SCHOOLCLASS_NEW
  ON SAMS.EDU_SCHOOLCLASS_NEW.SCHOOLCLASSID = SAMS.EDU_PUPIL_STUDYTIMELINE.SCHOOLCLASSID
LEFT JOIN SAMS.EDU_CLASS
  ON SAMS.EDU_CLASS.CLASSID = SAMS.EDU_SCHOOLCLASS_NEW.CLASSID
 left  JOIN SAMS.edu_pupil_mark
    ON SAMS.edu_pupil.pupilid = SAMS.edu_pupil_mark.pupilid 
    AND sams.edu_pupil_mark.schoolclassid = SAMS.EDU_PUPIL_STUDYTIMELINE.SCHOOLCLASSID
    AND sams.edu_pupil_mark.schoolyearid = 2
    JOIN SAMS.edu_subject
    ON sams.edu_subject.subjectid = SAMS.edu_pupil_mark.subjectid
LEFT JOIN sams.edu_pupil_studyhistory
    ON sams.edu_pupil_studyhistory.pupilid = SAMS.edu_pupil.pupilid
    AND sams.edu_pupil_studyhistory.schoolclassid = SAMS.EDU_SCHOOLCLASS_NEW.schoolclassid
    AND sams.edu_pupil_studyhistory.schoolyearid = 2
    LEFT JOIN sams.edu_conductrank
    ON sams.edu_pupil_studyhistory.wholeyearconductrankid = sams.edu_conductrank.conductrankid
LEFT JOIN sams.edu_studyrank
    ON sams.edu_pupil_studyhistory.wholeyearstudyrankid = sams.edu_studyrank.studyrankid
LEFT JOIN sams.edu_passclassrequest_pupil
    ON sams.edu_passclassrequest_pupil.pupilid = SAMS.EDU_PUPIL.pupilid
LEFT JOIN sams.edu_passclassrequest
    ON sams.edu_passclassrequest.passclassrequestid = sams.edu_passclassrequest_pupil.passclassrequestid
    AND sams.edu_passclassrequest.schoolyearid = 2
LEFT JOIN sams.edu_passclasstype
    ON sams.edu_passclasstype.passclasstypeid = sams.edu_passclassrequest_pupil.passclasstypeid
LEFT JOIN SAMS.MP_EDUSCHOOL
    ON SAMS.MP_EDUSCHOOL.SCHOOLID = EDU_PUPIL_STUDYTIMELINE.SCHOOLID
    AND SAMS.MP_EDUSCHOOL.EDUCATIONLEVELID = SAMS.EDU_CLASS.EDUCATIONLEVELID
LEFT JOIN SAMS.EDU_SCHOOLCLASS_SUBJECT
    ON SAMS.EDU_SCHOOLCLASS_SUBJECT.SCHOOLCLASSID = SAMS.EDU_SCHOOLCLASS_NEW.SCHOOLCLASSID
    AND SAMS.EDU_SCHOOLCLASS_SUBJECT.SCHOOLYEARID = 2
    AND SAMS.EDU_SCHOOLCLASS_SUBJECT.SCHOOLTERMID = 2
    AND SAMS.EDU_SCHOOLCLASS_SUBJECT.SUBJECTID = SAMS.EDU_SUBJECT.SUBJECTID

LEFT JOIN SAMS.edu_pupil_attendance
    ON SAMS.edu_pupil_attendance.pupilid = SAMS.EDU_PUPIL.pupilid
    AND SAMS.edu_pupil_attendance.schoolyearid = 2
    AND (SAMS.edu_pupil_attendance.PUPILATTENDANCESTATUSID = 2 OR SAMS.edu_pupil_attendance.PUPILATTENDANCESTATUSID = 3)
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
  AND SAMS.EDU_SCHOOLCLASS_NEW.isactive = 1
  AND SAMS.EDU_SCHOOLCLASS_NEW.isdeleted = 0
  AND SAMS.EDU_CLASS.EDUCATIONLEVELID = 3 
  AND SAMS.EDU_CLASS.isactive = 1
  AND SAMS.EDU_CLASS.isdeleted = 0
  AND SAMS.EDU_PUPIL_STUDYTIMELINE.SCHOOLYEARID = 2
  AND SAMS.EDU_PUPIL_STUDYTIMELINE.SCHOOLTERMID = 2
  AND SAMS.EDU_PUPIL_STUDYTIMELINE.ISACTIVE = 1
  AND SAMS.EDU_PUPIL_STUDYTIMELINE.ISDELETED = 0
  AND SAMS.EDU_PUPIL_STUDYTIMELINE.CURRENTPUPILSTATUSID = 1
  and sams.edu_passclassrequest.ISDELETED = 0
  AND UPPER(edu_school.schoolname) NOT LIKE '%T? DO%'
  AND edu_school.schoolid NOT IN (1524,1530,10112318,1541,1525,1515,1470,1469,1528)
 
--AND EDU_PUPIL_STUDYTIMELINE.schoolid = '1469'
 --AND SAMS.EDU_PUPIL.PUPILID ='011497589           '
    ) TMP
)
group by 
TMP.ma_truong
,TMP.MA_LOP
,TMP.MA_HS
,TMP.TEN_HS
,TMP.NGAY_SINH
,TMP.DTB
,TMP.HOC_LUC
,TMP.HANH_KIEM
,TMP.DANH_HIEU
,TMP.DUOC_LEN_LOP
,TMP.REN_LUYEN_LAI
,TMP.TS_NGAY_NGHI_CA_NAM
