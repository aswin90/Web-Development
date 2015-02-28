<%@ Page Language="C#" AutoEventWireup="true"%>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Item Search</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="javascript/angular.js"></script>
    <script src="javascript/jquery-1.11.1.js"></script>
    <link href="css/bootstrap.css" rel="stylesheet" />
    <script type="text/javascript" src="javascript/jquery.xml2json.js"></script>
    <script type="text/javascript" src="javascript/projectHome.js"></script>
    <link href="css/projectHome.css" rel="stylesheet" />

    <script runat="server">
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                string username = Session["curruser"].ToString();
            }
            catch(Exception exp)
            {
                Response.Redirect("login.aspx");
            }
        }
    </script>

</head>
<body ng-app="">

   <div class="container body-height" ng-controller="ItemSearchController">

        <div class="header">
            <div class="row">
                <div class="col-md-5 pull-left"> <img src="images/proj_logo.jpg" height="64px" width="250px" /> </div>
                <div class="col-md-3"></div>
                <div class="col-md-1 pull-right"> <a href="https://plus.google.com/u/0/101584820096948585279" target="_blank"><img src="images/gplus.png" /></a> </div>
                <div class="col-md-1 pull-right"> <a href="https://twitter.com/pricecompare14" target="_blank"><img src="images/twitter.png" /></a> </div>
                <div class="col-md-1 pull-right"> <a href="https://www.facebook.com/pages/Price-Compare/421135361367756" target="_blank"><img src="images/fb.png" /></a> </div> 
            </div>
        </div>

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

       <table class="table borderless">
           <tr class="row">
               <td class="col-md-2 text-center"><label for="item">Enter item:</label></td>
               <td class="col-md-8"><input type="text" id="item" class="form-control" placeholder="Enter item" required /></td>
               <td class="col-md-2"><button class="btn btn-primary btn-block" id="searchBtn" name="searchBtn" ng-click="getItem()">Search</button></td>
       </table>

        <hr />

       <table class="table table-hover result">
           <thead>
               <tr class="row">
                   <th class="col-md-6 text-left">Name</th>
                   <th class="col-md-4 text-center">Image</th>
                   <th class="col-md-2 text-center">&nbsp;</th>
               </tr>
           </thead>
           <tbody>
               <tr ng-repeat="i in items" class="row">
                   <td class="col-md-6 text-left">{{i.ItemAttributes.Title}}</td>
                   <td class="col-md-4 text-center"><img ng-src="{{i.MediumImage.URL}}" /></td>
                   <td class="col-md-2"><a href="priceCompare.aspx?title={{i.ItemAttributes.Title}}" class="btn btn-primary btn-block">Compare prices</a></td>
               </tr>
           </tbody>
       </table>

    </div>

    <div id="footer">
      <div class="container">
          <h6 class="text-center footer-text-left">&copy; Aswin Muthiah Murugapan, Northeastern University</h6>
          <h6 class="text-center footer-text-right">Site best viewed in Google Chrome, Mozilla Firefox</h6>
      </div>
    </div>

</body>
</html>
