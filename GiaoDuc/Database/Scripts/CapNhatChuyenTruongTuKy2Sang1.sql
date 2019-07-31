
--SELECT * FROM sams.edu_pupil_studytimeline eps WHERE pupilid = '013357000' AND schoolyearid = 21 order by createddate;
SELECT * FROM sams.edu_pupil_studytimeline eps WHERE pupilid = '011892345' AND schoolyearid = 21 AND isactive = 1 AND isdeleted = 0  order by createddate;
--SELECT * FROM sams.edu_pupil eps WHERE pupilid = '011881407' order by createddate;
--SELECT * FROM sams.edu_pupil eps WHERE pupilid = '013348609'  order by createddate;
SELECT * FROM sams.edu_migrationrequest em WHERE pupilid = '011892345' AND isdeleted = 0;
SELECT * FROM sams.edu_migrationrequest em WHERE migrationrequestid = 'EM20181207000001';


-- Them timeline ky 2 lop moi
INSERT
  	INTO sams.EDU_PUPIL_STUDYTimeLINE
  	(
  --		STUDYTimeLINEID,
  		PUPILID,
  		SCHOOLID,
  		SCHOOLCLASSID,
  		SCHOOLYearID,
  		SCHOOLTermID,
  		RegisterBOOKNumber,
  		StartSTUDYDate,
  		ENDSTUDYDate,
  		CurrentPUPILStatusID,
  		MoveToSCHOOLID,
  		MoveToSCHOOLCLASSID,
  		MoveToSTUDYTimeLINEID,
  		MoveType,
  		MoveDate,
  		MoveToRequestID,
  		Note,
  		OrderIndex,
  		IsActive,
  		IsSystem,
  		CreatedUser,
  		CreatedDate, 
      MOVESCHOOLSTATUS,
      MOVESCHOOLCLASSSTATUS,
      FROMREQUESTID,
      TOREQUESTID
  	)
  	SELECT
  	
  --		v_STUDYTimeLINEID,
  		PUPILID,
  		SCHOOLID,
  		SCHOOLCLASSID,
  		SCHOOLYearID,
  		2,
  		RegisterBOOKNumber,
  		NULL,
  		NULL,
  		CurrentPUPILStatusID,
  		0,
  		0,
  		NULL,
  		0,
  		NULL,
  		NULL,
  		'Bo sung dong thieu do chuyen truong dau nam voi ToSchoolTermID = 2',
  		orderindex,
  		IsActive,
  		IsSystem,
  		'administrator',
  		SYSDATE,    
      0,
      0,
      'EM20181207000001',-------------------
      NULL
  	FROM sams.edu_pupil_studytimeline eps
    WHERE studytimelineid = '7CD4EDFA44325648E0540010E0B33240';

-- Cap nhat timeline lop moi tu ky 2 cu sang ky 1 va cot fromRequestID, cot moveschoolstatus
  UPDATE sams.edu_pupil_studytimeline eps 
    SET schooltermid = 1,
    fromrequestid = 'EM20181207000001',
    moveschoolstatus = 2,
    updateduser = 'administrator',
    updateddate = sysdate,
    note = 'Dieu chinh do chuyen truong dau nam voi ToSchoolTermID = 2'
    WHERE studytimelineid = '7CD4EDFA44325648E0540010E0B33240';

-- Cap nhat timeline ky 1 truong cu 
  UPDATE sams.edu_pupil_studytimeline eps 
  SET currentpupilstatusid = 19,
    moveschoolstatus = 1,
    torequestid = 'EM20181207000001'
    --movetorequestid = 'EM20180801000049' 
    WHERE studytimelineid = '6CC8FF92AE0B2C90E0540010E0B332C2';

-- Cap nhat timeline ky 2 truong cu 
  UPDATE sams.edu_pupil_studytimeline eps 
  SET currentpupilstatusid = 19,
    moveschoolstatus = 4,
    torequestid = 'EM20181207000001',
    movetype = 0
    --movetorequestid = 'EM20180801000049' 
    WHERE studytimelineid = '6CC8FF92AE0D2C90E0540010E0B332C2';

-- Cap nhat yeu cau chuyen truong tu ky 2 sang ky 1
UPDATE sams.edu_migrationrequest  em SET toschooltermid = 1 WHERE migrationrequestid = 'EM20181207000001';


