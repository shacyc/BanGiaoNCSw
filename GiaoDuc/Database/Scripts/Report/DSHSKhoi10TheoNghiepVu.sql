SELECT DISTINCT *
  FROM
  (

  SELECT * FROM 
  (
    SELECT 
      pupilid MA_HS,
      identificationnumber SBD,
      Substr(lastname, 1, Instr(lastname, ' ') - 1) AS HO,
      Substr(lastname, Instr(lastname, ' ') + 1)    AS DEM,
      firstname AS TEN,
       birthday,
      GENDERNAME,
      PLACEOFBIRTHFULLNAME,
      ethnicityname, --Dân t?c Name
      THCS,
      districtname,
     schoolclassname,
      MaTHPT,
      schoolid,
      schoolname,
     educationtypename
     ,'Phát sinh t? nghi?p v? tuy?n sinh G10' Note
           FROM
      (
    
    SELECT DISTINCT 
      edu_g10examresult.pupilid,
      edu_pupil.firstname,
      edu_pupil.lastname,
      edu_pupil.fullname,
      to_char(edu_pupil.birthday,'DD/MM/YYYY') birthday,
      DECODE(GENDER, 0,N'Nam', N'N?') GENDERNAME,
      NVL(MD_PROVINCE.PROVINCENAME, MD_COUNTRY.COUNTRYNAME) PLACEOFBIRTHFULLNAME,
      PL_ETHNICITY.ETHNICITYNAME, --Dân t?c Name
       to_char(NVL(SCHOOLTHCS.schoolname,'')) THCS,
      to_char(mdTHCS.districtname) districtname,
      NVL( esn.schoolclassname,'') schoolclassname,
      edu_school.schoolid MaTHPT,
      edu_school.schoolid,
      edu_school.schoolname,
      identificationnumber, 
      es1.educationtypename
      FROM sams.edu_g10examresult
      LEFT join SAMS.edu_pupil_g10examresult
      ON sams.edu_pupil_g10examresult.pupilid = sams.edu_g10examresult.pupilid
      AND edu_pupil_g10examresult.schoolyearid = 2
      AND edu_pupil_g10examresult.isdeleted = 0
      jOIN sams.edu_pupil
      ON sams.edu_pupil.pupilid = SAMS.edu_g10examresult.pupilid
      AND edu_pupil.isactive = 1 AND edu_pupil.isdeleted = 0
      AND edu_pupil.currentpupilstatusid = 1
      LEFT JOIN SAMS.PL_ETHNICITY ON  edu_pupil.ETHNICITYID = PL_ETHNICITY.ETHNICITYID
      LEFT JOIN SAMS.MD_COUNTRY ON  edu_pupil.PLACEOFBIRTHCOUNTRYID = MD_COUNTRY.COUNTRYID
      LEFT JOIN SAMS.MD_PROVINCE ON edu_pupil.PLACEOFBIRTHPROVINCEID = MD_PROVINCE.PROVINCEID
      left JOIN sams.edu_school SCHOOLTHCS
      ON SCHOOLTHCS.schoolid = edu_g10examresult.juniorschoolid
      LEFT JOIN sams.md_organ mo
      ON mo.organid = SCHOOLTHCS.organid
      LEFT JOIN sams.md_district mdTHCS
      ON mo.districtid = mdTHCS.districtid
      LEFT JOIN sams.edu_schoolclass_new esn
      ON esn.schoolclassid = edu_g10examresult.juniorschoolclassid
      AND esn.schoolyearid = edu_g10examresult.schoolyearid
      AND esn.schooltermid = 2 
      left JOIN sams.edu_school
      ON sams.edu_school.schoolid = edu_g10examresult.hischoolid
    left JOIN sams.edu_educationtype  es1
      ON edu_school.educationtypeid = es1.educationtypeid
     AND es1.isactive = 1 
     AND es1.isdeleted = 0
      WHERE 
      sams.edu_pupil.isactive = 1
      AND sams.edu_pupil.isdeleted = 0 
      AND sams.edu_school.isactive = 1
      AND sams.edu_school.isdeleted = 0 
      AND 
      SAMS.edu_g10examresult.isdeleted = 0 
      AND SAMS.edu_g10examresult.schoolyearid = 21
     AND EDU_SCHOOL.schoolid NOT IN   (1592,1593,1594,1595,1596,1597,1598,1599,1600,1605,1607,1610,1618,1613,1614,1616,1608,1611,1615,1602,1603,1604,1609,1617,1601,1606,1612,1524,1530,10112318,1525,1515,1470,1528,1469)
      )
    
      ORDER BY schoolname
  ) bang1
  UNION 
  (
      SELECT 
      pupilid MA_HS,
      identificationnumber SBD,
      Substr(lastname, 1, Instr(lastname, ' ') - 1) AS HO,
      Substr(lastname, Instr(lastname, ' ') + 1)    AS DEM,
     firstname AS TEN,
       birthday,
      GENDERNAME,
      PLACEOFBIRTHFULLNAME,
      ETHNICITYNAME ,--Dân t?c Name
      THCS,
     districtname,
     schoolclassname,
      MaTHPT,
      schoolid,
      schoolname,
     educationtypename
     ,'Phát sinh t? nghi?p v? chuy?n tru?ng t? t?nh ngoài d?n n?i t?nh' Note
           FROM
      (
         SELECT DISTINCT 
          ep.pupilid,
          ep.firstname,
          ep.lastname,
          ep.fullname,
          to_char(ep.birthday,'DD/MM/YYYY') birthday,
          DECODE(GENDER, 0,N'Nam', N'N?') GENDERNAME,
          NVL(MD_PROVINCE.PROVINCENAME, MD_COUNTRY.COUNTRYNAME) PLACEOFBIRTHFULLNAME,
          PL_ETHNICITY.ETHNICITYNAME, --Dân t?c Name
            to_char('') THCS,
          to_char('') districtname,
          NVL('','') schoolclassname,
          edu_school.schoolid MaTHPT,
          edu_school.schoolid,
          edu_school.schoolname,
          '' identificationnumber, 
          es1.educationtypename
          FROM sams.edu_pupil ep
          JOIN sams.edu_pupil_studytimeline eps
          ON ep.pupilid = eps.pupilid
          AND ep.currentschoolid = eps.schoolid
          AND ep.isactive = 1 AND eps.isdeleted = 0
          JOIN sams.edu_migrationrequest
           ON   edu_migrationrequest.pupilid = ep.pupilid
          AND   edu_migrationrequest.fromschoolyearid = eps.schoolyearid
          AND   edu_migrationrequest.toclassid IN (13,16)
          AND edu_migrationrequest.isdeleted = 0 
          AND edu_migrationrequest.migrationrequesttypeid = 12
          LEFT JOIN SAMS.PL_ETHNICITY ON  ep.ETHNICITYID = PL_ETHNICITY.ETHNICITYID
          LEFT JOIN SAMS.MD_COUNTRY ON  ep.PLACEOFBIRTHCOUNTRYID = MD_COUNTRY.COUNTRYID
          LEFT JOIN SAMS.MD_PROVINCE ON ep.PLACEOFBIRTHPROVINCEID = MD_PROVINCE.PROVINCEID  
          left JOIN sams.edu_school
          ON sams.edu_school.schoolid = ep.currentschoolid
          left JOIN sams.edu_educationtype  es1
          ON edu_school.educationtypeid = es1.educationtypeid
         AND es1.isactive = 1 
         AND es1.isdeleted = 0
          WHERE 
          ep.isactive = 1
          AND ep.isdeleted = 0 
          AND edu_school.isactive = 1
          AND edu_school.isdeleted = 0 
          AND eps.schoolyearid = 21
          AND eps.schooltermid = 1
          AND eps.currentpupilstatusid = 1
          AND ep.currentpupilstatusid =1
          AND ep.currentclassid IN (13,16)
          AND EDU_SCHOOL.schoolid NOT IN   (1592,1593,1594,1595,1596,1597,1598,1599,1600,1605,1607,1610,1618,1613,1614,1616,1608,1611,1615,1602,1603,1604,1609,1617,1601,1606,1612,1524,1530,10112318,1525,1515,1470,1528,1469)
      
      )
 
  )
  UNION 
  (
    SELECT 
      pupilid MA_HS,
      identificationnumber SBD,
      Substr(lastname, 1, Instr(lastname, ' ') - 1) AS HO,
      Substr(lastname, Instr(lastname, ' ') + 1)    AS DEM,
      firstname AS TEN,
       birthday,
      GENDERNAME,
      PLACEOFBIRTHFULLNAME,
      ETHNICITYNAME ,--Dân t?c Name
      THCS,
      to_char(districtname),
     schoolclassname,
      MaTHPT,
      schoolid,
      schoolname,
     educationtypename
     ,'Phát sinh t? nghi?p v? xin h?c l?i' Note
           FROM
      (
     SELECT DISTINCT 
      ep.pupilid,
      ep.firstname,
      ep.lastname,
      ep.fullname,
      to_char(ep.birthday,'DD/MM/YYYY') birthday,
      DECODE(ert.GENDER, 0,N'Nam', N'N?') GENDERNAME,
      NVL(MD_PROVINCE.PROVINCENAME, MD_COUNTRY.COUNTRYNAME) PLACEOFBIRTHFULLNAME,
      PL_ETHNICITY.ETHNICITYNAME, --Dân t?c Name
       to_char('') THCS,
      to_char('') districtname,
      NVL('','') schoolclassname,
      edu_school.schoolid MaTHPT,
      edu_school.schoolid,
      edu_school.schoolname,
      '' identificationnumber, 
      es1.educationtypename
      FROM sams.edu_pupil ep
      JOIN sams.edu_pupil_studytimeline eps
      ON ep.pupilid = eps.pupilid
      AND ep.currentschoolid = eps.schoolid
      AND ep.isactive = 1 AND eps.isdeleted = 0
      JOIN sams.edu_restudyrequest ert
       ON   ert.pupilid = ep.pupilid
      AND   ert.toschoolyearid = eps.schoolyearid
      AND   ert.toclassid IN (13,16)
      AND ert.isdeleted = 0 
      LEFT JOIN SAMS.PL_ETHNICITY ON  ep.ETHNICITYID = PL_ETHNICITY.ETHNICITYID
      LEFT JOIN SAMS.MD_COUNTRY ON  ep.PLACEOFBIRTHCOUNTRYID = MD_COUNTRY.COUNTRYID
      LEFT JOIN SAMS.MD_PROVINCE ON ep.PLACEOFBIRTHPROVINCEID = MD_PROVINCE.PROVINCEID  
      left JOIN sams.edu_school
      ON sams.edu_school.schoolid = ep.currentschoolid
      left JOIN sams.edu_educationtype  es1
      ON edu_school.educationtypeid = es1.educationtypeid
     AND es1.isactive = 1 
     AND es1.isdeleted = 0
      WHERE 
      ep.isactive = 1
      AND ep.isdeleted = 0 
      AND edu_school.isactive = 1
      AND edu_school.isdeleted = 0 
      AND eps.schoolyearid = 21
      AND eps.schooltermid = 1
--       AND  ep.currentpupilstatusid =1
      AND ep.currentclassid IN (13,16)
      AND EDU_SCHOOL.schoolid NOT IN   (1592,1593,1594,1595,1596,1597,1598,1599,1600,1605,1607,1610,1618,1613,1614,1616,1608,1611,1615,1602,1603,1604,1609,1617,1601,1606,1612,1524,1530,10112318,1525,1515,1470,1528,1469)
      
      )
  )
    UNION ALL
  (
   SELECT 
      pupilid MA_HS,
      '' SBD,
      Substr(lastname, 1, Instr(lastname, ' ') - 1) AS HO,
      Substr(lastname, Instr(lastname, ' ') + 1)    AS DEM,
     firstname AS TEN,
       birthday,
      GENDERNAME,
      PLACEOFBIRTHFULLNAME,
      ethnicityname, --Dân t?c Name
      THCS,
     DISTRICTNAME,
     schoolclassname,
      MaTHPT,
      schoolid,
      schoolname,
     educationtypename
     ,'Phát sinh t? nghi?p v? thêm m?i h?c sinh' Note
           FROM
      (
    
    SELECT DISTINCT 
      ep.pupilid,
      ep.firstname,
      ep.lastname,
      ep.fullname,
      to_char(ep.birthday,'DD/MM/YYYY') birthday,
      DECODE(GENDER, 0,N'Nam', N'N?') GENDERNAME,
      NVL(MD_PROVINCE.PROVINCENAME, MD_COUNTRY.COUNTRYNAME) PLACEOFBIRTHFULLNAME,
      PL_ETHNICITY.ETHNICITYNAME, --Dân t?c Name
        to_char(NVL(SCHOOLTHCS.schoolname,'')) THCS,
      to_char(mdTHCS.districtname) districtname,
       NVL( esn.schoolclassname,'') schoolclassname,
      edu_school.schoolid MaTHPT,
      edu_school.schoolid,
      edu_school.schoolname,
      '' identificationnumber, 
      es1.educationtypename
      FROM sams.edu_pupil ep
      JOIN sams.edu_pupil_studytimeline eps
      ON ep.pupilid = eps.pupilid
      AND ep.currentschoolid = eps.schoolid
      AND eps.currentpupilstatusid = 1
      AND ep.isactive = 1 AND eps.isdeleted = 0
      LEFT JOIN SAMS.PL_ETHNICITY ON  ep.ETHNICITYID = PL_ETHNICITY.ETHNICITYID
      LEFT JOIN SAMS.MD_COUNTRY ON  ep.PLACEOFBIRTHCOUNTRYID = MD_COUNTRY.COUNTRYID
      LEFT JOIN SAMS.MD_PROVINCE ON ep.PLACEOFBIRTHPROVINCEID = MD_PROVINCE.PROVINCEID

      LEFT JOIN (
      SELECT PUPILID,SCHOOLCLASSID,SCHOOLYEARID,SCHOOLID
        FROM (
            SELECT pupilid,schoolyearid,studytimelineid,SCHOOLID,SCHOOLCLASSID, ROW_NUMBER()
                    OVER (PARTITION BY EDU_PUPIL_STUDYTIMELINE.pupilid
              ORDER BY EDU_PUPIL_STUDYTIMELINE.SCHOOLYEARID DESC ) RNK
          FROM SAMS.EDU_PUPIL_STUDYTIMELINE
          WHERE SCHOOLTERMID = 2 AND
                EDU_PUPIL_STUDYTIMELINE.ISDELETED = 0
                AND EDU_PUPIL_STUDYTIMELINE.ISACTIVE = 1 AND
                EDU_PUPIL_STUDYTIMELINE.CURRENTPUPILSTATUSID = 1
                AND EDU_PUPIL_STUDYTIMELINE.SCHOOLYEARID <> 21

                )
        WHERE RNK = 1
      ) EDU_PUPIL_STUDYTIMELINE1
      ON ep.PUPILID = EDU_PUPIL_STUDYTIMELINE1.PUPILID
      left JOIN sams.edu_school SCHOOLTHCS
      ON SCHOOLTHCS.schoolid = EDU_PUPIL_STUDYTIMELINE1.schoolid
      LEFT JOIN sams.md_organ mo
      ON mo.organid = SCHOOLTHCS.organid
      LEFT JOIN sams.md_district mdTHCS
      ON mo.districtid = mdTHCS.districtid
      LEFT JOIN sams.edu_schoolclass_new esn
      ON esn.schoolclassid = EDU_PUPIL_STUDYTIMELINE1.schoolclassid
      AND esn.schoolyearid = EDU_PUPIL_STUDYTIMELINE1.schoolyearid
      AND esn.schooltermid = 2 
      left JOIN sams.edu_school
      ON sams.edu_school.schoolid = ep.currentschoolid
      left JOIN sams.edu_educationtype  es1
      ON edu_school.educationtypeid = es1.educationtypeid
     AND es1.isactive = 1 
     AND es1.isdeleted = 0
      WHERE 
      ep.isactive = 1
      AND ep.isdeleted = 0 
      AND edu_school.isactive = 1
      AND edu_school.isdeleted = 0 
      AND eps.schoolyearid = 21
      AND eps.schooltermid = 1
      AND ep.currentpupilstatusid = 1
      AND ep.currentclassid IN (13,16)
      AND EDU_SCHOOL.schoolid NOT IN   (1592,1593,1594,1595,1596,1597,1598,1599,1600,1605,1607,1610,1618,1613,1614,1616,1608,1611,1615,1602,1603,1604,1609,1617,1601,1606,1612,1524,1530,10112318,1525,1515,1470,1528,1469)
      AND ep.pupilid NOT IN 
        (
            SELECT edu_g10examresult.pupilid
              FROM sams.edu_g10examresult
              LEFT join SAMS.edu_pupil_g10examresult
              ON sams.edu_pupil_g10examresult.pupilid = sams.edu_g10examresult.pupilid
              AND edu_pupil_g10examresult.schoolyearid = 2
              AND edu_pupil_g10examresult.isdeleted = 0
              AND SAMS.edu_g10examresult.isdeleted = 0   
              AND SAMS.edu_g10examresult.schoolyearid = 21
  
              AND edu_g10examresult.hischoolid NOT IN   (1592,1593,1594,1595,1596,1597,1598,1599,1600,1605,1607,1610,1618,1613,1614,1616,1608,1611,1615,1602,1603,1604,1609,1617,1601,1606,1612,1524,1530,10112318,1525,1515,1470,1528,1469)
         )
      AND ep.pupilid NOT IN
        (
          SELECT ep.pupilid
          FROM sams.edu_pupil ep
          JOIN sams.edu_pupil_studytimeline eps
          ON ep.pupilid = eps.pupilid
          AND ep.currentschoolid = eps.schoolid
          AND ep.isactive = 1 AND eps.isdeleted = 0
          JOIN sams.edu_migrationrequest
           ON   edu_migrationrequest.pupilid = ep.pupilid
          AND   edu_migrationrequest.fromschoolyearid = eps.schoolyearid
          AND   edu_migrationrequest.toclassid IN (13,16)
          AND edu_migrationrequest.isdeleted = 0 
          AND edu_migrationrequest.migrationrequesttypeid = 12
          WHERE 
          ep.isactive = 1
          AND ep.isdeleted = 0 
          AND edu_school.isactive = 1
          AND edu_school.isdeleted = 0 
          AND eps.schoolyearid = 21
          AND eps.schooltermid = 1
          AND eps.currentpupilstatusid = 1
          AND ep.currentpupilstatusid =1
          AND ep.currentclassid IN (13,16)
          AND EDU_SCHOOL.schoolid NOT IN   (1592,1593,1594,1595,1596,1597,1598,1599,1600,1605,1607,1610,1618,1613,1614,1616,1608,1611,1615,1602,1603,1604,1609,1617,1601,1606,1612,1524,1530,10112318,1525,1515,1470,1528,1469)   
        )
      AND ep.pupilid NOT IN
        ( 
          SELECT ep.pupilid
          FROM sams.edu_pupil ep
                JOIN sams.edu_pupil_studytimeline eps
                ON ep.pupilid = eps.pupilid
                AND ep.currentschoolid = eps.schoolid
                AND ep.isactive = 1 AND eps.isdeleted = 0
                JOIN sams.edu_restudyrequest ert
                 ON   ert.pupilid = ep.pupilid
                AND   ert.toschoolyearid = eps.schoolyearid
                AND   ert.toclassid IN (13,16)
                AND ert.isdeleted = 0 
               
                WHERE 
                ep.isactive = 1
                AND ep.isdeleted = 0 
                AND edu_school.isactive = 1
                AND edu_school.isdeleted = 0 
                AND eps.schoolyearid = 21
                AND eps.schooltermid = 1
                AND ep.currentclassid IN (13,16)
                AND EDU_SCHOOL.schoolid NOT IN   (1592,1593,1594,1595,1596,1597,1598,1599,1600,1605,1607,1610,1618,1613,1614,1616,1608,1611,1615,1602,1603,1604,1609,1617,1601,1606,1612,1524,1530,10112318,1525,1515,1470,1528,1469)
               
         )
      )
             
  ) 
)

  ORDER BY schoolname
