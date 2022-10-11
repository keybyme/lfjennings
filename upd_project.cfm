
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
  
  	<cfset Get_Pro.RecordCount=0>
	<cfquery name="Get_Pro" datasource="wolffdb_dsn">
	  Select *
		From LF_Projects 
		Where pr_key = <cfqueryparam value="#URL.claveU#" cfsqltype="cf_sql_numeric">  
	</cfquery>
 
 <cfform name="edit" method="post" action="act_upd_project.cfm">
	<cfoutput>
        <input type="hidden" name="pr_key" value="#Get_Pro.pr_key#">	
    </cfoutput>
	<br>

	<table align="center">
	  <cfoutput>	
 
      <tr>
        <td>Project: </td>
       <td><cfinput name="pr_desc" value="#Get_Pro.pr_desc#" size="150"></td>    
    </tr>
 
    <tr>
        <td>Address: </td>
       <td><cfinput name="pr_address" value="#Get_Pro.pr_address#" size="150"></td>    
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
