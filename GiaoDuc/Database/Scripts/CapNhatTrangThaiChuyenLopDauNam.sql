update sams.edu_pupil_studytimeline eps SET currentpupilstatusid = 20
  WHERE currentpupilstatusid = 2 AND schoolyearid = 21 and pupilid IN (
SELECT em.pupilid FROM sams.edu_moveclassrequest em WHERE toschoolyearid = 21 AND isdeleted = 0 and em.createddate > to_timestamp('01/07/2018','dd/mm/yyyy'))