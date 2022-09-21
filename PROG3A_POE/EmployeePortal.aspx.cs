using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PROG3A_POE
{
    public partial class EmployeePortal : System.Web.UI.Page
    {
        public String chosenItem;
        public String chosenFarmer;
        
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\farmStall.mdf;Integrated Security=True");

        // ************************************************************************** PAGE LOAD *********************************************************************************************************
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        // ************************************************************************** SEARCH CATEGORY BTN *********************************************************************************************************

        protected void Button1_Click(object sender, EventArgs e)
        {
            searchByCat();
        }
        // **************************************************************************  *********************************************************************************************************
        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        // ************************************************************************** SEARCH FARMER BTN *********************************************************************************************************
        protected void btnSearchFarmer_Click(object sender, EventArgs e)
        {
            searchByFarmer();
           
        }
        // ************************************************************************** SEARCH FARMER METHOD *********************************************************************************************************

        public void searchByFarmer()
        {
            string chosenFarmer = DropDownList2.SelectedValue.ToString();
            SqlDataAdapter adap = new SqlDataAdapter("Select * from STOCK where userName  = '" + chosenFarmer + "'", con); // slecting data for dropdown item

            DataSet ds = new DataSet();
            adap.Fill(ds, "STOCK"); // filling from my stock table 
            GridView3.DataSource = ds.Tables["STOCK"].DefaultView; // declaring my grid views data source
            GridView3.DataBind();
        }
        // ************************************************************************** SEARCH CATEGORY METHOD *********************************************************************************************************
        public void searchByCat ()
        {
            string chosenItem = DropDownList1.SelectedValue.ToString();
            SqlDataAdapter adap = new SqlDataAdapter("Select * from STOCK where itemCatagory  = '" + chosenItem + "'", con); // slecting data for dropdown item

            DataSet ds = new DataSet();
            adap.Fill(ds, "STOCK"); // filling from my stock table 
            GridView3.DataSource = ds.Tables["STOCK"].DefaultView; // declaring my grid views data source
            GridView3.DataBind();
        }


       
    }
}