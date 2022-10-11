<cfinclude template="headings.cfm"></cfinclude>	
	

  
<div class="container-fluid text-center">    

			
			<cfif NOT (IsDefined("SESSION.Auth.IsLoggedIn") AND SESSION.Auth.IsLoggedIn)>
	            <cflocation url="https://www.keybyme.com"> 
          </cfif> 
<!---======================================================--->  					
<cfset GetEmp.RecordCount=0>
<cfquery name="GetEmp" datasource="wolffdb_dsn">
	  Select *
		From LF_Employees
        order by emp_name
</cfquery>   
         
<!---======================================================---> 
<cfset Get_Cert.RecordCount=0>
<cfquery name="Get_Cert" datasource="wolffdb_dsn">
  Select *
    From LF_Certificados 
    order by cer_desc
</cfquery>
<!---======================================================---> 

 <CFFORM ACTION="inc_emp_cer.cfm" METHOD="post">
        <table align="center" class="table table-striped">		
<TR>
   <TH colspan="2">
      <span class="style1"><font size="+1">Add Certification</font></span>
   </TH>
</TR>
<tr>
    <td> <p class="text-end"> Employee: </p></td>
    <td>
       <select name="ec_fk_emp_key" class="form-select"  size="1">
           <option value="0" selected>Employee</option>
              <cfloop query="GetEmp"> 
               <cfoutput>  
                   <option value="#GetEmp.emp_key#"> 
                       #GetEmp.emp_name#
                   </option> 	 
               </cfoutput>	 
           </cfloop> 
      </select>        
    </td>     
</tr> 

<tr>
    <td> <p class="text-end"> Certification: </a></td>
    <td>
       <select name="ec_fk_cer_key" class="form-select"  size="1">
           <option value="0" selected>Certification</option>
              <cfloop query="Get_Cert"> 
               <cfoutput>  
                   <option value="#Get_Cert.cer_key#"> 
                       #Get_Cert.cer_desc#
                   </option> 	 
               </cfoutput>	 
           </cfloop> 
      </select>        
    </td>     
</tr> 
<tr>
    <td>
        <p class="text-end">  Exp. Date YYYYMMDD: </p>
    </td>
    <td>
        <CFINPUT TYPE="Text"     
        NAME="ec_exp_yyyymmdd"  
        MAXLENGTH="15"
        class="form-control">
    </td>
</tr>
 <TR>
 <TD colspan="2" align="center">
<div class="d-grid gap-2">
 <input type="submit" class="btn btn-secondary" VALUE="Add"> 
</div>
 </TD> 
</TR>    
</table>
<br>
<br>
<br>
</CFFORM>
		
	 
</div>

<cfinclude template="footer.cfm"></cfinclude>
