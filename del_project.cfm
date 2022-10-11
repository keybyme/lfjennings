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
   
<CFSET Get_Pro.RecordCount=0>
<cfquery name = "Get_Pro" dataSource = "wolffdb_dsn">
    Select *   
    From LF_Projects
    Where pr_key = <cfqueryparam value="#URL.claveU#" cfsqltype="cf_sql_numeric"> 
</cfquery>


<cfparam name="url.action" default="">

<form name="edit" method="post" action="act_del_project.cfm">
	  <h2 align="center">Delete Certification</h2><br>
<cfoutput>
<table align="center">
    <input type="hidden" name="pr_key" value="#Get_Pro.pr_key#">	
          <tr>
     	<td>Project: </td>
        <td>   
        <input 
         type="text" 
         name="pr_desc" 
         value="#Get_Pro.pr_desc#"
         size="120">
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
