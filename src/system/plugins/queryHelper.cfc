<!-----------------------------------------------------------------------
Copyright 2005 - 2006 ColdBox Framework by Luis Majano
www.coldboxframework.com | www.coldboxframework.org
-------------------------------------------------------------------------

Author 	    :	Luis Majano
Date        :	August 21, 2006
Description :
	This is a query helper plugin.

Modification History:
01/30/2007 - Created
----------------------------------------------------------------------->
<cfcomponent name="queryHelper" hint="A query helper plugin." extends="coldbox.system.plugin" cache="true"> 
	
	<cffunction name="init" access="public" returntype="coldbox.system.plugin" output="false">
		<cfargument name="controller" type="any" required="true">
		<cfset super.Init(arguments.controller) />
		<cfset setpluginName("Query Helper")>
		<cfset setpluginVersion("1.0")>
		<cfset setpluginDescription("This is a query helper plugin.")>
		<cfreturn this>
	</cffunction>
	
	<!--- ************************************************************* --->
	
	<cffunction name="filterQuery" access="public" returntype="query" hint="Filters a query by the given value" output="false">
		<!--- ************************************************************* --->
		<cfargument name="qry" 			type="query" 	required="yes" hint="Query to filter">
		<cfargument name="field" 		type="string" 	required="yes" hint="Field to filter on">
		<cfargument name="value" 		type="string" 	required="yes" hint="Value to filter on">
		<cfargument name="cfsqltype" 	type="string" 	required="no" default="cf_sql_varchar" hint="The cf sql type of the value.">
		<!--- ************************************************************* --->
		<cfset var qryNew = QueryNew("")>
		<cfquery name="qryNew" dbtype="query">
			SELECT *
				FROM arguments.qry
				WHERE #trim(arguments.field)# = <cfqueryparam cfsqltype="#trim(arguments.cfsqltype)#" value="#trim(arguments.value)#">
		</cfquery>
		<cfreturn qryNew>
	</cffunction>
	
	<!--- ************************************************************* --->
	
	<cffunction name="sortQuery" access="public" returntype="query" hint="Sorts a query by the given field" output="false">
		<!--- ************************************************************* --->
		<cfargument name="qry" 			type="query" 	required="yes" hint="Query to sort">
		<cfargument name="sortBy" 		type="string" 	required="yes" hint="Sort by column(s)">
		<cfargument name="sortOrder" 	type="string" 	required="no" default="ASC" hint="ASC/DESC">
		<!--- ************************************************************* --->
		<cfset var qryNew = QueryNew("")>
		<!--- Validate sortOrder --->
		<cfif not reFindnocase("(asc|desc)", arguments.sortOrder)>
			<cfthrow type="Framework.sharedLibrary.InvalidSortOrderException" message="The sortOrder you sent in: #arguments.sortOrder# is not valid. Valid sort orders are ASC|DESC">
		</cfif>
		<cfquery name="qryNew" dbtype="query">
			SELECT *
				FROM arguments.qry
				ORDER BY #trim(Arguments.SortBy)# #Arguments.SortOrder#
		</cfquery>
		<cfreturn qryNew>
	</cffunction>
	
	<!--- ************************************************************* --->

</cfcomponent>