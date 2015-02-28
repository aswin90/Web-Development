using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Configuration;

namespace WebDevelopment.project
{    
        public class UserDAO
        {
            private SqlConnection dbconnection = new SqlConnection(ConfigurationManager.ConnectionStrings["aswin90ConnectionString1"].ConnectionString);
            private SqlDataReader reader;

            public UserTO getUserById(String userid)
            {
                UserTO crruser = new UserTO();

                SqlCommand retcmd = new SqlCommand("select username, password, firstName, lastName, email from [ProjectUserTable] where [username] = @userid", dbconnection);
                SqlParameter useridparam = new SqlParameter("@userid", userid);

                retcmd.Parameters.Add(useridparam);

                try
                {
                    dbconnection.Open();
                    reader = retcmd.ExecuteReader();

                    if (reader.HasRows)
                    {
                        while (reader.Read())
                        {
                            crruser = new UserTO(reader.GetValue(0).ToString(),
                                                reader.GetValue(1).ToString(),
                                                reader.GetValue(2).ToString(),
                                                reader.GetValue(3).ToString(),
                                                reader.GetValue(4).ToString());
                        }
                    }

                    else crruser = new UserTO("ND");
                    dbconnection.Close();
                }
                catch (Exception ee)
                {
                    crruser = new UserTO("ERROR");
                }
                return crruser;
            }
        }
    }
