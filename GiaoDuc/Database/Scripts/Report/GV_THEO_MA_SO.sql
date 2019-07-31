SELECT DISTINCT
    SAMS.mp_eduschool.moetschoolid TRUONG,
		SU.FULLNAME HO_TEN,
		CASE WHEN SU.gender = 0 THEN 1 ELSE 2 END GIOI_TINH,
		to_char(SU.birthday,'DD/MM/YYYY') NGAY_SINH,
' ' MA_TRANG_THAI_CB,
    idcard CMND,
		SU.EMAIL,
    mobi SDT,
' ' MA_DAN_TOC,
  ' ' MA_TON_GIAO,
  ' ' MA_TINH,
  ' ' MA_HUYEN,
  ' ' MA_XA,
  ' ' LA_DOAN_VIEN,
  ' ' LA_DANG_VIEN,
  ' ' BHXH,
    sams.mp_eduworkingposition.moetworkingpositionid MA_VI_TRI,
  sams.mp_eduposition.moetpositionid MA_CHUC_VU,

    SU.firstname,
  SU.lastname,
  sams.edu_school_educationlevel.educationlevelid
	
	
	FROM SAMS.SYS_USER SU
  JOIN SAMS.SYS_USER_TEACHSCHOOL SUT ON SU.USERNAME = SUT.USERNAME
   --JOIN EDU_SCHOOL ES ON SUT.SCHOOLID = ES.SCHOOLID
   LEFT JOIN SAMS.SYS_POSITION SP ON SP.POSITIONID = SU.POSITIONID
   LEFT JOIN SAMS.SYS_DEPARTMENT SD ON SU.DEPARTMENTID = SD.DEPARTMENTID
   LEFT JOIN SAMS.SYS_WORKINGPOSITION SW ON SU.WORKINGPOSITIONID = SW.WORKINGPOSITIONID
   LEFT JOIN SAMS.SYS_USER_SUBJECT ON SYS_USER_SUBJECT.USERNAME = SUT.USERNAME

  LEFT JOIN sams.mp_eduposition
    ON sams.mp_eduposition.positionid = sp.positionid
   LEFT JOIN sams.mp_eduworkingposition
    ON sams.mp_eduworkingposition.workingpositionid = SW.workingpositionid
  LEFT JOIN SAMS.edu_school
  ON sams.edu_school.schoolid = SUT.schoolid
  LEFT JOIN SAMS.mp_eduschool
  ON sams.edu_school.schoolid = SAMS.mp_eduschool.schoolid
  LEFT JOIN sams.edu_school_educationlevel
    ON sams.edu_school_educationlevel.schoolid = sams.edu_school.schoolid
  LEFT JOIN sams.md_organ
  ON sams.md_organ.organid = SAMS.edu_school.organid
	WHERE SU.ISDELETED = 0 
   AND SU.ISACTIVE = 1 
   AND SU.ORGANID <> -1
   AND SU.ISDELETED = 0
  AND SAMS.edu_school.isactive = 1
  AND SAMS.edu_school.isdeleted=  0
   AND EDU_SCHOOL.schoolid NOT IN (1524,1530,10112318,1541,1525,1515,1470,1469,1528)
  AND upper(sams.edu_school.schoolname) NOT LIKE '%T? DO%'
    ORDER BY NLSSORT(NLS_LOWER(SU.FIRSTNAME, 'NLS_SORT=vietnamese'),'NLS_SORT=vietnamese'),
               NLSSORT(NLS_LOWER(SU.LASTNAME, 'NLS_SORT=vietnamese'),'NLS_SORT=vietnamese'),
               to_char(SU.birthday,'DD/MM/YYYY')
