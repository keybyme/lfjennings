<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>L.F. Jennings</title>
</head>

<body>
	<cfset ws_key = 0>
     <cfset ws_key = '#Form.rep_key#'>  
	 <cfoutput>#ws_key#</cfoutput>

	<cfset GetFoto.RecordCount=0>
	<cfquery name="GetFoto" datasource="wolffdb_dsn">
	  Select *
		From LF_Photos 
        where ph_fk_rep_key = #ws_key#     
	</cfquery>  
  <cfloop query="GetFoto"> 
	<cfoutput> 
		#GetFoto.ph_link# <br>
	</cfoutput>	
            <cfoutput>
			<cfset ws_url_archivo = "">
		 
			<cfset ws_url_archivo = #GetFoto.ph_link#> 	 
		  
			<cfset ws_file = replace('#ws_url_archivo#', "https://www.keybyme.com/LFfotos/", "", "ONE") />
			 #ws_file# <br><br>
		  
			 <cfset ws_pre = "D:\home\keybyme.com\wwwroot\LFfotos\">
			 <cfset ws_link = "#ws_pre##ws_file#">
			 #ws_link#
		  </cfoutput>	
		   
			<cfoutput>
			<cfif FileExists("#ws_link#")>  
			<cffile action="delete"
			   
				file="#ws_link#">
				<p>Borrado</p>
			<cfelse>    
				<p>Sorry, can't delete the file - it doesn't exist.</p>
			</cfif> 
		   
		  </cfoutput>  
        
    
</cfloop> 

      <cfquery name="deletecon" datasource="wolffdb_dsn">
		DELETE from LF_Reportes
		WHERE 
        	rep_key = #ws_key#
   </cfquery>    
  
  <cfquery name="deletecon2" datasource="wolffdb_dsn">
	DELETE from LF_Photos
	WHERE 
		ph_fk_rep_key = #ws_key#
  </cfquery>
 
 <cfquery name="deletecon3" datasource="wolffdb_dsn">
	DELETE from LF_Photos2
	WHERE 
		ph_fk_rep_key2 = #ws_key#
  </cfquery>

   <cflocation url="Listar_Reports.cfm">      
 </body>
</html>