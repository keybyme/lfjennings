<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Keybyme</title>
</head>

<body> 
<cfoutput>	
<!---<cfset ws_fecha = DateFormat(Now(),"yyyy-mm-dd")></cfset>---> 
  
  <cfset ws_time_now =	(timeFormat(now(), "HH:mm"))> 
  <cfset east_time = #TimeFormat(DateAdd('h', 1, ws_time_now),'HHmm')#>		  
  <cfset Arizona_time = (timeFormat(now(), "HH:mm"))>      
  <cfset ws_fecha_hoy = #DateFormat(now(),"mm/dd/yyyy")#>	 
  <cfset fecha_de_hoy = #DateFormat(DateAdd('d', 0, ws_fecha_hoy),'mmdd')#>       
  <cfset ws_time_east = TimeFormat(DateAdd('h', 1, Arizona_time),'HH:mm')>	
  <cfset menos15 = #TimeFormat(DateAdd('n', -15, ws_time_east), 'HH:mm')#>
  <cfset mas15 = #TimeFormat(DateAdd('n', 15, ws_time_east), 'HH:mm')#>	    
 
</cfoutput>	
 

<CFSET GetUser.RecordCount=0>
<CFQUERY NAME="GetUser" datasource="wolffdb_dsn">
  SELECT  *          
  FROM  Usuarios
  WHERE user_name = <cfqueryparam value="#URL.ws_id#" cfsqltype="cf_sql_nvarchar">
  <!---  And user_password = '#secret#'--->
   
</CFQUERY>
 
<!--- If the username and password is correct ---> 
<CFIF GetUser.RecordCount EQ 1>
  <CFSET SESSION.Auth = StructNew()>
  <CFSET SESSION.Auth.IsLoggedIn        = "Yes">
  <CFSET SESSION.Auth.user_key          = GetUser.user_key>
  <CFSET SESSION.Auth.user_name         = GetUser.user_name>
  <CFSET SESSION.Auth.user_password     = GetUser.user_password>
  <CFSET SESSION.Auth.user_nombre       = GetUser.user_nombre>
  <CFSET SESSION.Auth.user_apellido     = GetUser.user_apellido>       
  <CFSET SESSION.Auth.email             = GetUser.user_email>  
  <CFSET SESSION.Auth.user_role         = GetUser.user_role>
</cfif>
 

<CFSET GetReporte.RecordCount=0>
<CFQUERY NAME="GetReporte" datasource="wolffdb_dsn">
  SELECT  *                  
  FROM LF_Rep_Emails inner join LF_Reportes on
         repe_fk_rep_key = rep_key 
        inner join LF_Employees on
        repe_fk_emp_key = emp_key
        Where rep_key = <cfqueryparam value="#URL.claveU#" cfsqltype="cf_sql_numeric"> 
</CFQUERY> 

<!---to="#TRIM(GetReporte.Res_email)#"--->
    
 <cfloop query="GetReporte">    
 
             <cfoutput>
               <cfmail from="lfjsafetydepartment@gmail.com" 
                       to="#TRIM(GetReporte.emp_email)#"
                       bcc ="wesnetwork@keybyme.com"        
                       subject="#TRIM(GetReporte.rep_name)#" type="HTML"
                       server="smtp.gmail.com:587"
                       username="lfjsafetydepartment@gmail.com" 
                       password="nqfzjjuhruegkacq" 
                       useTLS = "yes">  
				  <p>From: #TRIM(GetReporte.rep_name)#</p>  
          <p>L.F. Jennings Safety Department: #TRIM(GetReporte.rep_desc)#</p> 
          <p><a href="https://www.keybyme.com/LF/Reporte_upd2.cfm?claveU=#TRIM(GetReporte.rep_key)#&ws_id=#SESSION.Auth.user_name#">Click here to see Report #TRIM(GetReporte.rep_name)#</a></p>
              </cfmail>  
              Report #TRIM(GetReporte.rep_name)# has been sent to #TRIM(GetReporte.emp_email)# <br><br>
             </cfoutput>  

             <cfquery name="deletecon" datasource="wolffdb_dsn">
              DELETE from LF_Rep_Emails
              WHERE 
                    repe_key = #GetReporte.repe_key#
             </cfquery> 
              
		   
 </cfloop> 

<cfoutput>


<a href="Listar_Reports.cfm">Go back</a>

</cfoutput>
</body>
</html>
