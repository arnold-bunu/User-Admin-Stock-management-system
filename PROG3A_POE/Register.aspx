<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="PROG3A_POE.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
      <style>
        body {
            font-family: Arial, Helvetica, sans-serif;
            background-image: url('Pictures/farms.jpg');
        }
        form {
            border: 3px solid #f1f1f1;
        }
        input[type=text], input[type=password] {
            width: 100%;
            padding: 12px 20px;
            margin: 8px 0;
            display: inline-block;
            border: 1px solid #ccc;
            box-sizing: border-box;
        }
        button:hover {
            opacity: 0.8;
        }
        .cnbtn {
            background-color: #4CAF50 ;
            color: white;
            padding: 14px 20px;
            margin: 8px 0;
            border: none;
            cursor: pointer;
            width: 49%;
        }
        .lgnbtn {
            background-color:#ec3f3f;
            color: white;
            padding: 14px 20px;
            margin: 8px 0;
            border: none;
            cursor: pointer;
            width: 50%;
        }
        .imgcontainer {
            text-align: center;
            margin: 24px 0 12px 0;
        }
        img.avatar {
            width: 40%;
            border-radius: 50%;
        }
        .container {
            padding: 16px;
            background: rgba(0,0,0,0.5);
            position:absolute;
            top:50%;
            left: 50%;
            transform: translate(-50%, -50%);
        }
        span.psw {
            float: right;
            padding-top: 16px;
        }
        /* Change styles for span and cancel button on extra small screens */
        @media screen and (max-width: 300px) {
            span.psw {
                display: block;
                float: none;
            }
            .cnbtn {
                width: 100%;
            }
        }
        .frmalg {
            margin: auto;
            width: 40%;
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
    </style>
</head>
<body>
    <form id="registerform" runat="server">
            <div class="topnav">
  <a  href="#home">Home</a>
  <a class="active" href="Register.aspx">Add Farmer</a>
 <a href="Login.aspx">Log Out</a>
</div>
    
        <div class="container">
            <center>
                <h3> Log In </h3>
            </center>
            <label for="firstName"><b>First Name</b></label>
            <asp:TextBox ID="fName" runat="server"></asp:TextBox>
            <label for="Surname"><b>Surname</b></label>
           <asp:TextBox ID="sName" runat="server" ></asp:TextBox>
             <label for="uname"><b>Username</b></label>
            <asp:TextBox ID="userName" runat="server"></asp:TextBox>
             <label for="psw"><b>Password</b></label>
           <asp:TextBox ID="password" runat="server" TextMode="Password"></asp:TextBox>

            <asp:Button runat="server" ID="btnBack" CssClass="lgnbtn" Text="Back" OnClick="btnBack_Click" />
            <asp:Button runat="server" ID="btnAdduser"   Text="Add Farmer" class="cnbtn" OnClick="btnAdduser_Click"   />
        </div>
    </form>
</body>
</html>
