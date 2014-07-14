<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="RegistrationPage.Registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 123px;
        }
        .auto-style3 {
            width: 123px;
            text-align: right;
        }
        .auto-style4 {
            width: 194px;
        }
        #Reset1 {
            width: 73px;
        }
        .auto-style5 {
            text-align: center;
        }
        .auto-style6 {
            width: 123px;
            text-align: right;
            height: 26px;
        }
        .auto-style7 {
            width: 194px;
            height: 26px;
        }
        .auto-style8 {
            height: 26px;
        }
    </style>
</head>
<body>

    
    <script>
        window.fbAsyncInit = function () {
            FB.init({
                appId: '766245026773713',
                xfbml: true,
                version: 'v2.0'
            });



            // getting access tokens for login information
            FB.Event.subscribe('auth.authResponseChange', function (response)
            {
                if (response.status == 'connected') 
                {
                    // the user is logged in and has autheticated your app
                    // and response.authResponse supplies
                    // the suer's id a valid access token, a signed 
                    // request , and a time the access token,
                    // and signed request each expire
                    var uid = response.authResponse.userID;
                    var accessToken = response.authResponse.accessToken;

                    // todo : hand access token done
                    // sends the information to C# asp.net for parsing

                    var form = document.createElement("form");
                    form.setAttribute("method", 'post');
                    form.setAttribute("action", '/FacebookLogin.ashx');

                    var field = document.createElement("input");
                    field.setAttribute("type", "hidden");
                    field.setAttribute("name", 'accessToken');
                    field.setAttribute("value", accessToken);
                    form.appendChild(field);

                    document.body.appendChild(form);
                    form.submit();

                    // handling the access token

                }
                else if (response.status == 'not_authorized') 
                {
                    // the user is logged in to faccebook,
                    // but has not autheticated your app
                }
                else 
                {
                    // the user isn't loggged in to facebook 
                }
            }
            //getting access token for login information

            )};    
            
        

    (function (d, s, id) {
        var js, fjs = d.getElementsByTagName(s)[0];
        if (d.getElementById(id)) { return; }
        js = d.createElement(s); js.id = id;
        js.src = "//connect.facebook.net/en_US/sdk.js";
        fjs.parentNode.insertBefore(js, fjs);
    }(document, 'script', ' facebook-jssdk'));

        
    </script>

    <script>
        // This is called with the results from from FB.getLoginStatus().
        function statusChangeCallback(response) {
            console.log('statusChangeCallback');
            console.log(response);
            // The response object is returned with a status field that lets the
            // app know the current login status of the person.
            // Full docs on the response object can be found in the documentation
            // for FB.getLoginStatus().
            if (response.status === 'connected') {
                // Logged into your app and Facebook.
                testAPI();
            } else if (response.status === 'not_authorized') {
                // The person is logged into Facebook, but not your app.
                document.getElementById('status').innerHTML = 'Please log ' +
                  'into this app.';
            } else {
                // The person is not logged into Facebook, so we're not sure if
                // they are logged into this app or not.
                document.getElementById('status').innerHTML = 'Please log ' +
                  'into Facebook.';
            }
        }

        // This function is called when someone finishes with the Login
        // Button.  See the onlogin handler attached to it in the sample
        // code below.
        function checkLoginState() {
            FB.getLoginStatus(function (response) {
                statusChangeCallback(response);
            });
        }

        window.fbAsyncInit = function () {
            FB.init({
                appId: '766245026773713',
                status : true, // check login status 
                cookie: true,  // enable cookies to allow the server to access
                // the session
                xfbml: true,  // parse social plugins on this page
                version: 'v2.0' // use version 2.0
            });

            // Now that we've initialized the JavaScript SDK, we call
            // FB.getLoginStatus().  This function gets the state of the
            // the callback you provide.  They can be:
             
            // 1. Logged into your app ('connected')
            // 2. Logged into Facebook, but not your app ('not_authorized')
            // 3. Not logged into Facebook and can't tell if they are logged into
            //    your app or not.
            //
            // These three cases are handled in the callback function.

            FB.getLoginStatus(function (response) {
            // person visiting this page and can return one of three states to
                statusChangeCallback(response);
            });

        };

        // Load the SDK asynchronously
        (function (d, s, id) {
            var js, fjs = d.getElementsByTagName(s)[0];
            if (d.getElementById(id)) return;
            js = d.createElement(s); js.id = id;
            js.src = "//connect.facebook.net/en_US/sdk.js";
            fjs.parentNode.insertBefore(js, fjs);
        }(document, 'script', 'facebook-jssdk'));

        // Here we run a very simple test of the Graph API after login is
        // successful.  See statusChangeCallback() for when this call is made.
        function testAPI() {
            console.log('Welcome!  Fetching your information.... ');
            FB.api('/me', function (response) {
                console.log('Successful login for: ' + response.name);
                document.getElementById('status').innerHTML =
                  'Thanks for logging in, ' + response.name + '!';
            });
        }
    </script>
    <!--
      Below we include the Login Button social plugin. This button uses
      the JavaScript SDK to present a graphical Login button that triggers
      the FB.login() function when clicked.
    -->
    <!-- like and login buttons -->
    <fb:login-button scope="public_profile,email" onlogin="checkLoginState();">
    </fb:login-button>
   
        <div id="status">
        </div>

    <div class="fb-like"
         data-send="true"
         data-width="450"
         data-show-faces="true">
    </div>

    <!-- login and like buttons --> 

    <form id="form1" runat="server">

        <h1 class="auto-style5">Registration Page</h1>
        <table class="auto-style1">
            <tr>
                <td class="auto-style3">User Name:</td>
                <td class="auto-style4">
                    <asp:TextBox ID="TextBoxUN" runat="server" Width="180px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBoxUN" ErrorMessage="Username is required." ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">E-mail:</td>
                <td class="auto-style4">
                    <asp:TextBox ID="TextBoxEmail" runat="server" Width="180px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBoxEmail" ErrorMessage="Email is required." ForeColor="Red"></asp:RequiredFieldValidator>
                    <br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBoxEmail" ErrorMessage="Enter valid e-mail." ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Password:</td>
                <td class="auto-style4">
                    <asp:TextBox ID="TextBoxPass" runat="server" TextMode="Password" Width="180px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBoxPass" ErrorMessage="Password is required." ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Confirm Password:</td>
                <td class="auto-style4">
                    <asp:TextBox ID="TextBoxRPass" runat="server" TextMode="Password" Width="180px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBoxRPass" ErrorMessage="Confirm Password is Required." ForeColor="Red"></asp:RequiredFieldValidator>
                    <br />
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="TextBoxPass" ControlToValidate="TextBoxRPass" ErrorMessage="Passwords must match." ForeColor="Red"></asp:CompareValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style6">Country:</td>
                <td class="auto-style7">
                    <asp:DropDownList ID="DropDownListCountry" runat="server" Width="180px">
                        <asp:ListItem>Select Country </asp:ListItem>
                        <asp:ListItem>USA</asp:ListItem>
                        <asp:ListItem>UK</asp:ListItem>
                        <asp:ListItem>Germany</asp:ListItem>
                        <asp:ListItem>France</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="auto-style8">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="DropDownListCountry" ErrorMessage="Select a country namne" ForeColor="Red" InitialValue="Select Country"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style4">
                    <asp:Button ID="ButtonSubmit" runat="server" OnClick="ButtonSubmit_Click" Text="Submit" />
                    <input id="Reset1" type="reset" value="Reset" /></td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style4">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
    <div>
    
    </div>
    </form>
</body>
</html>
