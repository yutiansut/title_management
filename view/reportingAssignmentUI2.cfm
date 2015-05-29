<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>First Title Reporting Assignments</title>
</head>

<body>

<html>
    <head>
    <title>First Title Reporting Assignment </title>

    </head>
    <body bgcolor="#CCCCCC" >
    
    <!--- Script Block for Client Side functionality--->
    
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script language="javascript">
	
	$(document).ready(function() {
        $("#createReport").click(function(f) {
			var getReportName = $("textarea#reportName").val();
			var getReportPath = $("input#reportPath").val();
			//var getReportDesc = $('textarea#reportDescrip').val();		<!---this line is having issues passing parameter through to CFC--->			
			
			$.ajax({
				type:"POST",
				url: "http://10.11.2.60/testFolder/bidirectionalreporting/codetest/components/coldfusionFunction.cfc?method=testFunc&returnformat=json",
				dataType: "JSON",
				data:{ 
						reportName: getReportName,
						reportPath: getReportPath,
						//reportDescrip: getReportDesc
						//categoryBox: getCategory
					
				},
				success: function(result){
					alert("You successfully added a new report to the system") } 
    });
		});
	});
	</script>
    
    <cfajaxproxy cfc="deleteFunc" jsclassname="Users">
    <script language="javascript">
	
	function deleteAssignment() {												<!---javascript delete function to remove selected employee from assigment--->
	var selectedRecord = employeePerspective.getSelections();					<!--- This variable 'selectedRecord' is set to the datagrid selected value --->
	var employeeName = selectedRecord[0].data.employeeName;						<!---This deleteRecord variable is set to  the datagrid selected value stored in variable selectedRecord--->
	if(confirm('Delete Employee: ' + selectedRecord[0].data.employeeName))		<!--- This generates a confirmation window. When confirmed variable deleteRecord passed to CFC delete function--->
	{
		objeUser.delUser(employeeName);											<!---This line passes deleteRecord variable into CFC method and executes delete method--->
	};
	}
	
	var objUser = new delUser();													<!--- This line sets a JS variable equal to a Coldfusion function located in coldfusionFunction.cfc file--->
	objUser.setErrorHandler(showError);											<!--- This line sets an error handling method --->
	objectUser.setCallbackHandler(handleResult);								<!--- This line sets callback method which will refresh the grid --->
	
	function handleResult(res) {												<!---This line sets the event handler which will refresh the grid upon execution of delete function --->
		Coldfusion.Grid.refresh('employeePerspective',false);
	}
	
	function showError() 														<!--- This is the error handling function. Called when the delete function is unsuccessful --->
	{
		alert("Your attempt to delete the selected record was unsuccessful. Try again or contact administrator");
	}
</script>
<style>
  body {
      
      margin: 50px auto 200 auto;
      font-family: Arial, Helvetica;
      font-size: small;
      background: #444;
	  width: 100%;
	  height: 100%;
  }

/* ------------------------------------------------- */

#tabs {
  overflow: hidden;
  width: 80%;
  height:auto;
  margin: 0;
  padding: 0;
  list-style: none;
}

#tabs li {
  float: left;
  margin: 0 .5em 0 0;
}

#tabs a {
  position: relative;
  background: #ddd;
  background-image: -webkit-gradient(linear, left top, left bottom, from(#fff), to(#ddd));
  background-image: -webkit-linear-gradient(top, #fff, #ddd);
  background-image: -moz-linear-gradient(top, #fff, #ddd);
  background-image: -ms-linear-gradient(top, #fff, #ddd);
  background-image: -o-linear-gradient(top, #fff, #ddd);
  background-image: linear-gradient(to bottom, #fff, #ddd);  
  padding: .7em 3.5em;
  float: left;
  text-decoration: none;
  color: #444;
  text-shadow: 0 1px 0 rgba(255,255,255,.8);
  -webkit-border-radius: 5px 0 0 0;
  -moz-border-radius: 5px 0 0 0;
  border-radius: 5px 0 0 0;
  -moz-box-shadow: 0 2px 2px rgba(0,0,0,.4);
  -webkit-box-shadow: 0 2px 2px rgba(0,0,0,.4);
  box-shadow: 0 2px 2px rgba(0,0,0,.4);
}

#tabs a:hover,
#tabs a:hover::after,
#tabs a:focus,
#tabs a:focus::after {
  background: #fff;
}

#tabs a:focus {
  outline: 0;
}

#tabs a::after {
  content:'';
  position:absolute;
  z-index: 1;
  top: 0;
  right: -.5em;  
  bottom: 0;
  width: 1em;
  background: #ddd;
  background-image: -webkit-gradient(linear, left top, left bottom, from(#fff), to(#ddd));
  background-image: -webkit-linear-gradient(top, #fff, #ddd);
  background-image: -moz-linear-gradient(top, #fff, #ddd);
  background-image: -ms-linear-gradient(top, #fff, #ddd);
  background-image: -o-linear-gradient(top, #fff, #ddd);
  background-image: linear-gradient(to bottom, #fff, #ddd);  
  -moz-box-shadow: 2px 2px 2px rgba(0,0,0,.4);
  -webkit-box-shadow: 2px 2px 2px rgba(0,0,0,.4);
  box-shadow: 2px 2px 2px rgba(0,0,0,.4);
  -webkit-transform: skew(10deg);
  -moz-transform: skew(10deg);
  -ms-transform: skew(10deg);
  -o-transform: skew(10deg);
  transform: skew(10deg);
  -webkit-border-radius: 0 5px 0 0;
  -moz-border-radius: 0 5px 0 0;
  border-radius: 0 5px 0 0;  
}

#tabs #current a {
  background: #fff;
  z-index: 3;
}

#tabs #current a::after {
  background: #fff;
  z-index: 3;
}

/* ------------------------------------------------- */

#content {
    background: #fff;
    padding: 2em;
    height: 220px;
    position: relative;
    z-index: 2;	
    -moz-border-radius: 0 5px 5px 5px;
    -webkit-border-radius: 0 5px 5px 5px;
    border-radius: 0 5px 5px 5px;
    -moz-box-shadow: 0 -2px 3px -2px rgba(0, 0, 0, .5);
    -webkit-box-shadow: 0 -2px 3px -2px rgba(0, 0, 0, .5);
    box-shadow: 0 -2px 3px -2px rgba(0, 0, 0, .5);
}

/* ------------------------------------------------- */

#about {
    color: #999;
}

#about a {
    color: #eee;
}

</style>

    <!---Shut off debugging--->
    <cfsetting showdebugoutput="no">
    <!---Invoke Components--->
    <cfinclude template="controller/reportController.cfc">
    <!---Employee List Query--->
    <cfquery name="getAvailableEmployees" datasource="First_Title_Main_Dev">     <!---This query selects employee names from the First_Admin table then concatenates the names.--->
    SELECT ID, fname + ' ' + lname AS employeeName 								 <!---SELECT Statement then concatenate the first and last name, aliased as column Full_Name--->
    FROM First_Admin
    WHERE ID NOT IN (SELECT employeeID FROM AssignedReports)														 <!---Table referenced is First_Admin--->
    ORDER BY employeeName
    </cfquery>
    
    <!---Employee Assigned Query--->
    <cfquery name="getAssignedEmployees" datasource="First_Title_Main_Dev">  <!---This query selects the assigned employees from the AssignedReports table--->
 	SELECT employeeName								 <!---SELECT Statement then concatenate the first and last name, aliased as column Full_Name--->
    FROM AssignedReports												  	 <!---Table referenced is AssignedReports--->
    ORDER BY employeeName
    </cfquery>
    
    <!---Report Name Retrieval Query--->
     <cfquery name="getReports" datasource="First_Title_Main_Dev"> 			 <!---This query selects the assigned employees from the AssignedReports table--->
 	SELECT rid, Report_Name											 <!---SELECT Statement then concatenate the first and last name, aliased as column Full_Name--->
    FROM Report_Master_List													  	 <!---Table referenced is AssignedReports--->
    </cfquery>
    <!---Reports List DG Query--->
    <cfquery name="qryReportsList" datasource="First_Title_Main_Dev">
    SELECT Report_Name, URL, Report_Desc, Category
    FROM Report_Master_List
    </cfquery>
         <!---Application Control Pane--->
  <div id="right_div" style="position:fixed; width: 100%; background-color:#CCC; float:none;">
  
            <!---Application Control Pane Query--->
<cfquery name="qEmployeeAssignments" datasource="First_Title_Main_Dev">		<!---Control Grid Query. Grabs all employees assigned to a report--->
    SELECT assignmentID, employeeName, reportName, reportDescrip      		<!---Query criteria: first name, last name, reportName, reportDescrip --->
    FROM AssignedReports													<!--- Table being referenced --->
</cfquery>

     <!---This begins the visual component layout--->
     <div id="entire-page-div" style="position: relative; overflow: hidden; width:95%; margin-left:20px">
     <div id="left_module" style="position: relative; width: 30%; background-color:#CCC; float:left; margin-right:10px" >
     <br/>	
     <!---Available Employees--->											                   <!---This is the available employees list. Returns employees not assigned to a report--->
   <p>Available Employees</p>
    <cfform name="assignedEmployees" action="getReport.cfm" width="100%" height="240" format="html" >  <!---Form Initialization--->
   	 <cfgrid name="availableEmpGrid" query="getAvailableEmployees" width="200" format="html" bgcolor="##FFFF99" height="200">
     <cfgridcolumn name="employeeName" header="Employee Name" bgcolor="##8FB2B2" headerfont="Times New Roman, Times, serif" fontsize="12">
     </cfgrid>
     <br />
     </cfform>
     </div>
     	   <!---     ---->
           <!---     ---->
           <!---     ---->
            
     <div id="center_div" style="position: relative; width: 30%; background-color:#CCC; float:left; margin-left:20px">
     <!---Assigned Employees Module---> 
     <br/>
     <p>Assigned Employees</p>
     <cfform name="assignedEmployees" action="getReport.cfm" width="100%" height="240">   		<!---Assigned Employee Form Initialization--->
   	 <cfgrid name="assignedGrid" query="getAssignedEmployees" width="200" height="200" format="html" bgcolor="##FFFF99">
     <cfgridcolumn name="employeeName" header="Assigned Employees" bgcolor="##8FB2B2" headerfont="Times New Roman, Times, serif" fontsize="12" headerbold="yes" select="yes">
     </cfgrid>
    </cfform>														                 																								
     </div>
            
          <!---     ---->
          <!---     ---->
          <!---     ---->
          
     <div id="right_div" style="position: relative; width: 30%; background-color:#CCC; float: left; margin-left:30px">
     <!---Report List Module --->											
      <br/>
     <p>Available Reports</p>
     <cfform action="getReport.cfm" name="assignedEmployees" height="240" width="100%">	<!---Report List Form Initialization--->
     <cfgrid name="reportListGrid" query="getReports" width="200" height="200" format="html" bgcolor="##FFFF99">
     <cfgridcolumn name="Report_Name" header="Reports List" bgcolor="##8FB2B2" headerfont="Times New Roman, Times, serif" fontsize="12" headerbold="yes" select="yes">
     </cfgrid>
      <cfinput type="button" name="AssignEmp" label="Assign Employee" value="Manage Reports" onClick="ColdFusion.Window.hide('createAssignmentwin')">
   	 </cfform>
     </div>            
     </div>
     <br/>
 <div>    
     <ul id="tabs">
    <li><a href="#" name="tab1">Employee Perspective</a></li>
    <li><a href="#" name="tab2">Report Perspective</a></li>
    <li><a href="#" name="tab3">Report Creation</a></li>
    <li><a href="#" name="tab4">Update Employee Roster</a></li>  
    <li><a href="#" name="tab5">Misc.</a></li>    
    </ul>
</div>
<div id="content"> 
    <div id="tab1" style="height: 50%;"> 
    
  <cfif IsDefined("form.gridRefreshDatabtn") is True>
   <cfgridupdate grid="employeeAssignedGrid" datasource="First_Title_Main_Dev" tablename="AssignedReports">
  <cfgridupdate grid="reportListGrid" datasource="First_Title_Main_Dev" tablename="AssignedReports">
  <cfgridupdate grid="assignedGrid" datasource="First_Title_Main_Dev" tablename="Report_Name">
  <cfgridupdate grid="availableEmpGrid" datasource="First_Title_Main_Dev" tablename="First_Admin">
  </cfif>
  
        <cfform height="200">
        <cfgrid name="employeeAssignedGrid" format="html" striperows="yes" query="qEmployeeAssignments" height="200" selectmode="EDIT" insertbutton="Insert Assignment" 
        deletebutton="Delete Assignment" font="Tahoma, Geneva, sans-serif" colheaderbold="yes" width="950" insert="yes" delete="yes" >
        <cfgridcolumn name="assignmentID" header="Assignment ID" headerbold="yes" width="125" dataalign="center" headeralign="center">
        <cfgridcolumn name="employeeName"  header="Employee Name" headerbold="yes" width="350" dataalign="center" headeralign="center">
        <cfgridcolumn name="reportName" header="Report Name" headerbold="yes" width="300" dataalign="center"  headeralign="center">
     	</cfgrid>
        <br />
        <cfinput type="submit" name="gridRefreshDatabtn" value="Refresh">
        </cfform> </div>
    <div id="tab2" style="height: 60%;">
   <!--- <table bgcolor="CadetBlue" cellpadding="0" cellspacing="0">  
 <tr bgcolor="DarkCyan">  
     <td><b>Report Name</b></td>  
     <td><b>Employee Name</b></td>  
     <td><b>Report Description</b></td>    
    </tr>  
 <cfoutput query="qEmployeeAssignments">  
        <tr>  
            <td>#reportName#</td>  
            <td>#employeeName#</td>  
            <td>#reportDescrip#</td>  
        </tr>  
    </cfoutput>  
</table>--->  
	
        <cfform height="200">
        <cfgrid name="reportPerspective" format="html" striperows="yes" selectmode="edit" insertbutton="Add Report Assignment" deletebutton="Delete Report Assignment"
         query="qEmployeeAssignments" height="200" width="950" delete="yes">
        <cfgridcolumn name="reportName" header="Report Name" headeralign="center" headerbold="yes" dataalign="center" width="200"/>
        <cfgridcolumn name="employeeName"  header="Employee Name" width="200" headeralign="center" dataalign="center" headerbold="yes" />
        <cfgridcolumn name="reportDescrip" header="Report Description"  width="300" headeralign="center" headerbold="yes" dataalign="center" />
        </cfgrid>
         <cfinput type="button" name="AssignEmp" label="Assign Employee" value="Assign Employee">
   	 	 <cfinput type="button" name="editEmp" label="Delete Assignment" value="Delete Assignment">
        </cfform>
 
	</div>
    
    <div id="tab3">
     <cfif IsDefined("form.gridRefreshReportUpdateListbtn") is True>
   <cfgridupdate grid="reportListUpdateGrid" datasource="First_Title_Main_Dev" tablename="Report_Master_List">
  </cfif>
    <cfform height="200">
		<cfgrid name="reportListUpdateGrid" format="html" striperows="yes" query="qryReportsList" height="200" selectmode="EDIT" insert="yes" delete="yes" insertbutton="Insert Assignment" 
        deletebutton="Delete Assignment" font="Tahoma, Geneva, sans-serif" colheaderbold="yes" width="1250" >
        <cfgridcolumn name="Report_Name" header="Report Name" headerbold="yes" headeralign="center" width="225" dataalign="center" >
        <cfgridcolumn name="Report_Desc"  header="Report Description" headerbold="yes" headeralign="center" width="300" dataalign="center">
        <cfgridcolumn name="Category" header="Category" headerbold="yes"  headeralign="center" width="300" dataalign="center">
        <cfgridcolumn name="URL" header="Report Path" headerbold="yes" headeralign="center" width="300" dataalign="center">
        </cfgrid>
        <br />
        <cfinput type="submit" name="gridRefreshReportUpdateListbtn" value="Refresh">
        </cfform>
    
<!---     <form name="addReportForm" enctype="multipart/form-data" id="addReportForm">												<!--- Form Initialization --->
     <p> Report Name </p>
       <input type="Text" name="reportName"  id="reportName" size="20" width="200"	 />
	   <br />
     <br />
     
     <p> Report Path </p>	
     <input type="Text" name="reportPath" size="20" maxlength="35" label="Report Path"     									<!--- Report Path Field ---> 
     value="Report Path" required="yes" id="reportPath" width="200"> 
       <br />
     <br />
     
     <p>Report Description</p>
     <textarea name="reportDescip" required="required" width="400" height="400" label="Test Text Area" value="reportDescrip" id="reportDescrip"></textarea>
      <br />
     <br />
    
	 <!--- Report Category Dropdown box --->   
     <p> Category </p>
     <select name="categoryBox" label="Category" id="categoryBox" message="Select Category" 						        <!--- DB populated drop down box for reports. Required field. ---> 
     width="250" required="yes" tooltip="Select Category">  												  				<!--- Values are static for testing. CFSELECT to be populated by query--->
     <option value="Admin Tools">Admin Tools </option>							                                      
     <option value="Reports">Reports</option>
     <option value="Vendor Tools">Vendor Tools </option>
     <option value="Company Links">Company Links</option>
     <option value="Operations"> Operations</option>
	 </select>         
     <!--- <textarea name="reportDescrip" maxlength="200" label="Report Description"
     value=" Enter Report Description" required="yes" id="reportDescrip" width="600" height="250">
     </textarea>--->
     <br />
     <br />
     <input type="button" name="createReport" label="Add New Report" value="Add New Report" id="createReport" />
     </form>--->
     
    
    </div>
    <div id="tab4"> 
     <cfform height="200">
        <cfgrid name="employeeUpdateGrid" format="html" striperows="yes" query="qEmployeeAssignments" height="200" selectmode="EDIT" insertbutton="Insert Assignment" 
        deletebutton="Delete Assignment" font="Tahoma, Geneva, sans-serif" colheaderbold="yes" width="950" >
        <cfgridcolumn name="assignmentID" header="Employee Name" headerbold="yes" width="125" dataalign="center" headeralign="center">
        <cfgridcolumn name="employeeName"  header="Employee Name" headerbold="yes" width="350" dataalign="center" headeralign="center">
        <cfgridcolumn name="reportName" header="Report Name" headerbold="yes" width="300" dataalign="center"  headeralign="center">
     	</cfgrid>
        <br />
        <cfinput type="submit" name="button" value="Refresh">
        </cfform>
</div>
<div id="tab5">
<p>Content Goes Here</p>

    <!---    <cfform height="200">
        <cfgrid name="reportListGrid" format="html" striperows="yes" query="qryReportsList" height="200" selectmode="EDIT" insertbutton="Insert Assignment" 
        deletebutton="Delete Assignment" font="Tahoma, Geneva, sans-serif" colheaderbold="yes" width="950" insert="yes" delete="yes" >
        <cfgridcolumn name="reportName" header="Report Name" headerbold="yes" width="125" dataalign="center" headeralign="center">
        <cfgridcolumn name="reportDescription"  header="Report Description" headerbold="yes" width="350" dataalign="center" headeralign="center">
        <cfgridcolumn name="Category" header="Category" headerbold="yes" width="300" dataalign="center"  headeralign="center">
        <cfgridcolumn name="reportPath" header="Report Path" headerbold="yes" width="300" dataalign="center"  headeralign="center">
     	</cfgrid>
        <br />
        <cfinput type="submit" name="button" value="Refresh">
        </cfform>--->
</div>
</div>
</div>

<script src="http://code.jquery.com/jquery-1.7.2.min.js"></script>
<script>
$(document).ready(function() {
    $("#content").find("[id^='tab']").hide(); // Hide all content
    $("#tabs li:first").attr("id","current"); // Activate the first tab
    $("#content #tab1").fadeIn(); // Show first tab's content
    
    $('#tabs a').click(function(e) {
        e.preventDefault();
        if ($(this).closest("li").attr("id") == "current"){ //detection for current tab
         return;       
        }
        else{             
          $("#content").find("[id^='tab']").hide(); // Hide all content
          $("#tabs li").attr("id",""); //Reset id's
          $(this).parent().attr("id","current"); // Activate this
          $('#' + $(this).attr('name')).fadeIn(); // Show content for the current tab
        }
    });
});
</script>

</body>
</html>
