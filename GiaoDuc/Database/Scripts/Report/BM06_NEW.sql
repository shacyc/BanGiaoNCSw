SELECT rownum, MO1.ORGANNAME
  ,es.schoolname
  ,es1.educationtypename
  ,NVL(bang1.TotalPupil,0) TotalPupil
  ,NVL(bang2.totalpino,0) totalpino
  ,NVL(bang3.totalgvcn,0) totalgvcn
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
  LEFT JOIN
    (SELECT schoolid,TotalPINO
  FROM(
        SELECT es.schoolid, count(DISTINCT sys.pupilid) TotalPINO
        FROM 
        SAMS.EDU_SCHOOL ES        
         JOIN sams.edu_pupil ep
          ON ep.currentschoolid = es.schoolid
         JOIN sams.sys_EPUPILLOGINLOG sys
        ON ep.pupilid = sys.pupilid
        AND sys.egovchanelid IN (2,3)
        WHERE ES.ISDELETED = 0 AND ES.ISACTIVE = 1
        and ES.schoolid NOT IN (1592,1593,1594,1595,1596,1597,1598,1599,1600,1605,1607,1610,1618,1613,1614,1616,1608,1611,1615,1602,1603,1604
                            ,1609,1617,1601,1606,1612,1524,1530,10112318,1525,1515,1470,1528,1469,1799,1810,1786,1789,1818,1797,1819,1798,1689,1823,1809,1814,1787,1811,1820,1808,1821)
        GROUP BY schoolid)      
        GROUP BY  schoolid,TotalPINO
      )BANG2
      ON es.schoolid = bang2.schoolid 
 LEFT JOIN
    (
       SELECT schoolid, TOTALGVCN
        FROM(
              SELECT ES.schoolid, count(edu_sendmsgrequest.sendmsgrequestid) TOTALGVCN
        FROM 
        SAMS.EDU_SCHOOL ES
        LEFT JOIN SAMS.MD_ORGAN MO
        ON     ES.ORGANID = MO.ORGANID
        LEFT JOIN SAMS.MD_ORGAN MO1 
        ON MO.PARENTID = MO1.ORGANID
           JOIN sams.edu_sendmsgrequest 
          ON edu_sendmsgrequest.organid = es.organid
           AND edu_sendmsgrequest.isdeleted = 0
          AND edu_sendmsgrequest.issentmsg =  1
          AND edu_sendmsgrequest.sendmsgrequesttypeid = 1
        WHERE ES.ISDELETED = 0 AND ES.ISACTIVE = 1
        and ES.schoolid NOT IN (1592,1593,1594,1595,1596,1597,1598,1599,1600,1605,1607,1610,1618,1613,1614,1616,1608,1611,1615,1602,1603,1604
                            ,1609,1617,1601,1606,1612,1524,1530,10112318,1525,1515,1470,1528,1469,1799,1810,1786,1789,1818,1797,1819,1798,1689,1823,1809,1814,1787,1811,1820,1808,1821)
        
        GROUP BY es.schoolid)         
        GROUP BY  schoolid,totalgvcn
      )BANG3
      ON es.schoolid = bang3.schoolid 
     
      WHERE mo1.organid NOT IN (5700) AND es.isactive = 1 AND es.isdeleted = 0
      and ES.schoolid NOT IN (1592,1593,1594,1595,1596,1597,1598,1599,1600,1605,1607,1610,1618,1613,1614,1616,1608,1611,1615,1602,1603,1604
                            ,1609,1617,1601,1606,1612,1524,1530,10112318,1525,1515,1470,1528,1469,1799,1810,1786,1789,1818,1797,1819,1798,1689,1823,1809,1814,1787,1811,1820,1808,1821)
      AND ese.educationlevelid = 7
      
    ORDER BY mo1.organname
;