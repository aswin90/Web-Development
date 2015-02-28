<%@ Page Language="C#" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>  

    

    <script src="resources/login.js" runat="server"></script>

    <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" />

    <link rel="stylesheet" type="text/css" href="resources/login.css" />       

    <title>Login Page</title>
 
</head>

<body>

    <div class="container">

        <form class="form-signin" role="form" id="login_form" runat="server">

            <h2 class="form-signin-heading">Please sign in</h2>

            <asp:Label ID="errorMessage" runat="server" Text="Username and Password do not match" Visible="False"></asp:Label>

            <br />

            <asp:TextBox ID="txtUserName" runat="server" class="form-control" placeholder="Email address" autofocus="true" required="true"></asp:TextBox>

            <asp:TextBox ID="txtPassword" runat="server" class="form-control" placeholder="Password" TextMode="Password" autofocus="true" required="true"></asp:TextBox>
            
            <asp:Button ID="Button1" runat="server" class="btn btn-lg btn-primary btn-block" type="submit" text="Submit" onclick="Button1_Click" />

        </form>

        <br />

        <hr />

<p>
			Use the following credentials to login:</p>
		<p>
			<strong>username - guestlogin</strong></p>
		<p>
			<strong>password - password</strong></p>
		<p>
			&nbsp;</p>
		<p>
			In this experiment, I have created the ASPX login file which I will be using for my experiment.</p>
		<p>
			A Javascript file is included in the ASPX file and the runat=&quot;server&quot; is given as follows:</p>
		<p>
			<strong>&lt;script src=&quot;resources/login.js&quot; runat=&quot;server&quot;&gt;&lt;/script&gt;</strong></p>
		<p>
			&nbsp;</p>
		<p>
			Also, I have included the Bootstrap CSS CDN and a Stylesheet&nbsp;</p>
		<div>
			<strong>&nbsp;&lt;link href=&quot;//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css&quot; rel=&quot;stylesheet&quot; /&gt;</strong></div>
		<div>
			&nbsp;</div>
		<div>
			<strong>&nbsp;&lt;link rel=&quot;stylesheet&quot; type=&quot;text/css&quot; href=&quot;/web_resource/resources/login.css&quot; /&gt;&nbsp;</strong></div>
		<div>
			&nbsp;</div>
		<div>
			In a &lt;form&gt; element, I have the input fields for the username and the password with the respective placeholders.&nbsp;</div>
		<div>
			&nbsp;</div>
		<div>
			<div>
				<strong>&lt;asp:TextBox ID=&quot;txtUserName&quot; runat=&quot;server&quot; class=&quot;form-control&quot; placeholder=&quot;Email address&quot; autofocus=&quot;true&quot; required=&quot;true&quot;&gt;&lt;/asp:TextBox&gt;</strong></div>
			<div>
				&nbsp;</div>
			<div>
				<strong>&lt;asp:TextBox ID=&quot;txtPassword&quot; runat=&quot;server&quot; class=&quot;form-control&quot; placeholder=&quot;Password&quot; TextMode=&quot;Password&quot; autofocus=&quot;true&quot; required=&quot;true&quot;&gt;&lt;/asp:TextBox&gt;</strong></div>
			<div>
				&nbsp;</div>
			<div>
				On the click on submit button, the Button1_Click is called as below:</div>
			<div>
				&nbsp;</div>
			<div>
				<strong>&lt;asp:Button ID=&quot;Button1&quot; runat=&quot;server&quot; class=&quot;btn btn-lg btn-primary btn-block&quot; type=&quot;submit&quot; text=&quot;Submit&quot; onclick=&quot;Button1_Click&quot; /&gt;</strong></div>
			<div>
				&nbsp;</div>
			<div>
				In&nbsp;Button1_Click, if the username is guestlogin and the password is password, I have redirected to my Default.aspx home page.</div>
			<div>
				&nbsp;</div>
			<div>
				<a href="http://net4.ccs.neu.edu/home/aswin90/fileview/Default.aspx?~/experiments/ASPX/login.aspx" target="_blank" >Click here to view the source file</a></div>
			<div>
				&nbsp;</div>
			<div>
				<a href="http://net4.ccs.neu.edu/home/aswin90/fileview/Default.aspx?~/experiments/ASPX/resources/login.js" target="_blank" >Click here to view the JS</a></div>
			<div>
				&nbsp;</div>
			<div>
				<a href="http://net4.ccs.neu.edu/home/aswin90/fileview/Default.aspx?~/experiments/ASPX/resources/login.css" target="_blank" >Click here to view the CSS</a></div>
			<div>
				&nbsp;</div>
			<div>
				&nbsp;</div>
		</div>
		<p>
			&nbsp;</p>

    </div>

</body>
</html>