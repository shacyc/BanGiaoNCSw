CREATE PROCEDURE SAMS.EDU_SC_SUBJECT_ADDAUTO
/*
	CREATED BY	:	TR?N TH? MI
	DATE		    :	06/09/2017
	DESCRIPTION	:	tu dong add quyen dong tren Phan quyen nguoi dung tren lop hoc tu Phan cong giao vien bo mon
*/
(
    V_OUT OUT NUMBER
)
AS
  T_OUT NUMBER := 1;
BEGIN
  BEGIN
  	FOR CUR_ROW IN 
        (
            SELECT
                temp1.SCHOOLCLASSID,
            		temp1.SUBJECTID,
            		temp1.ISPARTICIPATEDSTUDYRANK,
                temp1.ISBILINGUALSUBJECT,
                temp1.ISBILINGUALAVGSUBJECT,
                temp1.AVGCALCFACTOR,
            		temp1.SCHOOLTERMID,
            FROM sams.edu_schoolclass es
              JOIN sams.edu_schoolclass_subject temp1
                ON es.schoolclassid = temp1.schoolclassid
            WHERE
              es.isdeleted = 0
              AND es.isactive = 1
              AND es.classid IN (4,5,6,7,8)
              AND temp1.schoolyearid = 2
              AND temp1.isdeleted = 0
              AND NOT EXISTS
            (SELECT 1 FROM sams.edu_schoolclass_subject WHERE es.schoolclassid = edu_schoolclass_subject.schoolclassid
              AND edu_schoolclass_subject.schoolyearid = 2 and edu_schoolclass_subject.isdeleted = 0)
        )
        LOOP
           BEGIN
             INSERT
            	INTO sams.EDU_SCHOOLCLASS_SUBJECT
            	(
            		SCHOOLCLASSID,
            		SUBJECTID,
            		ISPARTICIPATEDSTUDYRANK,
                ISBILINGUALSUBJECT ,
                ISBILINGUALAVGSUBJECT,
                AVGCALCFACTOR,
                SCHOOLYEARID,
            		SCHOOLTERMID,
            		CREATEDUSER,
            		CREATEDDATE
            	)
            	VALUES
            	(
            		CUR_ROW.SCHOOLCLASSID,
            		CUR_ROW.SUBJECTID,
            		CUR_ROW.ISPARTICIPATEDSTUDYRANK,
                CUR_ROW.ISBILINGUALSUBJECT,
                CUR_ROW.ISBILINGUALAVGSUBJECT,
                CUR_ROW.AVGCALCFACTOR,
                2,
            		CUR_ROW.SCHOOLTERMID,
            		'administrator',
                SYSDATE
            	);
            EXCEPTION WHEN OTHERS THEN
              T_OUT:= 0;
            END;
      END LOOP;
  EXCEPTION WHEN OTHERS THEN
    T_OUT:= 0;
  END;
  V_OUT := T_OUT;
END;
/