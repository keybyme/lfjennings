 

 
	<CFQUERY name="test" datasource="wolffdb_dsn">
	INSERT INTO LF_Cargos(ch_desc)
	 VALUES('#Trim(FORM.ch_desc)#')
	</CFQUERY> 
 
	   
<cflocation url="Listar_Cargos.cfm">
