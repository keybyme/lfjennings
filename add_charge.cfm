
<cfinclude template="headings.cfm"></cfinclude>	
	

<div class="container-fluid text-center">    


		<br>
		 
 
		<div>
			
			<cfif NOT (IsDefined("SESSION.Auth.IsLoggedIn") AND SESSION.Auth.IsLoggedIn)>
	            <cflocation url="https://www.keybyme.com"> 
          </cfif> 


 <CFFORM ACTION="inc_charge.cfm" METHOD="post">
        <table align="center" class="table table-striped" >		
<TR>
   <TH colspan="2">
      <span class="style1"><font size="+1">Add Charge</font></span>
   </TH>
</TR>
<TR>
   <TD><span class="style3">
       <p class="text-end"> Charge: </p>
   </span></TD>
   <TD>

        <CFINPUT TYPE="Text"     
                 NAME="ch_desc" 
	             MESSAGE="Name is required!"
	             MAXLENGTH="80"
                 REQUIRED="Yes"
                 class='form-control'>   
   </TD>
</TR>


 <TR>
 <TD colspan="2" align="center">
<div class="d-grid gap-2">
 <input type="submit" class="btn btn-secondary" VALUE="Enter"> 
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
