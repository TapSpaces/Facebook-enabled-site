using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using Facebook;
using Facebook.Reflection;

namespace RegistrationPage
{
    public partial class Registration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (IsPostBack)
            {
                // establishes connecction, query, command to sql database for registration page
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
                conn.Open();

                string  checkuser = "select count(*) from Table_1 where UserNamex='" + TextBoxUN.Text + "'";

                SqlCommand com = new SqlCommand(checkuser, conn);

                int temp = Convert.ToInt32(com.ExecuteScalar().ToString());

                if (temp == 1)
                {
                    Response.Write("User Already Exists");
                }


                conn.Close();

            }
        }

        protected void ButtonSubmit_Click(object sender, EventArgs e)
        {

            try
            {

                Guid newGUID = new Guid();

                newGUID = Guid.NewGuid();

                // create connection
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
                // open connection
                conn.Open();
                // create query
                string insertQuery = "insert into Table_1 (GUID,UserNamex,Emailx,Passwordx,Countryx) values (@GUID, @Uname, @email, @password, @country)";

                // create command by sending query and connection
                SqlCommand com = new SqlCommand(insertQuery, conn);

                // initialize command which is to send textbox data to database
                com.Parameters.AddWithValue("@GUID", newGUID.ToString());
                com.Parameters.AddWithValue("@Uname", TextBoxUN.Text);
                com.Parameters.AddWithValue("@email", TextBoxEmail.Text);
                com.Parameters.AddWithValue("@password", TextBoxPass.Text);
                com.Parameters.AddWithValue("@country", DropDownListCountry.SelectedItem.ToString());

                // execution of command
                com.ExecuteNonQuery();
                Response.Redirect("Manager.aspx");
                Response.Write("Registration is successful.");

                // close connection
                conn.Close();
            }

            catch(Exception ex)
            {
                Response.Write("Error:" + ex.ToString());

            }


        }
    }


    public class FacebookLogin : IHttpHandler, System.Web.SessionState.IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            var accessToken = context.Request["accessToken"];
            context.Session["AccessToken"] = accessToken;
            context.Response.Redirect("Manager.aspx");
        }

        /*
         
         var accessToken = Session["AccessToken"].ToString();
         var client = new FaceBookClient(accessToken);
         dynamic result = client.Get("me", new { fields = "name,id" });
         string name = result.name;
         string id = result.id;
         
        */
      
        public bool IsReusable
        {

            get
            {
                return false;
            }
        }
    }
}