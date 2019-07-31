SELECT * FROM (
    SELECT BANG1.*,
            CASE WHEN UPDATEBY.USERNAME  IS NULL AND BANG1.MODIFY_BY IS NULL THEN
                 CASE WHEN SU.USERNAME  IS NOT NULL AND METHOD = 2 THEN SU.USERNAME || ' - ' || SU.FULLNAME || ' - ' || MO.ORGANNAME
                 ELSE TRIM(EDU_PUPIL.PUPILID) ||' - '|| EDU_PUPIL.FULLNAME  END
            ELSE
                CASE WHEN UPDATEBY.USERNAME  IS NOT NULL AND METHOD = 2 THEN UPDATEBY.USERNAME || ' - ' || UPDATEBY.FULLNAME || ' - ' || MOUPDATE.ORGANNAME
                ELSE TRIM(PUPILUDATE.PUPILID) ||' - '|| PUPILUDATE.FULLNAME  END
            END FULLNAMEUSER,
            CASE WHEN SU1.USERNAME  IS NOT NULL AND METHOD = 2 THEN SU1.USERNAME || ' - ' || SU1.FULLNAME || ' - ' || MO1.ORGANNAME ELSE TRIM(EP1.PUPILID) ||' - '|| EP1.FULLNAME  END  DELETEUSER

     FROM(
            SELECT   EP.PUPILID AS PUPIL_ID, --MÃ H?C SINH
                     BGM.IDENTIFICATION_NUMBER, --S? BÁO DANH
                     BR.SCHOOL_YEAR_ID,
                     EP.FULLNAME, --TÊN H?C SINH
                     CASE WHEN EP.GENDER = 1 THEN 'N?' ELSE 'Nam' END GENDER, --GI?I TÍNH
                     EP.PLACEOFBIRTHFULL, -- FULL NOI SINH
                     BR.HIGH_SCHOOL_ID, --MÃ TRU?NG THPT
                     BR.HIGH_SCHOOL_CODE,
                     ES.SCHOOLNAME HIGH_SCHOOL_NAME, --TÊN TRU?NG THPT
                     BR.JUNIOR_SCHOOL_ID, --MÃ TRU?NG THCS
                     ES1.SCHOOLNAME JUNIOR_SCHOOL_NAME, --TÊN TRU?NG THCS
                     EE.EDUCATIONLEVELNAME, --H? H?C
                     EE.EDUCATIONLEVELID,
                     EE1.EDUCATIONTYPEID,
                     EE1.EDUCATIONTYPENAME, --LO?I HÌNH
                     BR.IS_EXTERNAL,
                     BR.DESCRIPTION, --GHI CHÚ FULLNAMEUSER-
                     CASE WHEN BR.MODIFY_DATE IS NULL THEN TO_CHAR(BR.CREATED_DATE, 'DD-MM-YYYY HH24:MI:SS') ELSE TO_CHAR(BR.MODIFY_DATE, 'DD-MM-YYYY HH24:MI:SS') END CREATED_DATE,
                     BGM.MARK, -- T?NG ÐI?M XÉT TUY?N
                     BR.JUNIOR_STUDY_RANK_ID,
                     BR.JUNIOR_CONDUCT_RANK_ID,
                     CR.CONDUCTRANKNAME,
                     CSR.STUDYRANKNAME,
                     BR.MODIFY_BY,
                     -- ngày h?y
                     br.IS_DELETED,
                     GRCR.GRCREQUESTRESULTNAME  GRCREQUESTRESULT,
                     CASE WHEN BR.METHOD_ID = 1 THEN 'Tr?c tuy?n' ELSE 'Tr?c ti?p' END METHOD_ID, -- HÌNH TH?C
                     TO_CHAR(BR.MODIFY_DATE, 'DD-MM-YYYY HH24:MI:SS') MODIFY_DATE,
                     br.CREATED_BY, BR.METHOD_ID METHOD,
                     ROW_NUMBER() OVER (ORDER BY BR.CREATED_DATE DESC) STT,
                     SUM(1) OVER()AS TOTALROWS
              FROM   SAMS.BR_G10_CONFIRM_RESULT BR
             INNER
              JOIN   SAMS.EDU_PUPIL EP
                     ON CAST(BR.PUPIL_ID AS CHAR(20))=EP.PUPILID
              LEFT
              JOIN   SAMS.BR_G10_MARK BGM
                     ON BGM.PUPIL_ID= CAST(BR.PUPIL_ID AS CHAR(20))
                     AND BGM.SCHOOL_YEAR_ID= BR.SCHOOL_YEAR_ID AND BGM.SORT_ORDER= 5 --LAY TONG DIEM
              LEFT
              JOIN   SAMS.EDU_SCHOOL ES
                     ON ES.SCHOOLID = BR.HIGH_SCHOOL_ID
              LEFT
              JOIN   SAMS.EDU_SCHOOL ES1
                     ON ES1.SCHOOLID = BR.JUNIOR_SCHOOL_ID
              LEFT
              JOIN   SAMS.EDU_EDUCATIONLEVEL EE
                     ON EE.EDUCATIONLEVELID = BR.EDUCATION_LEVEL_ID
              LEFT
              JOIN   SAMS.EDU_EDUCATIONTYPE EE1
                     ON EE1.EDUCATIONTYPEID = ES.EDUCATIONTYPEID
              LEFT
              JOIN  (
                        SELECT  AA.PUPILID,
                                AA.SCHOOLYEARID,
                                AA.GRCREQUESTRESULTID
                          FROM SAMS.EDU_GRCREQUEST AA
                         WHERE AA.REQUESTDATE = (SELECT MAX(B.REQUESTDATE)
                                                   FROM SAMS.EDU_GRCREQUEST B
                                                  WHERE B.PUPILID = AA.PUPILID)
                      ) GRC
                      ON GRC.pupilid =EP.PUPILID
              LEFT
              JOIN   SAMS.EDU_GRCREQUESTRESULT GRCR
                     ON GRCR.GRCREQUESTRESULTID =
                     GRC.GRCREQUESTRESULTID
             -- ÐI?M NAM H?C L?P 9
              LEFT JOIN SAMS.EDU_PUPIL_STUDYHISTORY
                   ON EDU_PUPIL_STUDYHISTORY.PUPILID = CAST(BR.PUPIL_ID AS CHAR(20))
                    AND EDU_PUPIL_STUDYHISTORY.SCHOOLYEARID = BR.JUNIOR_SCHOOL_YEAR_ID
                    AND EDU_PUPIL_STUDYHISTORY.ISACTIVE = 1 AND EDU_PUPIL_STUDYHISTORY.ISDELETED = 0
                    AND EDU_PUPIL_STUDYHISTORY.schoolid = br.junior_school_id
                    AND EDU_PUPIL_STUDYHISTORY.schoolclassid = br.junior_class_id
              LEFT JOIN SAMS.EDU_CONDUCTRANK CR
                ON EDU_PUPIL_STUDYHISTORY.WHOLEYEARCONDUCTRANKID = CR.CONDUCTRANKID
              LEFT JOIN SAMS.EDU_STUDYRANK CSR
                ON CSR.STUDYRANKID = EDU_PUPIL_STUDYHISTORY.WHOLEYEARSTUDYRANKID
             WHERE   EP.ISACTIVE=1 AND EP.ISDELETED = 0
                     AND BR.SCHOOL_YEAR_ID = 24
                     AND BR.IS_DELETED = 1
                     --AND (-1 < 0 OR BR.METHOD_ID = -1)
                     AND ES.SCHOOLID = 10060003
                     AND  EP.PUPILID = '014137204'
             ) BANG1
        LEFT
        JOIN  SAMS.SYS_USER SU
              ON SU.USERNAME =  BANG1.CREATED_BY
        LEFT
        JOIN  sams.md_organ mo
              ON su.organid = mo.organid
        LEFT
        JOIN  SAMS.EDU_PUPIL
              ON EDU_PUPIL.PUPILID = BANG1.PUPIL_ID
        --29/05 L?Y THEO TRU?NG H?P UPDATE
        LEFT
        JOIN  SAMS.SYS_USER UPDATEBY
              ON UPDATEBY.USERNAME =  BANG1.MODIFY_BY
        LEFT
        JOIN  SAMS.MD_ORGAN MOUPDATE
              ON UPDATEBY.ORGANID = MOUPDATE.ORGANID
        LEFT
        JOIN  SAMS.EDU_PUPIL PUPILUDATE
              ON PUPILUDATE.PUPILID = BANG1.PUPIL_ID
        --END 29/05

        LEFT
        JOIN  SAMS.SYS_USER SU1
              ON SU1.USERNAME =  BANG1.MODIFY_BY
              AND BANG1.IS_DELETED = 1
        LEFT
        JOIN  sams.md_organ mo1
               ON su1.organid = mo1.organid
        LEFT
        JOIN  sams.EDU_PUPIL EP1
               ON EP1.PUPILID = BANG1.PUPIL_ID
               AND BANG1.IS_DELETED = 1
  ORDER BY BANG1.CREATED_DATE DESC)
--  WHERE  STT > V_PAGEINDEX * V_PAGESIZE
--        AND STT <= (V_PAGEINDEX + 1) * V_PAGESIZE OR V_PAGESIZE < 0
  ORDER BY STT
    ;