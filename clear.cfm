<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>L.F. Jennings</title>
</head>

<body>
   <cfoutput>
    <cfset ws_key2 = #URL.claveU#>
   </cfoutput>
   
   <cfquery name="deletecon" datasource="wolffdb_dsn">
		DELETE from LF_rep_Emails 
        where repe_fk_rep_key = <cfqueryparam value="#URL.claveU#" cfsqltype="cf_sql_numeric">  
   </cfquery> 
  
 
  <cflocation url="add_emails_tosend.cfm?claveU=#ws_key2#">
 </body>
</html>