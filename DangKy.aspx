﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DangKy.aspx.cs" Inherits="DangKy" EnableEventValidation="false"  %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Đăng Ký</title>
     <!-- Required meta tags-->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Colorlib Templates">
    <meta name="author" content="Colorlib">
    <meta name="keywords" content="Colorlib Templates">

    <!-- Title Page-->
   
    <!-- Icons font CSS-->
    <link href="vendor/mdi-font/css/material-design-iconic-font.min.css" rel="stylesheet" media="all">
    <link href="vendor/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet" media="all">
    <!-- Font special for pages-->
    <link href="https://fonts.googleapis.com/css?family=Poppins:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

    <!-- Vendor CSS-->
    <link href="vendor/select2/select2.min.css" rel="stylesheet" media="all">
    <link href="vendor/datepicker/daterangepicker.css" rel="stylesheet" media="all">

    <!-- Main CSS-->
    <link href="css/main.css" rel="stylesheet" media="all">
</head>
<body>
    <form id="form1" runat="server">
     <div class="page-wrapper bg-gra-01 p-t-180 p-b-100 font-poppins">
        <div class="wrapper wrapper--w780">
            <div class="card card-3">
                <div class="card-heading"></div>
                <div class="card-body">
                    <h2 class="title">Thông tin đăng ký</h2>
                    <form >

                         <div class="input-group">
                            <asp:Label  runat="server" id="TextBox4" class="input--style-3" />
                        </div>
                        <div class="input-group">
                            <asp:TextBox  runat="server" id="TextBox1" class="input--style-3" placeholder="Tài Khoản" name="name"/>
                        </div>
                        
                        <div class="input-group">
                            <asp:TextBox TextMode="Password" runat="server" id="TextBox2" class="input--style-3" placeholder="Mật Khẩu" name="name"/>
                        </div>
                        <div class="input-group">
                           <asp:TextBox  runat="server" id="TextBox3" class="input--style-3" placeholder="Họ và Tên" name="name"/>
                        </div>
                        <div class="p-t-10">
                            <asp:Button runat="server" class="btn btn--pill btn--green" Text="Đăng Ký"  OnClick="btnDangKy"></asp:Button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Jquery JS-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <!-- Vendor JS-->
    <script src="vendor/select2/select2.min.js"></script>
    <script src="vendor/datepicker/moment.min.js"></script>
    <script src="vendor/datepicker/daterangepicker.js"></script>

    <!-- Main JS-->
    <script src="js/global.js"></script>
    </form>
</body>
</html>
