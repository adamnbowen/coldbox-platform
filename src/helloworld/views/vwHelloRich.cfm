<style type="text/css"><!--.style1 {color: #FFFFFF}--></style><table width="90%" border="0" align="center" cellpadding="5" cellspacing="1">  <tr>    <td bgcolor="#003366"><span class="style1">Your name will appear below: </span></td>  </tr>  <tr>    <td bgcolor="#f5f5f5"><strong>Hello:</strong> <cfoutput>#requestContext.getValue("firstname","No name Found")#</cfoutput> </td>  </tr></table>