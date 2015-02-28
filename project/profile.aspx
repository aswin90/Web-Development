<%@ Page Language="C#" AutoEventWireup="true"%>
<%@ Import Namespace="System.Web.Script.Serialization" %>
<%@ Import Namespace="System.Web.Services" %>
<%@ Import Namespace="WebDevelopment.project" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" ng-app="">
<head runat="server">
    <title>Profile</title>
    <script src="javascript/angular.js"></script>
    <script src="javascript/jquery-1.11.1.js"></script>
    <link href="css/bootstrap.css" rel="stylesheet" />
    <link href="css/profile.css" rel="stylesheet" />
    
    <script runat="server">
    
        public string usernameText;
        public string password;
        public string firstName;
        public string lastName;
        public string emailText;

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                string username = Session["curruser"].ToString();
                UserTO user = new UserTO();
                UserDAO daoProfile = new UserDAO();

                user = daoProfile.getUserById(username);
                usernameText = user.userid;
                password = user.password;
                firstName = user.fname;
                lastName = user.lname;
                emailText = user.email;
                ValueHiddenField.Value = usernameText;
            }
            catch (Exception exp)
            {
                Response.Redirect("login.aspx");
            }       
        }
    
        [WebMethod]
        public static string ProfileView(string username)
        {
            comparisonDAO comparisonDataAO = new comparisonDAO();
            var compData = comparisonDataAO.getByUsername(username);
            var jSerializer = new JavaScriptSerializer();
            return jSerializer.Serialize(compData);
        }
        
        [WebMethod]
        public static string loadSavedStores(string username)
        {
            ProductDAO productDataAO = new ProductDAO();
            var prodData = productDataAO.getByUsername(username);
            var jSerializer = new JavaScriptSerializer();
            return jSerializer.Serialize(prodData);
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">

         <asp:HiddenField ID="ValueHiddenField" value="" runat="server"/>
                
    </form>

    <div class="container body-height">

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

                <nav class="navbar navbar-default" role="navigation">
                    <div class="container-fluid">
                      <div class="navbar-header">
                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                          <span class="sr-only">Toggle navigation</span>
                          <span class="icon-bar"></span>
                          <span class="icon-bar"></span>
                          <span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand" href="#">Price Compare</a>
                      </div>
                      <div id="navbar" class="navbar-collapse collapse">
                        <ul class="nav navbar-nav">
                          <li><a href="profile.aspx">Profile</a></li>
                          <li><a href="projectHome.aspx">Search</a></li>
                          <li><a href="documentation.html">Documentation</a></li>
                        </ul>
                        <ul class="nav navbar-nav navbar-right">                      
                          <li class="active"><a href="profile.aspx">Welcome, <% Response.Write(Session["curruser"]); %></a></li>
                          <li><a href="logout.aspx">Logout</a></li>
                        </ul>
                      </div>
                    </div>
                  </nav>

        <br />

        <div class="row">
            <div class="col-md-6">
                <h3>Profile</h3>
                <table class="table table-bordered">
                    <tr>
                        <th>Username</th>
                        <td><%= usernameText %></td>
                    </tr>
                    <tr>
                    <th>First Name</th>
                    <td><%= firstName %></td>
                    </tr>
                    <tr>
                        <th>Last Name</th>
                        <td><%= lastName %></td>
                    </tr>
                    <tr>
                        <th>Email</th>
                        <td><%= emailText %></td>
                    </tr>
                    <tr>
                        <th>Password</th>
                        <td><%= password %></td>
                    </tr>
                 </table>
            </div>
        </div>
        <div class="row" ng-controller="ProfileController">
            <div class="col-md-6" >
                
                <h3>Saved Comparisons</h3>
                <table class="table table-bordered">
                    <tr>
                        <th>Comparisons</th>
                    </tr>
                    <tr ng-repeat="item in items">
                        <td><a href="priceCompare.aspx?title={{item.comparisonTextValue}}" target="_blank">{{item.comparisonTextValue}}</a></td>
                    </tr>
                </table>

            </div>
            <div class="col-md-6">
                <h3>Saved Products</h3>
                <table class="table table-bordered">
                    <tr>
                        <th>Products</th>
                        <th>Store</th>
                    </tr>
                    <tr ng-repeat="product in products">
                        <td><a href="{{product.store}}.aspx?title={{product.comparisonTextValue}}" target="_blank">{{product.comparisonTextValue}}</a></td>
                        <td>{{product.store}}</td>
                    </tr>
                </table>
            </div>
        </div>
    </div>

    <div id="footer">
      <div class="container">
          <h6 class="text-center footer-text-left">&copy; Aswin Muthiah Murugapan, Northeastern University</h6>
          <h6 class="text-center footer-text-right">Site best viewed in Google Chrome, Mozilla Firefox</h6>
      </div>
    </div>
    
</body>
    <script src="javascript/profile.js" type="text/javascript"></script>
</html>