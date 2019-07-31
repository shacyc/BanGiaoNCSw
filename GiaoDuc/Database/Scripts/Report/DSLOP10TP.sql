 SELECT 
    TO_BINARY_FLOAT(ROW_NUMBER() OVER(ORDER BY
               NLSSORT(NLS_LOWER(FIRSTNAME, 'NLS_SORT=vietnamese'),'NLS_SORT=vietnamese'),
               NLSSORT(NLS_LOWER(LASTNAME, 'NLS_SORT=vietnamese'),'NLS_SORT=vietnamese'),
               BIRTHDAY, ORDERINDEXSCHOOL, ORDERINDEX)) ID,

     TO_BINARY_FLOAT(ROW_NUMBER() OVER(ORDER BY
               NLSSORT(NLS_LOWER(FIRSTNAME, 'NLS_SORT=vietnamese'),'NLS_SORT=vietnamese'),
               NLSSORT(NLS_LOWER(LASTNAME, 'NLS_SORT=vietnamese'),'NLS_SORT=vietnamese'),
               BIRTHDAY,ORDERINDEXSCHOOL,ORDERINDEX)) STT,
     SO_HO_SO,                                                  --Mã h? so
     MA_SO,                                             --Mã s?
     HO_TEN,                                              --H? tên
     TEN,                                             --Tên 
    GIOI_TINH,
    NGAY_SINH,                     --Ngày sinh
    THANG_SINH,                     --Tháng sinh
    NAM_SINH,                     --Nam sinh
    NOI_SINH,
    DAN_TOC,                                         --Dân t?c
    DAN_TOC_KHAC,                                                            --Dan toc khac
    CMND, 
    KHONG_CO_CMND,                                        --Xã (phu?ng)
    duprovincecodeNH,                                      --Mã t?nh
    dudistrictcodeYEN,                                      --Qu?n/Huy?n
    duwardcodeA_XA,                                          --Xã (phu?ng)
    DIA_CHI,                                              --H? kh?u thu?ng trú trên 18 tháng t?i khu v?c 1.
    HO_KHAU_KV1,                                      --H? kh?u thu?ng trú trên 18 tháng t?i xã d?c bi?t khó khan.
    HO_KHAU_KHO_KHAN,  
    LOP10_MA_TINH,                   --Mã t?nh l?p 10
    LOP10_MA_TRUONG,                           --Mã tru?ng l?p 10
    LOP11_MA_TINH,                   --Mã t?nh l?p 11
    LOP11_MA_TRUONG,                           --Mã tru?ng l?p 11
    LOP12_MA_TINH,                   --Mã t?nh l?p 12
    LOP12_MA_TRUONG,
    TEN_LOP_12,                                          --Email
    DIEN_THOAI,                                         --SÐT
    EMAIL,                                         --Email
    DIA_CHI_LIEN_HE,                                      --Ð?a ch? liên h?
    CHUNG_CHI_MIEN_NN,                                         --Ngo?i ng?
    DIEM_TB_LOP12,                                         --Ði?m trung bình l?p 12
    GDTX,                                         --Hình th?c GDPT
    GDTHPT,

    NAM_HOAN_THANH_THPT,                                     --Nam hoàn thành l?p 12
    DOI_TUONG_MIEN_THI,                                 --Doi tuong mien thi tot nghiep
    KK_NGHE,                                            --Nghe (G/K/T)
    KK_VAN_HOA,                                         --HSG mon Van Hoa
    KK_KHAC,                                            --Giai khac
    CHUNG_CHI_NN_GDTX,                                  --Chung chi ngoai ngu (GDTX)
    CHUNG_CHI_TIN_GDTX,                                 --Chung chi tin hoc (GDTX)
    DIEN_XET_TOT_NGHIEP,                                --Dien xet tot nghiep
    KY_HIEU_DIEN_XET,                                   --Ky hieu dien xet tot nghiep
    XEP_LOAI_HOC_LUC_LOP12,                    --Hoc luc nam lop 12
    XEP_LOAI_HANH_KIEM_LOP12,                 --Hanh kiem nam lop 12
    GHI_CHU,
    MA_CUM
  FROM(
  
 SELECT
    EP.BIRTHDAY, ES.ORDERINDEX ORDERINDEXSCHOOL, ESC.ORDERINDEX,
    ep.LASTNAME,ep.FIRSTNAME,
    NULL SO_HO_SO,                                                  --Mã h? so
    '01' MA_SO,                                             --Mã s?
    EP.FULLNAME HO_TEN,                                              --H? tên
    EP.FIRSTNAME TEN,                                             --Tên
   -- TO_CHAR(EP.GENDER) GIOI_TINH,                                                --Gi?i tính
    --decode(EP.gender,1,'N?','NAM') GIOI_TINH,
    decode(EP.gender,1,'1','0') GIOI_TINH,
    TO_CHAR(EP.BIRTHDAY,'DD') NGAY_SINH,                     --Ngày sinh
    TO_CHAR(EP.BIRTHDAY,'MM') THANG_SINH,                     --Tháng sinh
    TO_CHAR(EP.BIRTHDAY,'YY') NAM_SINH,                     --Nam sinh
--    CASE WHEN EP.PLACEOFBIRTHCOUNTRYID = 4
--         THEN MP.PROVINCENAME
--         ELSE MC.COUNTRYNAME END NOI_SINH,        --Noi sinh
    NVL2(MP.PROVINCENAME,MP.PROVINCENAME,MC.COUNTRYNAME) NOI_SINH,
    PE.ETHNICITYNAME DAN_TOC,                                         --Dân t?c
    --TO_CHAR(PE.ISOTHER) DAN_TOC_KHAC,
    decode(pe.isother,1,'x','') DAN_TOC_KHAC,                                                            --Dan toc khac
    EP.IDCARD CMND,                                                --CMND
    --CASE WHEN EP.IDCARD IS NOT NULL THEN '' ELSE 'x' END KHONG_CO_CMND,   --Có CMND
    '' KHONG_CO_CMND,
    --h? kh?u thu?ng trú l?y theo b?ng map
--    MEP.EDUPROVINCECODE HO_KHAU_MA_TINH,                                      --Mã t?nh
--    MED.EDUDISTRICTCODE HO_KHAU_MA_HUYEN,                                      --Qu?n/Huy?n
--    MEW.EDUWARDCODE HO_KHAU_MA_XA,                                          --Xã (phu?ng)
    '' duprovincecodeNH,                                      --Mã t?nh
    '' dudistrictcodeYEN,                                      --Qu?n/Huy?n
    '' duwardcodeA_XA,                                          --Xã (phu?ng)
    EP.permanentfulladdress DIA_CHI,                                               --Ð?a ch?

    --DECODE(MEP.ADDRESSAREAID,1,'x',DECODE(MED.ADDRESSAREAID,1,'x',DECODE(MEW.ADDRESSAREAID,1,'x',''))) HO_KHAU_KV1,                                              --H? kh?u thu?ng trú trên 18 tháng t?i khu v?c 1.
    '' HO_KHAU_KV1,                                              --H? kh?u thu?ng trú trên 18 tháng t?i khu v?c 1.
    --DECODE(MEW.ISESPECIALLYDIFFICULT,1,'x','') HO_KHAU_KHO_KHAN,                                            --H? kh?u thu?ng trú trên 18 tháng t?i xã d?c bi?t khó khan.
    '' HO_KHAU_KHO_KHAN,  
    '' LOP10_MA_TINH,                   --Mã t?nh l?p 10
    '' LOP10_MA_TRUONG,                           --Mã tru?ng l?p 10
    '' LOP11_MA_TINH,                   --Mã t?nh l?p 11
    '' LOP11_MA_TRUONG,                           --Mã tru?ng l?p 11
    '' LOP12_MA_TINH,                   --Mã t?nh l?p 12
    '' LOP12_MA_TRUONG,
    --ES.SCHOOLNAME LOP12_TEN_TRUONG,
      --Mã tru?ng l?p 12
    ESC.SCHOOLCLASSNAME TEN_LOP_12,                                          --Email
    '' DIEN_THOAI,                                         --SÐT
    '' EMAIL,                                         --Email
    EP.contactfulladdress DIA_CHI_LIEN_HE,                                      --Ð?a ch? liên h?
    NULL CHUNG_CHI_MIEN_NN,                                         --Ngo?i ng?
    TO_BINARY_DOUBLE(DECODE(EPS.WHOLEYEARAVERAGEMARK,0,NULL,EPS.WHOLEYEARAVERAGEMARK)) DIEM_TB_LOP12,                                         --Ði?m trung bình l?p 12
    CASE WHEN ES.EDUCATIONTYPEID = 5 AND NVL(COUNTSUBJECT,0) < 12
          THEN 'X'
          ELSE '' END GDTX,                                         --Hình th?c GDPT

    CASE WHEN ES.EDUCATIONTYPEID = 5 AND NVL(COUNTSUBJECT,0) < 12
          THEN ''
          ELSE 'X' END GDTHPT,

    TO_CHAR(ESY.TOYEAR) NAM_HOAN_THANH_THPT,                                     --Nam hoàn thành l?p 12
    NULL DOI_TUONG_MIEN_THI,                                 --Doi tuong mien thi tot nghiep
    NULL KK_NGHE,                                            --Nghe (G/K/T)
    NULL KK_VAN_HOA,                                         --HSG mon Van Hoa
    NULL KK_KHAC,                                            --Giai khac
    NULL CHUNG_CHI_NN_GDTX,                                  --Chung chi ngoai ngu (GDTX)
    NULL CHUNG_CHI_TIN_GDTX,                                 --Chung chi tin hoc (GDTX)
    NULL DIEN_XET_TOT_NGHIEP,                                --Dien xet tot nghiep
    NULL KY_HIEU_DIEN_XET,                                   --Ky hieu dien xet tot nghiep
    ESR.STUDYRANKSHORTNAME XEP_LOAI_HOC_LUC_LOP12,                    --Hoc luc nam lop 12
    EC.CONDUCTRANKSHORTNAME XEP_LOAI_HANH_KIEM_LOP12,                 --Hanh kiem nam lop 12
    '' GHI_CHU,
    '01' MA_CUM


  FROM SAMS.EDU_PUPIL EP
    --H?c l?c, h?nh ki?m
    LEFT JOIN SAMS.EDU_PUPIL_STUDYHISTORY EPS ON EPS.SCHOOLCLASSID = EP.CURRENTSCHOOLCLASSID
                                                 AND EPS.SCHOOLID = EP.CURRENTSCHOOLID
                                                 AND EPS.PUPILID = EP.PUPILID
                                                 AND EPS.ISDELETED = 0
                                                 AND EPS.SCHOOLYEARID = 21
    LEFT JOIN SAMS.EDU_SCHOOLYEAR ESY ON EPS.SCHOOLYEARID = ESY.SCHOOLYEARID
    LEFT JOIN SAMS.EDU_CONDUCTRANK EC ON EC.CONDUCTRANKID = EPS.WHOLEYEARCONDUCTRANKID
    LEFT JOIN SAMS.EDU_STUDYRANK ESR ON ESR.STUDYRANKID = EPS.WHOLEYEARSTUDYRANKID
      --Thông tin THPT
    JOIN SAMS.EDU_SCHOOL ES ON ES.SCHOOLID = EP.CURRENTSCHOOLID
    LEFT JOIN SAMS.MP_EDUSCHOOLMAP ME ON ME.SCHOOLID = ES.SCHOOLID AND ES.SCHOOLID > 0
    LEFT JOIN SAMS.MP_EDUPROVINCEMAP MPES ON MPES.PROVINCEID = ES.PROVINCEID
    --L?p h?c 12
    JOIN SAMS.EDU_SCHOOLCLASS_NEW ESC
      ON ESC.SCHOOLID = EP.CURRENTSCHOOLID
      AND ESC.CLASSID = EP.CURRENTCLASSID
      AND ESC.SCHOOLCLASSID = EP.CURRENTSCHOOLCLASSID
      AND ESC.SCHOOLYEARID = 21
      AND ESC.SCHOOLTERMID = 2
    --Noi sinh
    LEFT JOIN SAMS.MD_COUNTRY MC ON MC.COUNTRYID = EP.PLACEOFBIRTHCOUNTRYID AND EP.PLACEOFBIRTHCOUNTRYID > 0
    LEFT JOIN SAMS.MD_PROVINCE MP ON MP.PROVINCEID = EP.PLACEOFBIRTHPROVINCEID AND EP.PLACEOFBIRTHPROVINCEID > 0
    --H? kh?u thu?ng trú
    LEFT JOIN SAMS.MP_EDUPROVINCEMAP MEP ON MEP.PROVINCEID = EP.PROVINCEID AND EP.PROVINCEID > 0
    LEFT JOIN SAMS.MP_EDUDISTRICTMAP MED ON MED.DISTRICTID = EP.DISTRICTID AND EP.DISTRICTID > 0
    LEFT JOIN SAMS.MP_EDUWARDMAP MEW ON MEW.WARDID = EP.WARDID AND EP.WARDID > 0
    --Dân t?c
    LEFT JOIN SAMS.PL_ETHNICITY PE ON PE.ETHNICITYID = EP.ETHNICITYID

    LEFT JOIN ( --mon hoc thuoc lop
                SELECT ESS.SCHOOLCLASSID,COUNT(1) COUNTSUBJECT
                FROM SAMS.EDU_SCHOOLCLASS_SUBJECT ESS
                JOIN SAMS.EDU_SCHOOLCLASS_NEW ES
                  ON ESS.SCHOOLCLASSID = ES.SCHOOLCLASSID
                  AND ES.SCHOOLYEARID = 21
                  AND ES.SCHOOLTERMID = 2
                WHERE ESS.ISDELETED = 0
                AND ES.ISDELETED = 0
                AND ES.ISACTIVE = 1
                AND ESS.SCHOOLYEARID = 21
                AND ESS.SCHOOLTERMID = 2
                AND ES.SCHOOLCLASSID IN (43613)
                GROUP BY ESS.SCHOOLCLASSID
      ) ESS ON ESS.SCHOOLCLASSID = EP.CURRENTSCHOOLCLASSID

  WHERE EP.ISDELETED = 0
    AND EP.ISACTIVE = 1

      AND EXISTS (select * 
                    from (SELECT    eps.PUPILID,
                eps.SCHOOLCLASSID,
                eps.SCHOOLID,
                eps.SCHOOLYEARID
        FROM sams.edu_pupil_studytimeline eps
             INNER JOIN sams.edu_schoolclass_new esn
               ON eps.schoolclassid = esn.schoolclassid
                  AND eps.schoolid = esn.schoolid
                  AND eps.schoolyearid = esn.schoolyearid
                  AND eps.schooltermid = esn.schooltermid
        WHERE  eps.schoolclassid = 43613
              AND eps.schoolyearid = 21
              AND eps.schooltermid = 2
              AND eps.isdeleted = 0
              AND eps.currentpupilstatusid = 1) tt                                     
                    where tt.pupilid = ep.pupilid)
        GROUP BY
              EP.BIRTHDAY, ES.ORDERINDEX , ESC.ORDERINDEX,
              ep.LASTNAME,
              ep.FIRSTNAME,
              EP.FULLNAME,
              EP.gender,
              EP.BIRTHDAY,
              MP.PROVINCENAME,MP.PROVINCENAME,MC.COUNTRYNAME,PE.ETHNICITYNAME,pe.isother,
              EP.IDCARD,EP.permanentfulladdress,ESC.SCHOOLCLASSNAME,EP.contactfulladdress,
              EPS.WHOLEYEARAVERAGEMARK,ES.EDUCATIONTYPEID,ESY.TOYEAR,ESR.STUDYRANKSHORTNAME
              ,EC.CONDUCTRANKSHORTNAME,COUNTSUBJECT
  ORDER BY
             NLSSORT(NLS_LOWER(EP.FIRSTNAME, 'NLS_SORT=vietnamese'),'NLS_SORT=vietnamese'),
             NLSSORT(NLS_LOWER(EP.LASTNAME, 'NLS_SORT=vietnamese'),'NLS_SORT=vietnamese'),
             EP.BIRTHDAY,
             ES.ORDERINDEX,
             ESC.ORDERINDEX
  ) BANG1
