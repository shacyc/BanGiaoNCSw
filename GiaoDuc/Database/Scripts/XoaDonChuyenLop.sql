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

--"- Kiem tra m� hoc sinh d� c� bao nhi�u don chuyen lop trong mot nam hoc
-- Kiem tra edu_pupil_studytimeline c� bao nhi�u d�ng trong nam hoc can x�t
-- giu lai 2 d�ng edu_pupil_studytimeline v� dua ve trang th�i chua xep lop
-- Cap nhat edu_pupil ve trang th�i chua xep lop currentschoolclassid = -1