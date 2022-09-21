using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows;

namespace PROG3A_POE
{
    public partial class employeeLogin : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\farmStall.mdf;Integrated Security=True");




        // ************************************************************************** PAGE LOAD *********************************************************************************************************
        protected void Page_Load(object sender, EventArgs e)
        {
          
        }
        // ************************************************************************** LOG IN BUTTON CLICK *********************************************************************************************************

        protected void btnlogIn_Click(object sender, EventArgs e)
        {
            logIn();
        }
        // ************************************************************************** FARMER BUTTON CLICK *********************************************************************************************************

        protected void btnFarmer_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }

        // ************************************************************************** METHOD TO RUN ON LOG IN BUTTON CLICK *********************************************************************************************************
        public void logIn()
        {
            try
            {
                if (con.State == ConnectionState.Closed)
                    con.Open();
                String Query = "SELECT COUNT (*) FROM EMPLOYEE where userName=@userName AND employeePassword=@employeePassword";
                SqlCommand sqlCmd = new SqlCommand(Query, con);
                sqlCmd.Parameters.AddWithValue("@userName", username.Text);
                sqlCmd.Parameters.AddWithValue("@employeePassword", password.Text);
                sqlCmd.ExecuteNonQuery();
                int count = Convert.ToInt32(sqlCmd.ExecuteScalar());

                if (count == 1)
                {
                    MessageBox.Show("Successfully logged in");
                    Response.Redirect("EmployeePortal.aspx");
                }





                else
                {
                    MessageBox.Show("Username or passord is incorrect");
                }
            }
            catch
            {

            }
        }
    }
    
    }
