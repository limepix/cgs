<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %><%@ page session="false" %><!DOCTYPE html>
<html lang="en-us">
<head>
	<meta charset="utf-8">
    <title>cgs docs</title>
</head>
<body>
	<h1>
	    cgs docs
	</h1>
	
	<hr>	
	<div>
       <h3>type: TEXT</h3>
       Parameter:
       <ul>
           <li>content (required)</li>
       </ul>
       
       Example:
       <pre>http://cgs.server.de/qr?type=TEXT&amp;content=foo</pre>
       <img src="${pageContext.request.contextPath}/qr?type=TEXT&amp;content=foo"/>
	</div>
    
    <hr>
	
	<div>
	   <h3>type: URL</h3>
	   Parameter:
	   <ul>
	       <li>url (required)</li>
	   </ul>
	   
	   Example:
       <pre>http://cgs.server.de/qr?type=URL&amp;url=www.google.com</pre>
       <img src="${pageContext.request.contextPath}/qr?type=URL&amp;url=www.google.com"/>
	</div>
	
	<hr>
	
	<div>
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
	</div>
    
    <hr>
    
    <div>
       <h3>type: SMS</h3>
       Parameter:
       <ul>
           <li>number (required)</li>
           <li>message (optional)</li>
       </ul>
       
       Example:
       <pre>http://cgs.server.de/qr?type=SMS&amp;number=01701231235&amp;message=testmessagecontent</pre>
       <img src="${pageContext.request.contextPath}/qr?type=SMS&amp;number=01701231235&amp;message=testmessagecontent"/>
    </div>
    
    <hr>
    
    <div>
       <h3>type: PHONE</h3>
       Parameter:
       <ul>
           <li>number (required)</li>
       </ul>
       
       Example:
       <pre>http://cgs.server.de/qr?type=PHONE&amp;number=01701231235</pre>
       <img src="${pageContext.request.contextPath}/qr?type=PHONE&amp;number=01701231235"/>
    </div>
    
    <hr>
    
    <div>
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
    </div>
    
    <hr>
    
    <div>
       <h3>type: MAIL</h3>
       Parameter:
       <ul>
           <li>address (required)</li>
       </ul>
       
       Example:
       <pre>http://cgs.server.de/qr?type=MAIL&amp;address=mr.foo@bar.com</pre>
       <img src="${pageContext.request.contextPath}/qr?type=MAIL&amp;address=mr.foo@bar.com"/>
    </div>
    
    <hr>
    
    <div>
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
    </div>
    
    <hr>
    
	<div style="background:#eee;">
		<h3>Optional Parameter for all types:</h3> 
		<pre>size</pre>
		Example:
		<pre>http://cgs.server.de/qr?type=TEXT&amp;content=foo&amp;size=64</pre>
		<img src="${pageContext.request.contextPath}/qr?type=TEXT&amp;content=foo&amp;size=64"/>
		<br>
		<i style="color:red;">cgs will automatically adjust (increase) the size, when there is too much information and the qr image is not big enough</i>
	</div>
	<p style="position: fixed; bottom:0; right: 0; color:#ccc;"><small>Juergen Binder - 2013</small> - <a href="${pageContext.request.contextPath}/imprint">imprint</a></p>
<script type="text/javascript">
  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-44263555-2']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();
</script>
</body>
</html>
