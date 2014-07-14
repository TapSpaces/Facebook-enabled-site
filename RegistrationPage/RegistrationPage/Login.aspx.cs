using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
namespace RegistrationPage
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button_Login_Click(object sender, EventArgs e)
        {
            // establishes connecction, query, command to sql database for registration page
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);

            // opens the connection
            conn.Open();

            // sql command to get data 
            string checkuser = "select count(*) from Table_1 where UserNamex='" + TextBoxUsername.Text + "'";

            // sql command declaration passing query string and connection
            SqlCommand com = new SqlCommand(checkuser, conn);

            // the results of a query converted to a string
            int temp = Convert.ToInt32(com.ExecuteScalar().ToString());

            // if the command which is a combination of query and connection returns with one doe this

            conn.Close();

            // query the database to confirm that password is correct
            if (temp == 1)
            {
                conn.Open();
                string checkPasswordQuery = "select Passwordx from Table_1 where UserNamex='" + TextBoxUsername.Text + "'";
                //Response.Write("User Already Exists");

                SqlCommand passComm = new SqlCommand(checkPasswordQuery, conn);
                string password = passComm.ExecuteScalar().ToString().Replace(" ","");
                if (password == TextBoxPassword.Text)
                {
                    Session["New"] = TextBoxUsername.Text; 
                    Response.Write("Password is correct");
                    Response.Redirect("Manager.aspx");
                }
                else
                {
                    Response.Write("Password is not correct");
                }

            }


            else
            {
                Response.Write("Username is not correct!");
            }
        }
    }
}