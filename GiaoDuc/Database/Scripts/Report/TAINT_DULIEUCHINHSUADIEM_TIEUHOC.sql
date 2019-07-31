

SELECT 
  eps.pupilid,
  ep.fullname,
  TO_CHAR(ep.birthday,'dd/mm/yyyy') BIRTHDAY,
  eps.subjectid,
  es.subjectname,
  examtermmark,
  TO_CHAR(eps.updateddate,'dd/mm/yyyy') updateddate,
  eps.updateduser || '-' || su.fullname UPDATEUSER

  FROM sams.edu_pupil_subjectassess_log eps
 JOIN sams.edu_pupil ep
  ON ep.pupilid = eps.pupilid
  JOIN sams.edu_subject es
  ON es.subjectid = eps.subjectid
  JOIN sams.sys_user su
  ON su.username = eps.updateduser
WHERE eps.pupilid in (
SELECT pupilid FROM sams.edu_pupil ep
 
  WHERE currentschoolid = '4020404 '
  AND currentclassid = 8
  AND isactive = 1
  AND isdeleted = 0)
  AND schoolyearid = 21
  AND schooltermid = 2
  AND pupilassesstermid = 3
  AND eps.subjectid IN (27,29)

ORDER BY pupilid,updateddate
;