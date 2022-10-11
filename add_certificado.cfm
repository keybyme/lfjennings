
<cfinclude template="headings.cfm"></cfinclude>	
	

<div class="container-fluid text-center">    



		<div>
			
			<cfif NOT (IsDefined("SESSION.Auth.IsLoggedIn") AND SESSION.Auth.IsLoggedIn)>
	            <cflocation url="https://www.keybyme.com"> 
          </cfif> 


 <CFFORM ACTION="inc_certificado.cfm" METHOD="post">
        <table align="center" class="table table-striped" >		
<TR>
   <TH colspan="2">
      <span class="style1"><font size="+1">Add Certification</font></span>
   </TH>
</TR>
<TR>
   <TD><span class="style3">
        Certification:
   </span></TD>
   <TD>
   <div class="form-group">
        <CFINPUT TYPE="Text"     
                 NAME="cer_desc" 
	             MESSAGE="Name is required!"
	             MAXLENGTH="80"
                 REQUIRED="Yes"
                 class="form-control">   
   </div>
   </TD>
</TR>


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
