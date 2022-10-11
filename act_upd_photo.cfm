<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>L.F. Jennings</title>
</head>

<body>
 
<cfquery name="editemp" datasource="wolffdb_dsn"> 

UPDATE LF_Photos
SET  ph_desc =	'#TRIM(Form.ph_desc)#' 
   , ph_obs  = '#TRIM(Form.ph_obs)#' 
WHERE 
        ph_key = #Form.ph_key#       
</cfquery>
 
 <cflocation url="Listar_Photos.cfm">

</body>
</html> 