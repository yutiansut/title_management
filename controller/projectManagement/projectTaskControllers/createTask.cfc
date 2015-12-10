<cfcomponent>
	<!--- This is the task creation component. 7/28/2015--->
    <!--- This component is responsible for handling requests --->
    <!--- To create new tasks and assigninig those tasks to employees--->
    <!--- Component will take in the following values:                   
	        //Task Name.                                                     	
	       //Start Date.                                                     
	      //EndDate.                                                         
	     //relatedProject.                                                   				
	    //Category.                                                          
	   //Assigned Employee.
	  // Urgency flag.
	 //Task Description.                                              --->
    
    <!--- This function creates the new task--->
    <cffunction name="createNewTask" access="remote" returntype="string">								<!--- Create New Task Function                   --->															
    <cfargument name="taskName" type="string" required="yes" hint="task name from form">				<!--- Task Name Variable. Value passed from flex --->
    <cfargument name="startDate" type="date" required="yes" hint="start date of task" >					<!--- Task start date variable.                  --->
    <cfargument name="endDate" type="date" required="yes" hint="end date of task" >						<!--- Task end date variable.                    --->
    <cfargument name="relatedProject" type="string" required="yes" >									<!--- Related Project Variable.                  --->
    <cfargument name="taskCategory"  type="string" required="yes" hint="category of the task">			<!--- Task category variable.                    --->
    <cfargument name="employeeName"  type="string" required="yes" hint="emmployee name from form" >		<!--- Employee name variable.                    --->				
    <cfargument name="markUrgent"    type="numeric" required="no" hint="sets urgency value." >	        <!--- Task urgency flag.                         --->
	<cfargument name="taskDescrip" type="string" required="yes" >                                       <!--- Task Description ---> 
    
    <!--- If the difference Start Date and End date is less than 5 days, automatically mark urgent --->
      <cfset taskTimeLength = #arguments.endDate# - #arguments.startDate# >								<!--- Set a time length variable = to date diff  --->
      <cfif variable.taskTimeLength LTE 5 >																<!--- If taskTimeLength <= 5, markUrgent =1      --->
      <cfset #arguments.markUrgent# = '1' >																<!--- Set markUrgent = 1                         --->
      <cfelse>							
      <cfset #arguments.markUrgent# = '0'>																<!--- Otherwise set markUrgent = 0               --->
      </cfif>
     
    <!--- Set New Task in the database with a query --->
    <cfquery name="qryCreateNewProjectTask" datasource="First_Title_Services_Dev">
    INSERT INTO Dev_tblProjectTasks (taskName, startDate, endDate, relatedProject taskCategory, employeeName, markUrgent )
    Values (
    			<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.taskName#" >
                ,<cfqueryparam cfsqltype="cf_sql_date"    value="#arguments.startDate#">
                ,<cfqueryparam cfsqltype="cf_sql_date"    value="#arguments.endDate#" >
                ,<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.relatedProject#" >
                ,<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.taskCategory#" >
                ,<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.assignedEmployee#" >
                ,<cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.markUrgent#" >
                ,<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.taskDescrip#" >         
            ) 
     </cfquery>
	 </cffunction>
     
   
</cfcomponent>