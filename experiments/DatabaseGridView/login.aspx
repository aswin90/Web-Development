<%@ Page Language="C#" AutoEventWireup="true" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css" rel="stylesheet"/>
    <style>
        .top-buffer { margin-top:20px; }
    </style>
    <script runat="server">
            
        protected void submit_Click(object sender, EventArgs e)
        {
            var loggedInUsername = username.Text;
            Session["loggedInUsername"] = loggedInUsername;
            Response.Redirect("profile.aspx?username=" + loggedInUsername);
        }
               
    </script>
</head>
<body>
    <form id="form1" runat="server" >
    <div class="container top-buffer" >
         
        <asp:TextBox ID="username" runat="server" CssClass="form-control" placeholder="Username"/><br />
        <asp:Button OnClick="submit_Click" Text="Login" cssclass="btn btn-primary btn-block" ID="submit" runat="server" />

    </div>
    </form>
</body>
</html>
