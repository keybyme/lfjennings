 

  <cfif '#Trim(Form.emp_fk_ch_key)#' gt '0'>
	<CFQUERY name="test" datasource="wolffdb_dsn">
	INSERT INTO LF_Employees(emp_name, emp_fk_ch_key, emp_email, emp_phone)
	 VALUES('#Trim(FORM.emp_name)#', '#Trim(FORM.emp_fk_ch_key)#', '#Trim(FORM.emp_email)#', '#Trim(FORM.emp_phone)#')
	</CFQUERY> 
 </cfif>
	   
<cflocation url="Listar_Emp.cfm">
