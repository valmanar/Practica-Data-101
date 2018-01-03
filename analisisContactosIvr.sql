USE STAGE;
SELECT COUNT(*) TOTAL_REGISTROS,
SUM(CASE WHEN LENGTH(TRIM(ID)) <> 0 THEN 1 ELSE 0 END) TOTAL_ID,
COUNT(DISTINCT CASE WHEN LENGTH(TRIM(ID)) <> 0 THEN ID ELSE 0 END) TOTAL_DISTINTOS_ID,
SUM(CASE WHEN LENGTH(TRIM(PHONE_NUMBER)) <> 0 THEN 1 ELSE 0 END) TOTAL_PHONE_NUMBER,
COUNT(DISTINCT CASE WHEN LENGTH(TRIM(PHONE_NUMBER)) <> 0 THEN PHONE_NUMBER ELSE 0 END) TOTAL_DISTINTOS_PHONE_NUMBER,
SUM(CASE WHEN LENGTH(TRIM(START_DATETIME)) <> 0 THEN 1 ELSE 0 END) TOTAL_START_DATETIME,
COUNT(DISTINCT CASE WHEN LENGTH(TRIM(START_DATETIME)) <> 0 THEN START_DATETIME ELSE 0 END) TOTAL_DISTINTOS_START_DATETIME,
SUM(CASE WHEN LENGTH(TRIM(END_DATETIME)) <> 0 THEN 1 ELSE 0 END) TOTAL_END_DATETIME,
COUNT(DISTINCT CASE WHEN LENGTH(TRIM(END_DATETIME)) <> 0 THEN END_DATETIME ELSE 0 END) TOTAL_DISTINTOS_END_DATETIME,
SUM(CASE WHEN LENGTH(TRIM(SERVICE)) <> 0 THEN 1 ELSE 0 END) TOTAL_SERVICE,
COUNT(DISTINCT CASE WHEN LENGTH(TRIM(SERVICE)) <> 0 THEN SERVICE ELSE 0 END) TOTAL_DISTINTOS_SERVICE,
SUM(CASE WHEN LENGTH(TRIM(FLG_TRANSFER)) <> 0 THEN 1 ELSE 0 END) TOTAL_FLG_TRANSFER,
COUNT(DISTINCT CASE WHEN LENGTH(TRIM(FLG_TRANSFER)) <> 0 THEN FLG_TRANSFER ELSE 0 END) TOTAL_DISTINTOS_FLG_TRANSFER,
SUM(CASE WHEN LENGTH(TRIM(AGENT)) <> 0 THEN 1 ELSE 0 END) TOTAL_AGENT,
COUNT(DISTINCT CASE WHEN LENGTH(TRIM(AGENT)) <> 0 THEN AGENT ELSE 0 END) TOTAL_DISTINTOS_AGENT
FROM STAGE.STG_CONTACTOS_IVR;