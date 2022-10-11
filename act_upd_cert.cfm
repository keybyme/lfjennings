<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>L.F. Jennings</title>
</head>

<body>
 
<cfquery name="editemp" datasource="wolffdb_dsn"> 

UPDATE LF_Certificados
SET cer_desc   = '#TRIM(Form.cer_desc)#'   
WHERE 
        cer_key = #Form.cer_key#       
</cfquery>
 
 <cflocation url="Listar_Certificados.cfm">

</body>
</html> 