<%@ page import="com.metafour.auth.saml.store.SAMLSessionManager" %>
<%@ page import="com.metafour.auth.saml.store.SAMLSessionInfo" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.security.Principal" %>
<html>
<body>
<h2>Private Resource</h2>
<%
  SAMLSessionInfo info =
       (SAMLSessionInfo)request.getSession().getAttribute(SAMLSessionManager.SAML_SESSION_INFO);
  out.println("User id = " + info.getNameId() + "<BR/>");
  out.println("<TABLE> <TR> <TH> Attribute name </TH> <TH> Attribulte value </TH></TR>");

  for (Map.Entry entry : info.getAttributes().entrySet()) {
    out.println("<TR><TD>" + entry.getKey() + "</TD><TD>" + entry.getValue() + "</TD></TR>");
  }
  out.println("</TABLE>");
  out.println("Valid to = " + info.getValidTo() + "<BR/>");
  
  Principal p = request.getUserPrincipal();
  out.println("Principal = " + p + "<BR/>");
%>

<a href="<%=request.getContextPath()%>/logout">Logout</a>
</body>
</html>