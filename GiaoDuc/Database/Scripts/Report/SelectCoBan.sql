SELECT * FROM sams.edu_grcrequest eg
  WHERE schoolyearid = 2 
  AND pupilid IN (011324713)
  ;

SELECT * FROM sams.edu_grcconfig_division egd
  WHERE schoolyearid = 2 
  ;

SELECT grcrequestid,schoolid,pupilid,fullname,isactive,isdeleted
  ,grcrequestresultid,grcrequestnumber
  ,grade9thstudyrankid,grade9thconductrankid,prioritynotes,schoolyearid
  FROM sams.edu_grcrequest eg
  WHERE schoolid IN (10060016,16030101,16030102,16030103,16030104,16030105,16030106,16030107,16030108,16030111,16030109,16030110,16030112,16030113,16030114,16030115,16030116,16030117,16030118,16030119,16030120,16030121,16030122,1597 ) AND schoolyearid = 2
  AND isactive = 1 AND isdeleted = 0 AND schoolyearid = 2 AND grcrequestresultid = 1 
--  AND grade9thstudyrankid = 4
;
SELECT * FROM sams.edu_pupil_markbook
  WHERE pupilid = '013455591 ';

SELECT * FROM sams.edu_frequentremarkbook ef
  WHERE pupilid = 013718595 
  ;

SELECT * FROM sams.edu_pupil ep 
  where ep.pupilid = 014141778           ;

SELECT * FROM sams.edu_admissionregister ea
  WHERE admissionregisterid =  'AR20180721315574'
  ;


SELECT * FROM sams.edu_restudyrequest er
  WHERE restudyrequestid = 'PR2018053020755'
  ;
SELECT * FROM sams.edu_passclassrequest ep
  WHERE passclassrequestid = 'PR2018052515768'
  ;
SELECT 
  *
  FROM sams.edu_pupil_log  ep
  WHERE pupilid = '014141788'    ORDER BY updateddate
  ;
SELECT --13864
  --*
 pupilid,fullname,birthday,currentschoolid,currentclassid,currentschoolclassid,isactive,isdeleted
  ,currentpupilstatusid,updateddate,updateduser
  FROM sams.edu_pupil ep
  WHERE pupilid = '014181742'   
 
  ;
SELECT * FROM sams.edu_pupil_studytimeline eps

  WHERE pupilid = '014181742'
 -- AND schoolyearid = 21
  ;
SELECT * FROM sams.edu_pupil_studytimeline_log eps

  WHERE pupilid = '013104853  ' 
--  AND schoolyearid = 21
  ;
SELECT * FROM sams.edu_schoolclass_new esn
  WHERE esn.schoolyearid = 21  AND isactive = 1 AND schoolid = '27075';

SELECT * FROM sams.edu_admissionregister ea
  WHERE pupilid =  '011049112'--49032
  ;
SELECT * FROM sams.edu_moveclassrequest em
  WHERE moveclassrequestid = 'MC20180911000136'
  ;
SELECT * FROM sams.edu_migrationrequest   em
  WHERE em.migrationrequestid = 'EM20190212000140   ';

SELECT * FROM sams.edu_migrationrequesttype em;

SELECT * FROM sams.edu_pupil_studyhistory eps
  WHERE pupilid = '011919164 ' AND isdeleted = 0
  ;
-- Huy mien mon
SELECT * FROM sams.edu_subjectexemptrequest em
  WHERE subjectexemptrequestid = 'SE20190105000009'
  ;
SELECT * FROM sams.edu_subjectexemptlist es
  WHERE subjectexemptrequestid = 'SE20190105000009'
  ;
-----
SELECT * FROM sams.edu_pupil_markbook epm
  WHERE schoolyearid = 21 AND schooltermid = 2 AND subjectid = 14 AND pupilid = '25030112'
  ;
SELECT * FROM sams.edu_pupil_mark epm
  WHERE pupilid = '011143315' AND schoolyearid = 21 AND subjectid = 14
  ; 
SELECT * FROM sams.edu_marktype  em;
  ;

SELECT * FROM sams.edu_pupil_markbook epm
  WHERE schoolyearid = 21 AND schooltermid = 2  AND schoolid = 25030112 AND schoolclassid IN (9904, 9913)
  AND subjectid = 9  AND marktypeid = 1  AND isactive = 1 AND isdeleted =0
  AND ischanged = 1
  ;

SELECT * FROM sams.edu_admissionregister ea
  WHERE EA.admissionregisterid = 'AR20180829032523'
  ;

SELECT * FROM sams.edu_conductrank  es
   WHERE isactive = 1 AND isdeleted = 0
  ;
SELECT * FROM sams.edu_pupil_conductrank  es
   WHERE  isdeleted = 0 AND pupilid = 011032767
  ;
SELECT * FROM sams.sys_user su
  WHERE username = '011006651'
  ;