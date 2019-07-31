SELECT  md.districtname,es.schoolid ,es.schoolname,nvl( couNTschoolclass.slschoolclass,0) TOTALTTGDTX
  ,nvl(B2.slschoolclass,0) TOTALCLASSTHCS
  ,nvl(B3.sls10,0) TOTALCLASS10
  ,nvl(B4.sls11,0) TOTALCLASS11
  ,nvl(B5.sls12,0) TOTALCLASS12
  ,nvl(couNTpupil.slhs,0) TOTALPUPIL
  ,nvl(couNTpupilTHCS.slhs,0) TOTALPUPILTHCS

  ,nvl(countpupilk6.slhs,0) TOTALPUPILK6
  ,nvl(countpupilnuk6.slhs,0) TOTALPUPILNUK6
,nvl(countpupildtk6.slhs,0) TOTALPUPILDTK6
,nvl(countpupilnudtk6.slhs,0) TOTALPUPILNUDTK6
--- TREN18
 ,nvl(countpupilk6tren18.slhs,0) TOTALPUPILK6tren18
  ,nvl(countpupilnuk6tren18.slhs,0) TOTALPUPILNUK6tren18
,nvl(countpupildtk6tren18.slhs,0) TOTALPUPILDTK6tren18
,nvl(countpupilnudtk6tren18.slhs,0) TOTALPUPILNUDTK6tren18
--kHOI 7
  ,nvl(countpupilk7.slhs,0) TOTALPUPILK7
  ,nvl(countpupilnuk7.slhs,0) TOTALPUPILNUK7
,nvl(countpupildtk7.slhs,0) TOTALPUPILDTK7
,nvl(countpupilnudtk7.slhs,0) TOTALPUPILNUDTK7
--- TREN18
 ,nvl(countpupilk7tren18.slhs,0) TOTALPUPILK7tren18
  ,nvl(countpupilnuk7tren18.slhs,0) TOTALPUPILNUK7tren18
,nvl(countpupildtk7tren18.slhs,0) TOTALPUPILDTK7tren18
  ,nvl(countpupilnudtk7tren18.slhs,0) TOTALPUPILNUDTK7tren18
--KHOI 8
    ,nvl(countpupilk8.slhs,0) TOTALPUPILK8
  ,nvl(countpupilnuk8.slhs,0) TOTALPUPILNUK8
,nvl(countpupildtk8.slhs,0) TOTALPUPILDTK8
,nvl(countpupilnudtk8.slhs,0) TOTALPUPILNUDTK8
--- TREN18
 ,nvl(countpupilk8tren18.slhs,0) TOTALPUPILK8tren18
  ,nvl(countpupilnuk8tren18.slhs,0) TOTALPUPILNUK8tren18
,nvl(countpupildtk8tren18.slhs,0) TOTALPUPILDTK8tren18
  ,nvl(countpupilnudtk8tren18.slhs,0) TOTALPUPILNUDTK8tren18
-- KHOI 9

    ,nvl(countpupilk9.slhs,0) TOTALPUPILK9
  ,nvl(countpupilnuk9.slhs,0) TOTALPUPILNUK9
,nvl(countpupildtk9.slhs,0) TOTALPUPILDTK9
,nvl(countpupilnudtk9.slhs,0) TOTALPUPILNUDTK9
--- TREN18
 ,nvl(countpupilk9tren18.slhs,0) TOTALPUPILK9tren18
  ,nvl(countpupilnuk9tren18.slhs,0) TOTALPUPILNUK9tren18
,nvl(countpupildtk9tren18.slhs,0) TOTALPUPILDTK9tren18
  ,nvl(countpupilnudtk9tren18.slhs,0) TOTALPUPILNUDTK9tren18
-- TONG THPT
    ,nvl(couNTpupilTHPT.slhs,0) TOTALPUPILTHPT
-- KHOI 10

    ,nvl(countpupilk10.slhs,0) TOTALPUPILK10
  ,nvl(countpupilnuk10.slhs,0) TOTALPUPILNUK10
,nvl(countpupildtk10.slhs,0) TOTALPUPILDTK10
,nvl(countpupilnudtk10.slhs,0) TOTALPUPILNUDTK10
--- TREN18
-- ,nvl(countpupilk10tren18.slhs,0) TOTALPUPILK10tren18
--  ,nvl(countpupilnuk10tren18.slhs,0) TOTALPUPILNUK10tren18
--,nvl(countpupildtk10tren18.slhs,0) TOTALPUPILDTK10tren18
--  ,nvl(countpupilnudtk10tren18.slhs,0) TOTALPUPILNUDTK10tren18
  -- KHOI 11

    ,nvl(countpupilk11.slhs,0) TOTALPUPILK11
  ,nvl(countpupilnuk11.slhs,0) TOTALPUPILNUK11
,nvl(countpupildtk11.slhs,0) TOTALPUPILDTK11
,nvl(countpupilnudtk11.slhs,0) TOTALPUPILNUDTK11
--- TREN18
-- ,nvl(countpupilk11tren18.slhs,0) TOTALPUPILK11tren18
--  ,nvl(countpupilnuk11tren18.slhs,0) TOTALPUPILNUK11tren18
--,nvl(countpupildtk11tren18.slhs,0) TOTALPUPILDTK11tren18
--  ,nvl(countpupilnudtk11tren18.slhs,0) TOTALPUPILNUDTK11tren18
  --KHOI 12
  ,nvl(countpupilk12.slhs,0) TOTALPUPILK12
  ,nvl(countpupilnuk12.slhs,0) TOTALPUPILNUK12
,nvl(countpupildtk12.slhs,0) TOTALPUPILDTK12
,nvl(countpupilnudtk12.slhs,0) TOTALPUPILNUDTK12
--- TREN18
-- ,nvl(countpupilk12tren18.slhs,0) TOTALPUPILK12tren18
--  ,nvl(countpupilnuk12tren18.slhs,0) TOTALPUPILNUK12tren18
--,nvl(countpupildtk12tren18.slhs,0) TOTALPUPILDTK12tren18
--  ,nvl(countpupilnudtk12tren18.slhs,0) TOTALPUPILNUDTK12tren18

FROM sams.edu_school es
  LEFT JOIN SAMS.EDU_SCHOOL_EDUCATIONLEVEL ESE
    ON   ESE.SCHOOLID = ES.SCHOOLID

JOIN sams.md_organ mo
  ON es.organid = mo.organid
JOIN sams.md_district md
  ON mo.districtid = md.districtid
--LEFT
JOIN sams.md_organ mo1
  ON MO1.organid = mo.parentid
LEFT 
JOIN (
  SELECT esn.schoolid,  COUNT(DISTINCT esn.schoolclassid) slschoolclass 
  FROM saMS.edu_schoolclass_new esn
  WHERE esn.schoolyearid = 21
  AND esn.schooltermid = 2
  AND esn.isdeleted = 0
  AND esn.isactive = 1
     AND esn.classid in (16,17,18,19,20,21,22)
  GROUP BY esn.schoolid
  )couNTschoolclass
 ON es.schoolid = couNTschoolclass.schoolid
LEFT 
JOIN (
  SELECT esn.schoolid,  COUNT(DISTINCT esn.schoolclassid) slschoolclass 
  FROM saMS.edu_schoolclass_new esn
  WHERE esn.schoolyearid = 21
  AND esn.schooltermid = 2
  AND esn.isdeleted = 0
  AND esn.isactive = 1
     AND esn.classid in (19,20,21,22)
  GROUP BY esn.schoolid
  )B2
 ON es.schoolid = B2.schoolid

LEFT 
JOIN (
  SELECT esn.schoolid,  COUNT(DISTINCT esn.schoolclassid) sls10
  FROM saMS.edu_schoolclass_new esn
  WHERE esn.schoolyearid = 21
  AND esn.schooltermid = 2
  AND esn.isdeleted = 0
  AND esn.isactive = 1
     AND esn.classid = 16
  GROUP BY esn.schoolid
  )B3
 ON es.schoolid = B3.schoolid

LEFT 
JOIN (
  SELECT esn.schoolid,  COUNT(DISTINCT esn.schoolclassid) sls11
  FROM saMS.edu_schoolclass_new esn
  WHERE esn.schoolyearid = 21
  AND esn.schooltermid = 2
  AND esn.isdeleted = 0
  AND esn.isactive = 1
     AND esn.classid = 17
  GROUP BY esn.schoolid
  )B4
 ON es.schoolid = B4.schoolid
LEFT 
JOIN (
  SELECT esn.schoolid,  COUNT(DISTINCT esn.schoolclassid) sls12
  FROM saMS.edu_schoolclass_new esn
  WHERE esn.schoolyearid = 21
  AND esn.schooltermid = 2
  AND esn.isdeleted = 0
  AND esn.isactive = 1
     AND esn.classid = 18
  GROUP BY esn.schoolid
  )B5
 ON es.schoolid = B5.schoolid


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
  AND eps.isdeleted = 0
  AND eps.isactive = 1
  AND EPS.LINKSCHOOLID IS NULL
  GROUP BY EPS.schoolid
  )couNTpupil
 ON es.schoolid = couNTpupil.schoolid

  LEFT 
JOIN (
  SELECT eps.schoolid, COUNT(DISTINCT eps.pupilid)slhs 
  FROM saMS.edu_pupil_studytimeline eps
    JOIN sams.edu_schoolclass_new esn
    ON esn.schoolid = eps.schoolid
    AND esn.schoolclassid = eps.schoolclassid
    AND esn.schoolyearid = eps.schoolyearid
    AND esn.schooltermid = eps.schooltermid
    AND esn.classid IN (19,20,21,22)
  WHERE eps.schoolyearid = 21
  AND eps.schooltermid = 2
  AND currentpupilstatusid = 1
  AND eps.isdeleted = 0
  AND eps.isactive = 1
    AND EPS.LINKSCHOOLID IS NULL
  GROUP BY EPS.schoolid
  )couNTpupilTHCS
 ON es.schoolid = couNTpupilTHCS.schoolid

  LEFT 
JOIN (
  SELECT eps.schoolid, COUNT(DISTINCT eps.pupilid)slhs 
  FROM saMS.edu_pupil_studytimeline eps
    JOIN sams.edu_schoolclass_new esn
    ON esn.schoolid = eps.schoolid
    AND esn.schoolclassid = eps.schoolclassid
    AND esn.schoolyearid = eps.schoolyearid
    AND esn.schooltermid = eps.schooltermid
    AND esn.classid IN (16,17,18)
  WHERE eps.schoolyearid = 21
  AND eps.schooltermid = 2
  AND currentpupilstatusid = 1
  AND eps.isdeleted = 0
  AND eps.isactive = 1
    AND EPS.LINKSCHOOLID IS NULL
  GROUP BY EPS.schoolid
  )couNTpupilTHPT
 ON es.schoolid = couNTpupilTHPT.schoolid
--region HS KHOI6
  LEFT 
JOIN (
  SELECT eps.schoolid, COUNT(DISTINCT eps.pupilid)slhs 
  FROM saMS.edu_pupil_studytimeline eps
    JOIN sams.edu_schoolclass_new esn
    ON esn.schoolid = eps.schoolid
    AND esn.schoolclassid = eps.schoolclassid
    AND esn.schoolyearid = eps.schoolyearid
    AND esn.schooltermid = eps.schooltermid
    AND esn.classid = 19
  WHERE eps.schoolyearid = 21
  AND eps.schooltermid = 2
  AND currentpupilstatusid = 1
  AND eps.isdeleted = 0
  AND eps.isactive = 1
    AND EPS.LINKSCHOOLID IS NULL
  GROUP BY EPS.schoolid
  )couNTpupilK6
 ON es.schoolid = couNTpupilK6.schoolid

  LEFT 
JOIN (
  SELECT eps.schoolid, COUNT(DISTINCT eps.pupilid)slhs 
  FROM saMS.edu_pupil_studytimeline eps
    JOIN sams.edu_pupil ep
    ON ep.pupilid = eps.pupilid
    AND ep.gender = 1
    JOIN sams.edu_schoolclass_new esn
    ON esn.schoolid = eps.schoolid
    AND esn.schoolclassid = eps.schoolclassid
    AND esn.schoolyearid = eps.schoolyearid
    AND esn.schooltermid = eps.schooltermid
    AND esn.classid = 19
  WHERE eps.schoolyearid = 21
  AND eps.schooltermid = 2
  AND eps.currentpupilstatusid = 1
  AND eps.isdeleted = 0
  AND eps.isactive = 1
    AND EPS.LINKSCHOOLID IS NULL
  GROUP BY EPS.schoolid
  )couNTpupilNUK6
 ON es.schoolid = couNTpupilNUK6.schoolid
    LEFT 
JOIN (
  SELECT eps.schoolid, COUNT(DISTINCT eps.pupilid)slhs 
  FROM saMS.edu_pupil_studytimeline eps
    JOIN sams.edu_pupil ep
    ON ep.pupilid = eps.pupilid
    AND ep.ethnicityid <> 1

    JOIN sams.edu_schoolclass_new esn
    ON esn.schoolid = eps.schoolid
    AND esn.schoolclassid = eps.schoolclassid
    AND esn.schoolyearid = eps.schoolyearid
    AND esn.schooltermid = eps.schooltermid
    AND esn.classid = 19
  WHERE eps.schoolyearid = 21
  AND eps.schooltermid = 2
  AND eps.currentpupilstatusid = 1
  AND eps.isdeleted = 0
  AND eps.isactive = 1 AND EPS.LINKSCHOOLID IS NULL
  GROUP BY EPS.schoolid
  )couNTpupilDTK6
 ON es.schoolid = couNTpupilDTK6.schoolid

      LEFT 
JOIN (
  SELECT eps.schoolid, COUNT(DISTINCT eps.pupilid)slhs 
  FROM saMS.edu_pupil_studytimeline eps
    JOIN sams.edu_pupil ep
    ON ep.pupilid = eps.pupilid
    AND ep.ethnicityid <> 1
    AND ep.gender = 1
    JOIN sams.edu_schoolclass_new esn
    ON esn.schoolid = eps.schoolid
    AND esn.schoolclassid = eps.schoolclassid
    AND esn.schoolyearid = eps.schoolyearid
    AND esn.schooltermid = eps.schooltermid
    AND esn.classid = 19
  WHERE eps.schoolyearid = 21
  AND eps.schooltermid = 2
  AND eps.currentpupilstatusid = 1
  AND eps.isdeleted = 0
  AND eps.isactive = 1 AND EPS.LINKSCHOOLID IS NULL
  GROUP BY EPS.schoolid
  )couNTpupilNUDTK6
 ON es.schoolid = couNTpupilNUDTK6.schoolid
---- Tren 18 tuoi
  LEFT 
JOIN (
  SELECT eps.schoolid, COUNT(DISTINCT eps.pupilid)slhs 
  FROM saMS.edu_pupil_studytimeline eps
     JOIN sams.edu_pupil ep
    ON ep.pupilid = eps.pupilid
    JOIN sams.edu_schoolclass_new esn
    ON esn.schoolid = eps.schoolid
    AND esn.schoolclassid = eps.schoolclassid
    AND esn.schoolyearid = eps.schoolyearid
    AND esn.schooltermid = eps.schooltermid
    AND esn.classid = 19
  WHERE eps.schoolyearid = 21
  AND eps.schooltermid = 2
  AND EPS.currentpupilstatusid = 1
  AND eps.isdeleted = 0
  AND eps.isactive = 1 AND EPS.LINKSCHOOLID IS NULL
  AND   EXTRACT(YEAR FROM ep.BIRTHDAY) <= 2001
  GROUP BY EPS.schoolid
  )couNTpupilK6TREN18
 ON es.schoolid = couNTpupilK6TREN18.schoolid

  LEFT 
JOIN (
  SELECT eps.schoolid, COUNT(DISTINCT eps.pupilid)slhs 
  FROM saMS.edu_pupil_studytimeline eps
    JOIN sams.edu_pupil ep
    ON ep.pupilid = eps.pupilid
    AND ep.gender = 1
    JOIN sams.edu_schoolclass_new esn
    ON esn.schoolid = eps.schoolid
    AND esn.schoolclassid = eps.schoolclassid
    AND esn.schoolyearid = eps.schoolyearid
    AND esn.schooltermid = eps.schooltermid
    AND esn.classid = 19
  WHERE eps.schoolyearid = 21
  AND eps.schooltermid = 2
  AND eps.currentpupilstatusid = 1
  AND eps.isdeleted = 0
  AND eps.isactive = 1 AND EPS.LINKSCHOOLID IS NULL
  AND   EXTRACT(YEAR FROM ep.BIRTHDAY) <= 2001
  GROUP BY EPS.schoolid
  )couNTpupilNUK6TREN18
 ON es.schoolid = couNTpupilNUK6TREN18.schoolid
    LEFT 
JOIN (
  SELECT eps.schoolid, COUNT(DISTINCT eps.pupilid)slhs 
  FROM saMS.edu_pupil_studytimeline eps
    JOIN sams.edu_pupil ep
    ON ep.pupilid = eps.pupilid
    AND ep.ethnicityid <> 1

    JOIN sams.edu_schoolclass_new esn
    ON esn.schoolid = eps.schoolid
    AND esn.schoolclassid = eps.schoolclassid
    AND esn.schoolyearid = eps.schoolyearid
    AND esn.schooltermid = eps.schooltermid
    AND esn.classid = 19
  WHERE eps.schoolyearid = 21
  AND eps.schooltermid = 2
  AND eps.currentpupilstatusid = 1
  AND eps.isdeleted = 0
  AND eps.isactive = 1 AND EPS.LINKSCHOOLID IS NULL
  AND   EXTRACT(YEAR FROM ep.BIRTHDAY) <= 2001
  GROUP BY EPS.schoolid
  )couNTpupilDTK6TREN18
 ON es.schoolid = couNTpupilDTK6TREN18.schoolid

      LEFT 
JOIN (
  SELECT eps.schoolid, COUNT(DISTINCT eps.pupilid)slhs 
  FROM saMS.edu_pupil_studytimeline eps
    JOIN sams.edu_pupil ep
    ON ep.pupilid = eps.pupilid
    AND ep.ethnicityid <> 1
    AND ep.gender = 1
    JOIN sams.edu_schoolclass_new esn
    ON esn.schoolid = eps.schoolid
    AND esn.schoolclassid = eps.schoolclassid
    AND esn.schoolyearid = eps.schoolyearid
    AND esn.schooltermid = eps.schooltermid
    AND esn.classid = 19
  WHERE eps.schoolyearid = 21
  AND eps.schooltermid = 2
  AND eps.currentpupilstatusid = 1
  AND eps.isdeleted = 0
  AND eps.isactive = 1 AND EPS.LINKSCHOOLID IS NULL
  AND   EXTRACT(YEAR FROM ep.BIRTHDAY) <= 2001
  GROUP BY EPS.schoolid
  )couNTpupilNUDTK6TREN18
 ON es.schoolid = couNTpupilNUDTK6TREN18.schoolid



--endregion
--kHOI 7
--region HS KHOI7
  LEFT 
JOIN (
  SELECT eps.schoolid, COUNT(DISTINCT eps.pupilid)slhs 
  FROM saMS.edu_pupil_studytimeline eps
    JOIN sams.edu_schoolclass_new esn
    ON esn.schoolid = eps.schoolid
    AND esn.schoolclassid = eps.schoolclassid
    AND esn.schoolyearid = eps.schoolyearid
    AND esn.schooltermid = eps.schooltermid
    AND esn.classid = 20
  WHERE eps.schoolyearid = 21
  AND eps.schooltermid = 2
  AND currentpupilstatusid = 1
  AND eps.isdeleted = 0
  AND eps.isactive = 1 AND EPS.LINKSCHOOLID IS NULL
  GROUP BY EPS.schoolid
  )couNTpupilK7
 ON es.schoolid = couNTpupilK7.schoolid

  LEFT 
JOIN (
  SELECT eps.schoolid, COUNT(DISTINCT eps.pupilid)slhs 
  FROM saMS.edu_pupil_studytimeline eps
    JOIN sams.edu_pupil ep
    ON ep.pupilid = eps.pupilid
    AND ep.gender = 1
    JOIN sams.edu_schoolclass_new esn
    ON esn.schoolid = eps.schoolid
    AND esn.schoolclassid = eps.schoolclassid
    AND esn.schoolyearid = eps.schoolyearid
    AND esn.schooltermid = eps.schooltermid
    AND esn.classid = 20
  WHERE eps.schoolyearid = 21
  AND eps.schooltermid = 2
  AND eps.currentpupilstatusid = 1
  AND eps.isdeleted = 0
  AND eps.isactive = 1 AND EPS.LINKSCHOOLID IS NULL
  GROUP BY EPS.schoolid
  )couNTpupilNUK7
 ON es.schoolid = couNTpupilNUK7.schoolid
    LEFT 
JOIN (
  SELECT eps.schoolid, COUNT(DISTINCT eps.pupilid)slhs 
  FROM saMS.edu_pupil_studytimeline eps
    JOIN sams.edu_pupil ep
    ON ep.pupilid = eps.pupilid
    AND ep.ethnicityid <> 1

    JOIN sams.edu_schoolclass_new esn
    ON esn.schoolid = eps.schoolid
    AND esn.schoolclassid = eps.schoolclassid
    AND esn.schoolyearid = eps.schoolyearid
    AND esn.schooltermid = eps.schooltermid
    AND esn.classid = 20
  WHERE eps.schoolyearid = 21
  AND eps.schooltermid = 2
  AND eps.currentpupilstatusid = 1
  AND eps.isdeleted = 0
  AND eps.isactive = 1 AND EPS.LINKSCHOOLID IS NULL
  GROUP BY EPS.schoolid
  )couNTpupilDTK7
 ON es.schoolid = couNTpupilDTK7.schoolid

      LEFT 
JOIN (
  SELECT eps.schoolid, COUNT(DISTINCT eps.pupilid)slhs 
  FROM saMS.edu_pupil_studytimeline eps
    JOIN sams.edu_pupil ep
    ON ep.pupilid = eps.pupilid
    AND ep.ethnicityid <> 1
    AND ep.gender = 1
    JOIN sams.edu_schoolclass_new esn
    ON esn.schoolid = eps.schoolid
    AND esn.schoolclassid = eps.schoolclassid
    AND esn.schoolyearid = eps.schoolyearid
    AND esn.schooltermid = eps.schooltermid
    AND esn.classid = 20
  WHERE eps.schoolyearid = 21
  AND eps.schooltermid = 2
  AND eps.currentpupilstatusid = 1
  AND eps.isdeleted = 0
  AND eps.isactive = 1 AND EPS.LINKSCHOOLID IS NULL
  GROUP BY EPS.schoolid
  )couNTpupilNUDTK7
 ON es.schoolid = couNTpupilNUDTK7.schoolid
---- Tren 18 tuoi
  LEFT 
JOIN (
  SELECT eps.schoolid, COUNT(DISTINCT eps.pupilid)slhs 
  FROM saMS.edu_pupil_studytimeline eps
     JOIN sams.edu_pupil ep
    ON ep.pupilid = eps.pupilid
    JOIN sams.edu_schoolclass_new esn
    ON esn.schoolid = eps.schoolid
    AND esn.schoolclassid = eps.schoolclassid
    AND esn.schoolyearid = eps.schoolyearid
    AND esn.schooltermid = eps.schooltermid
    AND esn.classid = 20
  WHERE eps.schoolyearid = 21
  AND eps.schooltermid = 2
  AND EPS.currentpupilstatusid = 1
  AND eps.isdeleted = 0
  AND eps.isactive = 1 AND EPS.LINKSCHOOLID IS NULL
  AND   EXTRACT(YEAR FROM ep.BIRTHDAY) <= 2001
  GROUP BY EPS.schoolid
  )couNTpupilK7TREN18
 ON es.schoolid = couNTpupilK7TREN18.schoolid

  LEFT 
JOIN (
  SELECT eps.schoolid, COUNT(DISTINCT eps.pupilid)slhs 
  FROM saMS.edu_pupil_studytimeline eps
    JOIN sams.edu_pupil ep
    ON ep.pupilid = eps.pupilid
    AND ep.gender = 1
    JOIN sams.edu_schoolclass_new esn
    ON esn.schoolid = eps.schoolid
    AND esn.schoolclassid = eps.schoolclassid
    AND esn.schoolyearid = eps.schoolyearid
    AND esn.schooltermid = eps.schooltermid
    AND esn.classid = 20
  WHERE eps.schoolyearid = 21
  AND eps.schooltermid = 2
  AND eps.currentpupilstatusid = 1
  AND eps.isdeleted = 0
  AND eps.isactive = 1 AND EPS.LINKSCHOOLID IS NULL
  AND   EXTRACT(YEAR FROM ep.BIRTHDAY) <= 2001
  GROUP BY EPS.schoolid
  )couNTpupilNUK7TREN18
 ON es.schoolid = couNTpupilNUK7TREN18.schoolid
    LEFT 
JOIN (
  SELECT eps.schoolid, COUNT(DISTINCT eps.pupilid)slhs 
  FROM saMS.edu_pupil_studytimeline eps
    JOIN sams.edu_pupil ep
    ON ep.pupilid = eps.pupilid
    AND ep.ethnicityid <> 1

    JOIN sams.edu_schoolclass_new esn
    ON esn.schoolid = eps.schoolid
    AND esn.schoolclassid = eps.schoolclassid
    AND esn.schoolyearid = eps.schoolyearid
    AND esn.schooltermid = eps.schooltermid
    AND esn.classid = 20
  WHERE eps.schoolyearid = 21
  AND eps.schooltermid = 2
  AND eps.currentpupilstatusid = 1
  AND eps.isdeleted = 0
  AND eps.isactive = 1 AND EPS.LINKSCHOOLID IS NULL
  AND   EXTRACT(YEAR FROM ep.BIRTHDAY) <= 2001
  GROUP BY EPS.schoolid
  )couNTpupilDTK7TREN18
 ON es.schoolid = couNTpupilDTK7TREN18.schoolid

      LEFT 
JOIN (
  SELECT eps.schoolid, COUNT(DISTINCT eps.pupilid)slhs 
  FROM saMS.edu_pupil_studytimeline eps
    JOIN sams.edu_pupil ep
    ON ep.pupilid = eps.pupilid
    AND ep.ethnicityid <> 1
    AND ep.gender = 1
    JOIN sams.edu_schoolclass_new esn
    ON esn.schoolid = eps.schoolid
    AND esn.schoolclassid = eps.schoolclassid
    AND esn.schoolyearid = eps.schoolyearid
    AND esn.schooltermid = eps.schooltermid
    AND esn.classid = 20
  WHERE eps.schoolyearid = 21
  AND eps.schooltermid = 2
  AND eps.currentpupilstatusid = 1
  AND eps.isdeleted = 0
  AND eps.isactive = 1 AND EPS.LINKSCHOOLID IS NULL
  AND   EXTRACT(YEAR FROM ep.BIRTHDAY) <= 2001
  GROUP BY EPS.schoolid
  )couNTpupilNUDTK7TREN18
 ON es.schoolid = couNTpupilNUDTK7TREN18.schoolid


--endregion

--KHOI 8
--region HS KHOI8
  LEFT 
JOIN (
  SELECT eps.schoolid, COUNT(DISTINCT eps.pupilid)slhs 
  FROM saMS.edu_pupil_studytimeline eps
    JOIN sams.edu_schoolclass_new esn
    ON esn.schoolid = eps.schoolid
    AND esn.schoolclassid = eps.schoolclassid
    AND esn.schoolyearid = eps.schoolyearid
    AND esn.schooltermid = eps.schooltermid
    AND esn.classid = 21
  WHERE eps.schoolyearid = 21
  AND eps.schooltermid = 2
  AND currentpupilstatusid = 1
  AND eps.isdeleted = 0 AND EPS.LINKSCHOOLID IS NULL
  AND eps.isactive = 1
  GROUP BY EPS.schoolid
  )couNTpupilK8
 ON es.schoolid = couNTpupilK8.schoolid

  LEFT 
JOIN (
  SELECT eps.schoolid, COUNT(DISTINCT eps.pupilid)slhs 
  FROM saMS.edu_pupil_studytimeline eps
    JOIN sams.edu_pupil ep
    ON ep.pupilid = eps.pupilid
    AND ep.gender = 1
    JOIN sams.edu_schoolclass_new esn
    ON esn.schoolid = eps.schoolid
    AND esn.schoolclassid = eps.schoolclassid
    AND esn.schoolyearid = eps.schoolyearid
    AND esn.schooltermid = eps.schooltermid
    AND esn.classid = 21
  WHERE eps.schoolyearid = 21
  AND eps.schooltermid = 2
  AND eps.currentpupilstatusid = 1
  AND eps.isdeleted = 0
  AND eps.isactive = 1 AND EPS.LINKSCHOOLID IS NULL
  GROUP BY EPS.schoolid
  )couNTpupilNUK8
 ON es.schoolid = couNTpupilNUK8.schoolid
    LEFT 
JOIN (
  SELECT eps.schoolid, COUNT(DISTINCT eps.pupilid)slhs 
  FROM saMS.edu_pupil_studytimeline eps
    JOIN sams.edu_pupil ep
    ON ep.pupilid = eps.pupilid
    AND ep.ethnicityid <> 1

    JOIN sams.edu_schoolclass_new esn
    ON esn.schoolid = eps.schoolid
    AND esn.schoolclassid = eps.schoolclassid
    AND esn.schoolyearid = eps.schoolyearid
    AND esn.schooltermid = eps.schooltermid
    AND esn.classid = 21
  WHERE eps.schoolyearid = 21
  AND eps.schooltermid = 2
  AND eps.currentpupilstatusid = 1
  AND eps.isdeleted = 0 AND EPS.LINKSCHOOLID IS NULL
  AND eps.isactive = 1
  GROUP BY EPS.schoolid
  )couNTpupilDTK8
 ON es.schoolid = couNTpupilDTK8.schoolid

      LEFT 
JOIN (
  SELECT eps.schoolid, COUNT(DISTINCT eps.pupilid)slhs 
  FROM saMS.edu_pupil_studytimeline eps
    JOIN sams.edu_pupil ep
    ON ep.pupilid = eps.pupilid
    AND ep.ethnicityid <> 1
    AND ep.gender = 1
    JOIN sams.edu_schoolclass_new esn
    ON esn.schoolid = eps.schoolid
    AND esn.schoolclassid = eps.schoolclassid
    AND esn.schoolyearid = eps.schoolyearid
    AND esn.schooltermid = eps.schooltermid
    AND esn.classid = 21
  WHERE eps.schoolyearid = 21
  AND eps.schooltermid = 2
  AND eps.currentpupilstatusid = 1
  AND eps.isdeleted = 0
  AND eps.isactive = 1 AND EPS.LINKSCHOOLID IS NULL
  GROUP BY EPS.schoolid
  )couNTpupilNUDTK8
 ON es.schoolid = couNTpupilNUDTK8.schoolid
---- Tren 18 tuoi
  LEFT 
JOIN (
  SELECT eps.schoolid, COUNT(DISTINCT eps.pupilid)slhs 
  FROM saMS.edu_pupil_studytimeline eps
     JOIN sams.edu_pupil ep
    ON ep.pupilid = eps.pupilid
    JOIN sams.edu_schoolclass_new esn
    ON esn.schoolid = eps.schoolid
    AND esn.schoolclassid = eps.schoolclassid
    AND esn.schoolyearid = eps.schoolyearid
    AND esn.schooltermid = eps.schooltermid
    AND esn.classid = 21
  WHERE eps.schoolyearid = 21
  AND eps.schooltermid = 2
  AND EPS.currentpupilstatusid = 1
  AND eps.isdeleted = 0
  AND eps.isactive = 1 AND EPS.LINKSCHOOLID IS NULL
  AND   EXTRACT(YEAR FROM ep.BIRTHDAY) <= 2001
  GROUP BY EPS.schoolid
  )couNTpupilK8TREN18
 ON es.schoolid = couNTpupilK8TREN18.schoolid

  LEFT 
JOIN (
  SELECT eps.schoolid, COUNT(DISTINCT eps.pupilid)slhs 
  FROM saMS.edu_pupil_studytimeline eps
    JOIN sams.edu_pupil ep
    ON ep.pupilid = eps.pupilid
    AND ep.gender = 1
    JOIN sams.edu_schoolclass_new esn
    ON esn.schoolid = eps.schoolid
    AND esn.schoolclassid = eps.schoolclassid
    AND esn.schoolyearid = eps.schoolyearid
    AND esn.schooltermid = eps.schooltermid
    AND esn.classid = 21
  WHERE eps.schoolyearid = 21
  AND eps.schooltermid = 2
  AND eps.currentpupilstatusid = 1
  AND eps.isdeleted = 0
  AND eps.isactive = 1 AND EPS.LINKSCHOOLID IS NULL
  AND   EXTRACT(YEAR FROM ep.BIRTHDAY) <= 2001
  GROUP BY EPS.schoolid
  )couNTpupilNUK8TREN18
 ON es.schoolid = couNTpupilNUK8TREN18.schoolid
    LEFT 
JOIN (
  SELECT eps.schoolid, COUNT(DISTINCT eps.pupilid)slhs 
  FROM saMS.edu_pupil_studytimeline eps
    JOIN sams.edu_pupil ep
    ON ep.pupilid = eps.pupilid
    AND ep.ethnicityid <> 1

    JOIN sams.edu_schoolclass_new esn
    ON esn.schoolid = eps.schoolid
    AND esn.schoolclassid = eps.schoolclassid
    AND esn.schoolyearid = eps.schoolyearid
    AND esn.schooltermid = eps.schooltermid
    AND esn.classid = 21
  WHERE eps.schoolyearid = 21
  AND eps.schooltermid = 2
  AND eps.currentpupilstatusid = 1
  AND eps.isdeleted = 0
  AND eps.isactive = 1 AND EPS.LINKSCHOOLID IS NULL
  AND   EXTRACT(YEAR FROM ep.BIRTHDAY) <= 2001
  GROUP BY EPS.schoolid
  )couNTpupilDTK8TREN18
 ON es.schoolid = couNTpupilDTK8TREN18.schoolid

      LEFT 
JOIN (
  SELECT eps.schoolid, COUNT(DISTINCT eps.pupilid)slhs 
  FROM saMS.edu_pupil_studytimeline eps
    JOIN sams.edu_pupil ep
    ON ep.pupilid = eps.pupilid
    AND ep.ethnicityid <> 1
    AND ep.gender = 1
    JOIN sams.edu_schoolclass_new esn
    ON esn.schoolid = eps.schoolid
    AND esn.schoolclassid = eps.schoolclassid
    AND esn.schoolyearid = eps.schoolyearid
    AND esn.schooltermid = eps.schooltermid
    AND esn.classid = 21
  WHERE eps.schoolyearid = 21
  AND eps.schooltermid = 2
  AND eps.currentpupilstatusid = 1
  AND eps.isdeleted = 0
  AND eps.isactive = 1 AND EPS.LINKSCHOOLID IS NULL
  AND   EXTRACT(YEAR FROM ep.BIRTHDAY) <= 2001
  GROUP BY EPS.schoolid
  )couNTpupilNUDTK8TREN18
 ON es.schoolid = couNTpupilNUDTK8TREN18.schoolid

--endregion

-- KHOI 9
--region HS KHOI9
  LEFT 
JOIN (
  SELECT eps.schoolid, COUNT(DISTINCT eps.pupilid)slhs 
  FROM saMS.edu_pupil_studytimeline eps
    JOIN sams.edu_schoolclass_new esn
    ON esn.schoolid = eps.schoolid
    AND esn.schoolclassid = eps.schoolclassid
    AND esn.schoolyearid = eps.schoolyearid
    AND esn.schooltermid = eps.schooltermid
    AND esn.classid = 22
  WHERE eps.schoolyearid = 21
  AND eps.schooltermid = 2
  AND currentpupilstatusid = 1
  AND eps.isdeleted = 0
  AND eps.isactive = 1 AND EPS.LINKSCHOOLID IS NULL
  GROUP BY EPS.schoolid
  )couNTpupilK9
 ON es.schoolid = couNTpupilK9.schoolid

  LEFT 
JOIN (
  SELECT eps.schoolid, COUNT(DISTINCT eps.pupilid)slhs 
  FROM saMS.edu_pupil_studytimeline eps
    JOIN sams.edu_pupil ep
    ON ep.pupilid = eps.pupilid
    AND ep.gender = 1
    JOIN sams.edu_schoolclass_new esn
    ON esn.schoolid = eps.schoolid
    AND esn.schoolclassid = eps.schoolclassid
    AND esn.schoolyearid = eps.schoolyearid
    AND esn.schooltermid = eps.schooltermid
    AND esn.classid = 22
  WHERE eps.schoolyearid = 21
  AND eps.schooltermid = 2
  AND eps.currentpupilstatusid = 1
  AND eps.isdeleted = 0
  AND eps.isactive = 1 AND EPS.LINKSCHOOLID IS NULL
  GROUP BY EPS.schoolid
  )couNTpupilNUK9
 ON es.schoolid = couNTpupilNUK9.schoolid
    LEFT 
JOIN (
  SELECT eps.schoolid, COUNT(DISTINCT eps.pupilid)slhs 
  FROM saMS.edu_pupil_studytimeline eps
    JOIN sams.edu_pupil ep
    ON ep.pupilid = eps.pupilid
    AND ep.ethnicityid <> 1

    JOIN sams.edu_schoolclass_new esn
    ON esn.schoolid = eps.schoolid
    AND esn.schoolclassid = eps.schoolclassid
    AND esn.schoolyearid = eps.schoolyearid
    AND esn.schooltermid = eps.schooltermid
    AND esn.classid = 22
  WHERE eps.schoolyearid = 21
  AND eps.schooltermid = 2
  AND eps.currentpupilstatusid = 1
  AND eps.isdeleted = 0
  AND eps.isactive = 1 AND EPS.LINKSCHOOLID IS NULL
  GROUP BY EPS.schoolid
  )couNTpupilDTK9
 ON es.schoolid = couNTpupilDTK9.schoolid

      LEFT 
JOIN (
  SELECT eps.schoolid, COUNT(DISTINCT eps.pupilid)slhs 
  FROM saMS.edu_pupil_studytimeline eps
    JOIN sams.edu_pupil ep
    ON ep.pupilid = eps.pupilid
    AND ep.ethnicityid <> 1
    AND ep.gender = 1
    JOIN sams.edu_schoolclass_new esn
    ON esn.schoolid = eps.schoolid
    AND esn.schoolclassid = eps.schoolclassid
    AND esn.schoolyearid = eps.schoolyearid
    AND esn.schooltermid = eps.schooltermid
    AND esn.classid = 22
  WHERE eps.schoolyearid = 21
  AND eps.schooltermid = 2
  AND eps.currentpupilstatusid = 1
  AND eps.isdeleted = 0
  AND eps.isactive = 1 AND EPS.LINKSCHOOLID IS NULL
  GROUP BY EPS.schoolid
  )couNTpupilNUDTK9
 ON es.schoolid = couNTpupilNUDTK9.schoolid
---- Tren 18 tuoi
  LEFT 
JOIN (
  SELECT eps.schoolid, COUNT(DISTINCT eps.pupilid)slhs 
  FROM saMS.edu_pupil_studytimeline eps
     JOIN sams.edu_pupil ep
    ON ep.pupilid = eps.pupilid
    JOIN sams.edu_schoolclass_new esn
    ON esn.schoolid = eps.schoolid
    AND esn.schoolclassid = eps.schoolclassid
    AND esn.schoolyearid = eps.schoolyearid
    AND esn.schooltermid = eps.schooltermid
    AND esn.classid = 22
  WHERE eps.schoolyearid = 21
  AND eps.schooltermid = 2
  AND EPS.currentpupilstatusid = 1
  AND eps.isdeleted = 0
  AND eps.isactive = 1 AND EPS.LINKSCHOOLID IS NULL
  AND   EXTRACT(YEAR FROM ep.BIRTHDAY) <= 2001
  GROUP BY EPS.schoolid
  )couNTpupilK9TREN18
 ON es.schoolid = couNTpupilK9TREN18.schoolid

  LEFT 
JOIN (
  SELECT eps.schoolid, COUNT(DISTINCT eps.pupilid)slhs 
  FROM saMS.edu_pupil_studytimeline eps
    JOIN sams.edu_pupil ep
    ON ep.pupilid = eps.pupilid
    AND ep.gender = 1
    JOIN sams.edu_schoolclass_new esn
    ON esn.schoolid = eps.schoolid
    AND esn.schoolclassid = eps.schoolclassid
    AND esn.schoolyearid = eps.schoolyearid
    AND esn.schooltermid = eps.schooltermid
    AND esn.classid = 22
  WHERE eps.schoolyearid = 21
  AND eps.schooltermid = 2
  AND eps.currentpupilstatusid = 1
  AND eps.isdeleted = 0
  AND eps.isactive = 1 AND EPS.LINKSCHOOLID IS NULL
  AND   EXTRACT(YEAR FROM ep.BIRTHDAY) <= 2001
  GROUP BY EPS.schoolid
  )couNTpupilNUK9TREN18
 ON es.schoolid = couNTpupilNUK9TREN18.schoolid
    LEFT 
JOIN (
  SELECT eps.schoolid, COUNT(DISTINCT eps.pupilid)slhs 
  FROM saMS.edu_pupil_studytimeline eps
    JOIN sams.edu_pupil ep
    ON ep.pupilid = eps.pupilid
    AND ep.ethnicityid <> 1

    JOIN sams.edu_schoolclass_new esn
    ON esn.schoolid = eps.schoolid
    AND esn.schoolclassid = eps.schoolclassid
    AND esn.schoolyearid = eps.schoolyearid
    AND esn.schooltermid = eps.schooltermid
    AND esn.classid = 22
  WHERE eps.schoolyearid = 21
  AND eps.schooltermid = 2
  AND eps.currentpupilstatusid = 1
  AND eps.isdeleted = 0
  AND eps.isactive = 1 AND EPS.LINKSCHOOLID IS NULL
  AND   EXTRACT(YEAR FROM ep.BIRTHDAY) <= 2001
  GROUP BY EPS.schoolid
  )couNTpupilDTK9TREN18
 ON es.schoolid = couNTpupilDTK9TREN18.schoolid

      LEFT 
JOIN (
  SELECT eps.schoolid, COUNT(DISTINCT eps.pupilid)slhs 
  FROM saMS.edu_pupil_studytimeline eps
    JOIN sams.edu_pupil ep
    ON ep.pupilid = eps.pupilid
    AND ep.ethnicityid <> 1
    AND ep.gender = 1
    JOIN sams.edu_schoolclass_new esn
    ON esn.schoolid = eps.schoolid
    AND esn.schoolclassid = eps.schoolclassid
    AND esn.schoolyearid = eps.schoolyearid
    AND esn.schooltermid = eps.schooltermid
    AND esn.classid = 22
  WHERE eps.schoolyearid = 21
  AND eps.schooltermid = 2
  AND eps.currentpupilstatusid = 1
  AND eps.isdeleted = 0
  AND eps.isactive = 1 AND EPS.LINKSCHOOLID IS NULL
  AND   EXTRACT(YEAR FROM ep.BIRTHDAY) <= 2001
  GROUP BY EPS.schoolid
  )couNTpupilNUDTK9TREN18
 ON es.schoolid = couNTpupilNUDTK9TREN18.schoolid

--endregion
  --KHOI 10
--region HS KHOI10
  LEFT 
JOIN (
  SELECT eps.schoolid, COUNT(DISTINCT eps.pupilid)slhs 
  FROM saMS.edu_pupil_studytimeline eps
    JOIN sams.edu_schoolclass_new esn
    ON esn.schoolid = eps.schoolid
    AND esn.schoolclassid = eps.schoolclassid
    AND esn.schoolyearid = eps.schoolyearid
    AND esn.schooltermid = eps.schooltermid
    AND esn.classid = 16
  WHERE eps.schoolyearid = 21
  AND eps.schooltermid = 2
  AND currentpupilstatusid = 1
  AND eps.isdeleted = 0
  AND eps.isactive = 1 AND EPS.LINKSCHOOLID IS NULL
  GROUP BY EPS.schoolid
  )couNTpupilK10
 ON es.schoolid = couNTpupilK10.schoolid

  LEFT 
JOIN (
  SELECT eps.schoolid, COUNT(DISTINCT eps.pupilid)slhs 
  FROM saMS.edu_pupil_studytimeline eps
    JOIN sams.edu_pupil ep
    ON ep.pupilid = eps.pupilid
    AND ep.gender = 1
    JOIN sams.edu_schoolclass_new esn
    ON esn.schoolid = eps.schoolid
    AND esn.schoolclassid = eps.schoolclassid
    AND esn.schoolyearid = eps.schoolyearid
    AND esn.schooltermid = eps.schooltermid
    AND esn.classid = 16
  WHERE eps.schoolyearid = 21
  AND eps.schooltermid = 2
  AND eps.currentpupilstatusid = 1
  AND eps.isdeleted = 0
  AND eps.isactive = 1 AND EPS.LINKSCHOOLID IS NULL
  GROUP BY EPS.schoolid
  )couNTpupilNUK10
 ON es.schoolid = couNTpupilNUK10.schoolid
    LEFT 
JOIN (
  SELECT eps.schoolid, COUNT(DISTINCT eps.pupilid)slhs 
  FROM saMS.edu_pupil_studytimeline eps
    JOIN sams.edu_pupil ep
    ON ep.pupilid = eps.pupilid
    AND ep.ethnicityid <> 1

    JOIN sams.edu_schoolclass_new esn
    ON esn.schoolid = eps.schoolid
    AND esn.schoolclassid = eps.schoolclassid
    AND esn.schoolyearid = eps.schoolyearid
    AND esn.schooltermid = eps.schooltermid
    AND esn.classid = 16
  WHERE eps.schoolyearid = 21
  AND eps.schooltermid = 2
  AND eps.currentpupilstatusid = 1
  AND eps.isdeleted = 0
  AND eps.isactive = 1 AND EPS.LINKSCHOOLID IS NULL
  GROUP BY EPS.schoolid
  )couNTpupilDTK10
 ON es.schoolid = couNTpupilDTK10.schoolid

      LEFT 
JOIN (
  SELECT eps.schoolid, COUNT(DISTINCT eps.pupilid)slhs 
  FROM saMS.edu_pupil_studytimeline eps
    JOIN sams.edu_pupil ep
    ON ep.pupilid = eps.pupilid
    AND ep.ethnicityid <> 1
    AND ep.gender = 1
    JOIN sams.edu_schoolclass_new esn
    ON esn.schoolid = eps.schoolid
    AND esn.schoolclassid = eps.schoolclassid
    AND esn.schoolyearid = eps.schoolyearid
    AND esn.schooltermid = eps.schooltermid
    AND esn.classid = 16
  WHERE eps.schoolyearid = 21
  AND eps.schooltermid = 2
  AND eps.currentpupilstatusid = 1
  AND eps.isdeleted = 0
  AND eps.isactive = 1 AND EPS.LINKSCHOOLID IS NULL
  GROUP BY EPS.schoolid
  )couNTpupilNUDTK10
 ON es.schoolid = couNTpupilNUDTK10.schoolid
---- Tren 18 tuoi
  LEFT 
JOIN (
  SELECT eps.schoolid, COUNT(DISTINCT eps.pupilid)slhs 
  FROM saMS.edu_pupil_studytimeline eps
     JOIN sams.edu_pupil ep
    ON ep.pupilid = eps.pupilid
    JOIN sams.edu_schoolclass_new esn
    ON esn.schoolid = eps.schoolid
    AND esn.schoolclassid = eps.schoolclassid
    AND esn.schoolyearid = eps.schoolyearid
    AND esn.schooltermid = eps.schooltermid
    AND esn.classid = 16
  WHERE eps.schoolyearid = 21
  AND eps.schooltermid = 2 AND EPS.LINKSCHOOLID IS NULL
  AND EPS.currentpupilstatusid = 1
  AND eps.isdeleted = 0
  AND eps.isactive = 1
  AND   EXTRACT(YEAR FROM ep.BIRTHDAY) <= 2001
  GROUP BY EPS.schoolid
  )couNTpupilK10TREN18
 ON es.schoolid = couNTpupilK10TREN18.schoolid

  LEFT 
JOIN (
  SELECT eps.schoolid, COUNT(DISTINCT eps.pupilid)slhs 
  FROM saMS.edu_pupil_studytimeline eps
    JOIN sams.edu_pupil ep
    ON ep.pupilid = eps.pupilid
    AND ep.gender = 1
    JOIN sams.edu_schoolclass_new esn
    ON esn.schoolid = eps.schoolid
    AND esn.schoolclassid = eps.schoolclassid
    AND esn.schoolyearid = eps.schoolyearid
    AND esn.schooltermid = eps.schooltermid
    AND esn.classid = 16
  WHERE eps.schoolyearid = 21
  AND eps.schooltermid = 2
  AND eps.currentpupilstatusid = 1
  AND eps.isdeleted = 0
  AND eps.isactive = 1 AND EPS.LINKSCHOOLID IS NULL
  AND   EXTRACT(YEAR FROM ep.BIRTHDAY) <= 2001
  GROUP BY EPS.schoolid
  )couNTpupilNUK10TREN18
 ON es.schoolid = couNTpupilNUK10TREN18.schoolid
    LEFT 
JOIN (
  SELECT eps.schoolid, COUNT(DISTINCT eps.pupilid)slhs 
  FROM saMS.edu_pupil_studytimeline eps
    JOIN sams.edu_pupil ep
    ON ep.pupilid = eps.pupilid
    AND ep.ethnicityid <> 1

    JOIN sams.edu_schoolclass_new esn
    ON esn.schoolid = eps.schoolid
    AND esn.schoolclassid = eps.schoolclassid
    AND esn.schoolyearid = eps.schoolyearid
    AND esn.schooltermid = eps.schooltermid
    AND esn.classid = 16
  WHERE eps.schoolyearid = 21
  AND eps.schooltermid = 2
  AND eps.currentpupilstatusid = 1
  AND eps.isdeleted = 0
  AND eps.isactive = 1 AND EPS.LINKSCHOOLID IS NULL
  AND   EXTRACT(YEAR FROM ep.BIRTHDAY) <= 2001
  GROUP BY EPS.schoolid
  )couNTpupilDTK10TREN18
 ON es.schoolid = couNTpupilDTK10TREN18.schoolid

      LEFT 
JOIN (
  SELECT eps.schoolid, COUNT(DISTINCT eps.pupilid)slhs 
  FROM saMS.edu_pupil_studytimeline eps
    JOIN sams.edu_pupil ep
    ON ep.pupilid = eps.pupilid
    AND ep.ethnicityid <> 1
    AND ep.gender = 1
    JOIN sams.edu_schoolclass_new esn
    ON esn.schoolid = eps.schoolid
    AND esn.schoolclassid = eps.schoolclassid
    AND esn.schoolyearid = eps.schoolyearid
    AND esn.schooltermid = eps.schooltermid
    AND esn.classid = 16
  WHERE eps.schoolyearid = 21
  AND eps.schooltermid = 2
  AND eps.currentpupilstatusid = 1
  AND eps.isdeleted = 0 AND EPS.LINKSCHOOLID IS NULL
  AND eps.isactive = 1
  AND   EXTRACT(YEAR FROM ep.BIRTHDAY) <= 2001
  GROUP BY EPS.schoolid
  )couNTpupilNUDTK10TREN18
 ON es.schoolid = couNTpupilNUDTK10TREN18.schoolid

--endregion

  --KHOI 11
  --region HS KHOI11
  LEFT 
JOIN (
  SELECT eps.schoolid, COUNT(DISTINCT eps.pupilid)slhs 
  FROM saMS.edu_pupil_studytimeline eps
    JOIN sams.edu_schoolclass_new esn
    ON esn.schoolid = eps.schoolid
    AND esn.schoolclassid = eps.schoolclassid
    AND esn.schoolyearid = eps.schoolyearid
    AND esn.schooltermid = eps.schooltermid
    AND esn.classid = 17
  WHERE eps.schoolyearid = 21
  AND eps.schooltermid = 2
  AND currentpupilstatusid = 1
  AND eps.isdeleted = 0
  AND eps.isactive = 1 AND EPS.LINKSCHOOLID IS NULL
  GROUP BY EPS.schoolid
  )couNTpupilK11
 ON es.schoolid = couNTpupilK11.schoolid

  LEFT 
JOIN (
  SELECT eps.schoolid, COUNT(DISTINCT eps.pupilid)slhs 
  FROM saMS.edu_pupil_studytimeline eps
    JOIN sams.edu_pupil ep
    ON ep.pupilid = eps.pupilid
    AND ep.gender = 1
    JOIN sams.edu_schoolclass_new esn
    ON esn.schoolid = eps.schoolid
    AND esn.schoolclassid = eps.schoolclassid
    AND esn.schoolyearid = eps.schoolyearid
    AND esn.schooltermid = eps.schooltermid
    AND esn.classid = 17
  WHERE eps.schoolyearid = 21
  AND eps.schooltermid = 2
  AND eps.currentpupilstatusid = 1
  AND eps.isdeleted = 0 AND EPS.LINKSCHOOLID IS NULL
  AND eps.isactive = 1
  GROUP BY EPS.schoolid
  )couNTpupilNUK11
 ON es.schoolid = couNTpupilNUK11.schoolid
    LEFT 
JOIN (
  SELECT eps.schoolid, COUNT(DISTINCT eps.pupilid)slhs 
  FROM saMS.edu_pupil_studytimeline eps
    JOIN sams.edu_pupil ep
    ON ep.pupilid = eps.pupilid
    AND ep.ethnicityid <> 1

    JOIN sams.edu_schoolclass_new esn
    ON esn.schoolid = eps.schoolid
    AND esn.schoolclassid = eps.schoolclassid
    AND esn.schoolyearid = eps.schoolyearid
    AND esn.schooltermid = eps.schooltermid
    AND esn.classid = 17
  WHERE eps.schoolyearid = 21
  AND eps.schooltermid = 2
  AND eps.currentpupilstatusid = 1
  AND eps.isdeleted = 0
  AND eps.isactive = 1 AND EPS.LINKSCHOOLID IS NULL
  GROUP BY EPS.schoolid
  )couNTpupilDTK11
 ON es.schoolid = couNTpupilDTK11.schoolid

      LEFT 
JOIN (
  SELECT eps.schoolid, COUNT(DISTINCT eps.pupilid)slhs 
  FROM saMS.edu_pupil_studytimeline eps
    JOIN sams.edu_pupil ep
    ON ep.pupilid = eps.pupilid
    AND ep.ethnicityid <> 1
    AND ep.gender = 1
    JOIN sams.edu_schoolclass_new esn
    ON esn.schoolid = eps.schoolid
    AND esn.schoolclassid = eps.schoolclassid
    AND esn.schoolyearid = eps.schoolyearid
    AND esn.schooltermid = eps.schooltermid
    AND esn.classid = 17
  WHERE eps.schoolyearid = 21
  AND eps.schooltermid = 2
  AND eps.currentpupilstatusid = 1
  AND eps.isdeleted = 0
  AND eps.isactive = 1 AND EPS.LINKSCHOOLID IS NULL
  GROUP BY EPS.schoolid
  )couNTpupilNUDTK11
 ON es.schoolid = couNTpupilNUDTK11.schoolid
---- Tren 18 tuoi
  LEFT 
JOIN (
  SELECT eps.schoolid, COUNT(DISTINCT eps.pupilid)slhs 
  FROM saMS.edu_pupil_studytimeline eps
     JOIN sams.edu_pupil ep
    ON ep.pupilid = eps.pupilid
    JOIN sams.edu_schoolclass_new esn
    ON esn.schoolid = eps.schoolid
    AND esn.schoolclassid = eps.schoolclassid
    AND esn.schoolyearid = eps.schoolyearid
    AND esn.schooltermid = eps.schooltermid
    AND esn.classid = 17
  WHERE eps.schoolyearid = 21
  AND eps.schooltermid = 2
  AND EPS.currentpupilstatusid = 1
  AND eps.isdeleted = 0 AND EPS.LINKSCHOOLID IS NULL
  AND eps.isactive = 1
  AND   EXTRACT(YEAR FROM ep.BIRTHDAY) <= 2001
  GROUP BY EPS.schoolid
  )couNTpupilK11TREN18
 ON es.schoolid = couNTpupilK11TREN18.schoolid

  LEFT 
JOIN (
  SELECT eps.schoolid, COUNT(DISTINCT eps.pupilid)slhs 
  FROM saMS.edu_pupil_studytimeline eps
    JOIN sams.edu_pupil ep
    ON ep.pupilid = eps.pupilid
    AND ep.gender = 1
    JOIN sams.edu_schoolclass_new esn
    ON esn.schoolid = eps.schoolid
    AND esn.schoolclassid = eps.schoolclassid
    AND esn.schoolyearid = eps.schoolyearid
    AND esn.schooltermid = eps.schooltermid
    AND esn.classid = 17
  WHERE eps.schoolyearid = 21
  AND eps.schooltermid = 2 AND EPS.LINKSCHOOLID IS NULL
  AND eps.currentpupilstatusid = 1
  AND eps.isdeleted = 0
  AND eps.isactive = 1
  AND   EXTRACT(YEAR FROM ep.BIRTHDAY) <= 2001
  GROUP BY EPS.schoolid
  )couNTpupilNUK11TREN18
 ON es.schoolid = couNTpupilNUK11TREN18.schoolid
    LEFT 
JOIN (
  SELECT eps.schoolid, COUNT(DISTINCT eps.pupilid)slhs 
  FROM saMS.edu_pupil_studytimeline eps
    JOIN sams.edu_pupil ep
    ON ep.pupilid = eps.pupilid
    AND ep.ethnicityid <> 1

    JOIN sams.edu_schoolclass_new esn
    ON esn.schoolid = eps.schoolid
    AND esn.schoolclassid = eps.schoolclassid
    AND esn.schoolyearid = eps.schoolyearid
    AND esn.schooltermid = eps.schooltermid
    AND esn.classid = 17
  WHERE eps.schoolyearid = 21
  AND eps.schooltermid = 2
  AND eps.currentpupilstatusid = 1
  AND eps.isdeleted = 0
  AND eps.isactive = 1 AND EPS.LINKSCHOOLID IS NULL
  AND   EXTRACT(YEAR FROM ep.BIRTHDAY) <= 2001
  GROUP BY EPS.schoolid
  )couNTpupilDTK11TREN18
 ON es.schoolid = couNTpupilDTK11TREN18.schoolid

      LEFT 
JOIN (
  SELECT eps.schoolid, COUNT(DISTINCT eps.pupilid)slhs 
  FROM saMS.edu_pupil_studytimeline eps
    JOIN sams.edu_pupil ep
    ON ep.pupilid = eps.pupilid
    AND ep.ethnicityid <> 1
    AND ep.gender = 1
    JOIN sams.edu_schoolclass_new esn
    ON esn.schoolid = eps.schoolid
    AND esn.schoolclassid = eps.schoolclassid
    AND esn.schoolyearid = eps.schoolyearid
    AND esn.schooltermid = eps.schooltermid
    AND esn.classid = 17
  WHERE eps.schoolyearid = 21
  AND eps.schooltermid = 2
  AND eps.currentpupilstatusid = 1
  AND eps.isdeleted = 0 AND EPS.LINKSCHOOLID IS NULL
  AND eps.isactive = 1
  AND   EXTRACT(YEAR FROM ep.BIRTHDAY) <= 2001
  GROUP BY EPS.schoolid
  )couNTpupilNUDTK11TREN18
 ON es.schoolid = couNTpupilNUDTK11TREN18.schoolid

--endregion
  --KHOI 12

  --region HS KHOI12
  LEFT 
JOIN (
  SELECT eps.schoolid, COUNT(DISTINCT eps.pupilid)slhs 
  FROM saMS.edu_pupil_studytimeline eps
    JOIN sams.edu_schoolclass_new esn
    ON esn.schoolid = eps.schoolid
    AND esn.schoolclassid = eps.schoolclassid
    AND esn.schoolyearid = eps.schoolyearid
    AND esn.schooltermid = eps.schooltermid
    AND esn.classid = 18
  WHERE eps.schoolyearid = 21
  AND eps.schooltermid = 2
  AND currentpupilstatusid = 1
  AND eps.isdeleted = 0
  AND eps.isactive = 1 AND EPS.LINKSCHOOLID IS NULL
  GROUP BY EPS.schoolid
  )couNTpupilK12
 ON es.schoolid = couNTpupilK12.schoolid

  LEFT 
JOIN (
  SELECT eps.schoolid, COUNT(DISTINCT eps.pupilid)slhs 
  FROM saMS.edu_pupil_studytimeline eps
    JOIN sams.edu_pupil ep
    ON ep.pupilid = eps.pupilid
    AND ep.gender = 1
    JOIN sams.edu_schoolclass_new esn
    ON esn.schoolid = eps.schoolid
    AND esn.schoolclassid = eps.schoolclassid
    AND esn.schoolyearid = eps.schoolyearid
    AND esn.schooltermid = eps.schooltermid
    AND esn.classid = 18
  WHERE eps.schoolyearid = 21
  AND eps.schooltermid = 2 AND EPS.LINKSCHOOLID IS NULL
  AND eps.currentpupilstatusid = 1
  AND eps.isdeleted = 0
  AND eps.isactive = 1
  GROUP BY EPS.schoolid
  )couNTpupilNUK12
 ON es.schoolid = couNTpupilNUK12.schoolid
    LEFT 
JOIN (
  SELECT eps.schoolid, COUNT(DISTINCT eps.pupilid)slhs 
  FROM saMS.edu_pupil_studytimeline eps
    JOIN sams.edu_pupil ep
    ON ep.pupilid = eps.pupilid
    AND ep.ethnicityid <> 1

    JOIN sams.edu_schoolclass_new esn
    ON esn.schoolid = eps.schoolid
    AND esn.schoolclassid = eps.schoolclassid
    AND esn.schoolyearid = eps.schoolyearid
    AND esn.schooltermid = eps.schooltermid 
    AND esn.classid = 18
  WHERE eps.schoolyearid = 21
  AND eps.schooltermid = 2 AND EPS.LINKSCHOOLID IS NULL
  AND eps.currentpupilstatusid = 1
  AND eps.isdeleted = 0
  AND eps.isactive = 1
  GROUP BY EPS.schoolid
  )couNTpupilDTK12
 ON es.schoolid = couNTpupilDTK12.schoolid

      LEFT 
JOIN (
  SELECT eps.schoolid, COUNT(DISTINCT eps.pupilid)slhs 
  FROM saMS.edu_pupil_studytimeline eps
    JOIN sams.edu_pupil ep
    ON ep.pupilid = eps.pupilid
    AND ep.ethnicityid <> 1
    AND ep.gender = 1
    JOIN sams.edu_schoolclass_new esn
    ON esn.schoolid = eps.schoolid
    AND esn.schoolclassid = eps.schoolclassid
    AND esn.schoolyearid = eps.schoolyearid
    AND esn.schooltermid = eps.schooltermid
    AND esn.classid = 18
  WHERE eps.schoolyearid = 21
  AND eps.schooltermid = 2 AND EPS.LINKSCHOOLID IS NULL
  AND eps.currentpupilstatusid = 1
  AND eps.isdeleted = 0
  AND eps.isactive = 1
  GROUP BY EPS.schoolid
  )couNTpupilNUDTK12
 ON es.schoolid = couNTpupilNUDTK12.schoolid
---- Tren 18 tuoi
  LEFT 
JOIN (
  SELECT eps.schoolid, COUNT(DISTINCT eps.pupilid)slhs 
  FROM saMS.edu_pupil_studytimeline eps
     JOIN sams.edu_pupil ep
    ON ep.pupilid = eps.pupilid
    JOIN sams.edu_schoolclass_new esn
    ON esn.schoolid = eps.schoolid
    AND esn.schoolclassid = eps.schoolclassid
    AND esn.schoolyearid = eps.schoolyearid
    AND esn.schooltermid = eps.schooltermid
    AND esn.classid = 18
  WHERE eps.schoolyearid = 21
  AND eps.schooltermid = 2
  AND EPS.currentpupilstatusid = 1
  AND eps.isdeleted = 0 AND EPS.LINKSCHOOLID IS NULL
  AND eps.isactive = 1
  AND   EXTRACT(YEAR FROM ep.BIRTHDAY) <= 2001
  GROUP BY EPS.schoolid
  )couNTpupilK12TREN18
 ON es.schoolid = couNTpupilK12TREN18.schoolid

  LEFT 
JOIN (
  SELECT eps.schoolid, COUNT(DISTINCT eps.pupilid)slhs 
  FROM saMS.edu_pupil_studytimeline eps
    JOIN sams.edu_pupil ep
    ON ep.pupilid = eps.pupilid
    AND ep.gender = 1
    JOIN sams.edu_schoolclass_new esn
    ON esn.schoolid = eps.schoolid
    AND esn.schoolclassid = eps.schoolclassid
    AND esn.schoolyearid = eps.schoolyearid
    AND esn.schooltermid = eps.schooltermid
    AND esn.classid = 18
  WHERE eps.schoolyearid = 21
  AND eps.schooltermid = 2
  AND eps.currentpupilstatusid = 1
  AND eps.isdeleted = 0
  AND eps.isactive = 1 AND EPS.LINKSCHOOLID IS NULL
  AND   EXTRACT(YEAR FROM ep.BIRTHDAY) <= 2001
  GROUP BY EPS.schoolid
  )couNTpupilNUK12TREN18
 ON es.schoolid = couNTpupilNUK12TREN18.schoolid
    LEFT 
JOIN (
  SELECT eps.schoolid, COUNT(DISTINCT eps.pupilid)slhs 
  FROM saMS.edu_pupil_studytimeline eps
    JOIN sams.edu_pupil ep
    ON ep.pupilid = eps.pupilid
    AND ep.ethnicityid <> 1

    JOIN sams.edu_schoolclass_new esn
    ON esn.schoolid = eps.schoolid
    AND esn.schoolclassid = eps.schoolclassid
    AND esn.schoolyearid = eps.schoolyearid
    AND esn.schooltermid = eps.schooltermid
    AND esn.classid = 18
  WHERE eps.schoolyearid = 21
  AND eps.schooltermid = 2
  AND eps.currentpupilstatusid = 1
  AND eps.isdeleted = 0
  AND eps.isactive = 1 AND EPS.LINKSCHOOLID IS NULL
  AND   EXTRACT(YEAR FROM ep.BIRTHDAY) <= 2001
  GROUP BY EPS.schoolid
  )couNTpupilDTK12TREN18
 ON es.schoolid = couNTpupilDTK12TREN18.schoolid

      LEFT 
JOIN (
  SELECT eps.schoolid, COUNT(DISTINCT eps.pupilid)slhs 
  FROM saMS.edu_pupil_studytimeline eps
    JOIN sams.edu_pupil ep
    ON ep.pupilid = eps.pupilid
    AND ep.ethnicityid <> 1
    AND ep.gender = 1
    JOIN sams.edu_schoolclass_new esn
    ON esn.schoolid = eps.schoolid
    AND esn.schoolclassid = eps.schoolclassid
    AND esn.schoolyearid = eps.schoolyearid
    AND esn.schooltermid = eps.schooltermid
    AND esn.classid = 18
  WHERE eps.schoolyearid = 21
  AND eps.schooltermid = 2
  AND eps.currentpupilstatusid = 1
  AND eps.isdeleted = 0
  AND eps.isactive = 1 AND EPS.LINKSCHOOLID IS NULL
  AND   EXTRACT(YEAR FROM ep.BIRTHDAY) <= 2001
  GROUP BY EPS.schoolid
  )couNTpupilNUDTK12TREN18
 ON es.schoolid = couNTpupilNUDTK12TREN18.schoolid

--endregion

WHERE es.isactive = 1 AND es.isdeleted = 0

  and ES.schoolid NOT IN (1592,1593,1594,1595,1596,1597,1598,1599,1600,1605,1607,1610,1618,1613,1614,1616,1608,1611,1615,1602,1603,1604,1609,1617,1601,1606,1612,1524,1530,10112318,1525,1515,1470,1528,1469)
--  AND ES.educationtypeid = 1
  AND ese.educationlevelid IN (7)
ORDER BY md.districtname,es.schoolname