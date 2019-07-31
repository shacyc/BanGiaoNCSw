SELECT 
  schoolid
  ,schoolname TEN_TRUONG
      ,to_char(pupilid) MA_HS
      ,to_char(identificationnumber) SBD
  
       FROM
  (

SELECT DISTINCT 
  edu_school.schoolid,
  schoolname,
  sams.edu_pupil.pupilid,
  identificationnumber, 
  edu_school.orderindex
  FROM sams.edu_g10examresult
  LEFT join SAMS.edu_pupil_g10examresult
  ON sams.edu_pupil_g10examresult.pupilid = sams.edu_g10examresult.pupilid
  AND edu_pupil_g10examresult.schoolyearid = 2
  AND edu_pupil_g10examresult.isdeleted = 0
  LEFT JOIN sams.edu_pupil
  ON sams.edu_pupil.pupilid = SAMS.edu_g10examresult.pupilid
  left JOIN sams.edu_school
  ON sams.edu_school.schoolid = edu_g10examresult.hischoolid
  WHERE 
  sams.edu_pupil.isactive = 1
  AND sams.edu_pupil.isdeleted = 0 
  AND sams.edu_school.isactive = 1
  AND sams.edu_school.isdeleted = 0 

  AND 
  SAMS.edu_g10examresult.isdeleted = 0 
  AND SAMS.edu_g10examresult.schoolyearid = 21

 AND EDU_SCHOOL.schoolid NOT IN   (1592,1593,1594,1595,1596,1597,1598,1599,1600,1605,1607,1610,1618,1613,1614,1616,1608,1611,1615,1602,1603,1604,1609,1617,1601,1606,1612,1524,1530,10112318,1541,1525,1515,1470,1528,1469)
--  AND upper(sams.edu_school.schoolname) NOT LIKE '%T? DO%'
--  and sams.edu_g10examresult.pupilid = '011103314'

  )
  ORDER BY schoolname


--SELECT * FROM sams.edu_g10examresult
--  WHERE pupilid ='013157594';
--SELECT currentschoolid FROM sams.edu_pupil
--  WHERE pupilid ='013157594';
--SELECT * FROM sams.edu_school WHERE schoolid ='25030116'
