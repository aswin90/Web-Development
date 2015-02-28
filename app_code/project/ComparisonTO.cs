using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebDevelopment.project
{
    public class ComparisonTO
    {
        public string usernameTextValue {set; get; }
        public string comparisonTextValue {set; get; }

        public ComparisonTO(string username, string comparison)
        {
            this.usernameTextValue = username;
            this.comparisonTextValue = comparison;
        }

        public ComparisonTO()
        {

        }

        public ComparisonTO(string comparison)
        {
            this.comparisonTextValue = comparison;
        }

    }
}