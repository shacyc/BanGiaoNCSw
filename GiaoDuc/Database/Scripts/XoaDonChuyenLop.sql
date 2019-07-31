--SELECT * FROM sams.edu_pupil_studytimeline eps WHERE pupilid = '013357000' AND schoolyearid = 21 order by createddate;
SELECT * FROM sams.edu_pupil_studytimeline eps WHERE pupilid = '011222236' AND schoolyearid = 21 order by createddate;
--SELECT * FROM sams.edu_pupil eps WHERE pupilid = '011881407' order by createddate;
--SELECT * FROM sams.edu_pupil eps WHERE pupilid = '013348609'  order by createddate;
SELECT * FROM sams.edu_moveclassrequest em WHERE pupilid = '011222236' AND isdeleted = 0;
SELECT * FROM sams.edu_moveclassrequest em WHERE moveclassrequestid = 'MC20190114000005 ';
SELECT 
  --*
 ep.pupilid,ep.fullname,ep.currentschoolid,ep.currentclassid,ep.currentschoolclassid, loginpassword
--      updateduser,updateddate
  FROM sams.edu_pupil  ep
  WHERE ep.pupilid =  '011222236'; -- dua lop ve -1

--"- Kiem tra mã hoc sinh dó có bao nhiêu don chuyen lop trong mot nam hoc
-- Kiem tra edu_pupil_studytimeline có bao nhiêu dòng trong nam hoc can xét
-- giu lai 2 dòng edu_pupil_studytimeline và dua ve trang thái chua xep lop
-- Cap nhat edu_pupil ve trang thái chua xep lop currentschoolclassid = -1