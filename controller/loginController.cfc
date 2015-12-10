<cfcomponent>
<!--- Check user credentials and log them in --->
	<cffunction name="createSession" access="remote" hint="checks user credentials">
	<cfargument name="fm_userName" type="any" required="true" default="jreece">
	<cfargument name="fm_Password" type="any" required="true" default="ReecePass9834" >
	
	<!--- Query to find a matching account for the username and password supplied --->
    <cfquery name="qryGetUserAcct" datasource="First_Title_Main_Dev" >
    SELECT * 
    FROM intranetSecurity
    WHERE ( username = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.fm_userName#" > ) and ( password = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.fm_Password#" > )
    </cfquery>
    
    <!--- If the user credentials are verified --->
    <cfif qryGetUserAcct.RecordCount EQ 1 >
     <!--- Create a data structure of the user's data --->
    <cfset sessionData = StructNew()>														  <!--- Create new sessionData struct            --->							
    <cfset sessionData.loggedIn = '1' >														  <!--- Set the session loggedIn value to true   --->											
																							  <!--- Get the user's account data              --->
    <cfquery name="qryGetUserData" datasource="First_Title_Main_Dev" >					      <!--- Get the user's profile data              --->
    SELECT fname, lname, email, position, manager,  admin, primaryDepartment			    	                                   
    FROM intranetSecurity	 																     <!---                                          --->
    WHERE username = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.fm_userName#" >  <!---                                          --->
    and password = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.fm_Password#" >	 <!---                                          --->
    </cfquery>	
																							  <!---                                          --->
    <cfif qryGetUserData.RecordCount EQ 1 >													  <!--- If query returns record                  --->	
    <cfset sessionData.profileInfo = #qryGetUserData# >										  <!--- inject query result into struct          --->
    <cfreturn sessionData >																	  <!--- return the sessionData struct            --->
    <cfelseif qryGetUserData GT 1 >															  <!--- else if GT 1, throw error                --->
 																                              <!--- Catch DB error                           --->
    <cfset acctError.errorCode = "100"> 													  <!--- load error handler struct                --->
    <cfset acctError.msg = "Multiple Accounts Found" >   									  <!---                                          --->		
																							  <!---                                          --->
    <cfreturn acctError >																	  <!--- return acctError struct to view          --->
    </cfif>
    </cfif>
 
    </cffunction>
</cfcomponent>