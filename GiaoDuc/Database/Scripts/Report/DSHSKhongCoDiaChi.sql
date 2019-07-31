SELECT MO1.organid, MO1.ORGANNAME,es.schoolname,ec.classname,esn.schoolclassname,ep.pupilid,ep.fullname            
  --,es1.educationtypename
  FROM sams.edu_pupil ep
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
          AND ep.provinceid < 0 OR ep.districtid < 0
       AND ES.schoolid NOT IN (1592,1593,1594,1595,1596,1597,1598,1599,1600,1605,1607,1610,1618,1613,1614,1616,1608,1611,1615,1602,1603,1604,1609,1617,1601,1606,1612,1524,1530,10112318,1525,1515,1470,1528,1469)
       GROUP BY MO1.organid, MO1.ORGANNAME,es.schoolname,ec.classname,esn.schoolclassname,ep.pupilid,ep.fullname,ep.lastname,ep.firstname
      ORDER BY MO1.ORGANNAME,es.schoolname,
       NLSSORT(NLS_LOWER(ep.FIRSTNAME, 'NLS_SORT=vietnamese'), 'NLS_SORT=vietnamese'),
                NLSSORT(NLS_LOWER(ep.LASTNAME, 'NLS_SORT=vietnamese'), 'NLS_SORT=vietnamese')
 