SELECT --13864
  --*
 pupilid,fullname,birthday,currentschoolid,currentclassid,currentschoolclassid,isactive,isdeleted
  ,currentpupilstatusid,updateddate,updateduser
  FROM sams.edu_pupil ep
  WHERE pupilid IN ('012196578')   
 
  ;
SELECT * FROM sams.edu_pupil_studytimeline eps
 WHERE pupilid IN ('012196578')  
  
 -- AND schoolyearid = 21
  ;
SELECT * FROM sams.br_g10_confirm_result bgcr
  WHERE pupil_id IN ('012196578')
  ;
SELECT schoolid,schoolname,schoolcode FROM sams.edu_school es
  WHERE schoolid = 10042302   
  ;