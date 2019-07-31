SELECT * FROM sams.edu_admissionregister EA
  WHERE ea.admissionregisterid = 'AR20181004006492';--dk tsdc

SELECT * FROM sams.edu_admissionselection  EA; -- keets qua

SELECT * FROM sams.edu_admissionselection_item  EA; -- Ket qua duyet tuyen sinh dau / rot tsdc (result))

SELECT ep.pupilid,fullname,currentschoolid,currentclassid,currentschoolclassid ,isdeleted
  FROM sams.edu_pupil ep
  WHERE ep.pupilid ='011992057'; -- Khi tsdc tao ket qua trung tuyen day toan bo thong tin hoc sinh update --currentschoolid, currentclassid, currentschoolclassid = 0
SELECT * FROM sams.edu_pupil_studytimeline eps
  WHERE pupilid = '011992057' AND schoolyearid = 21; -- them 2 dong cua nam hien tai

-- Xoa TSDC
  -- Xoa du lieu trong bang edu_admissionregister, edu_admissionselection, edu_admissionselection_item
  -- Dua du lieu edu_pupil ve trang thai truoc khi tuyen sinh
  -- edu_pupil_studytimeline xoa 2 dong nam hoc hien tai sinh ra
