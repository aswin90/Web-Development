<%@ Page Language="C#" AutoEventWireup="true"%>
<%@ Import Namespace="System.Web.Script.Serialization" %>
<%@ Import Namespace="System.Web.Services" %>
<%@ Import Namespace="WebDevelopment.project" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Amazon Store</title>
    <script src="javascript/angular.js"></script>
    <script src="javascript/jquery-1.11.1.js"></script>
    <link href="css/bootstrap.css" rel="stylesheet" />
    <script type="text/javascript" src="javascript/jquery.xml2json.js"></script>
    <link href="css/amazon.css" rel="stylesheet" />
    <script type="text/javascript" src="javascript/amazon.js"></script>
    <script runat="server">  
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                string username = Session["curruser"].ToString();
                ValueHiddenField.Value = username;
            }
            catch (Exception exp)
            {
                Response.Redirect("login.aspx");
            }   
        }
        protected void saveProductAmazon_Click(object sender, EventArgs e)
        {
            string username = Session["curruser"].ToString();
            string product = Request["title"];
            string store = "amazon";

            ProductTO productWalmart = new ProductTO(username, product, store);
            ProductDAO productWalmartDAO = new ProductDAO();
            productWalmartDAO.insertProduct(productWalmart);
        }
        [WebMethod]
        public static string loadSavedStores(string username)
        {
            ProductDAO productDataAO = new ProductDAO();
            var prodData = productDataAO.getByUsernameStore(username, "amazon");
            var jSerializer = new JavaScriptSerializer();
            return jSerializer.Serialize(prodData);
        }
    </script>
    
</head>
<body ng-app="">

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
        <br />

        <div class="row" ng-controller="amazonController">
            <div class="col-md-9">
                <table class="table table-hover">
                    <tr class="row">
                        <th class="col-md-3">Name</th>
                        <td class="col-md-9">{{itemsAmazon[0].ItemAttributes.Title}}</td>
                    </tr>
                    <tr class="row">
                        <th class="col-md-3">Features</th>
                        <td class="col-md-9">
                            <ul>
                              <li>{{itemsAmazon[0].ItemAttributes.Feature[0]}}</li>
                              <li>{{itemsAmazon[0].ItemAttributes.Feature[1]}}</li>
                              <li>{{itemsAmazon[0].ItemAttributes.Feature[2]}}</li>
                              <li>{{itemsAmazon[0].ItemAttributes.Feature[3]}}</li>
                              <li>{{itemsAmazon[0].ItemAttributes.Feature[4]}}</li>
                            </ul>
                        </td>
                    </tr>
                    <tr class="row">
                        <th class="col-md-3">Image</th>
                        <td class="col-md-9"><img ng-src="{{itemsAmazon[0].MediumImage.URL}}" /></td>
                    </tr>
                    <tr class="row">
                        <th class="col-md-3">Category</th>
                        <td class="col-md-9">{{itemsAmazon[0].ItemAttributes.Binding}}</td>
                    </tr>
                    <tr class="row">
                        <th class="col-md-3">Brand</th>
                        <td class="col-md-9">{{itemsAmazon[0].ItemAttributes.Brand}}</td>
                    </tr>
                    <tr class="row">
                        <th class="col-md-3">Price</th>
                        <td class="col-md-9">{{itemsAmazon[0].ItemAttributes.ListPrice.FormattedPrice}}</td>
                    </tr>
                    <tr class="row">
                        <th class="col-md-3">View on Amazon</th>
                        <td class="col-md-9"><a href="{{itemsAmazon[0].ItemLinks.ItemLink[0].URL}}" class="btn btn-primary" target="_blank">Click here</a></td>
                    </tr>      
                    <tr class="row">
                        <th class="col-md-3">Reviews on Amazon</th>
                        <td class="col-md-9"><a href="{{itemsAmazon[0].ItemLinks.ItemLink[5].URL}}" class="btn btn-primary" target="_blank">Click here</a></td>
                    </tr>                   
                </table>
            </div>
            <div class="col-md-3">
                <table class="table table-hover">
                    <thead class="row">
                        <tr class="col-md-12">
                            <th>Saved Products on Amazon</th>
                        </tr>
                    </thead>
                    <tbody class="row">
                        <tr class="col-md-12" ng-repeat="product in products">                       
                            <td class="text-left"><a href="amazon.aspx?title={{product.comparisonTextValue}}" target="_blank">{{product.comparisonTextValue}}</a></td>
                        </tr>   
                    </tbody>                                    
                </table>
            </div>
        </div>

        <form runat="server" id="form1" class="row pull-right">
             <asp:HiddenField ID="ValueHiddenField" value="" runat="server"/>      
            <asp:Button CssClass="btn btn-success btn-block" runat="server" id="saveProductAmazon" name="saveProductAmazon" Text="Save Product" OnClick="saveProductAmazon_Click" />
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
