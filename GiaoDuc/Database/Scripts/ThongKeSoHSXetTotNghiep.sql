  SELECT
        DISTRICTID,
        DISTRICTNAME,
        SCHOOLID,
        SCHOOLNAME,
--        DS1GIOI,
--        DS1KHA,
--        DS1TB,
--        DS1TONG,
--        DS2GIOI,
--        DS2KHA,
--        DS2TB,
--        DS2TONG,
--        DS3GIOI,
--        DS3KHA,
--        DS3TB,
--        DS3TONG,
--        DS1GIOI + DS2GIOI + DS3GIOI AS DSTONGGIOI,
--        DS1KHA + DS2KHA + DS2KHA AS DSTONGKHA,
--        DS1TB + DS2TB + DS3TB AS DSTONGTB,
--        DS1TONG + DS2TONG + DS3TONG AS DSTONG,
         TONGHSKHOI9 + nvl( tonghschuaxettn,0) TONGHSK9,
         TONGHSKHOI9DTN,
          TONGHSK9RTN,
          TONGHSK9RTN_CXET,
          TONGHSTD,nvl( tonghschuaxettn,0) tonghschuaxettn
      FROM
      (
        --L?y danh sách h?c sinh THCS
        (SELECT
--          MO1.ORGANID,
--          MO1.ORGANNAME ORGANSHORTNAME,
          MD.DISTRICTID,
          MD.DISTRICTNAME,
          ESC.SCHOOLID,
          ESC.SCHOOLNAME,

          ---DANH SÁCH 1 L?Y DANH SÁCH H?C SINH Ð?U TN V?I H?C L?C TB TR? LÊN     
          (SUM(CASE
                WHEN EG.FINISHEDJHSSCHOOLYEARID = 21
                     AND EG1.GRCREQUESTRESULTID IS NOT NULL
--                     AND EG.JHSGRADUATERANKID IN(1,2,3)
--                     AND EG.GRADE9THSTUDYRANKID NOT IN (4,5)
                     AND EG.SCHOOLYEARID = EG.FINISHEDJHSSCHOOLYEARID
                     AND EG.SCHOOLID = EG.FINISHEDJHSSCHOOLID
                THEN 1
                ELSE 0
              END) ) AS TONGHSKHOI9,
          (

          SUM(CASE
                WHEN EG1.GRCREQUESTRESULTID IS NOT NULL 
--                      AND EG.JHSGRADUATERANKID IN (1,2,3)
                      AND EG.FINISHEDJHSSCHOOLYEARID = 21
                    AND EG.GRCREQUESTRESULTID = 1
--                      AND EGP.GRCREQUESTID IS NOT NULL
--                      AND EG.GRADE9THSTUDYRANKID = 4
                      AND EG.SCHOOLYEARID = EG.FINISHEDJHSSCHOOLYEARID
                      AND EG.SCHOOLID = EG.FINISHEDJHSSCHOOLID
                THEN 1
                ELSE 0
              END)) AS TONGHSKHOI9DTN,
          (

          SUM(CASE
                WHEN EG1.GRCREQUESTRESULTID IS NOT NULL 
--                      AND EG.JHSGRADUATERANKID IN (1,2,3)
                      AND EG.FINISHEDJHSSCHOOLYEARID = 21
                    AND EG.GRCREQUESTRESULTID = 2
--                      AND EGP.GRCREQUESTID IS NOT NULL
--                      AND EG.GRADE9THSTUDYRANKID = 4
                      AND EG.SCHOOLYEARID = EG.FINISHEDJHSSCHOOLYEARID
                      AND EG.SCHOOLID = EG.FINISHEDJHSSCHOOLID
                THEN 1
                ELSE 0
              END)) AS TONGHSK9RTN,
          (

          SUM(CASE
                WHEN   EG.GRCREQUESTRESULTID NOT IN (1,2)
--                      AND EGP.GRCREQUESTID IS NOT NULL
--                      AND EG.GRADE9THSTUDYRANKID = 4
                      AND EG.SCHOOLYEARID = 21
                      AND EG.SCHOOLID = EG.FINISHEDJHSSCHOOLID
                THEN 1
                ELSE 0
              END)) AS TONGHSK9RTN_CXET,

             SUM(CASE
                            WHEN EG1.GRCREQUESTRESULTID IS NOT NULL 
            --                      AND EG.JHSGRADUATERANKID IN (1,2,3)
                                  AND (EG.FINISHEDJHSSCHOOLYEARID <> 21
                                    OR eg.pupilid IS NULL)
            --                    AND EG.GRCREQUESTRESULTID = 2
            --                      AND EGP.GRCREQUESTID IS NOT NULL
            --                      AND EG.GRADE9THSTUDYRANKID = 4
                                  AND EG.SCHOOLYEARID = EG.SCHOOLYEARID
                                  AND EG.SCHOOLID = EG.FINISHEDJHSSCHOOLID
                            THEN 1
                            ELSE 0
                          END) AS TONGHSTD
          ---DANH SÁCH 3 L?Y DANH SÁCH H?C SINH H?C H?T THCS T? NH?NG NAM TRU?C
          ,EPP.tonghschuaxettn

        FROM SAMS.EDU_SCHOOL ESC
          LEFT JOIN SAMS.MD_ORGAN MO
            ON ESC.ORGANID = MO.ORGANID
          LEFT JOIN sams.md_organ mo1
            ON mo1.organid = mo.parentid
          LEFT JOIN sams.md_district md
          ON md.districtid = MO.districtid
          LEFT JOIN 
          (SELECT eps.schoolid,nvl(count(DISTINCT eps.pupilid),0) tonghschuaxettn
            FROM  sams.edu_pupil_studytimeline eps
              JOIN sams.edu_pupil ep
              ON ep.pupilid = eps.pupilid
              AND ep.isactive = 1 AND ep.isdeleted = 0
              AND ep.currentpupilstatusid = 1 --AND ep.currentschoolid = eps.schoolid
--              AND ep.currentclassid IN (12,22)
              JOIN sams.edu_schoolclass_new esn
              ON esn.schoolclassid = eps.schoolclassid
              AND esn.schoolyearid= 21 AND esn.schooltermid = 2
              AND esn.classid IN (12,22)
            WHERE eps.isactive = 1 AND eps.isdeleted = 0
            AND eps.currentpupilstatusid = 1  AND eps.schoolyearid = 21 AND eps.schooltermid = 2
            AND eps.schoolid NOT IN (1592,1593,1594,1595,1596,1597,1598,1599,1600,1605,1607,1610,1618,1613,1614,1616,1608,1611,1615,1602,1603,1604,1609,1617,1601,1606,1612,1524,1530,10112318,1525,1515,1470,1528,1469)
              AND eps.pupilid NOT in (SELECT epc.pupilid FROM sams.EDU_GRCREQUEST epc 
                                  WHERE --epc.pupilid = eps.pupilid
                                     epc.isactive = 1 AND epc.isdeleted = 0
                                     AND epc.schoolyearid = 21
                                      AND epc.schoolid = eps.schoolid
              )

            GROUP BY eps.schoolid
           ) EPP 
            ON EPP.schoolid = ESC.schoolid
          

          LEFT JOIN  SAMS.EDU_GRCREQUEST EG
            ON EG.SCHOOLID = ESC.SCHOOLID
            AND ESC.ISDELETED = 0
            AND ESC.ISACTIVE = 1
            AND EG.SCHOOLYEARID = 21
          LEFT JOIN
          (
            SELECT GRCREQUESTID--, ADMISSIONPRIORITYID
            FROM SAMS.EDU_GRCREQUEST_PRIORITY
            WHERE
              ISDELETED = 0
              AND ADMISSIONPRIORITYID > 0
              AND ADMISSIONPRIORITYID IS NOT NULL
            GROUP BY GRCREQUESTID
            HAVING COUNT(1) > 0
          ) EGP
              ON EGP.GRCREQUESTID = EG.GRCREQUESTID
          LEFT JOIN SAMS.EDU_GRCREQUESTRESULT EG1
            ON EG1.GRCREQUESTRESULTID = EG.GRCREQUESTRESULTID
            AND EG1.ISDELETED = 0
            AND EG1.ISACTIVE = 1
--            AND EG1.ISSUCCESSFULRESULT = 1
        WHERE (EG.ISDELETED = 0 OR EG.ISDELETED IS NULL)
          AND (EG.ISACTIVE = 1 OR EG.ISACTIVE IS NULL)
--          AND ((EG.JHSGRADUATERANKID > 0 AND EG.JHSGRADUATERANKID IS NOT NULL) OR EG.JHSGRADUATERANKID IS NULL)
--          AND ((EG.GRADE9THSTUDYRANKID > 0 AND EG.GRADE9THSTUDYRANKID IS NOT NULL) OR EG.GRADE9THSTUDYRANKID IS NULL)
          AND (( EG.JHSGRADUATERANKID IS NOT NULL) OR EG.JHSGRADUATERANKID IS NULL)
          AND (( EG.GRADE9THSTUDYRANKID IS NOT NULL) OR EG.GRADE9THSTUDYRANKID IS NULL)
         AND EG.schoolid NOT IN (1592,1593,1594,1595,1596,1597,1598,1599,1600,1605,1607,1610,1618,1613,1614,1616,1608,1611,1615,1602,1603,1604,1609,1617,1601,1606,1612,1524,1530,10112318,1525,1515,1470,1528,1469)
          AND (EG.SCHOOLYEARID = 21 OR EG.SCHOOLYEARID IS NULL)
          AND EXISTS (
                        SELECT 1
                        FROM SAMS.EDU_SCHOOL_EDUCATIONLEVEL ESE
                        WHERE
                          ESE.SCHOOLID = ESC.SCHOOLID
                          AND ESE.EDUCATIONLEVELID IN (3, 7)
                     )
        GROUP BY
          ESC.SCHOOLID,
          ESC.SCHOOLNAME,
          ESC.EDUCATIONLEVELID,
          MD.DISTRICTID,
          MD.DISTRICTNAME,tonghschuaxettn)

      ) TEMP
    ORDER BY DISTRICTID, DISTRICTNAME
    ;

