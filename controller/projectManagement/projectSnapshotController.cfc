<cfcomponent>
	<!--- Query all projects due within 60 days --->
	<cffunction name="netSixtySnapshot" access="remote" returntype="any">
		<cfquery name="qryFinishDate"datasource="First_Title_Main">
           SELECT [projID]
          ,[projName]
          ,[projManager]
          ,[projDepartment]
          ,[startDate]
          ,[finishDate]
          ,[projDescipt]
          ,[projShortDescrip]
          ,[status]
          ,[suspendedBy]
          ,[employeeID]
            FROM [dbo].[projects]
            where finishdate <= getdate()+60
        </cfquery>
        <!---  Set new structure --->
        <cfset projPanelStruct ={}>
        <!---  Populate structure with projects due in 60 days or less --->
        <cfset projPanelStruct.ltSixty = #qryFinishDate#>
        <!---  Return Net 60 search result --->
        <cfreturn projPanelStruct>
 	</cffunction>
    <!--- Query all projects due within 30 days --->
	<cffunction name="netThirtySnapshot" access="remote" returntype="any">
		<cfquery name="qryFinishDate"datasource="First_Title_Main">
           SELECT [projID]
          ,[projName]
          ,[projManager]
          ,[projDepartment]
          ,[startDate]
          ,[finishDate]
          ,[projDescipt]
          ,[projShortDescrip]
          ,[status]
          ,[suspendedBy]
          ,[employeeID]
            FROM [dbo].[projects]
            where finishdate <= getdate()+30
        </cfquery>
        <!---  Set new structure --->
        <cfset projPanelStruct ={}>
        <!---  Populate structure with projects due in 30 days or less --->
        <cfset projPanelStruct.ltThirty = #qryFinishDate#>
        <!---  Return Net 30 search result --->
        <cfreturn projPanelStruct>
 	</cffunction>
    <!--- Query all projects due within 7 days --->
	<cffunction name="netSevenSnapshot" access="remote" returntype="any">
		<cfquery name="qryFinishDate"datasource="First_Title_Main">
           SELECT [projID]
          ,[projName]
          ,[projManager]
          ,[projDepartment]
          ,[startDate]
          ,[finishDate]
          ,[projDescipt]
          ,[projShortDescrip]
          ,[status]
          ,[suspendedBy]
          ,[employeeID]
            FROM [dbo].[projects]
            where finishdate <= getdate()+7
        </cfquery>
        <!---  Set new structure --->
        <cfset projPanelStruct ={}>
        <!---  Populate structure with projects due in 7 days or less --->
        <cfset projPanelStruct.ltSeven = #qryFinishDate#>
        <!---  Return Net 7 search result --->
        <cfreturn projPanelStruct>
 	</cffunction>
    <!--- Query all projects past due --->
	<cffunction name="netPastDueSnapshot" access="remote" returntype="any">
		<cfquery name="qryFinishDate"datasource="First_Title_Main">
           SELECT [projID]
          ,[projName]
          ,[projManager]
          ,[projDepartment]
          ,[startDate]
          ,[finishDate]
          ,[projDescipt]
          ,[projShortDescrip]
          ,[status]
          ,[suspendedBy]
          ,[employeeID]
            FROM [dbo].[projects]
            where finishdate > getdate()
        </cfquery>
        <!---  Set new structure --->
        <cfset projPanelStruct ={}>
        <!---  Populate structure with projects past due --->
        <cfset projPanelStruct.gtPastDue = #qryFinishDate#>
        <!---  Return past due search result --->
        <cfreturn projPanelStruct>
    </cffunction>
</cfcomponent>
