<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FarmerPortal.aspx.cs" Inherits="PROG3A_POE.FarmerPortal" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <style>
        table, th, td, tc {
            border: 1px solid black;
            border-radius: 10px;
            text-align:center;
            align-content:center;
        }

        button {
            border: 1px solid black;
            border-radius: 10px;
        }

        .topnav {
            background-color: #333;
            overflow: hidden;
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
        }
        .center {
  margin-left: auto;
  margin-right: auto;
}
h1 {
       text-align:center;
}
    </style>
    <title></title>

</head>
<body>
    <form id="form1" runat="server">
        <div class="topnav">
            <a class="active" href="#home">Home</a>
            <a class="topnav" href="Login.aspx">Logout</a>
          
        </div>
        <div>
           
                <h1  > Here is a list of all the items you have for sale</h1>
                <div >

                    <table class="center" >
                       
                        <tr>
                            <th>Item Catagory</th>
                            <th>Item Name</th>
                            <th>Item Description</th>
                            <th>Item Quantity</th>
                            <th>Item Image</th>
                        </tr>
                        <tr>
                            <td>
                                <asp:TextBox ID="txtprodcat" runat="server"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox ID="txtprodname" runat="server"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox ID="txtproddesc" runat="server"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox ID="txtprodquantity" runat="server"></asp:TextBox>
                            </td>
                            <td>
                                
                                <asp:FileUpload ID="FileUpload1" runat="server" />
                                
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Button ID="btnAddStock" runat="server" Text="Add" Width="121px" OnClick="btnAddStock_Click" />
                            </td>
                            <td>
                                <asp:Button ID="btnUpdateStock" runat="server" Text="Update" Width="121px" />
                            </td>
                            <td>
                                <asp:Button ID="btnDelete" runat="server" Text="Delete" Width="124px" />
                            </td>
                            <td>

                            </td>
                            <td>

                                <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>

                            </td>
  </tr>
                             
</table>
                  


                </div>
                <h2>
                    <asp:GridView ID="GridView1" class="center" runat="server" AutoGenerateColumns="False"  OnRowDataBound="OnRowDataBound" >
                        <Columns>
                            <asp:BoundField DataField="itemCatagory" HeaderText="itemCatagory" SortExpression="itemCatagory" />
                            <asp:BoundField DataField="itemName" HeaderText="itemName" SortExpression="itemName" />
                            <asp:BoundField DataField="itemDesc" HeaderText="itemDesc" SortExpression="itemDesc" />
                            <asp:BoundField DataField="itemQuantity" HeaderText="itemQuantity" SortExpression="itemQuantity" />
                            <asp:TemplateField HeaderText="Image">
                                <ItemTemplate>
                                    <asp:Image ImageUrl='<%# "data:image/jpg;base64," + Convert.ToBase64String((byte[])Eval("itemImage")) %>' ID="Image1" runat="server" width="174px" height="174px"/>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                    
                </h2>

            
        </div>
    </form>
</body>
</html>
