using System;
using System.Collections.Generic;
using System.Text;
using System.Net;
using System.IO;
using System.Xml;
using System.Xml.XPath;
using System.Linq;
using System.Xml.Linq;
using System.Web.UI;
using neu.edu.ccis.aswin90;

namespace WebDevelopment.project
{
    public class SearchAmazon
    {
        private const string AWS_ACCESS_KEY_ID_IDENTIFIER = "***amazonKey***";
        private const string AWS_SECRET_KEY_IDENTIFIER = "***amazonKey***";
        private const string DEST = "webservices.amazon.com";
        private const string NAMESPACE = "http://webservices.amazon.com/AWSECommerceService/2009-03-31";
        private const string ITEMID = "0545010225";
        private const string ENDPOINT = "http://ecs.amazonaws.com/onca/xml";

        public XElement getResponseAmazon(Page page, string keywords)
        {
            SignedRequestHelper helper = new SignedRequestHelper(
                AWS_ACCESS_KEY_ID_IDENTIFIER,
                AWS_SECRET_KEY_IDENTIFIER,
                DEST);
            String requestUrl;
            XElement xdoc = null;

            String[] Keywords = new String[] {
                keywords,
             };

            foreach (String keyword in Keywords)
            {
                String requestString = "Service=AWSECommerceService"
                    + "&Version=2011-08-01"
                    + "&Operation=ItemSearch"
                    + "&AssociateTag=***amazonTag***"
                    + "&SearchIndex=All"
                    + "&ResponseGroup=ItemAttributes,Images"
                    + "&Keywords=" + keyword
                    ;

                requestUrl = helper.Sign(requestString);

                try
                {
                    WebRequest request = HttpWebRequest.Create(requestUrl);
                    WebResponse response = request.GetResponse();
                    XmlDocument doc = new XmlDocument();
                    Stream responseStream = response.GetResponseStream();
                    doc.Load(responseStream);

                    XmlElement root = doc.DocumentElement;
                    string xml = root.InnerXml;
                    string fullxml = "<root>" + xml + "</root>";
                    TextReader tr = new StringReader(fullxml);
                    XElement eroot = XElement.Load(tr);
                    return eroot;
                }
                catch (Exception e)
                {
                    System.Console.WriteLine("Caught Exception: " + e.Message);
                    System.Console.WriteLine("Stack Trace: " + e.StackTrace);
                }
                return xdoc;
            }
            return xdoc;
        }
    }
}