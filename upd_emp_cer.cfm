
<cfinclude template="headings.cfm"></cfinclude>	
	

<div class="container-fluid text-center">    

       
  	 	  <cfif NOT (IsDefined("SESSION.Auth.IsLoggedIn") AND SESSION.Auth.IsLoggedIn)>
			    <cflocation url="https://www.keybyme.com/index.cfm">
          </cfif> 

  
  	<cfset Get_EC.RecordCount=0>
	<cfquery name="Get_EC" datasource="wolffdb_dsn">
	  Select *
		From LF_Emp_Cer inner join LF_Employees on 
             ec_fk_emp_key = emp_key inner join LF_Certificados on
             ec_fk_cer_key = cer_key
		Where ec_key = <cfqueryparam value="#URL.claveU#" cfsqltype="cf_sql_numeric">  
	</cfquery>

<cfquery name="Get_Cer" datasource="wolffdb_dsn">
  Select *
  From LF_Certificados
 </cfquery>	
 
 <cfform name="edit" method="post" action="act_upd_ec.cfm">
	<cfoutput>
        <input type="hidden"  class="form-control" name="ec_key" value="#Get_EC.ec_key#">	
    </cfoutput>
	<br>

	<table align="center" class="table table-striped">
	  <cfoutput>	
  <div class="form-control">
      <tr>
        <td>Name: </td>
       <td><cfinput name="emp_name" value="#Get_EC.emp_name#" class="form-control"></td>    
    </tr> 

     <tr>
      <td>Certification: </td>
      <td> 
    
      <select name="ec_fk_cer_key" size="1"  class="form-select">
     <cfloop query="Get_Cer"> 
        <cfoutput>
        <cfif #Trim(Get_Cer.cer_key)# EQ #Trim(Get_EC.ec_fk_cer_key)#>
                 <option value="#Get_Cer.cer_key#" selected> 
                        #Get_Cer.cer_desc#
                   </option>
            <cfelse>
           <option value="#Get_Cer.cer_key#"> 
                        #Get_Cer.cer_desc#
                   </option>	
        </cfif>	
       </cfoutput>	 
     </cfloop> 

      </select>			
  </td>	
  </tr> 

    <tr>
        <td>Expiration Date: </td>
       <td><cfinput name="ec_exp_yyyymmdd" value="#Get_EC.ec_exp_yyyymmdd#"  class="form-control"></td>    
    </tr>
     </cfoutput>
     
    <tr>
     
 </tr> 	  
 </div>
	</table>		
   

</cfform>		


</div>

<cfinclude template="footer.cfm"></cfinclude>