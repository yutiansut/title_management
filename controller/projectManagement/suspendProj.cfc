<cfcomponent>
<!--- Get the list of active projects currently in the system. --->
<cffunction name="getSuspendedProjects" access="remote" description="This method retrieves currently suspended projects" returntype="any">
<cfquery name="qryGetSuspendedProjects" datasource="First_Title_Main_Dev" >
SELECT projID
      ,projName      
FROM Projects 
WHERE projStatus = '1'
</cfquery>
<!--- Set initialize structure --->
<cfset suspStruct = {} />
<!--- Populate Struct --->
<cfset suspStruct = #qryGetSusependedProject# />
<!--- Return Struct to UI View --->
<cfreturn suspStruct >
</cffunction>

<!--- Suspend the selected project --->
<cffunction name="suspProject" access="remote" description="suspends the selected projects passed in the from the component." >
<cfquery name="qrySuspendProject" datasource="First_Title_Main" >
UPDATE [dbo].[projects]
   SET 
       [status] = "0"
      ,[suspendedBy] = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.employeeName#" >
      ,[employeeID] = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.employeeID#">
      
 WHERE projID = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.projID#" >
</cfquery>
<!--- Set response --->
<cfset suspendSuccess = "Project Successfully Suspended!" >
<cfreturn suspendSuccess >
</cffunction>

</cfcomponent>