<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>cgs demo</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.css" rel="stylesheet">
    <style type="text/css">
    #qr, .formcontainer{display:none;}
    </style>
    <link href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap-responsive.css" rel="stylesheet">
    <style type="text/css">body{padding-top: 10px;}</style>
  </head>
  <body>
    <div class="container">
      <!--h1>cgs demo page</h1-->

        <ul class="nav nav-pills">
          <li class="active"><a href="#text">Text</a></li>
          <li><a href="#url">URL</a></li>
          <li><a href="#mail">Mail</a></li>
          <li><a href="#wifi">WiFi</a></li>
          <li><a href="#sms">SMS</a></li>
          <li><a href="#phone">Phone</a></li>
          <li><a href="#geo">Geolocation</a></li>
          <li><a href="#contact">Contact</a></li>
        </ul>

        <hr>

        <div class="span5" id="forms">
            <div class="formcontainer" id="text">        
                <form action="#" id="TEXT" class="form">
                    <label>Size</label>
                    <select name="size">
                        <option value="64">64</option>
                        <option value="96">96</option>
                        <option value="128">128</option>
                        <option value="160">160</option>
                        <option value="192">192</option>
                        <option value="256">256</option>
                        <option value="512">512</option>
                    </select>
                    <label>Text</label>
                    <input type="text" placeHolder="Hello World!" name="content" />
                    <br><br><input type="submit" class="btn btn-primary btn-large" value="Create" />
                </form>        
            </div>
            <div class="formcontainer" id="url">                     
                <form action="#" id="URL" class="form">
                    <label>Size</label>
                    <select name="size">
                        <option value="64">64</option>
                        <option value="96">96</option>
                        <option value="128">128</option>
                        <option value="160">160</option>
                        <option value="192">192</option>
                        <option value="256">256</option>
                        <option value="512">512</option>
                    </select>
                    <label>URL</label>
                    <input type="text" placeHolder="www.google.de" name="url" />
                    <br><br><input type="submit" class="btn btn-primary btn-large" value="Create" />
                </form>        
            </div>
            <div class="formcontainer" id="mail">                      
                <form action="#" id="MAIL" class="form">
                    <label>Size</label>
                    <select name="size">
                        <option value="64">64</option>
                        <option value="96">96</option>
                        <option value="128">128</option>
                        <option value="160">160</option>
                        <option value="192">192</option>
                        <option value="256">256</option>
                        <option value="512">512</option>
                    </select>
                    <label>Email Address</label>
                    <input type="text" placeHolder="foo@example.com" name="address" />
                    <br><br><input type="submit" class="btn btn-primary btn-large" value="Create" />
                </form>            
            </div>
            <div class="formcontainer" id="wifi">                     
                <form action="#" id="WIFI" class="form">
                    <label>Size</label>
                    <select name="size">
                        <option value="64">64</option>
                        <option value="96">96</option>
                        <option value="128">128</option>
                        <option value="160">160</option>
                        <option value="192">192</option>
                        <option value="256">256</option>
                        <option value="512">512</option>
                    </select>
                    <label>SSID</label>
                    <input type="text" placeHolder="fritzbox" name="ssid" />
                    <label>Type</label>
                    <select name="wifitype" id="wifitype">
                        <option value="WPA">WPA</option>
                        <option value="WEP">WEP</option>
                        <option value="nopass">nopass</option>
                    </select>
                    <div id="wifipass">
                        <label>Password</label>
                        <input type="text" placeHolder="fritzbox" name="password" />
                    </div>
                    <br><br><input type="submit" class="btn btn-primary btn-large" value="Create" />
                </form>                
            </div>
            <div class="formcontainer" id="sms">                       
                <form action="#" id="SMS" class="form">
                    <label>Size</label>
                    <select name="size">
                        <option value="64">64</option>
                        <option value="96">96</option>
                        <option value="128">128</option>
                        <option value="160">160</option>
                        <option value="192">192</option>
                        <option value="256">256</option>
                        <option value="512">512</option>
                    </select>
                    <label>Number</label>
                    <input type="text" placeHolder="017012345678" name="number" />
                    <label>Message</label>
                    <input type="text" placeHolder="Hey there!" name="message" />
                    <br><br><input type="submit" class="btn btn-primary btn-large" value="Create" />
                </form>                
            </div>
            <div class="formcontainer" id="phone">                         
                <form action="#" id="PHONE" class="form">
                    <label>Size</label>
                    <select name="size">
                        <option value="64">64</option>
                        <option value="96">96</option>
                        <option value="128">128</option>
                        <option value="160">160</option>
                        <option value="192">192</option>
                        <option value="256">256</option>
                        <option value="512">512</option>
                    </select>
                    <label>Number</label>
                    <input type="text" placeHolder="017012345678" name="number" />
                    <br><br><input type="submit" class="btn btn-primary btn-large" value="Create" />
                </form>                
            </div>
            <div class="formcontainer" id="geo">   
                <form action="#" id="GEOLOCATION" class="form">
                    <label>Size</label>
                    <select name="size">
                        <option value="64">64</option>
                        <option value="96">96</option>
                        <option value="128">128</option>
                        <option value="160">160</option>
                        <option value="192">192</option>
                        <option value="256">256</option>
                        <option value="512">512</option>
                    </select>
                    <label>Latitude</label>
                    <input type="text" placeHolder="47.11" name="latitude" />
                    <label>Longitude</label>
                    <input type="text" placeHolder="10.533" name="longitude" />
                    <label>Query</label>
                    <input type="text" placeHolder="pizza" name="query" />
                    <br><br><input type="submit" class="btn btn-primary btn-large" value="Create" />
                </form>              
            </div>
            <div class="formcontainer" id="contact">      
                <form action="#" id="CONTACT" class="form">
                    <label>Size</label>
                    <select name="size">
                        <option value="64">64</option>
                        <option value="96">96</option>
                        <option value="128">128</option>
                        <option value="160">160</option>
                        <option value="192">192</option>
                        <option value="256">256</option>
                        <option value="512">512</option>
                    </select>
                    <label>Name</label>
                    <input type="text" placeHolder="Max Muster" name="name" />
                    <label>Company</label>
                    <input type="text" placeHolder="FooCompany Inc." name="company" />
                    <label>Title</label>
                    <input type="text" placeHolder="Dr." name="title" />
                    <label>Phone</label>
                    <input type="text" placeHolder="017012345678" name="phone" />
                    <label>Mail</label>
                    <input type="text" placeHolder="max@foo.com" name="mail" />
                    <label>Address</label>
                    <input type="text" placeHolder="Blahroad 5" name="address" />
                    <label>Address2</label>
                    <input type="text" placeHolder="12345 NoTown" name="address2" />
                    <label>Web</label>
                    <input type="text" placeHolder="http://www.foo.com" name="web" />
                    <label>Note</label>
                    <input type="text" placeHolder="Please do not call before 11:00 am" name="note" />
                    <br><br><input type="submit" class="btn btn-primary btn-large" value="Create" />
                </form>            
            </div>

            <!-- TODO: Input mit Size-->
        </div>

        <div class="span4 pull-left">
            <img src="" alt="qr" id="qr" /><br>
            <a href="" id="qrlink"></a>
        </div>
    </div>

    <script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
    <script type="text/javascript">

    var g_hash = location.hash;
    var g_url = '${pageContext.request.contextPath}/qr';

    function handleNewHash(){
        g_hash = location.hash;
        switchTo(g_hash);
    }
    function detectHashChange(){
        (g_hash != location.hash ? handleNewHash() : null);
    }

    function switchTo(name){
        $('.nav li').each(function(idx, el){
            $(el).removeClass("active");
        });

        $('.nav a[href="' + name + '"]').parent().addClass('active');
        $('.formcontainer').each(function(idx, el){
            $(el).fadeOut('fast');
        });
        $(name).delay(200).fadeIn('fast');
        $("#qr").fadeOut('fast');
        $("#qrlink").fadeOut('fast');
    }

    $(function(){
        window.setInterval(detectHashChange, 10);

        if(location.hash != 'text' && location.hash != ''){
            switchTo(location.hash);
        }
        else{
            $("#text").fadeIn('fast');
        }

        $('.form').each(function(idx, form){
            $(form).on('submit', function(evt){
                evt.preventDefault();

                var qr = g_url + "?type=" + $(form).attr("id");

                $($(form).serializeArray()).each(function(idx, el){
                    qr += ("&" + el.name + "=" + escape(el.value));
                });

                $("#qr").fadeOut('fast', function(){
                    //Complete
                    $("#qr").attr("src", qr).fadeIn('fast');
                    $("#qrlink").attr("href", qr).text(qr).fadeIn('fast');
                });                        
            });
        });

        //special for wifitype
        $("#wifitype").on("change", function(evt){
            if($("#wifitype").val() == 'nopass'){
                $("#wifipass").fadeOut("fast");
            }
            else{
                $("#wifipass").fadeIn("fast");
            }
        });
    });

    </script>
  </body>
</html>
