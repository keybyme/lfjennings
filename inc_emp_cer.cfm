 

 
	<CFQUERY name="test" datasource="wolffdb_dsn">
	INSERT INTO LF_Emp_Cer(ec_fk_emp_key, ec_fk_cer_key, ec_exp_yyyymmdd)
	 VALUES('#Trim(FORM.ec_fk_emp_key)#', '#Trim(FORM.ec_fk_cer_key)#', '#Trim(FORM.ec_exp_yyyymmdd)#')
	</CFQUERY> 
 
	   
<cflocation url="Listar_Emp_Cer.cfm">
