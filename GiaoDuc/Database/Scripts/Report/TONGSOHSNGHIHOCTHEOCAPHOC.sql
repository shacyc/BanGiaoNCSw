SELECT --eps.schoolid,
  COUNT(DISTINCT eps.pupilid)slhs 
  FROM saMS.edu_pupil_studytimeline eps
    JOIN sams.edu_pupil ep
    ON ep.pupilid = eps.pupilid
    AND ep.currentpupilstatusid = eps.currentpupilstatusid
    AND ep.isdeleted = 0 AND ep.isactive = 1
    JOIN sams.edu_schoolclass_new esn
    ON esn.schoolid = eps.schoolid
    AND esn.schoolclassid = eps.schoolclassid
    AND esn.schoolyearid = eps.schoolyearid
    AND esn.schooltermid = eps.schooltermid    
    --AND esn.classid IN (4,5,6,7,8) -- Tieu hoc
     -- AND esn.classid IN (9,10,11,12)
    AND esn.classid IN (13,14,15)
  WHERE eps.schoolyearid = 21
  AND eps.schooltermid = 2
  AND eps.currentpupilstatusid IN (4,6,7,8,9,10,11,12,13,14,15,17,18)
  AND eps.isdeleted = 0

  AND eps.isactive = 1
  --AND EPS.LINKSCHOOLID IS NULL
  --GROUP BY EPS.schoolid