<cfcomponent>
	<!--- Function retrieves the data for the All Orders tab of the Order Management 
	section in the application. Returns a structure. Structure children are cap cased in
	actionscript when being invoked in the application View (e.g. orderStruct.orderDate is 
	 orderStruct.ORDERDATE) --->
    <cffunction name="getOrderData" access="public" returntype="string">
        <cfargument name="orderType" type="string" required="yes">
        <cfargument name="dateFrom" type="date" required="no">
        <cfargument name="dateTo" type="date" required="no">
        <cfargument name="orderStatus" type="string" required="no"> 
        <!--- If date from and date to are defined, use this query --->
		<cfif isDefined(dateFrom, dateTo) >
        <cfquery name="qryGetOrderData" datasource="First_Title_Main_Dev">
        SELECT Title_ID, Type, Order_date
        FROM Title
        WHERE (Type = <cfqueryparam cfsqltype="cf_sql_varchar" value="orderType">) and (Order_date BETWEEN (<cfqueryparam cfsqltype="cf_sql_date" value="dateFrom"> and <cfqueryparam cfsqltype=	
        "cf_sql_date" value="dateTo">))
        </cfquery>
        <!--- Create New Structure--->
		<cfset orderStruct={}>
        <cfset orderStruct.allOrders = #qryGetOrderData# >
		<cfreturn orderStruct>
        
        <!--- If date from and date to NULL, --->
        <cfelse>
        <cfquery name="qryGetOrderData" datasource="First_Title_Main_Dev" >
        SELECT Title_ID, Type, Order_Date, Status, Notes
        FROM  
        Title
        WHERE (Type = <cfqueryparam cfsqltype="cf_sql_varchar" value="orderType" >) and (status = <cfqueryparam cfsqltype="cf_sql_varchar" value="orderStatus" >)
        </cfquery>
        <cfset orderStruct={} >
        <cfset orderStruct.allOrders = #qryGetOrderData# >
        <cfreturn orderStruct >
        </cfif>    
	</cffunction>
    
    <!--- Order Status List --->
    <cffunction name="orderStatusItems" access="remote" >
    <cfquery name="qryOrderStatusItems" datasource="First_Title_Main_Dev">
    SELECT [s.ID],[Status]
  FROM [dbo].[orderStatusList]
 Order By Status Asc
 </cfquery>
 <cfset orderStatusStruct = {} >
 <cfset orderStatusStruct = #qryOrderStatusItems# >
 <cfreturn orderStatusStruct >
 </cffunction>
    
</cfcomponent>