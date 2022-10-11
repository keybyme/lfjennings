
<cfinclude template="headings.cfm"></cfinclude>	


<link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
  
<div class="container-fluid text-center">    


		<div>
			
			<cfif NOT (IsDefined("SESSION.Auth.IsLoggedIn") AND SESSION.Auth.IsLoggedIn)>
	            <cflocation url="https://www.keybyme.com"> 
          </cfif> 

<!---======================================================--->  					
<cfset GetCargo.RecordCount=0>
<cfquery name="GetCargo" datasource="wolffdb_dsn">
	  Select *
		From LF_Cargos
        order by ch_desc
</cfquery>   
         
<!---======================================================---> 


<style>
#btn{
   background-color:9c0030;
   border-color:9c0030;
   color:white;
}
</style>

 <CFFORM ACTION="inc_emp.cfm" METHOD="post">
        <table align="center"  class="table table-striped" >		
<TR>
   <TH colspan="2">
      <span class="style1"><font size="+1">Add Employee</font></span>
   </TH>
</TR>
<TR>
   <TD><span class="style3">
        Name:
   </span></TD>

   <div class="form-group">
   <td>
        <CFINPUT TYPE="Text"     
                 NAME="emp_name" 
	             MESSAGE="Name is required!"
	             MAXLENGTH="80"
                 REQUIRED="Yes"
                 class="form-control">   
   </TD>
</TR>

<TR>
   <TD><span class="style3">
        Email:
   </span></TD>
   <TD>
        <CFINPUT TYPE="Text"     
                 NAME="emp_email" 
	             MESSAGE="Name is required!"
	             MAXLENGTH="80"
                 REQUIRED="Yes"
                 class="form-control">   
   </TD>

</TR>

<TR>
   <TD><span class="style3">
        Phone:
   </span></TD>
   <TD>
        <CFINPUT TYPE="Text"     
                 NAME="emp_phone" 
	             MAXLENGTH="80"
                class="form-control">   
   </TD>
</TR>
   </div>
<tr>
    <td>Charge:</td>
    <td>
 
  	 <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
      <script>
        $("#single").select2({
            placeholder: "Select a programming language",
            allowClear: true
        });
      </script>
 

       <select id="single" name="emp_fk_ch_key" class="js-states form-control" size="1">
           <option value="0" selected>Charges</option>
              <cfloop query="GetCargo"> 
               <cfoutput>  
                   <option value="#GetCargo.ch_key#"> 
                       #GetCargo.ch_desc#
                   </option> 	 
               </cfoutput>	 
           </cfloop> 
      </select>  

   
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


</div>

  	

      
<cfinclude template="footer.cfm"></cfinclude>
