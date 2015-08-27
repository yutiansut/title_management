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
<cfargument name="fm_accessLevel" type="any" default="1"> 
<cfargument name="fm_emailAddress" type="any" default="ftitle"> 
<cfargument name="fm_domainField" type="any" default="firsttitleservices.com" >  	    					    	    
<cfargument name="fm_position" type="any" default="Dev">				  		
<cfargument name="fm_phone" type="any" default="812-212-9928" >		      
<cfargument name="fm_fax" type="any" default="320-298-3850">			 
<cfargument name="fm_report" type="any" default="1">					 
<cfargument name="fm_roleID" type="any" default="25">
<cfargument name="fm_roleManager" type="numeric" default="0" >
<cfargument name="fm_Status" type="numeric">
<cfargument name="fm_parentUserID" type="numeric">
<cfargument name="fm_StreamlineEmployee" type="boolean" >
<cfargument name="fm_michiganEmployee" type="boolean" >
<cfargument name="fm_michiganAdmin" type="boolean" >
<cfargument name="fm_closingEmails" type="boolean" >
<cfargument name="fm_virginiaEmployee" type="boolean" >
<cfargument name="fm_virginiaAdmin" type="boolean" >
<cfargument name="fm_vendorAdmin" type="boolean" >
<cfargument name="fm_fairfaxAdmin" type="boolean" >
<cfargument name="fm_processor" type="boolean" >
<cfargument name="fm_virginiaEmployeeTemp" type="boolean" >
<cfargument name="fm_virginiaEmployeeBK" type="boolean" >
<cfargument name="fm_virginiaAdminTemp" type="boolean" >
<cfargument name="fm_fairfaxAdminTemp" type="boolean" >
<cfargument name="fm_TXEmployee" type="boolean" >
<cfargument name="fm_TXAdmin" type="boolean" >
<cfargument name="fm_ftFairfaxEmployee" type="boolean" >


<!--- Concatenate email and domain --->
<cfset domainString = "firstDevTeam.com" >
<cfset emailString = #arguments.fm_emailAddress#&"@"&#domainString# >
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
           ,[role_id]
           ,[role_mgr]
           ,[status]
           ,[parent_user_id]
           ,[streamline_employee]
           ,[mi_employee]
           ,[mi_admin]
           ,[closing_emails]
         )
           
        
     VALUES
           (<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.fm_Fname#" >
           ,<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.fm_Lname#" >
           ,<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.fm_userName#" >
           ,<cfqueryparam cfsqltype="cf_sql_varchar" value="#variables.hashedPassword#" >
		   ,<cfqueryparam cfsqltype="cf_sql_varchar" value="#password2#" >
           ,<cfqueryparam cfsqltype="cf_sql_varchar" value="#emailString#" >
           ,<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.fm_accessLevel#" >
           ,<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.fm_position#" >
           ,<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.fm_phone#" >
           ,<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.fm_fax#">
           ,<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.fm_report#" >
           ,<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.fm_roleID#" >
           ,<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.fm_roleManager#" >
           ,<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.fm_Status#" >
           ,<cfqueryparam cfsqltype="cf_sql_numeric" value="#arguments.fm_parentUserID#" >
           ,<cfqueryparam cfsqltype="cf_sql_numeric" value="#arguments.fm_StreamlineEmployee#" >
           ,<cfqueryparam cfsqltype="cf_sql_numeric" value="#arguments.fm_michiganEmployee#" >
           ,<cfqueryparam cfsqltype="cf_sql_numeric" value="#arguments.fm_michiganAdmin#" > )
          

</cfquery>
</cffunction>
