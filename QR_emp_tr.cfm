<!DOCTYPE html>
<html lang="en">
<head>
  <title>L.F. Jennings</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
	 <link rel="stylesheet" type="text/css" href="../Paginas/my.css">

</head>
<body> 
	
   
 
<div class="container-fluid text-center">    

  
  
	<cfset GetET.RecordCount=0>
	<cfquery name="GetET" datasource="wolffdb_dsn">
	  Select *
		From LF_Emp_Cer Inner join LF_Certificados on 
             ec_fk_cer_key = cer_key 
		     Inner Join LF_Employees on 
		     ec_fk_emp_key = emp_key
		Where emp_key = <cfqueryparam value="#URL.claveU#" cfsqltype="cf_sql_numeric"> 
		order by cer_desc
	</cfquery>
 
		       
 
<table class="table" align="center">
	<cfoutput>
	<tr><th>#TRIM(GetET.emp_name)#</th></tr>
	<tr><td>&nbsp;</td></tr>	
	</cfoutput>	
	 
    <tr> 
        <th style="color:#006" bgcolor="#CCCCCC">Certification</th>  
        <th> </th> 
        <th style="color:#006" bgcolor="#CCCCCC">Exp. Date</th>        
    </tr> 

<cfloop query="GetET"> 	
<cfoutput>    
     <tr> 
        <td>#TRIM(GetET.cer_desc)#</td>    
        <td>&nbsp;&nbsp;</td>  

        <cfset ws_fecha = #TRIM(GetET.ec_exp_yyyymmdd)#>
        <cfset ws_ini = #DateFormat(DateAdd('d', 0, ws_fecha),'yyyy-mm-dd')#> 

        <td>#TRIM(GetET.ec_exp_yyyymmdd)#</td>
     </tr>
</cfoutput> 
</cfloop>	
</table>


  </div>
</div>
	 
</body>
</html>
