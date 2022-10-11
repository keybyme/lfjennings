
<cfinclude template="headings.cfm"></cfinclude>	

  <cfif NOT (IsDefined("SESSION.Auth.IsLoggedIn") AND SESSION.Auth.IsLoggedIn)>
    <cflocation url="https://www.keybyme.com"> 
  </cfif>  

  <cfif isDefined("form.Criteria")>
    <cfset url.Criteria = trim(form.Criteria)>
  </cfif> 

<div class="container-fluid">    

	
		
 
	<cfset Get_Cert.RecordCount=0>
	<cfquery name="Get_Cert" datasource="wolffdb_dsn">
	  Select *
		From LF_Certificados
            <cfif isDefined('url.Criteria') AND TRIM(url.Criteria) NEQ ''>
             where (cer_desc LIKE '%#Trim(url.Criteria)#%')
            </cfif> 
		order by cer_desc
	</cfquery>
  
 <center>
				    	<h2> <cfoutput>Certifications</cfoutput> </h2>
	                
<table border="2" class="table table-striped">
   <tr>
     <th colspan="10">
        <cfoutput> 
        <a href="add_certificado.cfm">Add Certification</a> 
        </cfoutput>     
     </th>
     </tr>
     <tr>
 
      <cfform name="disp" method="post" action="Listar_Certificados.cfm">

        <tr> 
        <td colspan="1" valign="bottom" align="center"><input type="submit" class="btn btn-secondary" name="editpho" value="Search"></td> 
        <td colspan="4"><input name="Criteria" size="30"></td>
        <td colspan="4">&nbsp;</td>
        </tr>          
     
    </cfform> 

</tr>
   <tr>
	    <th style="color:#006" bgcolor="#CCCCCC"><span class="style9">Edit</th>
        <th style="color:#006" bgcolor="#CCCCCC">Certifications</th>  
        <th style="color:#006" bgcolor="#CCCCCC"><span class="style9">Delete</th>        
    </tr> 
	
<cfset ws_I = 0>
<cfset WbgcolorYes = "##70dbdb">
<cfset WbgcolorNo = "##ebfafa">
	
 <cfloop query="Get_Cert"> 
 <cfoutput> 
 <tr>
 
	 
	 	<cfif ws_I EQ 0>
                <cfset ws_color = WbgcolorNo>
                <cfset ws_I = 1>
        <cfelse>
                <cfset ws_color = WbgcolorYes>
                <cfset ws_I = 0>
        </cfif>  
	 
  <td align="center"><a href="upd_cert.cfm?claveU=#Get_Cert.cer_key#"><img src="Images/ico-edit.gif" width="16" height="16" alt=""/></a></td>					
  
  <td bgcolor="#(ws_color)#">#TRIM(Get_Cert.cer_desc)#</td> 
  
  <td align="center"><a href="del_cert.cfm?claveU=#Get_Cert.cer_key#"><img src="Images/ico-eliminar2.gif" width="20" height="20" alt=""/></a></td>               
 
 </tr>
 </cfoutput>
 </cfloop>
 
</table>

  
</div>

<cfinclude template="footer.cfm"></cfinclude>