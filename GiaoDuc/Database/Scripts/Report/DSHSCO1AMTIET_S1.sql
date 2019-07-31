SELECT MO1.organid, MO1.ORGANNAME,es.schoolname
  --,es1.educationtypename
  ,NVL(bang1.TotalPupil,0) TotalPupil
  ,NVL(bang2.totalpupil,0) totalpUPIL
  FROM SAMS.EDU_SCHOOL ES
    LEFT JOIN SAMS.MD_ORGAN MO
    ON     ES.ORGANID = MO.ORGANID
    LEFT JOIN SAMS.MD_ORGAN MO1 
    ON MO.PARENTID = MO1.ORGANID
    LEFT JOIN sams.edu_school_educationlevel ese
     ON ese.schoolid = es.schoolid
    JOIN sams.edu_educationtype  es1
    ON es.educationtypeid = es1.educationtypeid
   AND es1.isactive = 1 
   AND es1.isdeleted = 0
  LEFT JOIN
    (SELECT schoolid,TotalPupil
      FROM(
        SELECT ES.schoolid, count(DISTINCT ep.pupilid) TotalPupil
        FROM 
        SAMS.EDU_SCHOOL ES        
         JOIN sams.edu_pupil ep
          ON ep.currentschoolid = es.schoolid
          AND ep.isactive = 1 AND ep.isdeleted = 0
          AND ep.currentschoolid = es.schoolid

          JOIN sams.edu_pupil_studytimeline
          ON   edu_pupil_studytimeline.pupilid = ep.pupilid
          AND edu_pupil_studytimeline.schoolid = es.schoolid
          AND edu_pupil_studytimeline.isactive = 1 AND edu_pupil_studytimeline.isdeleted = 0
          AND edu_pupil_studytimeline.currentpupilstatusid = 1 AND
          edu_pupil_studytimeline.schoolyearid = 21 AND edu_pupil_studytimeline.schooltermid = 1       
        WHERE ES.ISDELETED = 0 AND ES.ISACTIVE = 1
        and ES.schoolid NOT IN (1592,1593,1594,1595,1596,1597,1598,1599,1600,1605,1607,1610,1618,1613,1614,1616,1608,1611,1615,1602,1603,1604
                            ,1609,1617,1601,1606,1612,1524,1530,10112318,1525,1515,1470,1528,1469,1799,1810,1786,1789,1818,1797,1819,1798,1689,1823,1809,1814,1787,1811,1820,1808,1821)
        GROUP BY ES.schoolid)      
        GROUP BY  schoolid,TotalPupil
      )BANG1
      ON es.schoolid = bang1.schoolid 
   JOIN
    (
        SELECT schoolid,TotalPUPIL
  FROM(
        SELECT es.schoolid, count(DISTINCT ep.pupilid) TotalPUPIL
        FROM 
             sams.edu_pupil ep
    JOIN sams.edu_pupil_studytimeline eps
      ON eps.pupilid = ep.pupilid
      AND eps.currentpupilstatusid = 1
      AND eps.schoolid = ep.currentschoolid
      AND eps.isdeleted = 1 AND ep.isdeleted = 0
      AND eps.schoolyearid = 21 AND eps.schooltermid = 1
    join SAMS.EDU_SCHOOL ES
      ON eps.schoolid = es.schoolid
    LEFT JOIN sams.edu_class ec
      ON ec.classid = ep.currentclassid
      AND ec.isdeleted = 0 AND ec.isactive = 1
    LEFT JOIN sams.edu_schoolclass_new esn
      ON esn.schoolclassid = eps.schoolclassid
      AND esn.schoolyearid = eps.schoolyearid
      AND esn.schooltermid = eps.schooltermid
      AND esn.isactive = 1 AND esn.isdeleted = 0

    LEFT JOIN SAMS.MD_ORGAN MO
    ON     ES.ORGANID = MO.ORGANID
    LEFT JOIN SAMS.MD_ORGAN MO1 
    ON MO.PARENTID = MO1.ORGANID
    LEFT JOIN sams.edu_school_educationlevel ese
     ON ese.schoolid = es.schoolid
    JOIN sams.edu_educationtype  es1
    ON es.educationtypeid = es1.educationtypeid
   AND es1.isactive = 1 
   AND es1.isdeleted = 0
    WHERE ES.ISDELETED = 0 AND ES.ISACTIVE = 1
          AND ep.isactive = 1 AND ep.isdeleted = 0 
          AND length(ep.firstname) = 1
       AND ES.schoolid NOT IN (1592,1593,1594,1595,1596,1597,1598,1599,1600,1605,1607,1610,1618,1613,1614,1616,1608,1611,1615,1602,1603,1604,1609,1617,1601,1606,1612,1524,1530,10112318,1525,1515,1470,1528,1469)
       
       GROUP BY ES.schoolid)      
        GROUP BY  schoolid,totalpupil
      )BANG2
      ON es.schoolid = bang2.schoolid      
      WHERE mo1.organid NOT IN (5700) AND es.isactive = 1 AND es.isdeleted = 0
     AND ES.schoolid NOT IN (1592,1593,1594,1595,1596,1597,1598,1599,1600,1605,1607,1610,1618,1613,1614,1616,1608,1611,1615,1602,1603,1604,1609,1617,1601,1606,1612,1524,1530,10112318,1525,1515,1470,1528,1469)
  -- AND ese.educationlevelid = 2
      AND bang2.totalpupil > 0
  GROUP BY
    MO1.organid, MO1.ORGANNAME,es.schoolname
  --,es1.educationtypename
  ,bang1.TotalPupil
  ,bang2.totalpupil
    ORDER BY mo1.organname, es.schoolname
;