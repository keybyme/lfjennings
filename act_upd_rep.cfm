<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>L.F. Jennings</title>
</head>

<body>
 
<cfquery name="editemp" datasource="wolffdb_dsn"> 

UPDATE LF_Reportes
SET rep_name           = '#TRIM(Form.rep_name)#'  
  , rep_fk_emp_key     = '#TRIM(Form.rep_fk_emp_key)#'
  , rep_fk_emp_key_sup = '#TRIM(Form.rep_fk_emp_key_sup)#'
  , rep_fk_pr_key      = '#TRIM(Form.rep_fk_pr_key)#'
  , rep_desc           = '#TRIM(Form.rep_desc)#'
  , rep_notes          = '#TRIM(Form.rep_notes)#'
WHERE 
        rep_key = #Form.rep_key#       
</cfquery>
 
 <cflocation url="Listar_Reports.cfm">

</body>
</html> 