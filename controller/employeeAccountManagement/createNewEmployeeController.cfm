<component>
<!--- 7/15/2015 createNewEmployeeController --->
<!--- This component contains the methods used to register the new employees into the system --->
<!--- No other methods which pertain to non-new employee profile creations should be included in this file --->
<!--- 8/13/2015 create New Employee Method verified --->

<!--- Set variables --->
<cfset password2 = "password123" >	

<!--- Add the new employee to the company employee table --->
<cffunction name="createNewEmployeeProfile" access="remote">
 <!--- Form Field Values Passed In From Flex Values --->
<cfargument name="fm_Fname" type="any" >				
<cfargument name="fm_Lname" type="any" >				
<cfargument name="fm_userName" type="any">		   
<cfargument name="fm_password" type="any" >	 
<cfargument name="fm_emailAddress" type="any" default="ftitle"> 
<cfargument name="fm_domainField" type="any" default="@firsttitleservices.com" >  	    					    	    
<cfargument name="fm_accessLevel" type="any" default="1">				  
<cfargument name="fm_position" type="any" default="Dev">				  		
<cfargument name="fm_phone" type="any" default="812-212-9928" >		      
<cfargument name="fm_fax" type="any" default="320-298-3850">			 
<cfargument name="fm_report" type="any" default="1">					 
<cfargument name="fm_roleID" type="numeric" default="25">

<!--- Concatenate email and domain --->
<cfset emailString = #arguments.fm_emailAddress#&"@"&#arguments.fm_domainField# >
<!---Hash the user password --->
<cfset variables.hashedPassword = Hash(#arguments.fm_password#, "SHA-512") />
<!--- Iterate over the hash 1,000 times --->
<cfset variables.numIterarions = 1000 />



<!--- Query Submits New Employee Information into the database to successfully create the new employee account --->
<cfquery name="qryCreateNewEmployeeProfile" datasource="First_Title_Services_Dev" >
INSERT INTO [First_Title_Services_Dev].[dbo].[Dev_First_Admin]
           ([fname]
           ,[lname]
           ,[username]
           ,[password]
           ,[password2]
           ,[email]
           ,[Lvl_access]
           ,[position]
           ,[phone]
           ,[fax]
           ,[report]
           ,[role_id] )
           
        
     VALUES
           (<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.fm_Fname#" >
           ,<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.fm_Lname#" >
           ,<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.fm_userName#" >
           ,<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.fm_password#" >
		   ,<cfqueryparam cfsqltype="cf_sql_varchar" value="#password2#" >
           ,<cfqueryparam cfsqltype="cf_sql_varchar" value="#emailString#" >
           ,<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.fm_accessLevel#" >
           ,<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.fm_position#" >
           ,<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.fm_phone#" >
           ,<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.fm_fax#">
           ,<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.fm_report#" >
           ,<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.fm_roleID#" >)
          

</cfquery>
</cffunction>

