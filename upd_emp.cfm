
<cfinclude template="headings.cfm"></cfinclude>	
	
<div class="main" style="height:100%">
	
  
<div class="container-fluid text-center">    

       
  	 	  <cfif NOT (IsDefined("SESSION.Auth.IsLoggedIn") AND SESSION.Auth.IsLoggedIn)>
			    <cflocation url="https://www.keybyme.com/index.cfm">
          </cfif> 

  
  	<cfset Get_Emp.RecordCount=0>
	<cfquery name="Get_Emp" datasource="wolffdb_dsn">
	  Select *
		From LF_Employees  
		Where emp_key = <cfqueryparam value="#URL.claveU#" cfsqltype="cf_sql_numeric">  
	</cfquery>

   <cfquery name="Get_Cargo" datasource="wolffdb_dsn">
    Select *
    From LF_Cargos
   </cfquery>	
 
 <cfform name="edit" method="post" action="act_upd_emp.cfm">
	<cfoutput>
        <input type="hidden" name="emp_key" value="#Get_Emp.emp_key#">	
    </cfoutput>
	<br>

	<table align="center">
	  <cfoutput>	
 
      <tr>
        <td>Name: </td>
       <td><cfinput name="emp_name" value="#Get_Emp.emp_name#" size="80"></td>    
    </tr>

      <tr>
        <td>Email: </td>
       <td><cfinput name="emp_email" value="#Get_Emp.emp_email#" size="80"></td>    
    </tr>

	<tr>
        <td>Phone: </td>
       <td><cfinput name="emp_phone" value="#Get_Emp.emp_phone#" size="80"></td>    
    </tr>

     </cfoutput>
    <tr>
        <td>Charge: </td>
        <td> 
			
        <select name="emp_fk_ch_key" size="1">
		   <cfloop query="Get_Cargo"> 
			    <cfoutput>
					<cfif #Trim(Get_Emp.emp_fk_ch_key)# EQ #Trim(Get_Cargo.ch_key)#>
		               <option value="#Get_Cargo.ch_key#" selected> 
		                      #Get_Cargo.ch_desc#
	                   </option>
			        <cfelse>
					   <option value="#Get_Cargo.ch_key#"> 
		                      #Get_Cargo.ch_desc#
	                   </option>	
					</cfif>	
				 </cfoutput>	 
		   </cfloop> 
	
        </select>			
		</td>	
    </tr>

    <tr>
        <td colspan="2"><input type="submit" name="editemp" value="Update"></td>
     
 </tr> 	  
	</table>		
   

</cfform>		

</div>

</div>

<cfinclude template="footer.cfm"></cfinclude>
