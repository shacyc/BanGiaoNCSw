SELECT 
--  schoolid
--  ,schoolname TEN_TRUONG
--      ,to_char(pupilid) MA_HS
--      ,to_char(identificationnumber) SBD
  to_char(pupilid) MA_HS,
  to_char(identificationnumber) SBD,
  Substr(lastname, 1, Instr(lastname, ' ') - 1) AS HO,
  Substr(lastname, Instr(lastname, ' ') + 1)    AS DEM,
 firstname AS TEN,
--  lastname,
--  fullname,
   birthday,
  GENDERNAME,
  PLACEOFBIRTHFULLNAME,
  ETHNICITYNAME, --Dân t?c Name
  THCS,
  districtname,
 schoolclassname,
  MaTHPT,
  schoolid,
  schoolname,
 educationtypename
       FROM
  (

SELECT DISTINCT 
  edu_g10examresult.pupilid,
  edu_pupil.firstname,
  edu_pupil.lastname,
  edu_pupil.fullname,
  to_char(edu_pupil.birthday,'DD/MM/YYYY') birthday,
  DECODE(GENDER, 0,N'Nam', N'N?') GENDERNAME,
  NVL(MD_PROVINCE.PROVINCENAME, MD_COUNTRY.COUNTRYNAME) PLACEOFBIRTHFULLNAME,
  PL_ETHNICITY.ETHNICITYNAME, --Dân t?c Name
  SCHOOLTHCS.schoolname THCS,
  mdTHCS.districtname,
  esn.schoolclassname,
  edu_school.schoolid MaTHPT,
  edu_school.schoolid,
  edu_school.schoolname,
  
  identificationnumber, 
  es1.educationtypename
  FROM sams.edu_g10examresult
  LEFT join SAMS.edu_pupil_g10examresult
  ON sams.edu_pupil_g10examresult.pupilid = sams.edu_g10examresult.pupilid
  AND edu_pupil_g10examresult.schoolyearid = 2
  AND edu_pupil_g10examresult.isdeleted = 0
  LEFT JOIN sams.edu_pupil
  ON sams.edu_pupil.pupilid = SAMS.edu_g10examresult.pupilid
  LEFT JOIN SAMS.PL_ETHNICITY ON  edu_pupil.ETHNICITYID = PL_ETHNICITY.ETHNICITYID
  LEFT JOIN SAMS.MD_COUNTRY ON  edu_pupil.PLACEOFBIRTHCOUNTRYID = MD_COUNTRY.COUNTRYID
  LEFT JOIN SAMS.MD_PROVINCE ON edu_pupil.PLACEOFBIRTHPROVINCEID = MD_PROVINCE.PROVINCEID
  left JOIN sams.edu_school SCHOOLTHCS
  ON SCHOOLTHCS.schoolid = edu_g10examresult.juniorschoolid
  LEFT JOIN sams.md_organ mo
  ON mo.organid = SCHOOLTHCS.organid
  LEFT JOIN sams.md_district mdTHCS
  ON mo.districtid = mdTHCS.districtid
  LEFT JOIN sams.edu_schoolclass_new esn
  ON esn.schoolclassid = edu_g10examresult.juniorschoolclassid
  AND esn.schoolyearid = edu_g10examresult.schoolyearid
  AND esn.schooltermid = 2
  
 
  left JOIN sams.edu_school
  ON sams.edu_school.schoolid = edu_g10examresult.hischoolid
   
left JOIN sams.edu_educationtype  es1
  ON edu_school.educationtypeid = es1.educationtypeid
 AND es1.isactive = 1 
 AND es1.isdeleted = 0
  WHERE 
  sams.edu_pupil.isactive = 1
  AND sams.edu_pupil.isdeleted = 0 
  AND sams.edu_school.isactive = 1
  AND sams.edu_school.isdeleted = 0 

  AND 
  SAMS.edu_g10examresult.isdeleted = 0 
  AND SAMS.edu_g10examresult.schoolyearid = 21
  
 AND EDU_SCHOOL.schoolid NOT IN   (1592,1593,1594,1595,1596,1597,1598,1599,1600,1605,1607,1610,1618,1613,1614,1616,1608,1611,1615,1602,1603,1604,1609,1617,1601,1606,1612,1524,1530,10112318,1525,1515,1470,1528,1469)
--  AND upper(sams.edu_school.schoolname) NOT LIKE '%T? DO%'
--  and sams.edu_g10examresult.pupilid = '011103314'

  )
  ORDER BY schoolname


--SELECT * FROM sams.edu_g10examresult
--  WHERE pupilid ='013157594';
--SELECT currentschoolid FROM sams.edu_pupil
--  WHERE pupilid ='013157594';
--SELECT * FROM sams.edu_school WHERE schoolid ='25030116'
