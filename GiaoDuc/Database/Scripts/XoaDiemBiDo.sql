--UPDATE sams.edu_pupil_markbook
--  SET ischanged = 0
SELECT * FROM sams.edu_pupil_markbook  epm
  WHERE  schoolyearid = 21 AND schooltermid = 2 AND schoolid = 11030106 
  AND schoolclassid = 7856  AND subjectid IN(8)
  AND ischanged = 1 --AND marktypeid = 1
  ;

SELECT * FROM  sams.edu_markgroup em;
SELECT * FROM sams.edu_marktype em;



Khôi ph?c k? thi V?N ÐÁP KH?I 8;

