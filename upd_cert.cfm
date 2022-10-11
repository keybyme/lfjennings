
<cfinclude template="headings.cfm"></cfinclude>	
	
<div class="main" style="height:100%">
	
  
<div class="container-fluid text-center">    
  <div class="row content">
  
    <div class="col-sm-8 text-left"> 
       
  	 	  <cfif NOT (IsDefined("SESSION.Auth.IsLoggedIn") AND SESSION.Auth.IsLoggedIn)>
			    <cflocation url="https://www.keybyme.com/index.cfm">
          </cfif> 
      <p>
		<div>
  
  	<cfset Get_Cert.RecordCount=0>
	<cfquery name="Get_Cert" datasource="wolffdb_dsn">
	  Select *
		From LF_Certificados 
		Where cer_key = <cfqueryparam value="#URL.claveU#" cfsqltype="cf_sql_numeric">  
	</cfquery>
 
 <cfform name="edit" method="post" action="act_upd_cert.cfm">
	<cfoutput>
        <input type="hidden" name="cer_key" value="#Get_Cert.cer_key#">	
    </cfoutput>
	<br>

	<table align="center">
	  <cfoutput>	
 
      <tr>
        <td>Certification: </td>
       <td><cfinput name="cer_desc" value="#Get_Cert.cer_desc#" size="80"></td>    
    </tr>
 
     </cfoutput>
     

    <tr>
        <td colspan="2"><input type="submit" name="editemp" value="Update"></td>
     
 </tr> 	  
	</table>		
   

</cfform>		
</div>
	
	   
    </div> 
  </div>
</div>
	 
</div>

<cfinclude template="footer.cfm"></cfinclude>
