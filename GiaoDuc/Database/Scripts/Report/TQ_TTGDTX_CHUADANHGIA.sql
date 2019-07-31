SELECT  md.districtname
  ,es.schoolid ,es.schoolname
  ,nvl(couNTpupilK6.slhs,0) TOTALPUPIL_NXL
  ,nvl(couNTpupilK7.slhs,0) TOTALPUPIL7_NXL
  FROM sams.edu_school es
  JOIN sams.md_organ mo
  ON es.organid = mo.organid
   JOIN sams.md_district md
  ON mo.districtid = md.districtid
  LEFT JOIN SAMS.EDU_SCHOOL_EDUCATIONLEVEL ESE
   ON   ESE.SCHOOLID = ES.SCHOOLID
  LEFT 
JOIN (
  SELECT eps.schoolid, COUNT(DISTINCT eps.pupilid)slhs 
  FROM saMS.edu_pupil_studytimeline eps
    JOIN sams.edu_schoolclass_new esn
    ON esn.schoolid = eps.schoolid
    AND esn.schoolclassid = eps.schoolclassid
    AND esn.schoolyearid = eps.schoolyearid
    AND esn.schooltermid = eps.schooltermid
    AND esn.classid IN (16,17,18,19,20,21,22)
    JOIN sams.edu_pupil_conductrank epc
    ON epc.pupilid = eps.pupilid
    AND epc.schoolid = eps.schoolid
    AND epc.schoolclassid = eps.schoolclassid
    AND epc.wholeyearconductrankid NOT IN (1,2,3,4,5)
    AND epc.isdeleted = 0
    AND epc.schoolyearid = eps.schoolyearid
  WHERE eps.schoolyearid = 21
  AND eps.schooltermid = 2
  AND currentpupilstatusid = 1
  AND eps.isdeleted = 0 AND EPS.LINKSCHOOLID IS NULL
  AND eps.isactive = 1
  GROUP BY EPS.schoolid
  )couNTpupilK6
 ON es.schoolid = couNTpupilK6.schoolid
LEFT 
JOIN (
  SELECT eps.schoolid, COUNT(DISTINCT eps.pupilid)slhs 
  FROM saMS.edu_pupil_studytimeline eps
    JOIN sams.edu_schoolclass_new esn
    ON esn.schoolid = eps.schoolid
    AND esn.schoolclassid = eps.schoolclassid
    AND esn.schoolyearid = eps.schoolyearid
    AND esn.schooltermid = eps.schooltermid
    AND esn.classid IN (16,17,18,19,20,21,22)
    
  WHERE eps.schoolyearid = 21
  AND eps.schooltermid = 2
  AND currentpupilstatusid = 1
  AND eps.isdeleted = 0 AND EPS.LINKSCHOOLID IS NULL
  AND eps.isactive = 1
  AND NOT EXISTS (SELECT * FROM sams.edu_pupil_conductrank epc WHERE epc.pupilid = eps.pupilid)
  GROUP BY EPS.schoolid
  )couNTpupilK7
 ON es.schoolid = couNTpupilK7.schoolid

  WHERE es.isactive = 1 AND es.isdeleted = 0
  and ES.schoolid NOT IN (1592,1593,1594,1595,1596,1597,1598,1599,1600,1605,1607,1610,1618,1613,1614,1616,1608,1611,1615,1602,1603,1604,1609,1617,1601,1606,1612,1524,1530,10112318,1525,1515,1470,1528,1469)
  AND ese.educationlevelid IN (7) 
ORDER BY md.districtname,es.schoolname
  ;