<%@ Page Language="C#" AutoEventWireup="true"%>
<%@ Import Namespace="System.Web.Script.Serialization" %>
<%@ Import Namespace="System.Web.Services" %>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="System.Net" %>
<%@ Import Namespace="System.Web.Script.Serialization" %>
<%@ Import Namespace="System.Web.Services" %>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="System.Net" %>
<%@ Import Namespace="System.Xml" %>
<%@ Import Namespace="System.Xml.XPath" %>
<%@ Import Namespace="System.Linq" %>
<%@ Import Namespace="System.Xml.Linq" %>
<%@ Import Namespace="System.Web.UI" %>
<%@ Import Namespace="WebDevelopment.project" %>

<%             
    String store = Request["store"];
    String query = Request["searchItem"];
    String respWalmart;

    if (store != null)
    {
        if (store.Equals("amazon"))
        {

            SearchAmazon search = new SearchAmazon();
            XElement amazonResp = search.getResponseAmazon(this, query);
            Response.Write(amazonResp);

        }

        else if (store.Equals("walmart"))
        {

            StreamReader stream;
            String walmartURL = "http://api.walmartlabs.com/v1/items/";
            walmartURL = walmartURL + query;
            walmartURL = walmartURL + "?apiKey=spw36je9q66fe886224gu5te";

            // Initialize a new WebRequest.
            
            HttpWebRequest webreq = (HttpWebRequest)WebRequest.Create(walmartURL);
            // Get the response from the Internet resource.
            
            HttpWebResponse webresp = (HttpWebResponse)webreq.GetResponse();

            stream = new StreamReader(webresp.GetResponseStream());
            respWalmart = stream.ReadLine();
            stream.Close();
            Response.Write(respWalmart);

        }

        else if (store.Equals("walmartReview"))
        {

            StreamReader stream;
            String walmartURL = "http://api.walmartlabs.com/v1/reviews/";
            walmartURL = walmartURL + query;
            walmartURL = walmartURL + "?apiKey=spw36je9q66fe886224gu5te";

            // Initialize a new WebRequest.

            HttpWebRequest webreq = (HttpWebRequest)WebRequest.Create(walmartURL);
            // Get the response from the Internet resource.

            HttpWebResponse webresp = (HttpWebResponse)webreq.GetResponse();

            stream = new StreamReader(webresp.GetResponseStream());
            respWalmart = stream.ReadLine();
            stream.Close();
            Response.Write(respWalmart);

        }

        else if (store.Equals("ebay"))
        {

            StreamReader stream;
            var url = "http://svcs.ebay.com/services/search/FindingService/v1";
            url += "?OPERATION-NAME=findItemsByKeywords";
            url += "&SERVICE-VERSION=1.0.0";
            url += "&SECURITY-APPNAME=Northeas-9a91-477b-8dcf-d760866d10ce";
            url += "&GLOBAL-ID=EBAY-US";
            url += "&RESPONSE-DATA-FORMAT=JSON";
            url += "&REST-PAYLOAD";

            url += "&keywords=" + query;
            url += "&paginationInput.entriesPerPage= 1";

            // Initialize a new WebRequest.

            HttpWebRequest webreq = (HttpWebRequest)WebRequest.Create(url);
            // Get the response from the Internet resource.

            HttpWebResponse webresp = (HttpWebResponse)webreq.GetResponse();

            stream = new StreamReader(webresp.GetResponseStream());
            String ebayResp = stream.ReadLine();
            stream.Close();
            Response.Write(ebayResp);

        }
    }
        
%>