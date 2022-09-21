using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows;

namespace PROG3A_POE
{
    public partial class Register : System.Web.UI.Page
    {

        // ************************************************************************** PAGE LOAD *********************************************************************************************************
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        // ************************************************************************** ADD USER *********************************************************************************************************



        protected void btnAdduser_Click(object sender, EventArgs e)
        {
            addUser();
           
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("EmployeePortal.aspx");
        }

        // ************************************************************************** ADD USER METHOD *********************************************************************************************************
        public void addUser()
        {
            if (String.IsNullOrEmpty(fName.Text) || String.IsNullOrEmpty(sName.Text) || String.IsNullOrEmpty(userName.Text) || String.IsNullOrEmpty(password.Text))
            {
                MessageBox.Show("One or more fields were left blank, please fill them in", "Warning", MessageBoxButton.OK, MessageBoxImage.Error); // error message 
            }
            else
            {
                SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\farmStall.mdf;Integrated Security=True");
                con.Open();

                SqlCommand sqlCmd = new SqlCommand("addFarmer", con);
                sqlCmd.CommandType = System.Data.CommandType.StoredProcedure;
                sqlCmd.Parameters.AddWithValue("firstName", fName.Text.Trim());
                sqlCmd.Parameters.AddWithValue("surName", sName.Text.Trim());               // addding the values to my stored procedure 
                sqlCmd.Parameters.AddWithValue("userName", userName.Text.Trim());
                sqlCmd.Parameters.AddWithValue("farmerPassword", password.Text.Trim());
                sqlCmd.ExecuteNonQuery();
                MessageBox.Show("Successfully registered"); // successful log in message 
                Response.Redirect("EmployeePortal.aspx");

            }
        }
    }
}