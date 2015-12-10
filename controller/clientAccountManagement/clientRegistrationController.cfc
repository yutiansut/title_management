<cfcomponent>
<!--- 7/29/2015 New Client Registration Module --->
<!--- Module registers new clients into the tblFirstTitleClients --->
<!--- Only methods as they pertain to client registration belong in this file --->
<!--- Unique values/record constraint enforced --->

<!--- New Client Registration Function --->																					
	<cffunction name="myFunction" access="public" returntype="string">												<!--- This function takes in values from the form and enters them into DB --->
		<cfargument name="clientName" type="string" required="yes">													<!--- Name of Client Organization                                         --->
		<cfargument name="contactName"	type="string" required="yes" >												<!--- Contact Person @ Client Organization                                --->
        <cfargument name="clientEmail" type="string" required="yes" >												<!--- Contact person email address                                        --->
        <cfargument name="clientAddress" type="string" required="yes" >
        <cfargument name="clientCity" type="string" required="yes" >
        <cfargument name="clientState" type="string" required="yes">
        <cfargument name="clientZip" type="numeric" required="yes">
        <cfargument name="clientType" type="string" required="yes">
        <cfargument name="assignedSalesRep" type="string" required="yes">
        
	<cfquery name="qryRegisterClient" datasource="First_Title_Main_Dev">
    INSERT into [FIRST_Title_Services_Dev].[dbo].[Dev_FirstTitleClients]
    Values (
    
    			
    
    )	
    </cfquery>


		
		<cfreturn myResult>
	</cffunction>
</cfcomponent>