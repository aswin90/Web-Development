<%@ Page Language="C#" AutoEventWireup="true"%>
<%@ Import Namespace="System.Web.Script.Serialization" %>
<%@ Import Namespace="System.Web.Services" %>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="System.Net" %>
<%@ Import Namespace="System.Web.Script.Serialization" %>
<%@ Import Namespace="System.Web.Services" %>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="System.Net" %>
<%@ Import Namespace="WebDevelopment.project" %>

<!DOCTYPE html>

<html ng-app="">
<head runat="server">
    <title>Compare Prices</title>
    
    <script src="javascript/angular.js"></script>
    <script src="//code.jquery.com/jquery-1.10.2.js"></script>
    <link href="css/bootstrap.css" rel="stylesheet" />
    <script type="text/javascript" src="javascript/jquery.xml2json.js"></script>
    <link href="css/priceCompare.css" rel="stylesheet" />
    <script type="text/javascript" src="javascript/priceCompare.js"></script>
    <script runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            string username = Session["curruser"].ToString();
        }
        catch (Exception exp)
        {
            Response.Redirect("login.aspx");
        }
    }
    
    protected void saveSearch_Click(object sender, EventArgs e)
    {
        string searchText = Request["title"];

    }

    protected void saveComp_Click(object sender, EventArgs e)
    {
        try
        {
            string username = Session["curruser"].ToString();
            string comparisonText = Request["title"];

            ComparisonTO comp = new ComparisonTO(username, comparisonText);
            comparisonDAO compDao = new comparisonDAO();
            compDao.insertComparison(comp);
        }
        catch (Exception exp)
        {
            Response.Redirect("login.aspx");
        }      
    }

    </script>
</head>
<body>

    <div class="container body-height"> 

        <div ng-controller="PriceController">

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
                      </div><!--/.nav-collapse -->
                    </div><!--/.container-fluid -->
                  </nav>

            <br />
            <br />

        <div>
            
            <div class="row">
                <div class="col-md-6 pull-left text-center">
                    <img ng-src="{{itemsAmazon[0].LargeImage.URL}}" />
                </div> 
                <div class="col-md-6 pull-right">
                    <h2>{{itemsAmazon[0].ItemAttributes.Title}}</h2>
                    <br />
                    <table class="table table-bordered table-hover">
                        <tr class="row">
                            <th class="col-md-6">Name</th>
                            <th class="col-md-2">Price</th>
                            <th class="col-md-2">Store</th>
                            <th class="col-md-2">Info</th>
                        </tr>
                        <tr class="row">
                            <td class="col-md-6">{{itemsAmazon[0].ItemAttributes.Title}}</td>
                            <td class="col-md-2"><b>{{itemsAmazon[0].ItemAttributes.ListPrice.FormattedPrice}}</b></td>
                            <td class="col-md-2"><img src="images/amazon100x40.jpg" /></td>
                            <td class="col-md-2"><a href="amazon.aspx?title={{itemsAmazon[0].ItemAttributes.Title}}" class="btn btn-block btn-success" target="_blank">Detailed Info</a></td>
                        </tr>
                        <tr class="row" ng-repeat="item in items | limitTo: 1">
                            <td class="col-md-6">{{item.name}}</td>
                            <td class="col-md-2"><b>${{item.salePrice}}</b></td>
                            <td class="col-md-2"><img src="images/walmart100x40.jpg" /></td>
                            <td class="col-md-2"><a href="walmart.aspx?title={{item.name}}" class="btn btn-block btn-success" target="_blank">Detailed Info</a></td>
                        </tr>
                        <tr class="row" ng-repeat="i in itemsEbay">
                            <td class="col-md-6">{{i.title[0]}}</td>
                            <td class="col-md-2"><b>${{i.sellingStatus[0].currentPrice[0].__value__}}</b></td>
                            <td class="col-md-2"><img src="images/ebay100x40.jpg" /></td>
                            <td class="col-md-2"><a href="ebay.aspx?title={{i.title[0]}}" class="btn btn-block btn-success" target="_blank">Detailed Info</a></td>
                        </tr>
                        
                    </table>
                </div>
            </div>     
            
            <br />
            <br />          
                
        </div>

        </div>

        <form runat="server" id="form1" class="row pull-right">
            <asp:Button name="saveComparsion" ID="saveComp" CssClass="btn btn-block btn-success" runat="server" OnClick="saveComp_Click" text="Save Comparison"/>
        </form>
      

    </div>

    <div id="footer">
      <div class="container">
          <h6 class="text-center footer-text-left">&copy; Aswin Muthiah Murugapan, Northeastern University</h6>
          <h6 class="text-center footer-text-right">Site best viewed in Google Chrome, Mozilla Firefox</h6>
      </div>
    </div>

</body>
    
</html>