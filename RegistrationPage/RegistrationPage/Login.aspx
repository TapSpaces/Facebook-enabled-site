<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="RegistrationPage.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            text-align: center;
        }
        .auto-style2 {
            width: 100%;
        }
        .auto-style3 {
            font-weight: normal;
            font-size: large;
            width: 344px;
        }
        .auto-style4 {
            width: 344px;
        }
        .auto-style5 {
            width: 240px;
        }
        .auto-style6 {
            width: 344px;
            font-weight: normal;
        }
    </style>
</head>
<body style="font-weight: 700">
    <form id="form1" runat="server">
    <div class="auto-style1" style="font-size: xx-large">
    
        Login Page<br />
        <table class="auto-style2">
            <tr>
                <td class="auto-style3">Username</td>
                <td class="auto-style5">
                    <asp:TextBox ID="TextBoxUsername" runat="server" Width="180px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please enter Username" style="font-size: large" ControlToValidate="TextBoxUsername" Enabled="False" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style6" style="font-size: large">Password</td>
                <td class="auto-style5">
                    <asp:TextBox ID="TextBoxPassword" runat="server" TextMode="Password" Width="180px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please enter Password" style="font-size: large" ControlToValidate="TextBoxPassword" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">&nbsp;</td>
                <td class="auto-style5">
                    <asp:Button ID="Button_Login" runat="server" OnClick="Button_Login_Click" Text="Login" />
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style4">&nbsp;</td>
                <td class="auto-style5">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
