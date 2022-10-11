
<cfinclude template="headings.cfm"></cfinclude>	
	
<div class="main" style="height:100%">

	
  
<div class="container-fluid text-center">    

  	 	  <cfif NOT (IsDefined("SESSION.Auth.IsLoggedIn") AND SESSION.Auth.IsLoggedIn)>
			    <cflocation url="https://www.keybyme.com/index.cfm">
          </cfif> 
 
  
  	<cfset Get_Photo.RecordCount=0>
	<cfquery name="Get_Photo" datasource="wolffdb_dsn">
	  Select *
		From LF_Photos
		Where ph_key = <cfqueryparam value="#URL.claveU#" cfsqltype="cf_sql_numeric">  
	</cfquery>
 	 
  	<cfset GetRep.RecordCount=0>
	<cfquery name="GetRep" datasource="wolffdb_dsn">
	  Select *
		From LF_Reportes
		where rep_user_name = '#SESSION.Auth.user_name#' 
	</cfquery>

 <cfform name="edit" method="post" action="act_upd_photo.cfm">
	<cfoutput>
        <input type="hidden" name="ph_key" value="#Get_Photo.ph_key#">	
    </cfoutput>
	<br>

	<table align="center">
	  <cfoutput>	
  
    <tr>
        <td>Report name: </td>
        <td> 
			
        <select name="ph_fk_rep_key" size="1">
            <option value="">Reports</option>
		   <cfloop query="GetRep"> 
			    <cfoutput>
					<cfif #Trim(GetRep.rep_key)# EQ #Trim(Get_Photo.ph_fk_rep_key)#>
		               <option value="#GetRep.rep_key#" selected> 
		                      #GetRep.rep_name#
	                   </option>
			        <cfelse>
					   <option value="#GetRep.rep_key#"> 
		                      #GetRep.rep_name#
	                   </option>	
					</cfif>	
				 </cfoutput>	 
		   </cfloop> 
	
        </select>			
		</td>	
    </tr>

    <tr>
        <td>Photo Observations: </td>
       <td><cfinput name="ph_obs" value="#Get_Photo.ph_obs#" size="130"></td>    
    </tr>

	<tr>
        <td>Photo Description: </td>
       <td><cfinput name="ph_desc" value="#Get_Photo.ph_desc#" size="130"></td>    
    </tr>

    <tr>
        
        <td colspan="3"><a href="#TRIM(Get_Photo.ph_link)#"><img src="#TRIM(Get_Photo.ph_link)#" width="200"/></a></td>
    
    </tr>
    <tr><td><br></td></tr>
    <tr>
        <td colspan="2"><input type="submit" name="editemp" value="Update"></td>
     
 </tr> 	
 </cfoutput> 
	</table>		
   

</cfform>		

</div>
	 
</div>

<cfinclude template="footer.cfm"></cfinclude>
