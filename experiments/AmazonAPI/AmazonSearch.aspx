<%@ Page Language="C#" AutoEventWireup="true" %>

<%@ Import Namespace="neu.edu.ccis.aswin90" %>
<%@ Import Namespace="System.Xml" %>
<%@ Import Namespace="System.Xml.XPath" %>
<%@ Import Namespace="System.IO" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">
    protected void searchOnAmazon(Object sender, EventArgs e)
    {
        SearchItem items = new SearchItem();
        XElement xdoc = items.getOutputXml(this, keywordsTextBox.Text);
        processXml(xdoc);
    }

    protected void processXml(XElement xdoc)
    {
        // Namespace
        string amzNs = "{http://webservices.amazon.com/AWSECommerceService/2011-08-01}";

        // Initializing variables
        XElement _root = xdoc;
        string mediumImageUrl = "testurl";
        string title = "testTitle";
        string amount = "testAmount";
        string author = "testAuthor";
        string detailPageUrl = "testurl";

        // Check if any error message has been returned in response
        // xml.
        XElement errorElement = null;
        string errorMsg = null;
        errorElement = _root.Element(amzNs + "Items")
                            .Element(amzNs + "Request")
                            .Element(amzNs + "Errors");

        // If error is present, display the error message to the user.
        if (errorElement != null)
        {
            errorMsg = errorElement.Element(amzNs + "Error").Element(amzNs + "Message").Value;
            constructTag(errorMsg);
        }
        else
        {   // else, render the page with necessary information.
            foreach (XElement items in _root.Elements(amzNs + "Items"))
            {
                foreach (XElement item in items.Elements(amzNs + "Item"))
                {
                    if (item.Element(amzNs + "DetailPageURL") != null)
                        detailPageUrl = item.Element(amzNs + "DetailPageURL").Value;
                    if (item.Element(amzNs + "MediumImage") != null)
                    {
                        if (item.Element(amzNs + "MediumImage").Element(amzNs + "URL") != null)
                            mediumImageUrl = item.Element(amzNs + "MediumImage").Element(amzNs + "URL").Value;
                    }
                    if (item.Element(amzNs + "ItemAttributes") != null)
                    {
                        XElement itemAttr = item.Element(amzNs + "ItemAttributes");
                        if (itemAttr.Element(amzNs + "Title") != null)
                            title = itemAttr.Element(amzNs + "Title").Value;
                        if (itemAttr.Element(amzNs + "Author") != null)
                            author = itemAttr.Element(amzNs + "Author").Value;
                        if (itemAttr.Element(amzNs + "ListPrice") != null)
                        {
                            XElement listPrice = itemAttr.Element(amzNs + "ListPrice");
                            if (listPrice.Element(amzNs + "FormattedPrice") != null)
                                amount = listPrice.Element(amzNs + "FormattedPrice").Value;
                        }
                    }

                    constructTag(detailPageUrl, mediumImageUrl, title, author, amount);
                }
            }
        }
    }

    public void constructTag(string msg)
    {
        holder.InnerHtml = holder.InnerHtml +
            "<h3>No Matching result found</h3>";
    }

    public void constructTag(string pageurl, string imageurl, string title, string author, string amount)
    {
        string imageTag, pageTag;
        if (imageurl == "testurl")
            imageTag = "<label class='imageText'>No Image available</label></br>";
        else
            imageTag = "<img class='image' src='" + imageurl + "' alt='Image' /></br>";

        if (pageurl == "testurl")
            pageTag = "<label class='pageUrlText'>Amazon Page URL not available</label></br>";
        else
            pageTag = "<a href='" + pageurl + "' target='_blank'>Click here</a> to see this listing on amazon.</br>";

        if (title == "testTitle")
            title = "No Title found";
        if (amount == "testAmount")
            amount = "No price found";
        if (author == "testAuthor")
            author = "No Author found";

        holder.InnerHtml = holder.InnerHtml +
            "<label class='title'>" + title + "</label></br>" +
            "<label class='author'>" + author + "</label></br>" +
            imageTag +
            "<label class='amount'>Price: " + amount + "</label></br>" +
            pageTag +
            "<hr/>";
    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Amazon API</title>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet"/>
</head>
<body>
    <div class="container">
    <form id="form2" runat="server">
    <div>
    <h2>Search Books on Amazon</h2>
    Enter search keywords <asp:TextBox ID="keywordsTextBox" runat="server"></asp:TextBox>
    <asp:Button ID="SearchButton" runat="server" Text="Search" OnClick="searchOnAmazon" />
    <br />
    <hr />
    <h3 id="searchResultLabel">Search Result</h3>
    </div>
    <label runat="server" id="holder"></label>
    <br />
    </form>

    <div>
			In this experiment, I have explored the Amazon Product Advertising API.</div>
		<div>
			&nbsp;</div>
		<div>
			The Product Advertising API looks up for an item that the user has searched and returns the response in a XML format.</div>
		<div>
			&nbsp;</div>
		<div>
			In this part, I&#39;ll describe about the ASPX part of the Amazon API call.&nbsp;</div>
		<div>
			&nbsp;</div>
		<div>
			The user enters the item in the textbox.</div>
		<div>
			&nbsp;</div>
		<div>
			<strong>&lt;asp:TextBox ID=&quot;keywordsTextBox&quot; runat=&quot;server&quot;&gt;&lt;/asp:TextBox&gt;</strong></div>
		<div>
			&nbsp;</div>
		<div>
			When the user clicks on the <strong>Search</strong> button, the following function is called.</div>
		<div>
			&nbsp;</div>
		<div>
			<strong>&lt;asp:Button ID=&quot;SearchButton&quot; runat=&quot;server&quot; Text=&quot;Search&quot; OnClick=&quot;searchOnAmazon&quot; /&gt;</strong></div>
		<div>
			&nbsp;</div>
		<div>
			This function, instantiates the <strong>SearchItem</strong> object items.</div>
		<div>
			&nbsp;</div>
		<div>
			The keyword that the user entered into the textbox is passed to the following, where the call is made to the Amazon API and the XML response is returned.</div>
		<div>
			&nbsp;</div>
		<div>
			The XML response is processed in the <strong>processXml</strong> and the search results are displayed to the user.</div>
		<div>
			&nbsp;</div>

    <div>
			In the C# file, a call is made to the Amazon API and the reponse XML is returned.</div>
		<div>
			&nbsp;</div>
		<div>
			The <strong>getOutputXml(Page page, string keywords)</strong> is called and the keyword the user entered is passed to this function.</div>
		<div>
			&nbsp;</div>
		<div>
			Amazon API can be divided into two parts, the Unsigned URL and the Signed URL.</div>
		<div>
			&nbsp;</div>
		<div>
			The unsigned url consists of the API call parameters and this URL is passed to a Sign function where a base64-encoded HMAC_SHA256 key is generated with the AWS secret key and the signature is appended to the URL.</div>
		<div>
			&nbsp;</div>
		<div>
			In the <strong>getOutputXml</strong> method, the Unsigned URL is constructed for every keyword:</div>
		<div>
			&nbsp;</div>
		<div>
			<strong>String requestString = &quot;Service=AWSECommerceService&quot;</strong></div>
		<div>
			<strong>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; + &quot;&amp;Version=2011-08-01&quot;&nbsp;</strong></div>
		<div>
			<strong>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; + &quot;&amp;Operation=ItemSearch&quot;</strong></div>
		<div>
			<strong>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; + &quot;&amp;AssociateTag=ecommercepric-20&quot;</strong></div>
		<div>
			<strong>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; + &quot;&amp;SearchIndex=Books&quot;</strong></div>
		<div>
			<strong>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; + &quot;&amp;Sort=relevancerank&quot;</strong></div>
		<div>
			<strong>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; + &quot;&amp;ResponseGroup=ItemAttributes,Images&quot;</strong></div>
		<div>
			<strong>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; + &quot;&amp;Keywords=&quot; + keyword</strong></div>
		<div>
			<strong>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ;</strong></div>
		<div>
			&nbsp;</div>
		<div>
			This requestString is passed to Sign function which constructs the Signed URL.</div>
		<div>
			&nbsp;</div>
		<div>
			The API call is made as follows:</div>
		<div>
			&nbsp;</div>
		<div>
			<strong>WebRequest request = HttpWebRequest.Create(requestUrl);</strong></div>
		<div>
			&nbsp;</div>
		<div>
			The XML response is stored in as:</div>
		<div>
			&nbsp;</div>
		<div>
			<strong>WebResponse response = request.GetResponse();</strong></div>
		<div>
			&nbsp;</div>
		<div>
			<a href="http://net4.ccs.neu.edu/home/aswin90/fileview/Default.aspx?~/experiments/AmazonAPI/AmazonSearch.aspx" target="_blank">To see the source file click here</a>
		</div>
        <div>
			&nbsp;</div>
		<div>
			<a href="http://net4.ccs.neu.edu/home/aswin90/fileview/Default.aspx?~/app_code/AmazonAPIExperiment/SearchItem.cs" target="_blank">To see the SearchItem C# file click here</a>
		</div>
        <div>
			&nbsp;</div>
		<div>
			<a href="http://net4.ccs.neu.edu/home/aswin90/fileview/Default.aspx?~/app_code/AmazonAPIExperiment/SignedRequestHelper.cs" target="_blank">To see the SignedRequestHelper C# file click here</a>
		</div>
        <div>
			&nbsp;</div>
        <div>
            References
        </div>
        <div>
			&nbsp;</div>
        <div>
			<a href="http://docs.aws.amazon.com/AWSECommerceService/latest/DG/ItemSearch.html" target="_blank">Amazon Product Search API</a>
		</div>
        <div>
			&nbsp;</div>
        <div>
			<a href="http://stackoverflow.com/" target="_blank">Stack Overflow</a>
		</div>
        <div>
			&nbsp;</div>


        </div>
</body>
</html>