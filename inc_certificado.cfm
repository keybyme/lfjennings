 

 
	<CFQUERY name="test" datasource="wolffdb_dsn">
	INSERT INTO LF_Certificados(cer_desc)
	 VALUES('#Trim(FORM.cer_desc)#')
	</CFQUERY> 
 
	   
<cflocation url="Listar_Certificados.cfm">
