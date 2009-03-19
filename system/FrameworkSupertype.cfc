<!-----------------------------------------------------------------------
		<cfreturn variables.controller/>
	</cffunction>
	<cffunction name="setcontroller" access="private" output="false" returntype="void" hint="Set controller">
		<cfargument name="controller" type="any" required="true" hint="coldbox.system.controller"/>
		<cfset variables.controller = arguments.controller/>
	</cffunction>
	<cffunction name="locateFilePath" output="false" access="private" returntype="string" hint="Locate the real path location of a file in a coldbox application. 3 checks: 1) inside of coldbox app, 2) expand the path, 3) Absolute location. If path not found, it returns an empty path">
		<cfargument name="pathToCheck" type="string"  required="true" hint="The path to check"/>
	</cffunction>
	</cffunction>