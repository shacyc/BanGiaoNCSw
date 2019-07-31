SELECT * 
  FROM 
(
SELECT eps.pupilid,ep.fullname
   , to_char(ep.birthday,'DD/MM/YYYY')  birthday,esn.schoolclassname
  ,eps.schoolid,es.schoolname
  ,'S? lu?ng h?c sinh chua dánh giá ' GHICHU
  FROM saMS.edu_pupil_studytimeline eps
   JOIN sams.edu_pupil ep
    ON ep.pupilid = eps.pupilid
  AND ep.isdeleted = 0 AND ep.isactive = 1

   JOIN sams.edu_school es
    ON es.schoolid = eps.schoolid
    JOIN sams.md_organ mo
    ON es.organid = mo.organid
     JOIN sams.md_district md
    ON mo.districtid = md.districtid
  LEFT JOIN SAMS.EDU_SCHOOL_EDUCATIONLEVEL ESE
   ON   ESE.SCHOOLID = ES.SCHOOLID
    JOIN sams.edu_schoolclass_new esn
    ON esn.schoolid = eps.schoolid
    AND esn.schoolclassid = eps.schoolclassid
    AND esn.schoolyearid = eps.schoolyearid
    AND esn.schooltermid = eps.schooltermid
    AND esn.classid IN (16,17,18,19,20,21,22)
    JOIN sams.edu_pupil_studyhistory  epc
    ON epc.pupilid = eps.pupilid
    AND epc.schoolid = eps.schoolid
    AND epc.schoolclassid = eps.schoolclassid
    AND epc.wholeyearstudyrankid NOT IN (1,2,3,4,5)
    AND epc.isdeleted = 0 AND epc.isactive =1
    AND epc.schoolyearid = eps.schoolyearid
  WHERE eps.schoolyearid = 21
  AND eps.schooltermid = 2
  AND EPS.currentpupilstatusid = 1
  AND eps.isdeleted = 0 AND EPS.LINKSCHOOLID IS NULL
  AND eps.isactive = 1
  AND ESE.educationlevelid = 7 AND es.isactive = 1 AND es.isdeleted = 0
  and ES.schoolid NOT IN (1592,1593,1594,1595,1596,1597,1598,1599,1600,1605,1607,1610,1618,1613,1614,1616,1608,1611,1615,1602,1603,1604,1609,1617,1601,1606,1612,1524,1530,10112318,1525,1515,1470,1528,1469)
UNION
SELECT eps.pupilid,ep.fullname
   , to_char(ep.birthday,'DD/MM/YYYY')  birthday
  ,esn.schoolclassname
  ,eps.schoolid,es.schoolname
  ,'S? lu?ng h?c sinh không có trong b?ng dánh giá' GHICHU
  FROM saMS.edu_pupil_studytimeline eps
   JOIN sams.edu_pupil ep
    ON ep.pupilid = eps.pupilid
  AND ep.isdeleted = 0 AND ep.isactive = 1

   JOIN sams.edu_school es
    ON es.schoolid = eps.schoolid
    JOIN sams.md_organ mo
    ON es.organid = mo.organid
     JOIN sams.md_district md
    ON mo.districtid = md.districtid
  LEFT JOIN SAMS.EDU_SCHOOL_EDUCATIONLEVEL ESE
   ON   ESE.SCHOOLID = ES.SCHOOLID
    JOIN sams.edu_schoolclass_new esn
    ON esn.schoolid = eps.schoolid
    AND esn.schoolclassid = eps.schoolclassid
    AND esn.schoolyearid = eps.schoolyearid
    AND esn.schooltermid = eps.schooltermid
    AND esn.classid IN (16,17,18,19,20,21,22)
    
  WHERE eps.schoolyearid = 21
  AND eps.schooltermid = 2
  AND EPS.currentpupilstatusid = 1
  AND eps.isdeleted = 0 AND EPS.LINKSCHOOLID IS NULL
  AND eps.isactive = 1
  AND NOT EXISTS (SELECT * FROM sams.edu_pupil_studyhistory epc WHERE epc.pupilid = eps.pupilid)
  and ES.schoolid NOT IN (1592,1593,1594,1595,1596,1597,1598,1599,1600,1605,1607,1610,1618,1613,1614,1616,1608,1611,1615,1602,1603,1604,1609,1617,1601,1606,1612,1524,1530,10112318,1525,1515,1470,1528,1469)
  AND ESE.educationlevelid = 7 AND es.isactive = 1 AND es.isdeleted = 0
  )
  ORDER BY schoolname
 