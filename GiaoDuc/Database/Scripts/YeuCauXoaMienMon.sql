-- Tìm pupil id
SELECT * FROM sams.edu_subjectexemptrequest em
  WHERE subjectexemptrequestid = 'SE20190105000009' -- param: mã tk cung cấp, update isdelete = 1
  ;
SELECT * FROM sams.edu_subjectexemptlist es
  WHERE subjectexemptrequestid = 'SE20190105000009' -- param: mã tk cung cấp, update isdelete = 1
  ;
-----
SELECT * FROM sams.edu_pupil_markbook epm
  WHERE schoolyearid = 21 AND schooltermid = 2 AND subjectid = 14 AND pupilid = '011143033' -- param: thay pupil id đã thấy ở trên
  ; -- => check xem đã nhập điểm chưa

SELECT * FROM sams.edu_pupil_mark epm
  WHERE pupilid = '011143033' AND schoolyearid = 21 AND subjectid = 14 -- 2
  ; -- => cập nhật lại thông tin firstTermMark = NULL
