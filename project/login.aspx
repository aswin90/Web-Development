<%@ Page Language="C#" AutoEventWireup="true"%>
<%@ Import Namespace="WebDevelopment.project" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <link href="css/bootstrap.css" rel="stylesheet" />
    <script type="text/javascript" src="javascript/jquery-1.11.1.js"></script>
    <script type="text/javascript" src="javascript/login.js"></script>
    <link href="css/login.css" rel="stylesheet" />
    <script runat="server">
        protected void submitButton_Click(object sender, EventArgs e)
        {

            string usernameValue = username.Text;
            string passwordValue = password.Text;

            if (!string.IsNullOrWhiteSpace(usernameValue) && !string.IsNullOrWhiteSpace(passwordValue))
            {
                verifyUserLogin(usernameValue, passwordValue);
            }
            else
            {

            }
        }

        private void verifyUserLogin(string usrnm, string pass)
        {
            UserTO curruser;
            UserDAO newuserdao = new UserDAO();

            curruser = newuserdao.getUserById(usrnm);
            if (curruser.status == "S" && pass == curruser.password)
            {
                Session["curruser"] = curruser.userid;
                Session.Timeout = 10080;
                Response.Redirect("projectHome.aspx");
            }
            else
            {
                msgbox.InnerText = "Username and password do not match";
            }
        }
    </script>
</head>
<body>
    
    <form id="form1" runat="server">
    
        <div class="container">

            <div class="header">
                <div class="row">
                    <div class="col-md-5 pull-left"> <img src="images/proj_logo.jpg" height="64px" width="250px"/> </div>
                    <div class="col-md-3"></div>
                    <div class="col-md-1 pull-right"> <a href="https://plus.google.com/u/0/101584820096948585279" target="_blank"><img src="images/gplus.png" /></a> </div>
                    <div class="col-md-1 pull-right"> <a href="https://twitter.com/pricecompare14" target="_blank"><img src="images/twitter.png" /></a> </div>
                    <div class="col-md-1 pull-right"> <a href="https://www.facebook.com/pages/Price-Compare/421135361367756" target="_blank"><img src="images/fb.png" /></a> </div> 
                </div>

            </div>

            <br />
            <br />
            <br />
            <br />
            <br />
            <br />

            <div class="row">
                <div class="col-md-6">
                    <div id="slideshow">
                        <div id="slideshowWindow">

                            <div class="slide">
                                <img src="images/amazon.jpg" class="image" />
                            </div>

                            <div class="slide">
                                <img src="images/walmart.jpg" class="image" />
                            </div>

                            <div class="slide">
                                <img src="images/ebay.jpeg" class="image" />
                            </div>

                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <table class="table borderless">
                        <tr>
                            <td>
                                <asp:TextBox ID="username" CssClass="form-control" placeholder="Username" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator id="RequiredFieldValidator1" runat="server"
                                  ControlToValidate="username"
                                  ErrorMessage="Username is a required field."
                                  ForeColor="Red">
                                </asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td><asp:TextBox ID="password" CssClass="form-control" placeholder="Password" TextMode="Password" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator id="RequiredFieldValidator2" runat="server"
                                  ControlToValidate="password"
                                  ErrorMessage="Password is a required field."
                                  ForeColor="Red">
                                </asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td><asp:Button ID="submitButton" Name="Submit" Text="Submit" runat="server" CssClass="btn btn-primary btn-block" OnClick="submitButton_Click" /></td>
                        </tr>
                        <tr>
                            <td><p runat="server" id="msgbox" class="msg-box"></p></td>
                        </tr>
                   </table>
                </div>
            </div>

            <h3>Hello, Welcome to Price Compare! Your one stop place to look up and compare an item across Amazon, eBay, and Walmart.</h3>
            
            
            
        </div>

        <div id="footer">
          <div class="container">
              <h6 class="text-center footer-text-left">&copy; Aswin Muthiah Murugapan, Northeastern University</h6>
              <h6 class="text-center footer-text-right">Site best viewed in Google Chrome, Mozilla Firefox</h6>
          </div>
        </div>
        
    </form>



</body>
</html>
