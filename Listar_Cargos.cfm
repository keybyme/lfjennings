
<cfinclude template="headings.cfm"></cfinclude>	

  <cfif NOT (IsDefined("SESSION.Auth.IsLoggedIn") AND SESSION.Auth.IsLoggedIn)>
    <cflocation url="https://www.keybyme.com"> 
  </cfif>  

<div class="container-fluid text-center">    

 
	<cfset Get_Cargo.RecordCount=0>
	<cfquery name="Get_Cargo" datasource="wolffdb_dsn">
	  Select *
		From LF_Cargos
		order by ch_desc
	</cfquery>
  
 <center>
				    	<h2> <cfoutput>Charges</cfoutput> </h2>
	                
<table border="2" class="table table-striped">
   <tr>
     <th colspan="10">
        <cfoutput> 
        <a href="add_charge.cfm">Add Charge</a> 
        </cfoutput>     
     </th>
     </tr>
     <tr>
 
</tr>
   <tr>
	    <th style="color:#006" bgcolor="#CCCCCC"><span class="style9">Edit</th>
        <th style="color:#006" bgcolor="#CCCCCC">Charge</th>  
        <th style="color:#006" bgcolor="#CCCCCC"><span class="style9">Delete</th>        
    </tr> 
	
<cfset ws_I = 0>
<cfset WbgcolorYes = "##70dbdb">
<cfset WbgcolorNo = "##ebfafa">
	
 <cfloop query="Get_Cargo"> 
 <cfoutput> 
 <tr>
 
	 
	 	<cfif ws_I EQ 0>
                <cfset ws_color = WbgcolorNo>
                <cfset ws_I = 1>
        <cfelse>
                <cfset ws_color = WbgcolorYes>
                <cfset ws_I = 0>
        </cfif>  
	 
  <td align="center"><a href="upd_charge.cfm?claveU=#Get_Cargo.ch_key#"><img src="Images/ico-edit.gif" width="16" height="16" alt=""/></a></td>					
  
  <td bgcolor="#(ws_color)#">#TRIM(Get_Cargo.ch_desc)#</td> 
  
  <td align="center"><a href="del_charge.cfm?claveU=#Get_Cargo.ch_key#"><img src="Images/ico-eliminar2.gif" width="20" height="20" alt=""/></a></td>               
 
 </tr>
 </cfoutput>
 </cfloop>
 
</table>
</center>

</div>
	


<cfinclude template="footer.cfm"></cfinclude>
