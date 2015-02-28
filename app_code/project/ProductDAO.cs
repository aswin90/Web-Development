using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Configuration;

namespace WebDevelopment.project
{
    public class ProductDAO
    {
        private SqlConnection dbconnection = new SqlConnection(ConfigurationManager.ConnectionStrings["aswin90ConnectionString1"].ConnectionString);
        private SqlDataReader reader;

        public void insertProduct(ProductTO product)
        {
            SqlCommand retcmd = new SqlCommand("insert into [ProjectProductSearch] ([username], [productText], [store]) values (@username, @productText, @store)", dbconnection);
            SqlParameter usernameParam = new SqlParameter("@username", product.usernameTextValue);
            SqlParameter productTextParam = new SqlParameter("@productText", product.comparisonTextValue);
            SqlParameter storeParam = new SqlParameter("@store", product.store);

            retcmd.Parameters.Add(usernameParam);
            retcmd.Parameters.Add(productTextParam);
            retcmd.Parameters.Add(storeParam);

            try
            {
                dbconnection.Open();
                retcmd.ExecuteNonQuery();
            }
            catch (Exception ee)
            {
            }


        }

        public List<ProductTO> getByUsername(String userid)
        {
            ProductTO userProduct = new ProductTO();

            SqlCommand retcmd = new SqlCommand("select productText, store from [ProjectProductSearch] where [username] = @userid", dbconnection);
            SqlParameter useridparam = new SqlParameter("@userid", userid);

            retcmd.Parameters.Add(useridparam);
            List<ProductTO> finalValue = new List<ProductTO>();
            try
            {
                dbconnection.Open();
                reader = retcmd.ExecuteReader();

                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        userProduct = new ProductTO(reader.GetValue(0).ToString(),
                                            reader.GetValue(1).ToString());
                        finalValue.Add(userProduct);
                    }
                }

                dbconnection.Close();
            }
            catch (Exception ee)
            {
                //
            }
            return finalValue;
        }

        public List<ProductTO> getByUsernameStore(String userid, String storeVal)
        {
            ProductTO userProduct = new ProductTO();

            SqlCommand retcmd = new SqlCommand("select productText from [ProjectProductSearch] where [username] = @userid AND [store] = @storeVal", dbconnection);
            SqlParameter useridparam = new SqlParameter("@userid", userid);
            SqlParameter storeValparam = new SqlParameter("@storeVal", storeVal);

            retcmd.Parameters.Add(useridparam);
            retcmd.Parameters.Add(storeValparam);
            List<ProductTO> finalValueProduct = new List<ProductTO>();
            try
            {
                dbconnection.Open();
                reader = retcmd.ExecuteReader();

                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        userProduct = new ProductTO(reader.GetValue(0).ToString());
                        finalValueProduct.Add(userProduct);
                    }
                }

                dbconnection.Close();
            }
            catch (Exception ee)
            {
                //
            }
            return finalValueProduct;
        }

    }
}