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
<cfargument name="fm_Fname" type="any" default="First">				
<cfargument name="fm_Lname" type="any" default="Title">				
<cfargument name="fm_userName" type="any" default="FTitle">		   
<cfargument name="fm_password" type="any" default="123" >	  	    					    	    
<cfargument name="fm_emailAddress" type="any" default="ftitle"> 
<cfargument name="fm_domainField" type="any" default="@firsttitleservices.com" > 
<cfargument name="fm_accessLevel" type="any" default="1">				  
<cfargument name="fm_position" type="any" default="Dev">				  		
<cfargument name="fm_phone" type="any" default="812-212-9928" >		      
<cfargument name="fm_fax" type="any" default="320-298-3850">			 
<cfargument name="fm_report" type="any" default="1">					 
<cfargument name="fm_roleID" type="numeric" default="25">			 	     
<cfargument name="fm_roleManager" type="any" default="1">				
<cfargument name="fm_Status" type="any" default="1">				   
<cfargument name="fm_parentUserID" type="any" default="21">				 
<cfargument name="fm_StreamlineEmployee" type="any" default="1">			 
<cfargument name="fm_michiganEmployee" type="any" default="0">		      
<cfargument name="fm_michiganAdmin" type="any" default="0">				
<cfargument name="fm_closingEmails" type="any" default="0">			     
<cfargument name="fm_virginiaEmployee" type="any" default="0">		    
<cfargument name="fm_virginiaAdmin" type="any" default="0">				  
<cfargument name="fm_vendorAdmin" type="any" default="0">		    	
<cfargument name="fm_fairfaxAdmin" type="any" default="0">				  
<cfargument name="fm_processor" type="any" default="0">					 
<cfargument name="fm_virginiaEmployeeTemp" type="any" default="0">		  
<cfargument name="fm_virginiaAdminTemp" type="any" default="0">			  
<cfargument name="fm_fairfaxAdminTemp" type="any" default="0">
<cfargument name="fm_TXEmployee" type="any" default="0">
<cfargument name="fm_TXAdmin" type="any" default="0">
<cfargument name="fm_ftFairfaxEmployee" type="any" default="0">
<cfargument name="fm_ftFairfaxAdmin" type="any" default="0">
<cfargument name="fm_MIFlushingEmployee" type="any" default="0">
<cfargument name="fm_MIFlushingAdmin" type="any" default="0">

<!--- Concatenate email address variables before passing them into the database --->
<cfset emailAddress = '#arguments.fm_emailAddress#' + '#arguments.fm_domainField#' >

<!--- Hash password before storing it. --->


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
           ,[va_employee]
           ,[va_admin]
           ,[vendor_admin]
           ,[fairfax_admin]
           ,[Processor]
           ,[va_employee_temp]
           ,[va_admin_temp]
           ,[fairfax_admin_temp]
           ,[tx_employee]
           ,[tx_admin]
           ,[ft_fairfax_employee]
           ,[ft_fairfax_admin]
           ,[mi_flushing_employee]
           ,[mi_flushing_admin] )
        
     VALUES
           (<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.fm_Fname#" >
           ,<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.fm_Lname#" >
           ,<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.fm_userName#" >
           ,<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.fm_password#" >
		   ,<cfqueryparam cfsqltype="cf_sql_varchar" value="#password2#" >
           ,<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.fm_emailAddress#" >
           ,<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.fm_accessLevel#" >
           ,<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.fm_position#" >
           ,<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.fm_phone#" >
           ,<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.fm_fax#">
           ,<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.fm_report#" >
           ,<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.fm_roleID#" >
           ,<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.fm_roleManager#" >
           ,<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.fm_status#" >
           ,<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.fm_parentUserID#" >
           ,<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.fm_StreamlineEmployee#" >
           ,<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.fm_michiganEmployee#" >
           ,<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.fm_michiganAdmin#" >
           ,<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.fm_closingEmails#" >
           ,<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.fm_virginiaEmployee#" >
           ,<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.fm_virginiaAdmin#" >
           ,<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.fm_vendorAdmin#" >
           ,<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.fm_fairfaxAdmin#" >
           ,<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.fm_processor#" >
           ,<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.fm_virginiaEmployeeTemp#" >
           ,<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.fm_virginiaAdminTemp#" >
           ,<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.fm_fairfaxAdminTemp#" >
           ,<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.fm_TXEmployee#" >
           ,<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.fm_TXAdmin#" >
           ,<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.fm_ftFairfaxEmployee#" >
           ,<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.fm_ftFairfaxAdmin#" >
           ,<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.fm_MIFlushingEmployee#" >
           ,<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.fm_MIFlushingAdmin#" > )
          

</cfquery>
</cffunction>


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
           ,[va_employee]
           ,[va_admin]
           ,[vendor_admin]
           ,[fairfax_admin]
           ,[Processor]
           ,[va_employee_temp]
           ,[va_employee_bk]
           ,[va_admin_temp]
           ,[fairfax_admin_temp]
           ,[tx_employee]
           ,[tx_admin]
           ,[ft_fairfax_employee]
           ,[ft_fairfax_admin]
           ,[mi_flushing_employee]
           ,[mi_flushing_admin]
           ,[mo_employee]
           ,[mo_admin])
     VALUES
           (<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.fm_Fname#" >
           ,<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.fm_Lname#" >
           ,<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.fm_userName#" >
           ,<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.fm_password#" >
           ,<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.fm_emailAddress#" >
           ,<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.fm_accessLevel#" >
           <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.fm_position#" >
           ,<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.fm_phone#" >
           ,<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.fm_fax#">
           ,<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.fm_report#" >
           ,<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.fm_roleID#" >
           ,<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.fm_roleManager#" >
           ,<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.fm_status#" >
           ,<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.fm_parentUserID#" >
           ,<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.fm_StreamlineEmployee#" >
           ,<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.fm_michiganEmployee#" >
           ,<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.fm_michiganAdmin#" >
           ,<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.fm_closingEmails#" >
           ,<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.fm_virginiaEmployee#" >
           ,<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.fm_virginiaAdmin#" >
           ,<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.fm_vendorAdmin#" >
           ,<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.fm_fairfaxAdmin#" >
           ,<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.fm_processor#" >
           ,<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.fm_virginiaEmployeeTemp#" >
           ,<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.fm_virginiaAdminTemp#" >
           ,<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.fm_fairfaxAdminTemp#" >
           ,<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.fm_TXEmployee#" >
           ,<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.fm_TXAdmin#" >
           ,<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.fm_ftFairfaxEmployee#" >
           ,<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.fm_ftFairfaxAdmin#" >
           ,<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.fm_MIFlushingEmployee#" >
           ,<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.fm_MIFlushingAdmin#" >
          

</cfquery>
</cffunction>

<!--- Update the employee record --->
<cffunction name="updateEmployeeRecord" access="remote" returntype="any" hint="updates the employee record by passing new values into the fields">
                                                                                                              <!--- Form Field Values Passed In From Flex Values --->
<cfargument name="fm_Fname" type="any" default="First">														  <!---                                              --->
<cfargument name="fm_Lname" type="any" required="Title">													  <!---                                              --->
<cfargument name="fm_userName" type="any" default="FTitle">													  <!---                                              --->
<cfargument name="fm_password" type="any" default="123" >													  <!---                                              --->
<cfset password2 = "password123" >																			  <!---                                              --->
<cfargument name="fm_emailAddress" type="any" default="ftitle@test.com">									  <!---                                              --->
<cfargument name="fm_accessLevel" type="any" default="1">													  <!---                                              --->
<cfargument name="fm_position" type="any" default="Dev">													  <!---                                              --->		
<cfargument name="fm_phone" type="any" default="812-212-9928" >											      <!---                                              --->	
<cfargument name="fm_fax" type="any" default="320-298-3850">												  <!---                                              --->
<cfargument name="fm_report" type="any" default="1">														  <!---                                              --->
<cfargument name="fm_roleID" type="int" default="25">			 											  <!---                                              --->
<cfargument name="fm_roleManager" type="any" default="1">													  <!---                                              --->
<cfargument name="fm_Status" type="any" default="1">													      <!---                                              --->
<cfargument name="fm_parentUserID" type="any" default="21">													  <!---                                              --->
<cfargument name="fm_StrealineEmployee" type="any" default="1">												  <!---                                              --->
<cfargument name="fm_michiganEmployee" type="any" default="0">												  <!---                                              --->
<cfargument name="fm_michiganAdmin" type="any" default="0">													  <!---                                              --->
<cfargument name="fm_closingEmails" type="any" default="0">													  <!---                                              --->	
<cfargument name="fm_virginiaEmployee" type="any" default="0">											      <!---                                              --->	
<cfargument name="fm_virginiaAdmin" type="any" default="0">													  <!---                                              --->
<cfargument name="fm_vendorAdmin" type="any" default="0">													  <!---                                              --->
<cfargument name="fm_fairfaxAdmin" type="any" default="0">													  <!---                                              --->
<cfargument name="fm_processor" type="any" default="0">														  <!---                                              --->
<cfargument name="fm_virginiaEmployeeTemp" type="any" default="0">											  <!---                                              --->
<cfargument name="fm_virginiaAdminTemp" type="any" default="0">												  <!---                                              --->


<!--- Update Query to submit updated employee information --->
<cfquery name="qryUpdateEmployeeRecord" datasource="First_Title_Services_Dev">
UPDATE [First_Title_Services].[dbo].[First_Admin]
   SET [fname] = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.fm_Fname#" >
      ,[lname] = <cfqueryparam cfsqltype="cf_sql_varchar" value="lname" >
      ,[username] = <cfqueryparam cfsqltype="cf_sql_varchar" value="lname" ><username, varchar(30),>
      ,[password] = <cfqueryparam cfsqltype="cf_sql_varchar" value="lname" ><password, varchar(30),>
      ,[password2] = <cfqueryparam cfsqltype="cf_sql_varchar" value="lname" ><password2, varchar(30),>
      ,[email] = <cfqueryparam cfsqltype="cf_sql_varchar" value="lname" ><email, varchar(190),>
      ,[Lvl_access] = <cfqueryparam cfsqltype="cf_sql_varchar" value="lname" ><Lvl_access, int,>
      ,[a_date_created] = <cfqueryparam cfsqltype="cf_sql_varchar" value="lname" ><a_date_created, datetime,>
      ,[a_time_created] = <cfqueryparam cfsqltype="cf_sql_varchar" value="lname" ><a_time_created, varchar(25),>
      ,[a_created_by] = <a_created_by, varchar(100),>
      ,[a_date_modified] = <a_date_modified, varchar(25),>
      ,[a_time_modified] = <a_time_modified, varchar(25),>
      ,[a_modified_by] = <a_modified_by, varchar(100),>
      ,[position] = <position, varchar(50),>
      ,[phone] = <phone, varchar(50),>
      ,[fax] = <fax, varchar(50),>
      ,[report] = <report, int,>
      ,[role_id] = <role_id, int,>
      ,[role_mgr] = <role_mgr, int,>
      ,[status] = <status, bit,>
      ,[passdate] = <passdate, datetime,>
      ,[parent_user_id] = <parent_user_id, int,>
      ,[streamline_employee] = <streamline_employee, bit,>
      ,[mi_employee] = <mi_employee, bit,>
      ,[mi_admin] = <mi_admin, bit,>
      ,[closing_emails] = <closing_emails, bit,>
      ,[va_employee] = <va_employee, bit,>
      ,[va_admin] = <va_admin, bit,>
      ,[vendor_admin] = <vendor_admin, bit,>
      ,[fairfax_admin] = <fairfax_admin, bit,>
      ,[Processor] = <Processor, bit,>
      ,[va_employee_temp] = <va_employee_temp, bit,>
      ,[va_employee_bk] = <va_employee_bk, bit,>
      ,[va_admin_temp] = <va_admin_temp, bit,>
      ,[fairfax_admin_temp] = <fairfax_admin_temp, bit,>
      ,[tx_employee] = <tx_employee, bit,>
      ,[tx_admin] = <tx_admin, bit,>
      ,[ft_fairfax_employee] = <ft_fairfax_employee, bit,>
      ,[ft_fairfax_admin] = <ft_fairfax_admin, bit,>
      ,[mi_flushing_employee] = <mi_flushing_employee, bit,>
      ,[mi_flushing_admin] = <mi_flushing_admin, bit,>
      ,[mo_employee] = <mo_employee, bit,>
      ,[mo_admin] = <mo_admin, bit,>
      
 WHERE <Search Conditions,,>
</cfquery>
</cffunction>

</component>