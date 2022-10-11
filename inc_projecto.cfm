 

 
	<CFQUERY name="test" datasource="wolffdb_dsn">
	INSERT INTO LF_Projects(pr_desc, pr_address)
	 VALUES('#Trim(FORM.pr_desc)#', '#Trim(FORM.pr_address)#')
	</CFQUERY> 
 
	   
<cflocation url="Listar_Projectos.cfm">
