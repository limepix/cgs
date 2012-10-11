<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
    <title>cgs docs</title>
</head>
<body>
	<h1>
	    cgs docs
	</h1>
	
	<hr>	
	<p>
       <h3>type: TEXT</h3>
       Parameter:
       <ul>
           <li>content (required)</li>
       </ul>
       
       Example:
       <pre>http://cgs.server.de/qr?type=TEXT&amp;content=foo</pre>
       <img src="${pageContext.request.contextPath}/qr?type=TEXT&amp;content=foo"/>
	</p>
    
    <hr>
	
	<p>
	   <h3>type: URL</h3>
	   Parameter:
	   <ul>
	       <li>url (required)</li>
	   </ul>
	   
	   Example:
       <pre>http://cgs.server.de/qr?type=URL&amp;url=www.google.com</pre>
       <img src="${pageContext.request.contextPath}/qr?type=URL&amp;url=www.google.com"/>
	</p>
	
	<hr>
	
	<p>
	   <h3>type: WIFI</h3>
	   Parameter:
	   <ul>
	       <li>ssid (required)</li>
	       <li>wifitype (required) (WPA/WEP/nopass)</li>
	       <li>password (optional)</li>
	   </ul>
       
       Example:
       <pre>http://cgs.server.de/qr?type=WIFI&amp;ssid=fritzbox&amp;wifitype=WPA&amp;password=123</pre>
       <img src="${pageContext.request.contextPath}/qr?type=WIFI&amp;ssid=fritzbox&amp;wifitype=WPA&amp;password=123"/>
	</p>
    
    <hr>
    
    <p>
       <h3>type: SMS</h3>
       Parameter:
       <ul>
           <li>number (required)</li>
           <li>message (optional)</li>
       </ul>
       
       Example:
       <pre>http://cgs.server.de/qr?type=SMS&amp;number=01701231235&amp;message=testmessagecontent</pre>
       <img src="${pageContext.request.contextPath}/qr?type=SMS&amp;number=01701231235&amp;message=testmessagecontent"/>
    </p>
    
    <hr>
    
    <p>
       <h3>type: PHONE</h3>
       Parameter:
       <ul>
           <li>number (required)</li>
       </ul>
       
       Example:
       <pre>http://cgs.server.de/qr?type=PHONE&amp;number=01701231235</pre>
       <img src="${pageContext.request.contextPath}/qr?type=PHONE&amp;number=01701231235"/>
    </p>
    
    <hr>
    
    <p>
       <h3>type: GEOLOCATION</h3>
       Parameter:
       <ul>
           <li>latitude (required)</li>
           <li>longitude (required)</li>
           <li>query (optional)</li>
       </ul>
       
       Example:
       <pre>http://cgs.server.de/qr?type=GEOLOCATION&amp;latitude=49.47253&amp;longitude=11.064111&amp;query=pizza</pre>
       <img src="${pageContext.request.contextPath}/qr?type=GEOLOCATION&amp;latitude=49.47253&amp;longitude=11.064111&amp;query=pizza"/>
    </p>
    
    <hr>
    
    <p>
       <h3>type: MAIL</h3>
       Parameter:
       <ul>
           <li>address (required)</li>
       </ul>
       
       Example:
       <pre>http://cgs.server.de/qr?type=MAIL&amp;address=mr.foo@bar.com</pre>
       <img src="${pageContext.request.contextPath}/qr?type=MAIL&amp;address=mr.foo@bar.com"/>
    </p>
    
    <hr>
    
    <p>
       <h3>type: CONTACT</h3>
       Parameter:
       <ul>
           <li>name (required)</li>
           <li>company (optional)</li>
           <li>title (optional)</li>
           <li>phone (optional)</li>
           <li>mail (optional)</li>
           <li>address (optional)</li>
           <li>address2 (optional)</li>
           <li>web (optional)</li>
           <li>note (optional)</li>
       </ul>
       
       Example:
       <pre>http://cgs.server.de/qr?type=CONTACT&amp;name=Max Mustermann&amp;title=IT Specialist&amp;company=Google Inc.&amp;phone=01701231235&amp;mail=max.mustermann@google.com&amp;address=1600 Amphitheatre Parkway&amp;address2=Mountain View, CA 94043&amp;web=http://www.google.com&amp;note=fakeaccount</pre>
       <img src="${pageContext.request.contextPath}/qr?type=CONTACT&amp;name=Max Mustermann&amp;title=IT Specialist&amp;company=Google Inc.&amp;phone=01701231235&amp;mail=max.mustermann@google.com&amp;address=1600 Amphitheatre Parkway&amp;address2=Mountain View, CA 94043&amp;web=http://www.google.com&amp;note=fakeaccount"/>
    </p>
    
    <hr>
    
    <h3>Optional Parameter for all types:</h3> 
    <pre>size</pre>
    Example:
    <pre>http://cgs.server.de/qr?type=TEXT&amp;content=foo&size=64</pre>
    <img src="${pageContext.request.contextPath}/qr?type=TEXT&amp;content=foo&size=64"/>
    <br>
    <i style="color:red;">cgs will automatically adjust (increase) the size, when there is too much information an the qr is not big enough</i>
</body>
</html>