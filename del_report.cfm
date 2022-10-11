<cfinclude template="headings.cfm"></cfinclude>	
	
<div class="main">
<div class="container-fluid text-center">    

	      <cfif NOT (IsDefined("SESSION.Auth.IsLoggedIn") AND SESSION.Auth.IsLoggedIn)>
			    <cflocation url="https://www.keybyme.com/index.cfm">
          </cfif> 
		 
		<div>
   
<CFSET GetRep.RecordCount=0>
<cfquery name = "GetRep" dataSource = "wolffdb_dsn">
    Select *   
    From LF_Reportes
    Where rep_key = <cfqueryparam value="#URL.claveU#" cfsqltype="cf_sql_numeric"> 
</cfquery>


<cfparam name="url.action" default="">

<form name="edit" method="post" action="act_del_rep.cfm">
	  <h2 align="center">Delete Report</h2><br>
<cfoutput>
<table class="table" align="center">
    <input type="hidden" name="rep_key" value="#GetRep.rep_key#">	
          <tr>
     	<td>Report Name: </td>
        <td>   
        <input 
         type="text" 
         name="rep_name" 
         value="#GetRep.rep_name#"
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

</div>
	
	

</div>

<cfinclude template="footer.cfm"></cfinclude>
