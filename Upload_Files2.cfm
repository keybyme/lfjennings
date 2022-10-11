
<cfinclude template="headings.cfm"></cfinclude>	
	
<div class="main">
  <cfoutput>
    <cfset ws_url_reporte = 0>
    <cfparam name="url.reporte" default="">
    <cfset ws_url_reporte = url.reporte> 	

    <cfset ws_llave = 0>
    <cfparam name="url.llave" default="">
    <cfset ws_llave = url.llave> 	
   
  </cfoutput>	
<div align="center">	
	<br>
	<CFSET ws_fecha = DateFormat(Now(),"yyyymmdd")>   
	<cfoutput>#ws_fecha#</cfoutput><br>
	
 <cfif NOT (IsDefined("SESSION.Auth.IsLoggedIn") AND SESSION.Auth.IsLoggedIn)>
			    <cflocation url="https://www.keybyme.com/index.cfm">
          </cfif> 
<br>
<cfparam name="form.fileUpload" default="">

<cfif len(trim(form.fileUpload))>
  <cfoutput>
  <cffile action="upload"
     fileField="fileUpload" nameconflict="OVERWRITE" 
      destination="D:\home\keybyme.com\wwwroot\LFfotos">
   <cfset ws_link = "https://www.keybyme.com/LFfotos/">   
  <p>
   You Uploaded #cffile.ClientFileName#.#cffile.ClientFileExt#
      successfully to #cffile.ServerDirectory#.</p>
      <!---#ws_link##cffile.ClientFileName#.#cffile.ClientFileExt#--->
    <a href=#cffile.ClientFileName#"#ws_link#.#cffile.ClientFileExt#"  target="_blank">#ws_link##cffile.ClientFileName#.#cffile.ClientFileExt#</a>   <br>
       <cfset ws_copiar = "#ws_link##cffile.ClientFileName#.#cffile.ClientFileExt#">
<!---===================================     --->  
 
<input type="text" value= "#ws_copiar#" id="myInput" size="70">
<button onclick="myFunction()">Copy Link</button>


<script>
function myFunction() {
  var copyText = document.getElementById("myInput");
  copyText.select();
  copyText.setSelectionRange(0, 99999)
  document.execCommand("copy");
  alert("Copied the text: " + copyText.value);
}
</script>
<!--- ======================================   --->   
<cfquery name="fotos" datasource="wolffdb_dsn"> 
	INSERT INTO LF_Photos2(ph_link2, ph_yyyymmdd2, ph_fk_ph_key, ph_desc2, ph_fk_rep_key2)
	 VALUES('#ws_copiar#', '#ws_fecha#', '#ws_llave#', '#desc#', '#ws_url_reporte#') 
</cfquery>
</cfoutput>   
  <cfoutput>     
  <cflocation url="Reporte_upd.cfm?claveU=#ws_url_reporte#"> 
</cfoutput>   
</p>       
</cfif>

<form enctype="multipart/form-data" method="post">
  <input type="file" name="fileUpload" /><br />
  <br> 
  <strong>Description</strong><br>
  <input name="desc" type="text" value="" size="100"> <br><br>
  <input type="submit" value="Upload File" />
  
</form> 
      
</div>	
      <br><br>   
    </div>

    <cfinclude template="footer.cfm"></cfinclude>
