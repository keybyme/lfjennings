
<cfinclude template="headings.cfm"></cfinclude>	
	
<div class="main">
  <cfoutput>
    <cfset ws_url_reporte = 0>
    <cfparam name="url.reporte" default="">
    <cfset ws_url_reporte = url.reporte> 	
   
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
	INSERT INTO LF_Photos(ph_link, ph_yyyymmdd, ph_user_name, ph_fk_rep_key, ph_desc, ph_obs)
	 VALUES('#ws_copiar#', '#ws_fecha#', '#SESSION.Auth.user_name#', '#ws_url_reporte#', '#desc#', '#obse#') 
</cfquery>

<cfset ws_rep_pages = 0>
<cfquery name="GetRep" datasource="wolffdb_dsn">
  Select *
  From LF_Reportes  
      Where rep_key = <cfqueryparam value="#URL.reporte#" cfsqltype="cf_sql_numeric">     
   
</cfquery>

<cfset ws_rep_pages = #GetRep.rep_pages# + 1>
<cfquery name="editemp" datasource="wolffdb_dsn"> 

  UPDATE LF_Reportes
  SET rep_pages           = #ws_rep_pages#  
  WHERE 
          rep_key = #GetRep.rep_key#       
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
  <strong>Observations</strong><br>
  <input name="obse" type="text" value="" size="100"><br>
  <strong>Description</strong><br>
  <input name="desc" type="text" value="" size="100"> <br><br>
  <input type="submit" value="Upload File" />
  
</form> 
      
</div>	
      <br><br>   
    </div>

    <cfinclude template="footer.cfm"></cfinclude>
