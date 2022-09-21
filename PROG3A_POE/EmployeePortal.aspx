<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmployeePortal.aspx.cs" Inherits="PROG3A_POE.EmployeePortal" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <style>
        
.topnav {
  background-color: #333;
  overflow: hidden;
}
h1 {
    text-align:center;
}


.topnav a {
  float: left;
  color: #f2f2f2;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
  font-size: 17px;
}


.topnav a:hover {
  background-color: #ddd;
  color: black;
}


.topnav a.active {
  background-color: #04AA6D;
  color: white;
}
        .auto-style1 {
            width: 499px;
        }
        .auto-style2 {
            width: 196px;
            align-content:center;
        }
table {
    align-content:center;
}
.center {
  margin-left: auto;
  margin-right: auto;
}
    </style>
</head>

<body>
    <form id="form1" runat="server">
    <div class="topnav">
  <a class="active" href="#home">Home</a>
  <a href="Register.aspx">Add Farmer</a>
  <a href="Login.aspx">Log Out</a>
  
</div>
    
     <div>
         <center>
            
                <h1> Welcome to the Admin portal</h1>

                
            </center>
         </div>
        <div>
            <table class="center">
                
                <tr>
                    <th class="auto-style2">

                        <asp:Label ID="Label1" runat="server" Text="Search items by catagory"></asp:Label>

                    </th>
                    <th>

                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="itemCatagory" DataValueField="itemCatagory">
                        </asp:DropDownList>

                    </th>
                    <th>

                        <asp:Button ID="btnCatagory" runat="server" Text="Search" OnClick="Button1_Click" />

                    </th>
                </tr>
                <tr>
                    <th>

                        <asp:Label ID="Label2" runat="server" Text="Search items by farmer"></asp:Label>

                    </th>
                    <th>

                        <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource1" DataTextField="userName" DataValueField="userName">
                        </asp:DropDownList>

                    </th>
                    <th>

                        <asp:Button ID="btnSearchFarmer" runat="server" Text="Search" OnClick="btnSearchFarmer_Click" />

                    </th>

                </tr>
                   
            </table>
       
            </div>
        <div>
            <h1> Your search results will appear under this text once you have filtered the results</h1>
        </div>
   <div>

       <asp:GridView ID="GridView3" class="center" runat="server" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" GridLines="Horizontal" AutoGenerateColumns="False">
           <Columns>
                            <asp:BoundField DataField="itemCatagory" HeaderText="itemCatagory" SortExpression="itemCatagory" />
                            <asp:BoundField DataField="itemName" HeaderText="itemName" SortExpression="itemName" />
                            <asp:BoundField DataField="itemDesc" HeaderText="itemDesc" SortExpression="itemDesc" />
                            <asp:BoundField DataField="itemQuantity" HeaderText="itemQuantity" SortExpression="itemQuantity" />
                            <asp:BoundField DataField="userName" HeaderText="userName" SortExpression="userName" />
            <asp:TemplateField HeaderText="Image">
                                <ItemTemplate>
                                    <asp:Image ImageUrl='<%# "data:image/jpg;base64," + Convert.ToBase64String((byte[])Eval("itemImage")) %>' ID="Image1" runat="server" width="174px" height="174px"/>
                                </ItemTemplate>
                            </asp:TemplateField>
           </Columns>
           <FooterStyle BackColor="White" ForeColor="#333333" />
           <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
           <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
           <RowStyle BackColor="White" ForeColor="#333333" />
           <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
           <SortedAscendingCellStyle BackColor="#F7F7F7" />
           <SortedAscendingHeaderStyle BackColor="#487575" />
           <SortedDescendingCellStyle BackColor="#E5E5E5" />
           <SortedDescendingHeaderStyle BackColor="#275353" />
       </asp:GridView>

   </div>
        <div>
            <h1>All farmers products will show here</h1>
        </div>
        <div>
             <asp:GridView ID="GridView2" class="center" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView2_SelectedIndexChanged" >
                        <Columns>
                            <asp:BoundField DataField="itemCatagory" HeaderText="itemCatagory" SortExpression="itemCatagory" />
                            <asp:BoundField DataField="itemName" HeaderText="itemName" SortExpression="itemName" />
                            <asp:BoundField DataField="itemDesc" HeaderText="itemDesc" SortExpression="itemDesc" />
                            <asp:BoundField DataField="itemQuantity" HeaderText="itemQuantity" SortExpression="itemQuantity" />
                            <asp:BoundField DataField="userName" HeaderText="userName" SortExpression="userName" />
                             <asp:TemplateField HeaderText="Image">
                                <ItemTemplate>
                                    <asp:Image ImageUrl='<%# "data:image/jpg;base64," + Convert.ToBase64String((byte[])Eval("itemImage")) %>' ID="Image1" runat="server" width="174px" height="174px"/>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [itemCatagory], [itemName], [itemDesc], [itemQuantity], [itemImage], [userName] FROM [STOCK]"></asp:SqlDataSource>
        </div>
        </form>
</body>
</html>
