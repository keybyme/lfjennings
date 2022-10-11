

<cfinclude template="headings.cfm"></cfinclude>	

<div class="container-fluid text-center">    

	      <cfif NOT (IsDefined("SESSION.Auth.IsLoggedIn") AND SESSION.Auth.IsLoggedIn)>
			    <cflocation url="https://www.keybyme.com/index.cfm">
          </cfif> 
		
 
	<cfset GetFoto.RecordCount=0>
	<cfquery name="GetFoto" datasource="wolffdb_dsn">
	  Select *
		From LF_Photos left join LF_Reportes on 
             ph_fk_rep_key = rep_key
    where ph_user_name = '#SESSION.Auth.user_name#'         
		order by ph_yyyymmdd
	</cfquery>
  
 <center>
				    	<h2> <cfoutput>Photos</cfoutput> </h2>
	                
<table border="2" class="table table-striped">
  <tr>
    <th colspan="10">
       <cfoutput> 
       <a href="Upload_Files.cfm">Add Photo</a> 
       </cfoutput>     
    </th>
    </tr> 
</tr>
   <tr>
	    <th style="color:#006" bgcolor="#CCCCCC"><span class="style9">Edit</th> 
	    <th style="color:#006" bgcolor="#CCCCCC">Observations</th>
      <th style="color:#006" bgcolor="#CCCCCC">Description</th>
	    <th style="color:#006" bgcolor="#CCCCCC">Photo</th>
        <th style="color:#006" bgcolor="#CCCCCC"><span class="style9">Delete</th>        
    </tr> 
	
<cfset ws_I = 0>
<cfset WbgcolorYes = "##70dbdb">
<cfset WbgcolorNo = "##ebfafa">
	
 <cfloop query="GetFoto"> 
 <cfoutput> 
 <tr>
 
	 
	 	<cfif ws_I EQ 0>
                <cfset ws_color = WbgcolorNo>
                <cfset ws_I = 1>
        <cfelse>
                <cfset ws_color = WbgcolorYes>
                <cfset ws_I = 0>
        </cfif>  
	 
  <td align="center"><a href="upd_photo.cfm?claveU=#GetFoto.ph_key#"><img src="Images/ico-edit.gif"  width="16" height="16" alt=""/></a></td>					
  <td bgcolor="#(ws_color)#">#TRIM(GetFoto.ph_obs)#</td>  
  <td bgcolor="#(ws_color)#">#TRIM(GetFoto.ph_desc)#</td> 
  <td bgcolor="#(ws_color)#"><a href="#TRIM(GetFoto.ph_link)#"><img src="#TRIM(GetFoto.ph_link)#" class="img-fluid" /></a></td>
					
  <td align="center"><a href="del_photo.cfm?claveU=#GetFoto.ph_key#"><img src="Images/ico-eliminar2.gif" width="20" height="20" alt=""/></a></td>               
 
 </tr>
 </cfoutput>
 </cfloop>
 
</table>
</center>

</div>

<cfinclude template="footer.cfm"></cfinclude>
