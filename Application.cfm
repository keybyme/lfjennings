<CFAPPLICATION
  NAME="wolffdb_dsn"
  CLIENTMANAGEMENT="Yes"
  clientStorage = "Cookie"
  SESSIONMANAGEMENT="Yes" 
  <!--- sessionTimeout = #CreateTimeSpan(days, hours, minutes, seconds)#  --->
  sessiontimeout=#CreateTimeSpan(0,0,45,0)#>
  



<!--- Backgrounds ergemonico --->
<!--- <cfset bgcolorYes = "##EBEBEB">
<cfset bgcolorNo = "##F9F9F9">  --->

<cfset bgcolorNo = "##ebfafa">
<cfset bgcolorYes = "##70dbdb"> 

<cfset yellowNo = "##CC9900">
<cfset yellowYes = "##FFFCCC">

<cfset BlueNo = "##00FFFF">
<cfset BlueYes = "##CCFFFF">

<cfset pinkNo = "##FF99FF">
<cfset pinkYes = "##FFCCFF">

<cfset greenNo = "##CCFF99">
<cfset greenYes = "##CCFFCC">
<!---<cfset bgcolorYes= "##003399"> --->


<cfset ws_parte1 = '<a  href="http://'>
<cfset ws_parte2 = '" target="_blank">'>
<cfset ws_parte3 = '</a>'>

<cfset ws_action = 0>
	
<cfset ws_roll = 0>	

<cfset ws_capitulo_editado = 0>
