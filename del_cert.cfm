
<cfinclude template="headings.cfm"></cfinclude>	
	
<div class="main">
<div class="container-fluid text-center">    
  <div class="row content">

	  
    <div class="col-sm-8 text-left"> 
	      <cfif NOT (IsDefined("SESSION.Auth.IsLoggedIn") AND SESSION.Auth.IsLoggedIn)>
			    <cflocation url="https://www.keybyme.com/index.cfm">
          </cfif> 
		 
		
      <p>
		<div>
   
<CFSET Get_Cert.RecordCount=0>
<cfquery name = "Get_Cert" dataSource = "wolffdb_dsn">
    Select *   
    From LF_Certificados
    Where cer_key = <cfqueryparam value="#URL.claveU#" cfsqltype="cf_sql_numeric"> 
</cfquery>


<cfparam name="url.action" default="">

<form name="edit" method="post" action="act_del_cert.cfm">
	  <h2 align="center">Delete Certification</h2><br>
<cfoutput>
<table align="center">
    <input type="hidden" name="cer_key" value="#Get_Cert.cer_key#">	
          <tr>
     	<td>Certification: </td>
        <td>   
        <input 
         type="text" 
         name="cer_desc" 
         value="#Get_Cert.cer_desc#"
         size="80">
        </td>    
     </tr>
          
    <tr>
       	<td colspan="2"><input type="submit" name="editemp" value="Delete"></td>
    </tr>   				
</table>
</cfoutput>
</form>

</div>
	  </p>
	   
    </div>
 
  </div>
</div>
	
	
</div>

<cfinclude template="footer.cfm"></cfinclude>
