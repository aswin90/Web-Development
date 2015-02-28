using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Configuration;

namespace WebDevelopment.project
{
    public class comparisonDAO
    {

        private SqlConnection dbconnection = new SqlConnection(ConfigurationManager.ConnectionStrings["aswin90ConnectionString1"].ConnectionString);
        private SqlDataReader reader;

        public void insertComparison(ComparisonTO comp)
        {
            SqlCommand retcmd = new SqlCommand("insert into [ProjectComparisonTable] ([username], [comparisonText]) values (@username, @comparisonText)", dbconnection);
            SqlParameter usernameParam = new SqlParameter("@username", comp.usernameTextValue);
            SqlParameter comparisonTextParam = new SqlParameter("@comparisonText", comp.comparisonTextValue);

            retcmd.Parameters.Add(usernameParam);
            retcmd.Parameters.Add(comparisonTextParam);

            try
            {
                dbconnection.Open();
                retcmd.ExecuteNonQuery();
            }
            catch (Exception ee)
            {
            }


        }

        public List<ComparisonTO> getByUsername(String userid)
        {
            ComparisonTO userComparison = new ComparisonTO();

            SqlCommand retcmd = new SqlCommand("select comparisonText from [ProjectComparisonTable] where [username] = @userid", dbconnection);
            SqlParameter useridparam = new SqlParameter("@userid", userid);

            retcmd.Parameters.Add(useridparam);
            List<ComparisonTO> finalValue = new List<ComparisonTO>();
            try
            {
                dbconnection.Open();
                reader = retcmd.ExecuteReader();

                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        userComparison = new ComparisonTO(reader.GetValue(0).ToString());
                        finalValue.Add(userComparison);
                    }
                }

                dbconnection.Close();
            }
            catch (Exception ee)
            {
                
            }
            return finalValue;
        }
    }
}