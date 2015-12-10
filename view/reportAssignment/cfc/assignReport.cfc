<cfcomponent>
<!---Check Employee Assignment--->

<!--- Function To Get Reports List--->
<cffunction name="reportsList" returntype="any" access="remote">
 <!---Reports List DG Query--->
    <cfquery name="qryReportsList" datasource="First_Title_Main_Dev">
    SELECT rid, Report_Name, Category
    FROM Report_Master_List
    Order By Report_Name
    </cfquery>
    <cfreturn qryReportsList>
    </cffunction>
    
  <!--- Function To Get List of Employees--->
  <cffunction name="getEmployeeList" access="remote" >
    <cfquery name="qryGetEmployeeList" datasource="First_Title_Main_Dev">
    SELECT ID, fname + ' ' + lname AS employeeName 							
    FROM First_Admin
   WHERE (fname IS NOT NULL)
   AND (lname IS NOT NULL)
   Order By employeeName
    </cfquery>
  <cfreturn qryGetEmployeeList>
  </cffunction>
  <!---Lets Get The Employees Assigned to the Selected Report--->
  <cffunction name="getReportsAssignedToEmployees" access="remote" >
  <cfargument name="reportName" hint="passes report name from flex to CF" >
  <cfquery name="qryGetAssignedEmployees" datasource="First_Title_Main_Dev">
  SELECT employeeName, dateCreated
  FROM [First_Title_Services_Dev].[dbo].[AssignedReports]
  WHERE reportName = '#arguments.reportName#'
  </cfquery>
  <cfreturn qryGetAssignedEmployees >
  </cffunction>
  
  <!---Get the currently assigned Reports. This grabs a list of reports currently assigned and returns it to the UI for the data drill down--->
  <cffunction name="getReportsCurrentlyAssigned" access="remote">
  <cfquery name="qrygetReportsCurrentlyAssigned" datasource="First_Title_Main_Dev">
  SELECT DISTINCT reportName 
  FROM AssignedReports
  Order By reportName
  </cfquery>
  <cfreturn qryGetReportsCurrentlyAssigned >
  </cffunction>
  
   <!---Lets Get The Employees Assigned to the Selected Report (populates the assigned employee box in flex) --->
  <cffunction name="getAssignedEmployees2" access="remote" >
  <cfquery name="qryGetAssignedEmployees2" datasource="First_Title_Main_Dev">
  SELECT DISTINCT employeeID, employeeName
  FROM AssignedReports
  Order By employeeName
  </cfquery>
  <cfreturn qryGetAssignedEmployees2 >
  </cffunction>
  
   <!---Lets Get The Reports Assigned to the Selected employee (populates the assigned reports box in flex) --->
  <cffunction name="getAssignedReports" access="remote" >
  <cfargument name="employeeName">
  <cfquery name="qryGetAssignedReports" datasource="First_Title_Main_Dev">
	SELECT 
     reportName, reportID, dateCreated  
  	FROM [First_Title_Services_Dev].[dbo].[AssignedReports]
  	WHERE employeeName = '#arguments.employeeName#'
  </cfquery>
  <cfreturn qryGetAssignedReports >
  </cffunction>
  
  <!--- Lets delete the selected assignment by selected employee--->
  <cffunction name="deleteEmployeeAssignment" access="remote" >
   <cfargument name="employeeName" >
  <cfargument name="reportName" >
  <cfargument name="reportID" type="any" >
  <cfargument name="employeeID" type="any" >
  <cfquery name="qryDeleteEmployeeAssignment" datasource="First_Title_Main_Dev">
  DELETE FROM [First_Title_Services_Dev].[dbo].[AssignedReports]
      WHERE employeeName = '#arguments.employeeName#' and reportName='#reportName#'
  </cfquery>
  
  <cfquery name="qryDeleteReport_Access" datasource="First_Title_Main_Admin">
  DELETE FROM [First_Title_Services].[dbo].[Report_Access]
  WHERE Report_Id = '#arguments.reportID#' and User_Id = '#arguments.employeeID#'
  </cfquery>
  </cffunction>
 
    <!---Employee DataGrid Query--->
 	<cffunction name="getAssignmentByEmployee" access="remote" returntype="any">
	<cfquery name="qEmployeeAssignments" datasource="First_Title_Main_Dev">									<!---Control Grid Query. Grabs all employees assigned to a report--->
    SELECT assignmentID, employeeID, employeeName, reportName, reportDescrip, dateCreated 					<!---Query criteria: first name, last name, reportName, reportDescrip --->
    FROM AssignedReports																					<!--- Table being referenced --->
	</cfquery>
    <cfreturn qEmployeeAssignments>
</cffunction>

	<!---Assign Employee to Report Method--->
	<cffunction name="assignReport" access="remote"  >														<!---Method assignReport runs to create emp/report assign--->
        <!--- <cfargument name="employeeID" type="numeric" default="11299">	--->							<!---employeeID variable--->
       <cfargument name="ID" type="any">
        <cfargument name="employeeName" type="any" default="Michael">										<!---first name variable: fName--->
        <cfargument name="Report_Name" type="any" default="Sample Report">									<!---report name variable: reportName --->
        <cfargument name="Report_Id" type="any" >
       <cfset access_level = '1' >
        <cftransaction> 																					
        <!---Check For Existing Assignment--->
       <!--- <cfquery name="qryReportAlreadyAssigned" datasource="First_Title_Main_Dev" dbname="First_Title_Services_Dev">			<!---This query checks for prior employee assignment--->
        SELECT *
  		FROM [First_Title_Services_Dev].[dbo].[AssignedReports]																		<!---Checks based on this assignedReport and employeeID--->
  		WHERE assignedReport = '2' AND employeeID = '11299'
        </cfquery> 
        <!---If record count is zero, run insert query to assign employee to report--->
        <cfif qryAlreadyAssigned.recordCount eq 0>																					<!---If the check of a record count is 0, insert initiated--->
        <!---Assignment Query--->
       --->
        <cfquery name="qryAssignReport" datasource="First_Title_Services_Dev" dbname="First_Title_Services_Dev">
         INSERT INTO AssignedReports (employeeID, employeeName, reportName, reportID, accessLevel)
   		
         VALUES ( <cfqueryparam cfsqltype="cf_sql_int" value="#arguments.ID#">,
    			<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.employeeName#">,
         	    <cfqueryparam cfsqltype="cf_sql_varchar" value="#Report_Name#">,
                <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.rid#">,
                <cfqueryparam cfsqltype="cf_sql_integer" value="#access_level#"> )
        </cfquery>
       
       <!--- Add the assignment to the Report_Access table also ---> 
        <cfquery name="qrySetReportAccess" datasource="First_Title_Services_Dev" >
        INSERT INTO Report_Access (Report_Id, User_Id)
        Values (  <cfqueryparam cfsqltype="cf_sql_int" value="#arguments.rid#">,
                  <cfqueryparam cfsqltype="cf_sql_int" value="#arguments.ID#"> )
        </cfquery>
    </cftransaction>
	</cffunction>
    
    <!---Add New Report To the DB --->
    <cffunction name="addNewReport" access="remote" returntype="any">
    <cfargument name="fmReportName" type="any" required="yes">
    <cfargument name="fmReportCategory" type="any" required="yes">
    <cfargument name="fmReportDescrip" type="any" required="yes">
    <cfquery name="qryAddNewReport" datasource="First_Title_Services_Dev">
    INSERT INTO [First_Title_Services_Dev].[dbo].[Report_Master_List]
           ([Report_Name]
           ,[Category]
           ,[Report_Desc] )
     VALUES
           (<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.fmReportName#">,
           <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.fmReportCategory#">,
           <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.fmReportDescrip#">)
    </cfquery>
    </cffunction>
    
</cfcomponent>