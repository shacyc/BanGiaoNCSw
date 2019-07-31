--SELECT * FROM sams.edu_pupil_studytimeline eps WHERE pupilid = '013357000' AND schoolyearid = 21 order by createddate;
SELECT * FROM sams.edu_pupil_studytimeline eps WHERE pupilid = '013391359'AND isactive = 1 AND isdeleted = 0  AND schoolyearid = 21  order by createddate;
--SELECT * FROM sams.edu_pupil eps WHERE pupilid = '011881407' order by createddate;
--SELECT * FROM sams.edu_pupil eps WHERE pupilid = '013348609'  order by createddate;
SELECT * FROM sams.edu_moveclassrequest em WHERE pupilid = '013391359' AND isdeleted = 0;
SELECT * FROM sams.edu_moveclassrequest em WHERE moveclassrequestid = 'MC20181108000011';


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
  		Note,
  		0,
  		IsActive,
  		IsSystem,
  		'administrator',
  		SYSDATE,    
      0,
      0,
      null,
      null
  	FROM sams.edu_pupil_studytimeline eps
    WHERE studytimelineid = '7A1F317EAD446CDAE0540010E0B332C2';

-- Cap nhat timeline lop moi tu ky 2 cu sang ky 1
  UPDATE sams.edu_pupil_studytimeline eps SET schooltermid = 1, orderindex = 0 WHERE studytimelineid = '7A1F317EAD446CDAE0540010E0B332C2';

-- Cap nhat timeline ky 1 lop cu sang k? 2 va trang thai chuyen lop la 4
  UPDATE sams.edu_pupil_studytimeline eps 
  SET currentpupilstatusid = 20, moveschoolclassstatus = 4, schooltermid = 2, movetype = 0 WHERE studytimelineid = '7144526CE417156FE0540010E0B33240';
-- Cap nhat timeline ky 2 lop cu thanh ky 1 lop cu
UPDATE sams.edu_pupil_studytimeline eps SET schooltermid = 1, currentpupilstatusid = 20 WHERE studytimelineid = '7144526CE419156FE0540010E0B33240';

-- Cap nhat yeu cau chuyen lop tu ky 2 sang ky 1
UPDATE sams.edu_moveclassrequest em SET toschooltermid = 1 WHERE moveclassrequestid = 'MC20181108000011';
