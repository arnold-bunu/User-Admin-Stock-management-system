using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PROG3A_POE
{

    public partial class FarmerPortal : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\farmStall.mdf;Integrated Security=True");

        
    // ************************************************************************** PAGE LOAD *********************************************************************************************************

        protected void Page_Load(object sender, EventArgs e)
        {
            if (customClass.loggedinUserName == null)
            {
                Response.Redirect("Login.aspx");
            }
            Loadrecords();
            getUser();
        }
     // ************************************************************************** GET USER *********************************************************************************************************
        public void getUser()
        {
            Label1.Text = customClass.loggedinUserName;
        }
    // ************************************************************************** LOAD RECORDS *********************************************************************************************************
        private void Loadrecords()
        {
            SqlDataAdapter adap = new SqlDataAdapter("Select * from STOCK where userName  = '" + customClass.loggedinUserName + "'", con);
            DataSet ds = new DataSet();
            adap.Fill(ds, "STOCK"); // filling from my student table 
            GridView1.DataSource = ds.Tables["STOCK"].DefaultView; // declaring my grid views data source
            GridView1.DataBind();
        }
    // ************************************************************************** ADD STOCK *********************************************************************************************************
        protected void btnAddStock_Click(object sender, EventArgs e)
        {
            addStock();
           
        }
        public void addStock ()
        {
            byte[] bytes;
            using (BinaryReader br = new BinaryReader(FileUpload1.PostedFile.InputStream))
            {
                bytes = br.ReadBytes(FileUpload1.PostedFile.ContentLength);      // binary reading method that reads my image binary
            }


            {
                SqlCommand sqlcmd = new SqlCommand("addStock", con);
                sqlcmd.CommandType = System.Data.CommandType.StoredProcedure;
                sqlcmd.Parameters.AddWithValue("@userName", customClass.loggedinUserName);
                sqlcmd.Parameters.AddWithValue("@itemCatagory", txtprodcat.Text);
                sqlcmd.Parameters.AddWithValue("@itemName", txtprodname.Text);
                sqlcmd.Parameters.AddWithValue("@itemDesc", txtproddesc.Text);
                sqlcmd.Parameters.AddWithValue("@itemQuantity", txtprodquantity.Text);
                sqlcmd.Parameters.AddWithValue("@itemImage", bytes);
                con.Open();
                sqlcmd.ExecuteNonQuery();
                con.Close();

            }
            ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Successfully Inserted');", true);
            Response.Redirect("FarmerPortal.aspx");
        }
     // ************************************************************************** ON ROW DATA BOUND *********************************************************************************************************
        protected void OnRowDataBound(object sender, GridViewRowEventArgs e) // method that converts the file uploaded into a base 64 string (bytes)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                DataRowView dr = (DataRowView)e.Row.DataItem;
                string imageUrl = "data:image/jpg;base64," + Convert.ToBase64String((byte[])dr["itemImage"]);
                (e.Row.FindControl("Image1") as Image).ImageUrl = imageUrl;
            }
        }

    }
}