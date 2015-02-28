using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebDevelopment.project
{
    public class UserTO
    {
        public string userid;
        public string password;        
        public string fname;
        public string lname;
        public string email;
        public string status;

        public UserTO(string userid, string password, string fname, string lname, string email)
        {
            this.userid = userid;
            this.password = password;            
            this.fname = fname;
            this.lname = lname;
            this.email = email;
            this.status = "S";
        }

        public UserTO (string status)
        {
             this.status = status;
        }

        public UserTO(){}
    }
}