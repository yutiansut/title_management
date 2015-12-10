<cfcomponent>
	 <!--- 7/29/2015 Task Toggle Controller --->
     <!--- This component controls the toggling of project task urgency --->
     <!--- Only methods pertaining to project task urgency should be included in this file --->
     
      <!---Toggle Urgency Flag By Task --->
     <cffunction name="setTaskUrgency" access="remote" returntype="void">													<!--- Function toggles the task urgency flag for assigned task --->
     <cfargument name="markUrgent" type="numeric" >																			<!--- variable markUrgent                                      --->
     <cfargument name="taskID" type="numeric">																				<!--- variable taskID                                          --->
     <cfargument name="employeeName" type="string" >																		<!--- variable employeeName                                    --->
     <cfquery name="qryToggleUrgencyFlag" datasource="First_Title_Services_Dev">
    UPDATE [First_Title_Services_Dev].[dbo].[Dev_tblProjectTasks]
    SET 
      [markUrgent] = '<cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.markUrgent#">'
    WHERE (taskID = '<cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.taskID#" >' ) and (employeeName = '<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.employeeName#">')
     </cfquery>
     </cffunction>
     
     <!--- Toggle Off Urgency of All Tasks of associated project --->
     <cffunction name="toggleOffAllProjectTasks" access="remote" description="Toggles urgency of all tasks in a project"
      returntype="any" >
     <cfargument name="projectID" type="numeric">																			<!--- Project ID Passed in to generate "Off" toggle status --->
     UPDATE [FIRST_Title_Services_Dev].[dbo].[Dev_tblProjectTasks]															<!--- Query marks all project tasks as non-urgent          --->
     SET 																												
      [markUrgent] = '0'									
      WHERE projectID = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.projectID#">
     </cffunction>
     
     <!--- Toggle On Urgency of All Tasks of associated project --->
     <cffunction name="toggleOnAllProjectTasks" access="remote" description="Toggles Off Urgency Of All Project Tasks" 
     returntype="any">
     <cfargument name="projectID" type="numeric">																			<!--- Project ID Passed in to generate "On" toggle status --->
      UPDATE [FIRST_Title_Services_Dev].[dbo].[Dev_tblProjectTasks]															<!--- Query marks all project tasks as urgent             --->
     SET 
      [markUrgent] = '1'
      WHERE projectID = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.projectID#">
     </cffunction>
     
     
</cfcomponent>