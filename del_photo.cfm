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
   
<CFSET Get_Photo.RecordCount=0>
<cfquery name = "Get_Photo" dataSource = "wolffdb_dsn">
    Select *   
    From LF_Photos
    Where ph_key = <cfqueryparam value="#URL.claveU#" cfsqltype="cf_sql_numeric"> 
</cfquery>


<cfparam name="url.action" default="">

<form name="edit" method="post" action="act_del_photo.cfm">
	  <h2 align="center">Delete Photo</h2><br>
<cfoutput>
<table align="center">
    <input type="hidden" name="ph_key" value="#Get_Photo.ph_key#">	
          <tr>
     	<td>Photo: </td>
         <td><a href="#TRIM(Get_Photo.ph_link)#"><img src="#TRIM(Get_Photo.ph_link)#" width="250"/></a></td>   
     </tr>
       <tr><td><br></td></tr>   
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
