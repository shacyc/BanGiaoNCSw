SELECT es.schoolid, es.schoolname, nvl(couNTpupil.slhs, 0) slhs,
  nvl(db3.sl, 0) android , NVL(db4.sl, 0) IOS, NVL(db2.sl, 0) WEB, nvl(db3.sl,0) + NVL(db4.sl,0) pino

FROM sams.edu_school es

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
  AND ES.schoolid  IN ('10042226',
'10042720',
'10042156',
'10042158',
'10042277',
'10042279',
'10042233',
'10042235',
'10042196',
'10042167',
'10042195',
'10042315',
'1781',
'10042311',
'1506',
'10042164',
'10042276',
'10042275',
'10042177',
'10042194',
'10042213',
'10042240',
'10042467',
'10042175',
'10042201',
'10042140',
'10042220',
'10042278',
'10042414',
'10042728',
'1676',
'10042191',
'10042186',
'10042292',
'10042190',
'10042211',
'10042138',
'10042268',
'4030110',
'10042255',
'10042215',
'10042163'
) 
ORDER BY es.schoolid,es.schoolname