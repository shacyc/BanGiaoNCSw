--SELECT * FROM sams.edu_class ec WHERE isdeleted = 0 AND isactive = 1;

--SELECT * FROM sams.sys_user su WHERE username= '011101501';

--SELECT * FROM sams.edu_Pupil WHERE pupilid = '014195062';
--
--SELECT * FROM sams.edu_Pupil WHERE pupilid = '014194979';
--
--SELECT * FROM sams.edu_pupil_studytimeline eps WHERE pupilid = '014194979';
--  SELECT * FROM sams.edu_pupil_studytimeline_log eps
-- WHERE pupilid IN ('011423414') 


SELECT * FROM sams.edu_admissionregister ea
  WHERE upper(pupilfullname) LIKE  '%VU Ð? DUY L?C%' 
  AND extract(day from pupilbirthday) = 19
  AND extract(MONTH from pupilbirthday) = 6
  AND extract(YEAR from pupilbirthday) = 2008
  ;
SELECT * FROM sams.edu_admissionregister EA
  WHERE pupilid IN ('014194959','014195061')
--SELECT * FROM sams.am_ogservice ao ea;

SELECT * FROM sams.edu_admissionregister ea
  WHERE admissionregisterid = 'AR20190721283555'

SELECT * FROM sams.edu_Pupil WHERE pupilid IN ('014194959','014195061');
SELECT * FROM sams.edu_pupil ep
  where UPPER(fullname) like '%VU Ð? DUY L?C%'
   AND extract(day from birthday) = 19
  AND extract(MONTH from birthday) = 6
  AND extract(YEAR from birthday) = 2008;

SELECT * FROM sams.edu_pupil_studytimeline eps WHERE pupilid IN ('014195060','014194958','012802420');
SELECT * FROM sams.md_province mp
  where provinceid = 21;

SELECT * FROM sams.admission  ea
  WHERE admissionregisterid IN ('AR20190721283555','AR20190723050704','AR20190723050706')
  SELECT * FROM sams.edu_admissionselection_item ea
  WHERE admissionregisterid IN ('AR20190721283555','AR20190721283555')
