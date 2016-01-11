<cfcomponent>
	<!--- 12.22.2015 ---> 
    <!--- This controller receives the values of the document QC Checklist component --->
    <!--- Methods for save progress, save and submit (setters) as well as methods for 
	getting existing progress (getters) are contained below --->
	<cffunction name="saveDoc" access="remote" returntype="any">
   		<!--- Section one form elements --->
        <cfargument name="fm_FileNum" type="string" required="yes">
    	<cfargument name="fm_LoanNum" type="string" required="yes">
    	<cfargument name="fm_Insurer" type="string" required="yes">
    	<cfargument name="fm_Classification" type="string" required="yes">
   		<cfargument name="fm_ClosingDate" type="string" required="yes">
    	<cfargument name="fm_ClosingTime" type="string" required="yes">
    	<cfargument name="fm_PropAddr" type="string" required="yes">
		<cfargument name="fm_PropCity" type="string" required="yes">
		<cfargument name="fm_PropState" type="string" required="yes">
        <cfargument name="fm_PropZip" type="string" required="yes">
        <cfargument name="fm_PropCounty" type="string" required="yes">
        <cfargument name="fm_PolicyType" type="string" required="yes">
        <cfargument name="fm_CPL_ICL_State" type="string" required="yes">
        <cfargument name="fm_Endorsements" type="string" required="yes">
        <cfargument name="fm_EndorsementType" type="string" required="yes">
        <cfargument name="" type="string" required="yes">
     <!--- Sellers Information Section --->
     	<cfargument name="fm_CTC_Date" type="string" required="yes">
        <cfargument name="fm_EffectiveDate" type="string" required="yes">
        <cfargument name="fm_UpdateOrdered" type="string" required="yes">
        <cfargument name="fm_Sellers" type="string" required="yes">
        <cfargument name="fm_SellerAddress" type="string" required="yes">
        <cfargument name="fm_SellerPhone" type="string" required="yes">
        <cfargument name="fm_SellerEmail" type="string" required="yes">
        <cfargument name="fm_SellerIsTrust" type="string" required="yes">
        <cfargument name="fm_SellerisPOA" type="string" required="yes">
        <cfargument name="fm_SellerPOAName" type="string" required="yes">
        <cfargument name="fm_SellerListingAgent" type="string" required="yes">
        <cfargument name="fm_AgentWith" type="string" required="yes">
		<cfargument name="fm_AgentAddress" type="string" required="yes">
        <cfargument name="fm_AgentPhone" type="string" required="yes">
        <cfargument name="fm_AgentEmail" type="string" required="yes">
		<cfargument name="fm_AgentCommission" type="string" required="yes">
        <cfargument name="fm_AgentAdminFee" type="string" required="yes">
        <cfargument name="fm_SellerCredit" type="string" required="yes">
     <!--- Buyer Information --->
     <cfargument name="fm_Buyers" type="string" required="yes">
     <cfargument name="fm_BuyerAddress" type="string" required="yes">
     <cfargument name="fm_BuyerPhone" type="string" required="yes">
     <cfargument name="fm_BuyerEmail" type="string" required="yes">
     <cfargument name="fm_BuyerPropTrust" type="string" required="yes">   
	 <cfargument name="fm_BuyerIsPOA" type="string" required="yes">
     <cfargument name="fm_BuyerPOAName" type="string" required="no">	
     <cfargument name="fm_BuyerSellingAgent" type="string" required="yes">
     <cfargument name="fm_BuyerSellAgentComp" type="string" required="yes">
     <cfargument name="fm_BuyerSellingAgentAddr" type="string" required="yes">
     <cfargument name="fm_BuyerSellingAgentPhone" type="string" required="yes">
     <cfargument name="fm_BuyerSellingAgent" type="string" required="yes">	
     <cfargument name="fm_BuyerSellingAgentComp" type="string" required="yes">
     <cfargument name="fm_BuyerSellAgtAddress" type="string" required="yes">
     <cfargument name="fm_BuyerSellAgtPhone" type="string" required="yes">
     <cfargument name="fm_BuyerSellAgtEmail" type="string" required="yes">
     <cfargument name="fm_SellAgtCommission" type="string" required="yes">
     <cfargument name="fm_SellAgtFee" type="string" required="yes">
     <cfargument name="fm_SellAgtEMD" type="string" required="yes">
	<cfargument name="isHolding" type="string" required="yes">	
    
		
		<cfset myResult="foo">
		<cfreturn myResult>
	</cffunction>
</cfcomponent>