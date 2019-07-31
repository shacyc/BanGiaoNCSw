SELECT eg.schoolid,es.schoolname,eg.pupilid, eg.fullname,
  eg.grcrequesttypeid,
  eg.grcrequeststatusid, eg1.grcrequeststatusname, 
  eg.currentgrcrequeststepid, eg2.grcrequeststepname, egw.isfinishstep
  FROM sams.edu_grcrequest eg
  LEFT JOIN sams.edu_school es ON es.schoolid = eg.schoolid -- Lay ten truong
  LEFT JOIN sams.edu_grcrequesttype eg3 ON eg.grcrequesttypeid = eg3.grcrequesttypeid
  LEFT JOIN sams.edu_grcrequeststatus eg1 ON eg.grcrequeststatusid = eg1.grcrequeststatusid
  LEFT JOIN sams.edu_grcrequeststep eg2 ON eg.currentgrcrequeststepid = eg2.grcrequeststepid
  LEFT JOIN sams.edu_grcrequesttype_wf egw ON eg2.grcrequeststepid = egw.grcrequeststepid AND eg3.grcrequesttypeid = egw.grcrequesttypeid
WHERE egw.isfinishstep = 0 AND eg.isdeleted = 0 AND eg.isactive = 1 AND eg.schoolyearid = 21
  ORDER BY eg.pupilid