
<cfinclude template="headings.cfm"></cfinclude>	
	

  
<div class="container-fluid text-center ">    


			<cfif NOT (IsDefined("SESSION.Auth.IsLoggedIn") AND SESSION.Auth.IsLoggedIn)>
	            <cflocation url="https://www.keybyme.com"> 
          </cfif> 


 <cfform action="inc_projecto.cfm" METHOD="post">
        <table align="center"  class="table table-striped">		
<tr>
   <TH colspan="2">
      <span class="style1"><font size="+1">Add Project</font></span>
   </th>
</tr>
<tr>
<div class="form-group">
   <td><span class="style3">
        Project:
   </span></td>
   <td>
        <CFINPUT class="form-control"
                type="Text"     
                 name="pr_desc" 
	             message="Name is required!"
	             maxlength="120"
                 required="Yes">   
   </td>
</tr>

<tr>
    <td><span class="style3">
         Address:
    </span></td>
    <td>
         <CFINPUT class="form-control"
                  type="Text"     
                  NAME="pr_address" 
                  MESSAGE="Address is required!"
                  MAXLENGTH="120"
                  REQUIRED="Yes">   
    </td>
   </div>
 </tr>

 <tr>
 <TD colspan="2" align="center">
      
<div class="d-grid gap-2">
 <input type="submit" class="btn btn-secondary" VALUE="Add"> 
</div>
 </td> 
</tr>    
</table>
<br>
<br>
<br>
</cfform>

</div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <!-- Select2 -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>
    <script>
      $("#single").select2({
          placeholder: "Select an Employee",
          allowClear: true
      });
      </script>
<cfinclude template="footer.cfm"></cfinclude>
