
SELECT md.districtid,md.districtname,su.username, su.fullname,to_char(su.birthday,'dd/MM/yyyy') birthday , es.schoolname
  FROM sams.sys_user su
    JOIN sams.sys_user_teachschool  sus
      ON sus.username = su.username   
    JOIN sams.edu_school es
      ON es.schoolid = sus.schoolid
    LEFT JOIN sams.edu_school_educationlevel ese
      ON ese.schoolid = es.schoolid
     
  LEFT JOIN sams.md_organ mo
    ON es.organid = mo.organid
  LEFT JOIN sams.md_district md
    ON md.districtid = mo.districtid
    WHERE su.isactive = 1 AND su.isdeleted = 0
        AND ese.educationlevelid = 2 
        AND su.username NOT IN (SELECT su1.username
                          FROM sams.sys_user su1
                          WHERE upper(su1.username) LIKE 'NC%'
                          )
        AND ES.schoolid NOT IN (1592,1593,1594,1595,1596,1597,1598,1599,1600,1605,1607,1610,1618,1613,1614,1616,1608,1611,1615,1602,1603,1604,1609,1617,1601,1606,1612,1524,1530,10112318,1541,1525,1515,1470,1528,1469)
    GROUP BY su.username, su.fullname,su.birthday, es.schoolname,su.firstname,su.lastname,md.districtid,md.districtname
      
    ORDER BY    districtname,
                NLSSORT(NLS_LOWER(su.firstname, 'NLS_SORT=vietnamese'), 'NLS_SORT=vietnamese'),
                NLSSORT(NLS_LOWER(su.lastname, 'NLS_SORT=vietnamese'), 'NLS_SORT=vietnamese')
  ;

