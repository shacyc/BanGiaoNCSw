SELECT  md.districtname
  ,es.schoolid ,es.schoolname
  ,nvl(couNTpupilTHCS.slhs,0) TOTALPUPILTHCS

  ,nvl(countpupilk6.slhs,0) TOTALPUPILK6
  ,nvl(countpupilnuk6.slhs,0) TOTALPUPILNUK6
,nvl(countpupildtk6.slhs,0) TOTALPUPILDTK6
,nvl(countpupilnudtk6.slhs,0) TOTALPUPILNUDTK6
--- HK KHA THCS
  ,nvl(couNTpupil_HKK.slhs,0) TOTALPUPIL_HKK
  ,nvl(countpupilnu_hkk.slhs,0) TOTALPUPILNU_HKK
,nvl(countpupildt_hkk.slhs,0) TOTALPUPILDT_HKK
,nvl(countpupilnudt_hkk.slhs,0) TOTALPUPILNUDT_HKK

--- HK TB THCS
  ,nvl(countpupil_hktb.slhs,0) TOTALPUPIL_HKTB
  ,nvl(countpupilnu_hktb.slhs,0) TOTALPUPILNU_HKTB
,nvl(countpupildt_hktb.slhs,0) TOTALPUPILDT_HKTB
,nvl(countpupilnudt_hktb.slhs,0) TOTALPUPILNUDT_HKTB

--- HK YEU THCS
  ,nvl(countpupil_hky.slhs,0) TOTALPUPIL_HKY
  ,nvl(countpupilnu_hkY.slhs,0) TOTALPUPILNU_HKY
,nvl(countpupildt_hkY.slhs,0) TOTALPUPILDT_HKY
,nvl(countpupilnudt_hkY.slhs,0) TOTALPUPILNUDT_HKY

--- HK KEM THCS
  ,nvl(countpupil_hkkem.slhs,0) TOTALPUPIL_hkkem
  ,nvl(countpupilnu_hkkem.slhs,0) TOTALPUPILNU_hkkem
,nvl(countpupildt_hkkem.slhs,0) TOTALPUPILDT_hkkem
,nvl(countpupilnudt_hkkem.slhs,0) TOTALPUPILNUDT_hkkem
 --- TONG SO HOC SINH THPT
  ,nvl(couNTpupilTHPT.slhs,0) TOTALPUPILTHPT
  ---HK KHOI 10
  -- HANH KIEM TOT
  ,nvl(couNTpupilK10_HKT.slhs,0) TOTALPUPILK10_HKT
  ,nvl(countpupilnuK10_HKT.slhs,0) TOTALPUPILNUK10_HKT
,nvl(countpupildtK10_HKT.slhs,0) TOTALPUPILDTK10_HKT
,nvl(countpupilnudtK10_HKT.slhs,0) TOTALPUPILNUDTK10_HKT
 -- HK KHA

  ,nvl(couNTpupilK10_HKK.slhs,0) TOTALPUPILK10_HKK
  ,nvl(countpupilnuK10_HKK.slhs,0) TOTALPUPILNUK10_HKK
,nvl(countpupildtK10_HKK.slhs,0) TOTALPUPILDTK10_HKK
,nvl(countpupilnudtK10_HKK.slhs,0) TOTALPUPILNUDTK10_HKK
  -- HK TB
  ,nvl(couNTpupilK10_HKTB.slhs,0) TOTALPUPILK10_HKTB
  ,nvl(countpupilnuK10_HKTB.slhs,0) TOTALPUPILNUK10_HKTB
,nvl(countpupildtK10_HKTB.slhs,0) TOTALPUPILDTK10_HKTB
,nvl(countpupilnudtK10_HKTB.slhs,0) TOTALPUPILNUDTK10_HKTB

  -- HK YEU
  ,nvl(couNTpupilK10_HKY.slhs,0) TOTALPUPILK10_HKY
  ,nvl(countpupilnuK10_HKY.slhs,0) TOTALPUPILNUK10_HKY
,nvl(countpupildtK10_HKY.slhs,0) TOTALPUPILDTK10_HKY
,nvl(countpupilnudtK10_HKY.slhs,0) TOTALPUPILNUDTK10_HKY

  -- HK KEM
  ,nvl(couNTpupilK10_HKKEM.slhs,0) TOTALPUPILK10_HKKEM
  ,nvl(countpupilnuK10_HKKEM.slhs,0) TOTALPUPILNUK10_HKKEM
,nvl(countpupildtK10_HKKEM.slhs,0) TOTALPUPILDTK10_HKKEM
,nvl(countpupilnudtK10_HKKEM.slhs,0) TOTALPUPILNUDTK10_HKKEM
--- KHOI 11
-- HANH KIEM TOT
  ,nvl(couNTpupilK11_HKT.slhs,0) TOTALPUPILK11_HKT
  ,nvl(countpupilnuK11_HKT.slhs,0) TOTALPUPILNUK11_HKT
,nvl(countpupildtK11_HKT.slhs,0) TOTALPUPILDTK11_HKT
,nvl(countpupilnudtK11_HKT.slhs,0) TOTALPUPILNUDTK11_HKT
 -- HK KHA

  ,nvl(couNTpupilK11_HKK.slhs,0) TOTALPUPILK11_HKK
  ,nvl(countpupilnuK11_HKK.slhs,0) TOTALPUPILNUK11_HKK
,nvl(countpupildtK11_HKK.slhs,0) TOTALPUPILDTK11_HKK
,nvl(countpupilnudtK11_HKK.slhs,0) TOTALPUPILNUDTK11_HKK
  -- HK TB
  ,nvl(couNTpupilK11_HKTB.slhs,0) TOTALPUPILK11_HKTB
  ,nvl(countpupilnuK11_HKTB.slhs,0) TOTALPUPILNUK11_HKTB
,nvl(countpupildtK11_HKTB.slhs,0) TOTALPUPILDTK11_HKTB
,nvl(countpupilnudtK11_HKTB.slhs,0) TOTALPUPILNUDTK11_HKTB

  -- HK YEU
  ,nvl(couNTpupilK11_HKY.slhs,0) TOTALPUPILK11_HKY
  ,nvl(countpupilnuK11_HKY.slhs,0) TOTALPUPILNUK11_HKY
,nvl(countpupildtK11_HKY.slhs,0) TOTALPUPILDTK11_HKY
,nvl(countpupilnudtK11_HKY.slhs,0) TOTALPUPILNUDTK11_HKY

  -- HK KEM
  ,nvl(couNTpupilK11_HKKEM.slhs,0) TOTALPUPILK11_HKKEM
  ,nvl(countpupilnuK11_HKKEM.slhs,0) TOTALPUPILNUK11_HKKEM
,nvl(countpupildtK11_HKKEM.slhs,0) TOTALPUPILDTK11_HKKEM
,nvl(countpupilnudtK11_HKKEM.slhs,0) TOTALPUPILNUDTK11_HKKEM
--- KHOI 12
  -- HANH KIEM TOT
  ,nvl(couNTpupilK12.slhs,0) TOTALPUPILK12_HKT
  ,nvl(countpupilnuK12.slhs,0) TOTALPUPILNUK12_HKT
,nvl(countpupildtK12.slhs,0) TOTALPUPILDTK12_HKT
,nvl(countpupilnudtK12.slhs,0) TOTALPUPILNUDTK12_HKT
 -- HK KHA

  ,nvl(couNTpupilK12_HKK.slhs,0) TOTALPUPILK12_HKK
  ,nvl(countpupilnuK12_HKK.slhs,0) TOTALPUPILNUK12_HKK
,nvl(countpupildtK12_HKK.slhs,0) TOTALPUPILDTK12_HKK
,nvl(countpupilnudtK12_HKK.slhs,0) TOTALPUPILNUDTK12_HKK
  -- HK TB
  ,nvl(couNTpupilK12_HKTB.slhs,0) TOTALPUPILK12_HKTB
  ,nvl(countpupilnuK12_HKTB.slhs,0) TOTALPUPILNUK12_HKTB
,nvl(countpupildtK12_HKTB.slhs,0) TOTALPUPILDTK12_HKTB
,nvl(countpupilnudtK12_HKTB.slhs,0) TOTALPUPILNUDTK12_HKTB

  -- HK YEU
  ,nvl(couNTpupilK12_HKY.slhs,0) TOTALPUPILK12_HKY
  ,nvl(countpupilnuK12_HKY.slhs,0) TOTALPUPILNUK12_HKY
,nvl(countpupildtK12_HKY.slhs,0) TOTALPUPILDTK12_HKY
,nvl(countpupilnudtK12_HKY.slhs,0) TOTALPUPILNUDTK12_HKY

 -- HK KEM
  ,nvl(couNTpupilK12_HKKEM.slhs,0) TOTALPUPILK12_HKKEM
  ,nvl(countpupilnuK12_HKKEM.slhs,0) TOTALPUPILNUK12_HKKEM
,nvl(countpupildtK12_HKKEM.slhs,0) TOTALPUPILDTK12_HKKEM
,nvl(countpupilnudtK12_HKKEM.slhs,0) TOTALPUPILNUDTK12_HKKEM

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
  AND eps.currentpupilstatusid = 1 AND EPS.LINKSCHOOLID IS NOT  NULL
  AND eps.isdeleted = 0
  AND eps.isactive = 1
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
  AND eps.currentpupilstatusid = 1 AND EPS.LINKSCHOOLID IS NOT  NULL
  AND eps.isdeleted = 0
  AND eps.isactive = 1
  GROUP BY EPS.schoolid
  )couNTpupilTHPT
 ON es.schoolid = couNTpupilTHPT.schoolid
--region HS THCS HANH KIEM TOT
  
  --REGION HANH KIEM TOT
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
    JOIN sams.edu_pupil_studyhistory  epc
    ON epc.pupilid = eps.pupilid
    AND epc.schoolid = eps.schoolid
    AND epc.schoolclassid = eps.schoolclassid
    AND epc.wholeyearstudyrankid = 1
    AND epc.isdeleted = 0 AND epc.isactive =1
    AND epc.schoolyearid = eps.schoolyearid
  WHERE eps.schoolyearid = 21
  AND eps.schooltermid = 2
  AND eps.currentpupilstatusid = 1 AND EPS.LINKSCHOOLID IS NOT  NULL
  AND eps.isdeleted = 0
  AND eps.isactive = 1
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
    AND esn.classid IN (19,20,21,22)
    JOIN sams.edu_pupil_studyhistory  epc
    ON epc.pupilid = eps.pupilid
    AND epc.schoolid = eps.schoolid
    AND epc.schoolclassid = eps.schoolclassid
    AND epc.wholeyearstudyrankid = 1
    AND epc.isdeleted = 0 AND epc.isactive =1
    AND epc.schoolyearid = eps.schoolyearid
  WHERE eps.schoolyearid = 21
  AND eps.schooltermid = 2
  AND eps.currentpupilstatusid = 1 AND EPS.LINKSCHOOLID IS NOT  NULL
  AND eps.isdeleted = 0
  AND eps.isactive = 1
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
    AND esn.classid IN (19,20,21,22)
   JOIN sams.edu_pupil_studyhistory  epc
    ON epc.pupilid = eps.pupilid
    AND epc.schoolid = eps.schoolid
    AND epc.schoolclassid = eps.schoolclassid
    AND epc.wholeyearstudyrankid = 1
    AND epc.isdeleted = 0 AND epc.isactive =1
    AND epc.schoolyearid = eps.schoolyearid
  WHERE eps.schoolyearid = 21
  AND eps.schooltermid = 2 AND EPS.LINKSCHOOLID IS NOT  NULL
  AND eps.currentpupilstatusid = 1
  AND eps.isdeleted = 0
  AND eps.isactive = 1
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
    AND esn.classid IN (19,20,21,22)
    JOIN sams.edu_pupil_studyhistory  epc
    ON epc.pupilid = eps.pupilid
    AND epc.schoolid = eps.schoolid
    AND epc.schoolclassid = eps.schoolclassid
    AND epc.wholeyearstudyrankid = 1 
    AND epc.isdeleted = 0 AND epc.isactive =1
    AND epc.schoolyearid = eps.schoolyearid
  WHERE eps.schoolyearid = 21 AND EPS.LINKSCHOOLID IS NOT  NULL
  AND eps.schooltermid = 2
  AND eps.currentpupilstatusid = 1
  AND eps.isdeleted = 0
  AND eps.isactive = 1
  GROUP BY EPS.schoolid
  )couNTpupilNUDTK6
 ON es.schoolid = couNTpupilNUDTK6.schoolid
--ENDREGION
---- Tren HANH KIEM KHA
 --REGION HANH KIEM KHA
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
    JOIN sams.edu_pupil_studyhistory  epc
    ON epc.pupilid = eps.pupilid
    AND epc.schoolid = eps.schoolid
    AND epc.schoolclassid = eps.schoolclassid
    AND epc.wholeyearstudyrankid = 2
    AND epc.isdeleted = 0 AND epc.isactive =1
    AND epc.schoolyearid = eps.schoolyearid
  WHERE eps.schoolyearid = 21
  AND eps.schooltermid = 2 AND EPS.LINKSCHOOLID IS NOT  NULL
  AND eps.currentpupilstatusid = 1
  AND eps.isdeleted = 0
  AND eps.isactive = 1
  GROUP BY EPS.schoolid
  )couNTpupil_HKK
 ON es.schoolid = couNTpupil_HKK.schoolid

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
    AND esn.classid IN (19,20,21,22)
    JOIN sams.edu_pupil_studyhistory  epc
    ON epc.pupilid = eps.pupilid
    AND epc.schoolid = eps.schoolid
    AND epc.schoolclassid = eps.schoolclassid
    AND epc.wholeyearstudyrankid = 2
    AND epc.isdeleted = 0 AND epc.isactive =1
    AND epc.schoolyearid = eps.schoolyearid
  WHERE eps.schoolyearid = 21
  AND eps.schooltermid = 2 AND EPS.LINKSCHOOLID IS NOT  NULL
  AND eps.currentpupilstatusid = 1
  AND eps.isdeleted = 0
  AND eps.isactive = 1
  GROUP BY EPS.schoolid
  )couNTpupilNU_HKK
 ON es.schoolid = couNTpupilNU_HKK.schoolid
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
    AND esn.classid IN (19,20,21,22)
    JOIN sams.edu_pupil_studyhistory  epc
    ON epc.pupilid = eps.pupilid
    AND epc.schoolid = eps.schoolid
    AND epc.schoolclassid = eps.schoolclassid
    AND epc.wholeyearstudyrankid = 2
    AND epc.isdeleted = 0 AND epc.isactive =1
    AND epc.schoolyearid = eps.schoolyearid
  WHERE eps.schoolyearid = 21
  AND eps.schooltermid = 2
  AND eps.currentpupilstatusid = 1
  AND eps.isdeleted = 0
  AND eps.isactive = 1 AND EPS.LINKSCHOOLID IS NOT  NULL
  GROUP BY EPS.schoolid
  )couNTpupilDT_HKK
 ON es.schoolid = couNTpupilDT_HKK.schoolid

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
    AND esn.classid IN (19,20,21,22)
    JOIN sams.edu_pupil_studyhistory  epc
    ON epc.pupilid = eps.pupilid
    AND epc.schoolid = eps.schoolid
    AND epc.schoolclassid = eps.schoolclassid
    AND epc.wholeyearstudyrankid = 2
    AND epc.isdeleted = 0 AND epc.isactive =1
    AND epc.schoolyearid = eps.schoolyearid
  WHERE eps.schoolyearid = 21
  AND eps.schooltermid = 2 AND EPS.LINKSCHOOLID IS NOT  NULL
  AND eps.currentpupilstatusid = 1
  AND eps.isdeleted = 0
  AND eps.isactive = 1
  GROUP BY EPS.schoolid
  )couNTpupilNUDT_HKK
 ON es.schoolid = couNTpupilNUDT_HKK.schoolid
--ENDREGION

 --REGION HANH KIEM TB
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
    JOIN sams.edu_pupil_studyhistory  epc
    ON epc.pupilid = eps.pupilid
    AND epc.schoolid = eps.schoolid
    AND epc.schoolclassid = eps.schoolclassid
    AND epc.wholeyearstudyrankid = 3
    AND epc.isdeleted = 0 AND epc.isactive =1
    AND epc.schoolyearid = eps.schoolyearid
  WHERE eps.schoolyearid = 21
  AND eps.schooltermid = 2 AND EPS.LINKSCHOOLID IS NOT  NULL
  AND eps.currentpupilstatusid = 1
  AND eps.isdeleted = 0
  AND eps.isactive = 1
  GROUP BY EPS.schoolid
  )couNTpupil_HKTB
 ON es.schoolid = couNTpupil_HKTB.schoolid

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
    AND esn.classid IN (19,20,21,22)
     JOIN sams.edu_pupil_studyhistory  epc
    ON epc.pupilid = eps.pupilid
    AND epc.schoolid = eps.schoolid
    AND epc.schoolclassid = eps.schoolclassid
    AND epc.wholeyearstudyrankid = 3
    AND epc.isdeleted = 0 AND epc.isactive =1
    AND epc.schoolyearid = eps.schoolyearid
  WHERE eps.schoolyearid = 21
  AND eps.schooltermid = 2 AND EPS.LINKSCHOOLID IS NOT  NULL
  AND eps.currentpupilstatusid = 1
  AND eps.isdeleted = 0
  AND eps.isactive = 1
  GROUP BY EPS.schoolid
  )couNTpupilNU_HKTB
 ON es.schoolid = couNTpupilNU_HKTB.schoolid
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
    AND esn.classid IN (19,20,21,22)
     JOIN sams.edu_pupil_studyhistory  epc
    ON epc.pupilid = eps.pupilid
    AND epc.schoolid = eps.schoolid
    AND epc.schoolclassid = eps.schoolclassid
    AND epc.wholeyearstudyrankid = 3
    AND epc.isdeleted = 0 AND epc.isactive =1
    AND epc.schoolyearid = eps.schoolyearid
  WHERE eps.schoolyearid = 21
  AND eps.schooltermid = 2 AND EPS.LINKSCHOOLID IS NOT  NULL
  AND eps.currentpupilstatusid = 1
  AND eps.isdeleted = 0
  AND eps.isactive = 1
  GROUP BY EPS.schoolid
  )couNTpupilDT_HKTB
 ON es.schoolid = couNTpupilDT_HKTB.schoolid

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
    AND esn.classid IN (19,20,21,22)
     JOIN sams.edu_pupil_studyhistory  epc
    ON epc.pupilid = eps.pupilid
    AND epc.schoolid = eps.schoolid
    AND epc.schoolclassid = eps.schoolclassid
    AND epc.wholeyearstudyrankid = 3
    AND epc.isdeleted = 0 AND epc.isactive =1
    AND epc.schoolyearid = eps.schoolyearid
  WHERE eps.schoolyearid = 21
  AND eps.schooltermid = 2
  AND eps.currentpupilstatusid = 1
  AND eps.isdeleted = 0 AND EPS.LINKSCHOOLID IS NOT  NULL
  AND eps.isactive = 1
  GROUP BY EPS.schoolid
  )couNTpupilNUDT_HKTB
 ON es.schoolid = couNTpupilNUDT_HKTB.schoolid
--ENDREGION

 --REGION HANH KIEM YEU
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
     JOIN sams.edu_pupil_studyhistory  epc
    ON epc.pupilid = eps.pupilid
    AND epc.schoolid = eps.schoolid
    AND epc.schoolclassid = eps.schoolclassid
    AND epc.wholeyearstudyrankid = 4
    AND epc.isdeleted = 0 AND epc.isactive =1
    AND epc.schoolyearid = eps.schoolyearid
  WHERE eps.schoolyearid = 21
  AND eps.schooltermid = 2 AND EPS.LINKSCHOOLID IS NOT  NULL
  AND eps.currentpupilstatusid = 1
  AND eps.isdeleted = 0
  AND eps.isactive = 1
  GROUP BY EPS.schoolid
  )couNTpupil_HKY
 ON es.schoolid = couNTpupil_HKY.schoolid

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
    AND esn.classid IN (19,20,21,22)
    JOIN sams.edu_pupil_studyhistory  epc
    ON epc.pupilid = eps.pupilid
    AND epc.schoolid = eps.schoolid
    AND epc.schoolclassid = eps.schoolclassid
    AND epc.wholeyearstudyrankid = 4
    AND epc.isdeleted = 0 AND epc.isactive =1
    AND epc.schoolyearid = eps.schoolyearid
  WHERE eps.schoolyearid = 21
  AND eps.schooltermid = 2 AND EPS.LINKSCHOOLID IS NOT  NULL
  AND eps.currentpupilstatusid = 1
  AND eps.isdeleted = 0
  AND eps.isactive = 1
  GROUP BY EPS.schoolid
  )couNTpupilNU_HKY
 ON es.schoolid = couNTpupilNU_HKY.schoolid
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
    AND esn.classid IN (19,20,21,22)
    JOIN sams.edu_pupil_studyhistory  epc
    ON epc.pupilid = eps.pupilid
    AND epc.schoolid = eps.schoolid
    AND epc.schoolclassid = eps.schoolclassid
    AND epc.wholeyearstudyrankid = 4
    AND epc.isdeleted = 0 AND epc.isactive =1
    AND epc.schoolyearid = eps.schoolyearid
  WHERE eps.schoolyearid = 21
  AND eps.schooltermid = 2 AND EPS.LINKSCHOOLID IS NOT  NULL
  AND eps.currentpupilstatusid = 1
  AND eps.isdeleted = 0
  AND eps.isactive = 1
  GROUP BY EPS.schoolid
  )couNTpupilDT_HKY
 ON es.schoolid = couNTpupilDT_HKY.schoolid

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
    AND esn.classid IN (19,20,21,22)
    JOIN sams.edu_pupil_studyhistory  epc
    ON epc.pupilid = eps.pupilid
    AND epc.schoolid = eps.schoolid
    AND epc.schoolclassid = eps.schoolclassid
    AND epc.wholeyearstudyrankid = 4
    AND epc.isdeleted = 0 AND epc.isactive =1
    AND epc.schoolyearid = eps.schoolyearid
  WHERE eps.schoolyearid = 21
  AND eps.schooltermid = 2 AND EPS.LINKSCHOOLID IS NOT  NULL
  AND eps.currentpupilstatusid = 1
  AND eps.isdeleted = 0
  AND eps.isactive = 1
  GROUP BY EPS.schoolid
  )couNTpupilNUDT_HKY
 ON es.schoolid = couNTpupilNUDT_HKY.schoolid
--ENDREGION
 --REGION HANH KIEM KEM
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
     JOIN sams.edu_pupil_studyhistory  epc
    ON epc.pupilid = eps.pupilid
    AND epc.schoolid = eps.schoolid
    AND epc.schoolclassid = eps.schoolclassid
    AND epc.wholeyearstudyrankid = 5
    AND epc.isdeleted = 0 AND epc.isactive =1
    AND epc.schoolyearid = eps.schoolyearid
  WHERE eps.schoolyearid = 21
  AND eps.schooltermid = 2
  AND eps.currentpupilstatusid = 1
  AND eps.isdeleted = 0
  AND eps.isactive = 1 AND EPS.LINKSCHOOLID IS NOT  NULL
  GROUP BY EPS.schoolid
  )couNTpupil_HKKEM
 ON es.schoolid = couNTpupil_HKKEM.schoolid

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
    AND esn.classid IN (19,20,21,22)
    JOIN sams.edu_pupil_studyhistory  epc
    ON epc.pupilid = eps.pupilid
    AND epc.schoolid = eps.schoolid
    AND epc.schoolclassid = eps.schoolclassid
    AND epc.wholeyearstudyrankid = 5
    AND epc.isdeleted = 0 AND epc.isactive =1
    AND epc.schoolyearid = eps.schoolyearid
  WHERE eps.schoolyearid = 21
  AND eps.schooltermid = 2 AND EPS.LINKSCHOOLID IS NOT  NULL
  AND eps.currentpupilstatusid = 1
  AND eps.isdeleted = 0
  AND eps.isactive = 1
  GROUP BY EPS.schoolid
  )couNTpupilNU_HKKEM
 ON es.schoolid = couNTpupilNU_HKKEM.schoolid
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
    AND esn.classid IN (19,20,21,22)
    JOIN sams.edu_pupil_studyhistory  epc
    ON epc.pupilid = eps.pupilid
    AND epc.schoolid = eps.schoolid
    AND epc.schoolclassid = eps.schoolclassid
    AND epc.wholeyearstudyrankid = 5
    AND epc.isdeleted = 0 AND epc.isactive =1
    AND epc.schoolyearid = eps.schoolyearid
  WHERE eps.schoolyearid = 21
  AND eps.schooltermid = 2
  AND eps.currentpupilstatusid = 1
  AND eps.isdeleted = 0
  AND eps.isactive = 1 AND EPS.LINKSCHOOLID IS NOT  NULL
  GROUP BY EPS.schoolid 
  )couNTpupilDT_HKKEM
 ON es.schoolid = couNTpupilDT_HKKEM.schoolid

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
    AND esn.classid IN (19,20,21,22)
    JOIN sams.edu_pupil_studyhistory  epc
    ON epc.pupilid = eps.pupilid
    AND epc.schoolid = eps.schoolid
    AND epc.schoolclassid = eps.schoolclassid
    AND epc.wholeyearstudyrankid = 5
    AND epc.isdeleted = 0 AND epc.isactive =1
    AND epc.schoolyearid = eps.schoolyearid
  WHERE eps.schoolyearid = 21 AND EPS.LINKSCHOOLID IS NOT  NULL
  AND eps.schooltermid = 2
  AND eps.currentpupilstatusid = 1
  AND eps.isdeleted = 0
  AND eps.isactive = 1
  GROUP BY EPS.schoolid
  )couNTpupilNUDT_HKKEM
 ON es.schoolid = couNTpupilNUDT_HKKEM.schoolid
--ENDREGION

--endregion  
  
  --KHOI 10
  --REGION HANH KIEM TOT
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
    JOIN sams.edu_pupil_studyhistory  epc
    ON epc.pupilid = eps.pupilid
    AND epc.schoolid = eps.schoolid
    AND epc.schoolclassid = eps.schoolclassid
    AND epc.wholeyearstudyrankid = 1
    AND epc.isdeleted = 0 AND epc.isactive =1
    AND epc.schoolyearid = eps.schoolyearid
  WHERE eps.schoolyearid = 21
  AND eps.schooltermid = 2
  AND eps.currentpupilstatusid = 1
  AND eps.isdeleted = 0 AND EPS.LINKSCHOOLID IS NOT  NULL
  AND eps.isactive = 1
  GROUP BY EPS.schoolid
  )couNTpupilK10_HKT
 ON es.schoolid = couNTpupilK10_HKT.schoolid

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
    JOIN sams.edu_pupil_studyhistory  epc
    ON epc.pupilid = eps.pupilid
    AND epc.schoolid = eps.schoolid
    AND epc.schoolclassid = eps.schoolclassid
    AND epc.wholeyearstudyrankid = 1
    AND epc.isdeleted = 0 AND epc.isactive =1
    AND epc.schoolyearid = eps.schoolyearid
  WHERE eps.schoolyearid = 21
  AND eps.schooltermid = 2
  AND eps.currentpupilstatusid = 1 AND EPS.LINKSCHOOLID IS NOT  NULL
  AND eps.isdeleted = 0
  AND eps.isactive = 1
  GROUP BY EPS.schoolid
  )couNTpupilNUK10_HKT
 ON es.schoolid = couNTpupilNUK10_HKT.schoolid
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
    JOIN sams.edu_pupil_studyhistory  epc
    ON epc.pupilid = eps.pupilid
    AND epc.schoolid = eps.schoolid
    AND epc.schoolclassid = eps.schoolclassid
    AND epc.wholeyearstudyrankid = 1
    AND epc.isdeleted = 0 AND epc.isactive =1
    AND epc.schoolyearid = eps.schoolyearid
  WHERE eps.schoolyearid = 21
  AND eps.schooltermid = 2
  AND eps.currentpupilstatusid = 1
  AND eps.isdeleted = 0 AND EPS.LINKSCHOOLID IS NOT  NULL
  AND eps.isactive = 1
  GROUP BY EPS.schoolid
  )couNTpupilDTK10_HKT
 ON es.schoolid = couNTpupilDTK10_HKT.schoolid

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
    JOIN sams.edu_pupil_studyhistory  epc
    ON epc.pupilid = eps.pupilid
    AND epc.schoolid = eps.schoolid
    AND epc.schoolclassid = eps.schoolclassid
    AND epc.wholeyearstudyrankid = 1
    AND epc.isdeleted = 0 AND epc.isactive =1
    AND epc.schoolyearid = eps.schoolyearid
  WHERE eps.schoolyearid = 21
  AND eps.schooltermid = 2 AND EPS.LINKSCHOOLID IS NOT  NULL
  AND eps.currentpupilstatusid = 1
  AND eps.isdeleted = 0
  AND eps.isactive = 1
  GROUP BY EPS.schoolid
  )couNTpupilNUDTK10_HKT
 ON es.schoolid = couNTpupilNUDTK10_HKT.schoolid
--ENDREGION
---- Tren HANH KIEM KHA
 --REGION HANH KIEM KHA
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
    JOIN sams.edu_pupil_studyhistory  epc
    ON epc.pupilid = eps.pupilid
    AND epc.schoolid = eps.schoolid
    AND epc.schoolclassid = eps.schoolclassid
    AND epc.wholeyearstudyrankid = 2
    AND epc.isdeleted = 0 AND epc.isactive =1
    AND epc.schoolyearid = eps.schoolyearid
  WHERE eps.schoolyearid = 21
  AND eps.schooltermid = 2 AND EPS.LINKSCHOOLID IS NOT  NULL
  AND eps.currentpupilstatusid = 1
  AND eps.isdeleted = 0
  AND eps.isactive = 1
  GROUP BY EPS.schoolid
  )couNTpupilK10_HKK
 ON es.schoolid = couNTpupilK10_HKK.schoolid

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
   JOIN sams.edu_pupil_studyhistory  epc
    ON epc.pupilid = eps.pupilid
    AND epc.schoolid = eps.schoolid
    AND epc.schoolclassid = eps.schoolclassid
    AND epc.wholeyearstudyrankid = 2
    AND epc.isdeleted = 0 AND epc.isactive =1
    AND epc.schoolyearid = eps.schoolyearid
  WHERE eps.schoolyearid = 21
  AND eps.schooltermid = 2
  AND eps.currentpupilstatusid = 1 AND EPS.LINKSCHOOLID IS NOT  NULL
  AND eps.isdeleted = 0
  AND eps.isactive = 1
  GROUP BY EPS.schoolid
  )couNTpupilNUK10_HKK
 ON es.schoolid = couNTpupilNUK10_HKK.schoolid
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
    JOIN sams.edu_pupil_studyhistory  epc
    ON epc.pupilid = eps.pupilid
    AND epc.schoolid = eps.schoolid
    AND epc.schoolclassid = eps.schoolclassid
    AND epc.wholeyearstudyrankid = 2
    AND epc.isdeleted = 0 AND epc.isactive =1
    AND epc.schoolyearid = eps.schoolyearid
  WHERE eps.schoolyearid = 21
  AND eps.schooltermid = 2 AND EPS.LINKSCHOOLID IS NOT  NULL
  AND eps.currentpupilstatusid = 1
  AND eps.isdeleted = 0
  AND eps.isactive = 1
  GROUP BY EPS.schoolid
  )couNTpupilDTK10_HKK
 ON es.schoolid = couNTpupilDTK10_HKK.schoolid

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
    JOIN sams.edu_pupil_studyhistory  epc
    ON epc.pupilid = eps.pupilid
    AND epc.schoolid = eps.schoolid
    AND epc.schoolclassid = eps.schoolclassid
    AND epc.wholeyearstudyrankid = 2
    AND epc.isdeleted = 0 AND epc.isactive =1
    AND epc.schoolyearid = eps.schoolyearid
  WHERE eps.schoolyearid = 21
  AND eps.schooltermid = 2
  AND eps.currentpupilstatusid = 1
  AND eps.isdeleted = 0
  AND eps.isactive = 1 AND EPS.LINKSCHOOLID IS NOT  NULL
  GROUP BY EPS.schoolid
  )couNTpupilNUDTK10_HKK
 ON es.schoolid = couNTpupilNUDTK10_HKK.schoolid
--ENDREGION

 --REGION HANH KIEM TB
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
    JOIN sams.edu_pupil_studyhistory  epc
    ON epc.pupilid = eps.pupilid
    AND epc.schoolid = eps.schoolid
    AND epc.schoolclassid = eps.schoolclassid
    AND epc.wholeyearstudyrankid = 3
    AND epc.isdeleted = 0 AND epc.isactive =1
    AND epc.schoolyearid = eps.schoolyearid
  WHERE eps.schoolyearid = 21
  AND eps.schooltermid = 2
  AND eps.currentpupilstatusid = 1 AND EPS.LINKSCHOOLID IS NOT  NULL
  AND eps.isdeleted = 0
  AND eps.isactive = 1
  GROUP BY EPS.schoolid
  )couNTpupilK10_HKTB
 ON es.schoolid = couNTpupilK10_HKTB.schoolid

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
    AND esn.classid  = 16
    JOIN sams.edu_pupil_studyhistory  epc
    ON epc.pupilid = eps.pupilid
    AND epc.schoolid = eps.schoolid
    AND epc.schoolclassid = eps.schoolclassid
    AND epc.wholeyearstudyrankid = 3
    AND epc.isdeleted = 0 AND epc.isactive =1
    AND epc.schoolyearid = eps.schoolyearid
  WHERE eps.schoolyearid = 21
  AND eps.schooltermid = 2
  AND eps.currentpupilstatusid = 1 AND EPS.LINKSCHOOLID IS NOT  NULL
  AND eps.isdeleted = 0
  AND eps.isactive = 1
  GROUP BY EPS.schoolid
  )couNTpupilNUK10_HKTB
 ON es.schoolid = couNTpupilNUK10_HKTB.schoolid
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
    JOIN sams.edu_pupil_studyhistory  epc
    ON epc.pupilid = eps.pupilid
    AND epc.schoolid = eps.schoolid
    AND epc.schoolclassid = eps.schoolclassid
    AND epc.wholeyearstudyrankid = 3
    AND epc.isdeleted = 0 AND epc.isactive =1
    AND epc.schoolyearid = eps.schoolyearid
  WHERE eps.schoolyearid = 21
  AND eps.schooltermid = 2
  AND eps.currentpupilstatusid = 1
  AND eps.isdeleted = 0
  AND eps.isactive = 1 AND EPS.LINKSCHOOLID IS NOT  NULL
  GROUP BY EPS.schoolid
  )couNTpupilDTK10_HKTB
 ON es.schoolid = couNTpupilDTK10_HKTB.schoolid

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
    JOIN sams.edu_pupil_studyhistory  epc
    ON epc.pupilid = eps.pupilid
    AND epc.schoolid = eps.schoolid
    AND epc.schoolclassid = eps.schoolclassid
    AND epc.wholeyearstudyrankid = 3
    AND epc.isdeleted = 0 AND epc.isactive =1
    AND epc.schoolyearid = eps.schoolyearid
  WHERE eps.schoolyearid = 21
  AND eps.schooltermid = 2
  AND eps.currentpupilstatusid = 1
  AND eps.isdeleted = 0
  AND eps.isactive = 1 AND EPS.LINKSCHOOLID IS NOT  NULL
  GROUP BY EPS.schoolid
  )couNTpupilNUDTK10_HKTB
 ON es.schoolid = couNTpupilNUDTK10_HKTB.schoolid
--ENDREGION

 --REGION HANH KIEM YEU
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
    JOIN sams.edu_pupil_studyhistory  epc
    ON epc.pupilid = eps.pupilid
    AND epc.schoolid = eps.schoolid
    AND epc.schoolclassid = eps.schoolclassid
    AND epc.wholeyearstudyrankid = 4
    AND epc.isdeleted = 0 AND epc.isactive =1
    AND epc.schoolyearid = eps.schoolyearid
  WHERE eps.schoolyearid = 21
  AND eps.schooltermid = 2
  AND eps.currentpupilstatusid = 1
  AND eps.isdeleted = 0
  AND eps.isactive = 1 AND EPS.LINKSCHOOLID IS NOT  NULL
  GROUP BY EPS.schoolid
  )couNTpupilK10_HKY
 ON es.schoolid = couNTpupilK10_HKY.schoolid

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
    JOIN sams.edu_pupil_studyhistory  epc
    ON epc.pupilid = eps.pupilid
    AND epc.schoolid = eps.schoolid
    AND epc.schoolclassid = eps.schoolclassid
    AND epc.wholeyearstudyrankid = 4
    AND epc.isdeleted = 0 AND epc.isactive =1
    AND epc.schoolyearid = eps.schoolyearid
  WHERE eps.schoolyearid = 21
  AND eps.schooltermid = 2 AND EPS.LINKSCHOOLID IS NOT  NULL
  AND eps.currentpupilstatusid = 1
  AND eps.isdeleted = 0
  AND eps.isactive = 1
  GROUP BY EPS.schoolid
  )couNTpupilNUK10_HKY
 ON es.schoolid = couNTpupilNUK10_HKY.schoolid
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
    JOIN sams.edu_pupil_studyhistory  epc
    ON epc.pupilid = eps.pupilid
    AND epc.schoolid = eps.schoolid
    AND epc.schoolclassid = eps.schoolclassid
    AND epc.wholeyearstudyrankid = 4
    AND epc.isdeleted = 0 AND epc.isactive =1
    AND epc.schoolyearid = eps.schoolyearid
  WHERE eps.schoolyearid = 21 AND EPS.LINKSCHOOLID IS NOT  NULL
  AND eps.schooltermid = 2
  AND eps.currentpupilstatusid = 1
  AND eps.isdeleted = 0
  AND eps.isactive = 1
  GROUP BY EPS.schoolid
  )couNTpupilDTK10_HKY
 ON es.schoolid = couNTpupilDTK10_HKY.schoolid

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
    JOIN sams.edu_pupil_studyhistory  epc
    ON epc.pupilid = eps.pupilid
    AND epc.schoolid = eps.schoolid
    AND epc.schoolclassid = eps.schoolclassid
    AND epc.wholeyearstudyrankid = 4
    AND epc.isdeleted = 0 AND epc.isactive =1
    AND epc.schoolyearid = eps.schoolyearid
  WHERE eps.schoolyearid = 21 AND EPS.LINKSCHOOLID IS NOT  NULL
  AND eps.schooltermid = 2
  AND eps.currentpupilstatusid = 1
  AND eps.isdeleted = 0
  AND eps.isactive = 1
  GROUP BY EPS.schoolid
  )couNTpupilNUDTK10_HKY
 ON es.schoolid = couNTpupilNUDTK10_HKY.schoolid
--ENDREGION

  --REGION HOC LUC KEM
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
    JOIN sams.edu_pupil_studyhistory  epc
    ON epc.pupilid = eps.pupilid
    AND epc.schoolid = eps.schoolid
    AND epc.schoolclassid = eps.schoolclassid
    AND epc.wholeyearstudyrankid = 5
    AND epc.isdeleted = 0 AND epc.isactive =1
    AND epc.schoolyearid = eps.schoolyearid
  WHERE eps.schoolyearid = 21
  AND eps.schooltermid = 2
  AND eps.currentpupilstatusid = 1 AND EPS.LINKSCHOOLID IS NOT  NULL
  AND eps.isdeleted = 0
  AND eps.isactive = 1
  GROUP BY EPS.schoolid
  )couNTpupilK10_HKKEM
 ON es.schoolid = couNTpupilK10_HKKEM.schoolid

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
    JOIN sams.edu_pupil_studyhistory  epc
    ON epc.pupilid = eps.pupilid
    AND epc.schoolid = eps.schoolid
    AND epc.schoolclassid = eps.schoolclassid
    AND epc.wholeyearstudyrankid = 5
    AND epc.isdeleted = 0 AND epc.isactive =1
    AND epc.schoolyearid = eps.schoolyearid
  WHERE eps.schoolyearid = 21
  AND eps.schooltermid = 2 AND EPS.LINKSCHOOLID IS NOT  NULL
  AND eps.currentpupilstatusid = 1
  AND eps.isdeleted = 0
  AND eps.isactive = 1
  GROUP BY EPS.schoolid
  )couNTpupilNUK10_HKKEM
 ON es.schoolid = couNTpupilNUK10_HKKEM.schoolid
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
    JOIN sams.edu_pupil_studyhistory  epc
    ON epc.pupilid = eps.pupilid
    AND epc.schoolid = eps.schoolid
    AND epc.schoolclassid = eps.schoolclassid
    AND epc.wholeyearstudyrankid = 5
    AND epc.isdeleted = 0 AND epc.isactive =1
    AND epc.schoolyearid = eps.schoolyearid
  WHERE eps.schoolyearid = 21
  AND eps.schooltermid = 2 AND EPS.LINKSCHOOLID IS NOT  NULL
  AND eps.currentpupilstatusid = 1
  AND eps.isdeleted = 0
  AND eps.isactive = 1
  GROUP BY EPS.schoolid
  )couNTpupilDTK10_HKKEM
 ON es.schoolid = couNTpupilDTK10_HKKEM.schoolid

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
    JOIN sams.edu_pupil_studyhistory  epc
    ON epc.pupilid = eps.pupilid
    AND epc.schoolid = eps.schoolid
    AND epc.schoolclassid = eps.schoolclassid
    AND epc.wholeyearstudyrankid = 5
    AND epc.isdeleted = 0 AND epc.isactive =1
    AND epc.schoolyearid = eps.schoolyearid
  WHERE eps.schoolyearid = 21
  AND eps.schooltermid = 2
  AND eps.currentpupilstatusid = 1
  AND eps.isdeleted = 0
  AND eps.isactive = 1 AND EPS.LINKSCHOOLID IS NOT  NULL
  GROUP BY EPS.schoolid
  )couNTpupilNUDTK10_HKKEM
 ON es.schoolid = couNTpupilNUDTK10_HKKEM.schoolid
--ENDREGION
  --KHOI 11

    --REGION HANH KIEM TOT
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
    JOIN sams.edu_pupil_studyhistory  epc
    ON epc.pupilid = eps.pupilid
    AND epc.schoolid = eps.schoolid
    AND epc.schoolclassid = eps.schoolclassid
    AND epc.wholeyearstudyrankid = 1
    AND epc.isdeleted = 0 AND epc.isactive =1
    AND epc.schoolyearid = eps.schoolyearid
  WHERE eps.schoolyearid = 21
  AND eps.schooltermid = 2
  AND eps.currentpupilstatusid = 1
  AND eps.isdeleted = 0 AND EPS.LINKSCHOOLID IS NOT  NULL
  AND eps.isactive = 1
  GROUP BY EPS.schoolid
  )couNTpupilK11_HKT
 ON es.schoolid = couNTpupilK11_HKT.schoolid

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
    JOIN sams.edu_pupil_studyhistory  epc
    ON epc.pupilid = eps.pupilid
    AND epc.schoolid = eps.schoolid
    AND epc.schoolclassid = eps.schoolclassid
    AND epc.wholeyearstudyrankid = 1
    AND epc.isdeleted = 0 AND epc.isactive =1
    AND epc.schoolyearid = eps.schoolyearid
  WHERE eps.schoolyearid = 21
  AND eps.schooltermid = 2
  AND eps.currentpupilstatusid = 1 AND EPS.LINKSCHOOLID IS NOT  NULL
  AND eps.isdeleted = 0
  AND eps.isactive = 1
  GROUP BY EPS.schoolid
  )couNTpupilNUK11_HKT
 ON es.schoolid = couNTpupilNUK11_HKT.schoolid
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
    JOIN sams.edu_pupil_studyhistory  epc
    ON epc.pupilid = eps.pupilid
    AND epc.schoolid = eps.schoolid
    AND epc.schoolclassid = eps.schoolclassid
    AND epc.wholeyearstudyrankid = 1
    AND epc.isdeleted = 0 AND epc.isactive =1
    AND epc.schoolyearid = eps.schoolyearid
  WHERE eps.schoolyearid = 21
  AND eps.schooltermid = 2
  AND eps.currentpupilstatusid = 1 AND EPS.LINKSCHOOLID IS NOT  NULL
  AND eps.isdeleted = 0
  AND eps.isactive = 1
  GROUP BY EPS.schoolid
  )couNTpupilDTK11_HKT
 ON es.schoolid = couNTpupilDTK11_HKT.schoolid

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
    JOIN sams.edu_pupil_studyhistory  epc
    ON epc.pupilid = eps.pupilid
    AND epc.schoolid = eps.schoolid
    AND epc.schoolclassid = eps.schoolclassid
    AND epc.wholeyearstudyrankid = 1
    AND epc.isdeleted = 0 AND epc.isactive =1
    AND epc.schoolyearid = eps.schoolyearid
  WHERE eps.schoolyearid = 21
  AND eps.schooltermid = 2 AND EPS.LINKSCHOOLID IS NOT  NULL
  AND eps.currentpupilstatusid = 1
  AND eps.isdeleted = 0
  AND eps.isactive = 1
  GROUP BY EPS.schoolid
  )couNTpupilNUDTK11_HKT
 ON es.schoolid = couNTpupilNUDTK11_HKT.schoolid
--ENDREGION
---- Tren HANH KIEM KHA
 --REGION HANH KIEM KHA
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
    JOIN sams.edu_pupil_studyhistory  epc
    ON epc.pupilid = eps.pupilid
    AND epc.schoolid = eps.schoolid
    AND epc.schoolclassid = eps.schoolclassid
    AND epc.wholeyearstudyrankid = 2
    AND epc.isdeleted = 0 AND epc.isactive =1
    AND epc.schoolyearid = eps.schoolyearid
  WHERE eps.schoolyearid = 21
  AND eps.schooltermid = 2
  AND eps.currentpupilstatusid = 1 AND EPS.LINKSCHOOLID IS NOT  NULL
  AND eps.isdeleted = 0
  AND eps.isactive = 1
  GROUP BY EPS.schoolid
  )couNTpupilK11_HKK
 ON es.schoolid = couNTpupilK11_HKK.schoolid

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
    JOIN sams.edu_pupil_studyhistory  epc
    ON epc.pupilid = eps.pupilid
    AND epc.schoolid = eps.schoolid
    AND epc.schoolclassid = eps.schoolclassid
    AND epc.wholeyearstudyrankid = 2
    AND epc.isdeleted = 0 AND epc.isactive =1
    AND epc.schoolyearid = eps.schoolyearid
  WHERE eps.schoolyearid = 21
  AND eps.schooltermid = 2
  AND eps.currentpupilstatusid = 1
  AND eps.isdeleted = 0 AND EPS.LINKSCHOOLID IS NOT  NULL
  AND eps.isactive = 1
  GROUP BY EPS.schoolid
  )couNTpupilNUK11_HKK
 ON es.schoolid = couNTpupilNUK11_HKK.schoolid
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
    JOIN sams.edu_pupil_studyhistory  epc
    ON epc.pupilid = eps.pupilid
    AND epc.schoolid = eps.schoolid
    AND epc.schoolclassid = eps.schoolclassid
    AND epc.wholeyearstudyrankid = 2
    AND epc.isdeleted = 0 AND epc.isactive =1
    AND epc.schoolyearid = eps.schoolyearid
  WHERE eps.schoolyearid = 21
  AND eps.schooltermid = 2
  AND eps.currentpupilstatusid = 1 AND EPS.LINKSCHOOLID IS NOT  NULL
  AND eps.isdeleted = 0
  AND eps.isactive = 1
  GROUP BY EPS.schoolid
  )couNTpupilDTK11_HKK
 ON es.schoolid = couNTpupilDTK11_HKK.schoolid

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
    JOIN sams.edu_pupil_studyhistory  epc
    ON epc.pupilid = eps.pupilid
    AND epc.schoolid = eps.schoolid
    AND epc.schoolclassid = eps.schoolclassid
    AND epc.wholeyearstudyrankid = 2
    AND epc.isdeleted = 0 AND epc.isactive =1
    AND epc.schoolyearid = eps.schoolyearid
  WHERE eps.schoolyearid = 21
  AND eps.schooltermid = 2
  AND eps.currentpupilstatusid = 1 AND EPS.LINKSCHOOLID IS NOT  NULL
  AND eps.isdeleted = 0
  AND eps.isactive = 1
  GROUP BY EPS.schoolid
  )couNTpupilNUDTK11_HKK
 ON es.schoolid = couNTpupilNUDTK11_HKK.schoolid
--ENDREGION

 --REGION HANH KIEM TB
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
    JOIN sams.edu_pupil_studyhistory  epc
    ON epc.pupilid = eps.pupilid
    AND epc.schoolid = eps.schoolid
    AND epc.schoolclassid = eps.schoolclassid
    AND epc.wholeyearstudyrankid = 3
    AND epc.isdeleted = 0 AND epc.isactive =1
    AND epc.schoolyearid = eps.schoolyearid
  WHERE eps.schoolyearid = 21
  AND eps.schooltermid = 2
  AND eps.currentpupilstatusid = 1 AND EPS.LINKSCHOOLID IS NOT  NULL
  AND eps.isdeleted = 0
  AND eps.isactive = 1
  GROUP BY EPS.schoolid
  )couNTpupilK11_HKTB
 ON es.schoolid = couNTpupilK11_HKTB.schoolid

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
    JOIN sams.edu_pupil_studyhistory  epc
    ON epc.pupilid = eps.pupilid
    AND epc.schoolid = eps.schoolid
    AND epc.schoolclassid = eps.schoolclassid
    AND epc.wholeyearstudyrankid = 3
    AND epc.isdeleted = 0 AND epc.isactive =1
    AND epc.schoolyearid = eps.schoolyearid
  WHERE eps.schoolyearid = 21
  AND eps.schooltermid = 2
  AND eps.currentpupilstatusid = 1
  AND eps.isdeleted = 0 AND EPS.LINKSCHOOLID IS NOT  NULL
  AND eps.isactive = 1
  GROUP BY EPS.schoolid
  )couNTpupilNUK11_HKTB
 ON es.schoolid = couNTpupilNUK11_HKTB.schoolid
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
   JOIN sams.edu_pupil_studyhistory  epc
    ON epc.pupilid = eps.pupilid
    AND epc.schoolid = eps.schoolid
    AND epc.schoolclassid = eps.schoolclassid
    AND epc.wholeyearstudyrankid = 3
    AND epc.isdeleted = 0 AND epc.isactive =1
    AND epc.schoolyearid = eps.schoolyearid
  WHERE eps.schoolyearid = 21
  AND eps.schooltermid = 2
  AND eps.currentpupilstatusid = 1 AND EPS.LINKSCHOOLID IS NOT  NULL
  AND eps.isdeleted = 0
  AND eps.isactive = 1
  GROUP BY EPS.schoolid
  )couNTpupilDTK11_HKTB
 ON es.schoolid = couNTpupilDTK11_HKTB.schoolid

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
    JOIN sams.edu_pupil_studyhistory  epc
    ON epc.pupilid = eps.pupilid
    AND epc.schoolid = eps.schoolid
    AND epc.schoolclassid = eps.schoolclassid
    AND epc.wholeyearstudyrankid = 3
    AND epc.isdeleted = 0 AND epc.isactive =1
    AND epc.schoolyearid = eps.schoolyearid
  WHERE eps.schoolyearid = 21
  AND eps.schooltermid = 2
  AND eps.currentpupilstatusid = 1 AND EPS.LINKSCHOOLID IS NOT  NULL
  AND eps.isdeleted = 0
  AND eps.isactive = 1
  GROUP BY EPS.schoolid
  )couNTpupilNUDTK11_HKTB
 ON es.schoolid = couNTpupilNUDTK11_HKTB.schoolid
--ENDREGION

 --REGION HANH KIEM YEU
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
    JOIN sams.edu_pupil_studyhistory  epc
    ON epc.pupilid = eps.pupilid
    AND epc.schoolid = eps.schoolid
    AND epc.schoolclassid = eps.schoolclassid
    AND epc.wholeyearstudyrankid = 4
    AND epc.isdeleted = 0 AND epc.isactive =1
    AND epc.schoolyearid = eps.schoolyearid
  WHERE eps.schoolyearid = 21
  AND eps.schooltermid = 2
  AND eps.currentpupilstatusid = 1
  AND eps.isdeleted = 0 AND EPS.LINKSCHOOLID IS NOT  NULL
  AND eps.isactive = 1
  GROUP BY EPS.schoolid
  )couNTpupilK11_HKY
 ON es.schoolid = couNTpupilK11_HKY.schoolid

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
    JOIN sams.edu_pupil_studyhistory  epc
    ON epc.pupilid = eps.pupilid
    AND epc.schoolid = eps.schoolid
    AND epc.schoolclassid = eps.schoolclassid
    AND epc.wholeyearstudyrankid = 4
    AND epc.isdeleted = 0 AND epc.isactive =1
    AND epc.schoolyearid = eps.schoolyearid
  WHERE eps.schoolyearid = 21
  AND eps.schooltermid = 2
  AND eps.currentpupilstatusid = 1
  AND eps.isdeleted = 0
  AND eps.isactive = 1 AND EPS.LINKSCHOOLID IS NOT  NULL
  GROUP BY EPS.schoolid
  )couNTpupilNUK11_HKY
 ON es.schoolid = couNTpupilNUK11_HKY.schoolid
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
    JOIN sams.edu_pupil_studyhistory  epc
    ON epc.pupilid = eps.pupilid
    AND epc.schoolid = eps.schoolid
    AND epc.schoolclassid = eps.schoolclassid
    AND epc.wholeyearstudyrankid = 4
    AND epc.isdeleted = 0 AND epc.isactive =1
    AND epc.schoolyearid = eps.schoolyearid
  WHERE eps.schoolyearid = 21 AND EPS.LINKSCHOOLID IS NOT  NULL
  AND eps.schooltermid = 2
  AND eps.currentpupilstatusid = 1
  AND eps.isdeleted = 0
  AND eps.isactive = 1
  GROUP BY EPS.schoolid
  )couNTpupilDTK11_HKY
 ON es.schoolid = couNTpupilDTK11_HKY.schoolid

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
    JOIN sams.edu_pupil_studyhistory  epc
    ON epc.pupilid = eps.pupilid
    AND epc.schoolid = eps.schoolid
    AND epc.schoolclassid = eps.schoolclassid
    AND epc.wholeyearstudyrankid = 4
    AND epc.isdeleted = 0 AND epc.isactive =1
    AND epc.schoolyearid = eps.schoolyearid
  WHERE eps.schoolyearid = 21 AND EPS.LINKSCHOOLID IS NOT  NULL
  AND eps.schooltermid = 2
  AND eps.currentpupilstatusid = 1
  AND eps.isdeleted = 0
  AND eps.isactive = 1
  GROUP BY EPS.schoolid
  )couNTpupilNUDTK11_HKY
 ON es.schoolid = couNTpupilNUDTK11_HKY.schoolid
--ENDREGION
   --REGION HOC LUC KEM
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
    JOIN sams.edu_pupil_studyhistory  epc
    ON epc.pupilid = eps.pupilid
    AND epc.schoolid = eps.schoolid
    AND epc.schoolclassid = eps.schoolclassid
    AND epc.wholeyearstudyrankid = 5
    AND epc.isdeleted = 0 AND epc.isactive =1
    AND epc.schoolyearid = eps.schoolyearid
  WHERE eps.schoolyearid = 21
  AND eps.schooltermid = 2
  AND eps.currentpupilstatusid = 1
  AND eps.isdeleted = 0
  AND eps.isactive = 1 AND EPS.LINKSCHOOLID IS NOT  NULL
  GROUP BY EPS.schoolid
  )couNTpupilK11_HKKEM
 ON es.schoolid = couNTpupilK11_HKKEM.schoolid

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
    JOIN sams.edu_pupil_studyhistory  epc
    ON epc.pupilid = eps.pupilid
    AND epc.schoolid = eps.schoolid
    AND epc.schoolclassid = eps.schoolclassid
    AND epc.wholeyearstudyrankid = 5
    AND epc.isdeleted = 0 AND epc.isactive =1
    AND epc.schoolyearid = eps.schoolyearid
  WHERE eps.schoolyearid = 21 AND EPS.LINKSCHOOLID IS NOT  NULL
  AND eps.schooltermid = 2
  AND eps.currentpupilstatusid = 1
  AND eps.isdeleted = 0
  AND eps.isactive = 1
  GROUP BY EPS.schoolid
  )couNTpupilNUK11_HKKEM
 ON es.schoolid = couNTpupilNUK11_HKKEM.schoolid
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
    JOIN sams.edu_pupil_studyhistory  epc
    ON epc.pupilid = eps.pupilid
    AND epc.schoolid = eps.schoolid
    AND epc.schoolclassid = eps.schoolclassid
    AND epc.wholeyearstudyrankid = 5
    AND epc.isdeleted = 0 AND epc.isactive =1
    AND epc.schoolyearid = eps.schoolyearid
  WHERE eps.schoolyearid = 21
  AND eps.schooltermid = 2
  AND eps.currentpupilstatusid = 1
  AND eps.isdeleted = 0 AND EPS.LINKSCHOOLID IS NOT  NULL
  AND eps.isactive = 1
  GROUP BY EPS.schoolid
  )couNTpupilDTK11_HKKEM
 ON es.schoolid = couNTpupilDTK11_HKKEM.schoolid

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
    JOIN sams.edu_pupil_studyhistory  epc
    ON epc.pupilid = eps.pupilid
    AND epc.schoolid = eps.schoolid
    AND epc.schoolclassid = eps.schoolclassid
    AND epc.wholeyearstudyrankid = 5
    AND epc.isdeleted = 0 AND epc.isactive =1
    AND epc.schoolyearid = eps.schoolyearid
  WHERE eps.schoolyearid = 21
  AND eps.schooltermid = 2 AND EPS.LINKSCHOOLID IS NOT  NULL
  AND eps.currentpupilstatusid = 1
  AND eps.isdeleted = 0
  AND eps.isactive = 1
  GROUP BY EPS.schoolid
  )couNTpupilNUDTK11_HKKEM
 ON es.schoolid = couNTpupilNUDTK11_HKKEM.schoolid
--ENDREGION
  

  --KHOI 12
  --REGION HANH KIEM TOT
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
   JOIN sams.edu_pupil_studyhistory  epc
    ON epc.pupilid = eps.pupilid
    AND epc.schoolid = eps.schoolid
    AND epc.schoolclassid = eps.schoolclassid
    AND epc.wholeyearstudyrankid = 1
    AND epc.isdeleted = 0 AND epc.isactive =1
    AND epc.schoolyearid = eps.schoolyearid
  WHERE eps.schoolyearid = 21
  AND eps.schooltermid = 2 AND EPS.LINKSCHOOLID IS NOT  NULL
  AND eps.currentpupilstatusid = 1
  AND eps.isdeleted = 0
  AND eps.isactive = 1
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
    JOIN sams.edu_pupil_studyhistory  epc
    ON epc.pupilid = eps.pupilid
    AND epc.schoolid = eps.schoolid
    AND epc.schoolclassid = eps.schoolclassid
    AND epc.wholeyearstudyrankid = 1
    AND epc.isdeleted = 0 AND epc.isactive =1
    AND epc.schoolyearid = eps.schoolyearid
  WHERE eps.schoolyearid = 21
  AND eps.schooltermid = 2 AND EPS.LINKSCHOOLID IS NOT  NULL
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
    JOIN sams.edu_pupil_studyhistory  epc
    ON epc.pupilid = eps.pupilid
    AND epc.schoolid = eps.schoolid
    AND epc.schoolclassid = eps.schoolclassid
    AND epc.wholeyearstudyrankid = 1
    AND epc.isdeleted = 0 AND epc.isactive =1
    AND epc.schoolyearid = eps.schoolyearid
  WHERE eps.schoolyearid = 21
  AND eps.schooltermid = 2
  AND eps.currentpupilstatusid = 1 AND EPS.LINKSCHOOLID IS NOT  NULL
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
    JOIN sams.edu_pupil_studyhistory  epc
    ON epc.pupilid = eps.pupilid
    AND epc.schoolid = eps.schoolid
    AND epc.schoolclassid = eps.schoolclassid
    AND epc.wholeyearstudyrankid = 1
    AND epc.isdeleted = 0 AND epc.isactive =1
    AND epc.schoolyearid = eps.schoolyearid
  WHERE eps.schoolyearid = 21
  AND eps.schooltermid = 2
  AND eps.currentpupilstatusid = 1 AND EPS.LINKSCHOOLID IS NOT  NULL
  AND eps.isdeleted = 0
  AND eps.isactive = 1
  GROUP BY EPS.schoolid
  )couNTpupilNUDTK12
 ON es.schoolid = couNTpupilNUDTK12.schoolid
--ENDREGION
---- Tren HANH KIEM KHA
 --REGION HANH KIEM KHA
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
    JOIN sams.edu_pupil_studyhistory  epc
    ON epc.pupilid = eps.pupilid
    AND epc.schoolid = eps.schoolid
    AND epc.schoolclassid = eps.schoolclassid
    AND epc.wholeyearstudyrankid = 2
    AND epc.isdeleted = 0 AND epc.isactive =1
    AND epc.schoolyearid = eps.schoolyearid
  WHERE eps.schoolyearid = 21
  AND eps.schooltermid = 2
  AND eps.currentpupilstatusid = 1
  AND eps.isdeleted = 0 AND EPS.LINKSCHOOLID IS NOT  NULL
  AND eps.isactive = 1
  GROUP BY EPS.schoolid
  )couNTpupilK12_HKK
 ON es.schoolid = couNTpupilK12_HKK.schoolid

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
    JOIN sams.edu_pupil_studyhistory  epc
    ON epc.pupilid = eps.pupilid
    AND epc.schoolid = eps.schoolid
    AND epc.schoolclassid = eps.schoolclassid
    AND epc.wholeyearstudyrankid = 2 
    AND epc.isdeleted = 0 AND epc.isactive =1
    AND epc.schoolyearid = eps.schoolyearid
  WHERE eps.schoolyearid = 21 AND EPS.LINKSCHOOLID IS NOT  NULL
  AND eps.schooltermid = 2
  AND eps.currentpupilstatusid = 1
  AND eps.isdeleted = 0
  AND eps.isactive = 1
  GROUP BY EPS.schoolid
  )couNTpupilNUK12_HKK
 ON es.schoolid = couNTpupilNUK12_HKK.schoolid
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
    JOIN sams.edu_pupil_studyhistory  epc
    ON epc.pupilid = eps.pupilid
    AND epc.schoolid = eps.schoolid
    AND epc.schoolclassid = eps.schoolclassid
    AND epc.wholeyearstudyrankid = 2
    AND epc.isdeleted = 0 AND epc.isactive =1
    AND epc.schoolyearid = eps.schoolyearid
  WHERE eps.schoolyearid = 21
  AND eps.schooltermid = 2
  AND eps.currentpupilstatusid = 1
  AND eps.isdeleted = 0
  AND eps.isactive = 1 AND EPS.LINKSCHOOLID IS NOT  NULL
  GROUP BY EPS.schoolid
  )couNTpupilDTK12_HKK
 ON es.schoolid = couNTpupilDTK12_HKK.schoolid

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
    JOIN sams.edu_pupil_studyhistory  epc
    ON epc.pupilid = eps.pupilid
    AND epc.schoolid = eps.schoolid
    AND epc.schoolclassid = eps.schoolclassid
    AND epc.wholeyearstudyrankid = 2
    AND epc.isdeleted = 0 AND epc.isactive =1
    AND epc.schoolyearid = eps.schoolyearid
  WHERE eps.schoolyearid = 21
  AND eps.schooltermid = 2
  AND eps.currentpupilstatusid = 1
  AND eps.isdeleted = 0
  AND eps.isactive = 1 AND EPS.LINKSCHOOLID IS NOT  NULL
  GROUP BY EPS.schoolid 
  )couNTpupilNUDTK12_HKK
 ON es.schoolid = couNTpupilNUDTK12_HKK.schoolid
--ENDREGION

 --REGION HANH KIEM TB
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
    JOIN sams.edu_pupil_studyhistory  epc
    ON epc.pupilid = eps.pupilid
    AND epc.schoolid = eps.schoolid
    AND epc.schoolclassid = eps.schoolclassid
    AND epc.wholeyearstudyrankid = 3
    AND epc.isdeleted = 0 AND epc.isactive =1
    AND epc.schoolyearid = eps.schoolyearid
  WHERE eps.schoolyearid = 21 AND EPS.LINKSCHOOLID IS NOT  NULL
  AND eps.schooltermid = 2
  AND eps.currentpupilstatusid = 1
  AND eps.isdeleted = 0
  AND eps.isactive = 1
  GROUP BY EPS.schoolid
  )couNTpupilK12_HKTB
 ON es.schoolid = couNTpupilK12_HKTB.schoolid

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
    JOIN sams.edu_pupil_studyhistory  epc
    ON epc.pupilid = eps.pupilid
    AND epc.schoolid = eps.schoolid
    AND epc.schoolclassid = eps.schoolclassid
    AND epc.wholeyearstudyrankid = 3
    AND epc.isdeleted = 0 AND epc.isactive =1
    AND epc.schoolyearid = eps.schoolyearid
  WHERE eps.schoolyearid = 21
  AND eps.schooltermid = 2 AND EPS.LINKSCHOOLID IS NOT  NULL
  AND eps.currentpupilstatusid = 1
  AND eps.isdeleted = 0
  AND eps.isactive = 1
  GROUP BY EPS.schoolid
  )couNTpupilNUK12_HKTB
 ON es.schoolid = couNTpupilNUK12_HKTB.schoolid
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
    JOIN sams.edu_pupil_studyhistory  epc
    ON epc.pupilid = eps.pupilid
    AND epc.schoolid = eps.schoolid
    AND epc.schoolclassid = eps.schoolclassid
    AND epc.wholeyearstudyrankid = 3
    AND epc.isdeleted = 0 AND epc.isactive =1
    AND epc.schoolyearid = eps.schoolyearid
  WHERE eps.schoolyearid = 21 AND EPS.LINKSCHOOLID IS NOT  NULL
  AND eps.schooltermid = 2
  AND eps.currentpupilstatusid = 1
  AND eps.isdeleted = 0
  AND eps.isactive = 1
  GROUP BY EPS.schoolid
  )couNTpupilDTK12_HKTB
 ON es.schoolid = couNTpupilDTK12_HKTB.schoolid

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
    JOIN sams.edu_pupil_studyhistory  epc
    ON epc.pupilid = eps.pupilid
    AND epc.schoolid = eps.schoolid
    AND epc.schoolclassid = eps.schoolclassid
    AND epc.wholeyearstudyrankid = 3
    AND epc.isdeleted = 0 AND epc.isactive =1
    AND epc.schoolyearid = eps.schoolyearid
  WHERE eps.schoolyearid = 21 AND EPS.LINKSCHOOLID IS NOT  NULL
  AND eps.schooltermid = 2
  AND eps.currentpupilstatusid = 1
  AND eps.isdeleted = 0
  AND eps.isactive = 1
  GROUP BY EPS.schoolid
  )couNTpupilNUDTK12_HKTB
 ON es.schoolid = couNTpupilNUDTK12_HKTB.schoolid
--ENDREGION

 --REGION HANH KIEM YEU
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
    JOIN sams.edu_pupil_studyhistory  epc
    ON epc.pupilid = eps.pupilid
    AND epc.schoolid = eps.schoolid
    AND epc.schoolclassid = eps.schoolclassid
    AND epc.wholeyearstudyrankid = 4
    AND epc.isdeleted = 0 AND epc.isactive =1
    AND epc.schoolyearid = eps.schoolyearid
  WHERE eps.schoolyearid = 21
  AND eps.schooltermid = 2
  AND eps.currentpupilstatusid = 1 AND EPS.LINKSCHOOLID IS NOT  NULL
  AND eps.isdeleted = 0
  AND eps.isactive = 1
  GROUP BY EPS.schoolid
  )couNTpupilK12_HKY
 ON es.schoolid = couNTpupilK12_HKY.schoolid

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
    JOIN sams.edu_pupil_studyhistory  epc
    ON epc.pupilid = eps.pupilid
    AND epc.schoolid = eps.schoolid
    AND epc.schoolclassid = eps.schoolclassid
    AND epc.wholeyearstudyrankid = 4
    AND epc.isdeleted = 0 AND epc.isactive =1
    AND epc.schoolyearid = eps.schoolyearid
  WHERE eps.schoolyearid = 21
  AND eps.schooltermid = 2 AND EPS.LINKSCHOOLID IS NOT  NULL
  AND eps.currentpupilstatusid = 1
  AND eps.isdeleted = 0
  AND eps.isactive = 1
  GROUP BY EPS.schoolid
  )couNTpupilNUK12_HKY
 ON es.schoolid = couNTpupilNUK12_HKY.schoolid
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
    JOIN sams.edu_pupil_studyhistory  epc
    ON epc.pupilid = eps.pupilid
    AND epc.schoolid = eps.schoolid
    AND epc.schoolclassid = eps.schoolclassid
    AND epc.wholeyearstudyrankid = 4
    AND epc.isdeleted = 0 AND epc.isactive =1
    AND epc.schoolyearid = eps.schoolyearid
  WHERE eps.schoolyearid = 21
  AND eps.schooltermid = 2 AND EPS.LINKSCHOOLID IS NOT  NULL
  AND eps.currentpupilstatusid = 1
  AND eps.isdeleted = 0
  AND eps.isactive = 1
  GROUP BY EPS.schoolid
  )couNTpupilDTK12_HKY
 ON es.schoolid = couNTpupilDTK12_HKY.schoolid

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
    JOIN sams.edu_pupil_studyhistory  epc
    ON epc.pupilid = eps.pupilid
    AND epc.schoolid = eps.schoolid
    AND epc.schoolclassid = eps.schoolclassid
    AND epc.wholeyearstudyrankid = 4
    AND epc.isdeleted = 0 AND epc.isactive =1
    AND epc.schoolyearid = eps.schoolyearid
  WHERE eps.schoolyearid = 21
  AND eps.schooltermid = 2
  AND eps.currentpupilstatusid = 1 AND EPS.LINKSCHOOLID IS NOT  NULL
  AND eps.isdeleted = 0
  AND eps.isactive = 1
  GROUP BY EPS.schoolid
  )couNTpupilNUDTK12_HKY
 ON es.schoolid = couNTpupilNUDTK12_HKY.schoolid
--ENDREGION
 --REGION HOC LUC YEU
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
    JOIN sams.edu_pupil_studyhistory  epc
    ON epc.pupilid = eps.pupilid
    AND epc.schoolid = eps.schoolid
    AND epc.schoolclassid = eps.schoolclassid
    AND epc.wholeyearstudyrankid = 5
    AND epc.isdeleted = 0 AND epc.isactive =1
    AND epc.schoolyearid = eps.schoolyearid
  WHERE eps.schoolyearid = 21
  AND eps.schooltermid = 2
  AND eps.currentpupilstatusid = 1
  AND eps.isdeleted = 0 AND EPS.LINKSCHOOLID IS NOT  NULL
  AND eps.isactive = 1
  GROUP BY EPS.schoolid
  )couNTpupilK12_HKKEM
 ON es.schoolid = couNTpupilK12_HKKEM.schoolid

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
    JOIN sams.edu_pupil_studyhistory  epc
    ON epc.pupilid = eps.pupilid
    AND epc.schoolid = eps.schoolid
    AND epc.schoolclassid = eps.schoolclassid
    AND epc.wholeyearstudyrankid = 5
    AND epc.isdeleted = 0 AND epc.isactive =1
    AND epc.schoolyearid = eps.schoolyearid
  WHERE eps.schoolyearid = 21 AND EPS.LINKSCHOOLID IS NOT  NULL
  AND eps.schooltermid = 2
  AND eps.currentpupilstatusid = 1
  AND eps.isdeleted = 0
  AND eps.isactive = 1
  GROUP BY EPS.schoolid
  )couNTpupilNUK12_HKKEM
 ON es.schoolid = couNTpupilNUK12_HKKEM.schoolid
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
    JOIN sams.edu_pupil_studyhistory  epc
    ON epc.pupilid = eps.pupilid
    AND epc.schoolid = eps.schoolid
    AND epc.schoolclassid = eps.schoolclassid
    AND epc.wholeyearstudyrankid = 5
    AND epc.isdeleted = 0 AND epc.isactive =1
    AND epc.schoolyearid = eps.schoolyearid
  WHERE eps.schoolyearid = 21
  AND eps.schooltermid = 2
  AND eps.currentpupilstatusid = 1
  AND eps.isdeleted = 0 AND EPS.LINKSCHOOLID IS NOT  NULL
  AND eps.isactive = 1
  GROUP BY EPS.schoolid
  )couNTpupilDTK12_HKKEM
 ON es.schoolid = couNTpupilDTK12_HKKEM.schoolid

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
    JOIN sams.edu_pupil_studyhistory  epc
    ON epc.pupilid = eps.pupilid
    AND epc.schoolid = eps.schoolid
    AND epc.schoolclassid = eps.schoolclassid
    AND epc.wholeyearstudyrankid = 5
    AND epc.isdeleted = 0 AND epc.isactive =1
    AND epc.schoolyearid = eps.schoolyearid
  WHERE eps.schoolyearid = 21 AND EPS.LINKSCHOOLID IS NOT  NULL
  AND eps.schooltermid = 2
  AND eps.currentpupilstatusid = 1
  AND eps.isdeleted = 0
  AND eps.isactive = 1
  GROUP BY EPS.schoolid
  )couNTpupilNUDTK12_HKKEM
 ON es.schoolid = couNTpupilNUDTK12_HKKEM.schoolid
--ENDREGION

  
WHERE es.isactive = 1 AND es.isdeleted = 0

  and ES.schoolid NOT IN (1592,1593,1594,1595,1596,1597,1598,1599,1600,1605,1607,1610,1618,1613,1614,1616,1608,1611,1615,1602,1603,1604,1609,1617,1601,1606,1612,1524,1530,10112318,1525,1515,1470,1528,1469)
--  AND ES.educationtypeid = 1
  AND ese.educationlevelid IN (7) AND (couNTpupilTHCS.slhs  >0 OR couNTpupilTHPT.slhs>0)
ORDER BY md.districtname,es.schoolname