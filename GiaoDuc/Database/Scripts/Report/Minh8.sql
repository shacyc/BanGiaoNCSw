SELECT mo1.organid, mo1.organname, es1.educationtypename, es.schoolname, nvl(couNTpupil.slhs, 0) slhs,
  nvl(db3.sl, 0) android , NVL(db4.sl, 0) IOS, NVL(db2.sl, 0) WEB, nvl(db3.sl,0) + NVL(db4.sl,0) pino

FROM sams.edu_school es
JOIN sams.md_organ mo
  ON es.organid = mo.organid
--LEFT
JOIN sams.md_organ mo1
  ON MO1.organid = mo.parentid

JOIN sams.edu_school_educationlevel ese
  ON es.schoolid = ese.schoolid
AND ese.educationlevelid = 7

LEFT 
JOIN sams.edu_educationtype  es1
  ON es.educationtypeid = es1.educationtypeid
 AND es1.isactive = 1 
 AND es1.isdeleted = 0

LEFT
JOIN (
  seLECT temp2.currentschoolid, count(*) sl FROM (
  SELECT edu_pupil.currentschoolid, sys_ePupilLoginLog.PUPILID, sys_ePupilLoginLog.EGOVCHANelID
FROM sams.sys_ePupilLoginLog 
JOIN sams.edu_PUPIL 
  ON sys_ePupilLoginLog.PUPILID = edu_pupil.pupilid 
  AND edu_pupil.isdeleted = 0 AND edu_pupil.currentpupilstatusid = 1

 WHERE sys_ePupilLoginLog.EGOVCHANelID = 2
GROUP by edu_pupil.currentschoolid, sys_ePupilLoginLog.PUPILID, sys_ePupilLoginLog.EGOVCHANelID
  )TEMP2
    GROUP by TEMP2.currentschoolid
)db2
ON es.schoolid = db2.currentschoolid

LEFT
JOIN (
  seLECT temp3.currentschoolid, count(*) sl FROM (
  SELECT edu_pupil.currentschoolid, sys_ePupilLoginLog.PUPILID, sys_ePupilLoginLog.EGOVCHANelID
FROM sams.sys_ePupilLoginLog 
JOIN sams.edu_PUPIL 
  ON sys_ePupilLoginLog.PUPILID = edu_pupil.pupilid 
  AND edu_pupil.isdeleted = 0 AND edu_pupil.currentpupilstatusid = 1
 WHERE sys_ePupilLoginLog.EGOVCHANelID = 3
GROUP by edu_pupil.currentschoolid, sys_ePupilLoginLog.PUPILID, sys_ePupilLoginLog.EGOVCHANelID
  )TEMP3
GROUP by TEMP3.currentschoolid
)db3
ON es.schoolid = db3.currentschoolid

LEFT
JOIN (
  seLECT temp4.currentschoolid, count(*) sl FROM (
  SELECT edu_pupil.currentschoolid, sys_ePupilLoginLog.PUPILID, sys_ePupilLoginLog.EGOVCHANelID
FROM sams.sys_ePupilLoginLog 
JOIN sams.edu_PUPIL 
  ON sys_ePupilLoginLog.PUPILID = edu_pupil.pupilid 
  AND edu_pupil.isdeleted = 0 AND edu_pupil.currentpupilstatusid = 1

 WHERE sys_ePupilLoginLog.EGOVCHANelID = 4
GROUP by edu_pupil.currentschoolid, sys_ePupilLoginLog.PUPILID, sys_ePupilLoginLog.EGOVCHANelID
  )TEMP4
    GROUP by TEMP4.currentschoolid
)db4
ON es.schoolid = db4.currentschoolid

LEFT 
JOIN (
  SELECT eps.schoolid, COUNT(eps.pupilid)slhs 
  FROM saMS.edu_pupil_studytimeline eps
  WHERE schoolyearid = 21
  AND schooltermid = 1
  AND currentpupilstatusid = 1
  AND isdeleted = 0
  AND isactive = 1
  GROUP BY EPS.schoolid
  )couNTpupil
 ON es.schoolid = couNTpupil.schoolid



WHERE es.isdeleted = 0 AND es.isactive = 1
  AND ES.schoolid NOT IN (1592,1593,1594,1595,1596,1597,1598,1599,1600,1605,1607,1610,1618,1613,1614,1616,1608,1611,1615,1602,1603,1604,1609,1617,1601,1606,1612,1524,1530,10112318,1541,1525,1515,1470,1528,1469) 
ORDER BY mo1.organid,es.schoolname