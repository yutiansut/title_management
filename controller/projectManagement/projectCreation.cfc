<cfcomponent>
<!--- Coldfusion Project Management Component. --->
<!--- Component contains all of the CRUD methods --->
<!--- for creating a new project and setting initial values --->

<!---Project Creation Method --->
<cffunction name="createNewProject" access="remote" hint="creates New Project in the DB" output="no" >
<!--- Variables storing new project values ---> 
<cfargument name="fmAdmin" type="any" >
<cfargument name="fmProjectID" type="any" >
<cfargument name="fmProjectName" type="string" >
<cfargument name="fmProjectDescription" type="string">
<cfargument name="employeeName" type="string">
<cfargument name="fmProjectType" type="string">
<cfargument name="fmStartDate" type="date">
<cfargument name="fmEndDate"  type="date" >

<cfquery name="qryCreateNewProject" datasource="First_Title_Main_Dev" >													<!--- First Query creates a new project in the project table --->
NSERT INTO [First_Title_Services_Dev].[dbo].[Dev_ProjectManagement]														<!--- Project Tasks and employee assignments are set in the next query --->
           ([projectID]
           ,[projectName]
           ,[projectDescription]
           ,[projectType]
           ,[startDate]
           ,[endDate])
     VALUES
           (<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.fmProjectID" maxlength="20" >					<!--- All Variables are set in a query paramter to prevent sql injection--->
            ,<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.fmProjectName#" maxlength="50">					<!---                                                                   --->
            ,<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.projectDescription" maxlength="1500" >			<!---                                                                   --->
            ,<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.projectType" maxlength="50" >					<!---                                                                   --->
            ,<cfqueryparam cfsqltype="cf_sql_date" value="#arguments.startDate" >										<!---                                                                   --->
            ,<cfqueryparam cfsqltype="cf_sql_date" value="#arguments.endDate" > )										<!---                                                                   --->
</cfquery>																												<!---        End of first query. No value returned back to user         --->
</cffunction>
</cfcomponent>