
<cfinclude template="headings.cfm"></cfinclude>	
	
<div class="main" style="height:100%">


	
  
<div class="container-fluid text-center">    

       
  	 	  <cfif NOT (IsDefined("SESSION.Auth.IsLoggedIn") AND SESSION.Auth.IsLoggedIn)>
			    <cflocation url="https://www.keybyme.com/index.cfm">
          </cfif> 
   
		<div>
  
  	<cfset Get_Charge.RecordCount=0>
	<cfquery name="Get_Charge" datasource="wolffdb_dsn">
	  Select *
		From LF_Cargos  
		Where ch_key = <cfqueryparam value="#URL.claveU#" cfsqltype="cf_sql_numeric">  
	</cfquery>
 
 <cfform name="edit" method="post" action="act_upd_charge.cfm">
	<cfoutput>
        <input type="hidden" name="ch_key" value="#Get_Charge.ch_key#">	
    </cfoutput>
	<br>

	<table align="center">
	  <cfoutput>	
 
      <tr>
        <td>Charge: </td>
       <td><cfinput name="ch_desc" value="#Get_Charge.ch_desc#" size="80"></td>    
    </tr>
 
     </cfoutput>
     

    <tr>
        <td colspan="2"><input type="submit" name="editemp" value="Update"></td>
     
 </tr> 	  
	</table>		
   

</cfform>		

</div>
	 
</div>

<cfinclude template="footer.cfm"></cfinclude>

