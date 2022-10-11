<!doctype html> 
<html>
 
<body> 
    <CFSET SESSION.Auth = StructNew()>
    <CFSET SESSION.Auth.IsLoggedIn        = "No">
    <CFSET SESSION.Auth.user_key          = ''>
    <CFSET SESSION.Auth.user_name         = ''>
    <CFSET SESSION.Auth.user_password     = ''>
    <CFSET SESSION.Auth.user_nombre       = ''>
    <CFSET SESSION.Auth.user_apellido     = ''>     
    <CFSET SESSION.Auth.email             = ''>   
    <CFSET SESSION.Auth.user_role         = ''>
    <CFSET SESSION.Auth.user_cia          = ''>
    <cflocation template="https://www.keybyme.com/index.cfm"> 
</body>
</html>