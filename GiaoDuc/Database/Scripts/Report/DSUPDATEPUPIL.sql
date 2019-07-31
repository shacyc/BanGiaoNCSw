SELECT    PPL.PUPILID,
              PPL.FULLNAME,
              PPL.BIRTHDAY,
              PPL.ORDERINDEX,
              NVL2(SUC.USERNAME, EP.CREATEDUSER || '-' || SUC.FULLNAME, '') CREATEDUSER,
              TO_CHAR(EP.CREATEDDATE, 'DD/MM/YYYY HH24:MI:SS') CREATEDDATE,
              NVL2(PPL.UPDATEDUSER, PPL.UPDATEDUSER || '-' || SUU.FULLNAME, '') UPDATEDUSER,
              PPL.UPDATEDDATE
    FROM      (
                  SELECT    DISTINCT
                            EPL.PUPILID,
                            FULLNAME,
                            FIRSTNAME,
                            LASTNAME,
                            BIRTHDAY,
                            EPL.ORDERINDEX,
                            EPL.UPDATEDUSER,
                            TO_CHAR(EPL.UPDATEDDATE, 'DD/MM/YYYY HH24:MI:SS') UPDATEDDATE
                  FROM      SAMS.EDU_PUPIL_LOG              EPL
                  JOIN      SAMS.EDU_PUPIL_STUDYTIMELINE    EPS
                    ON      EPL.PUPILID                   = EPS.PUPILID
                  WHERE     LOGTYPE             = 2 
                    AND     EPS.SCHOOLCLASSID   = V_SCHOOLCLASSID
                    AND     EPL.ORDERINDEX      > 0
                    AND     EPS.SCHOOLYEARID    = 21
                    AND     EPS.SCHOOLTERMID    = V_SCHOOLTERMID
                    AND     EPS.ISACTIVE        = 1
                    AND     EPS.ISDELETED       = 0
              ) PPL
    JOIN      SAMS.EDU_PUPIL      EP
      ON      PPL.PUPILID       = EP.PUPILID
    LEFT 
    JOIN      SAMS.SYS_USER       SUC
      ON      EP.CREATEDUSER    = SUC.USERNAME
    LEFT 
    JOIN      SAMS.SYS_USER       SUU
      ON      PPL.UPDATEDUSER   = SUU.USERNAME
   ORDER BY   EP.ISDELETED,
              NLSSORT(NLS_LOWER(EP.FIRSTNAME, 'NLS_SORT=vietnamese'), 'NLS_SORT=vietnamese'),
              NLSSORT(NLS_LOWER(EP.LASTNAME, 'NLS_SORT=vietnamese'), 'NLS_SORT=vietnamese'),
              EP.BIRTHDAY,
              PPL.UPDATEDDATE DESC;