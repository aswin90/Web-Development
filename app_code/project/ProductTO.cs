using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebDevelopment.project
{
    public class ProductTO
    {
        public string usernameTextValue {set; get; }
        public string comparisonTextValue {set; get; }

        public string store { set; get; }

        public ProductTO(string username, string comparison, string store)
        {
            this.usernameTextValue = username;
            this.comparisonTextValue = comparison;
            this.store = store;
        }

        public ProductTO()
        {

        }

        public ProductTO(string comparison, string store)
        {
            this.comparisonTextValue = comparison;
            this.store = store;
        }

        public ProductTO(string comparison)
        {
            this.comparisonTextValue = comparison;
        }
    }
}