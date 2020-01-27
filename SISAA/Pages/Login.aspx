<%@ Page Title="" Language="C#"  AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="SISAA.Pages.Login" %>
<!DOCTYPE html>

<html lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title><%: Page.Title %> - My ASP.NET Application</title>

    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="/SISAA/plugins/fontawesome-free/css/all.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
    <!-- iCheck -->
    <link rel="stylesheet" href="/SISAA/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="/SISAA/dist/css/adminlte.min.css">
    <!-- Google Font: Source Sans Pro -->
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">

    <%--for editable table --%>
    <link rel="stylesheet" href="/SISAA/Content/Site.css">

</head>
<body class="hold-transition login-page">

<div class="login-box">  
  <!-- /.login-logo -->
  <div class="card">
    <div class="card-body login-card-body">
    <div class="row pb-3">
        <img class="profile-img" src="/SISAA/dist/img/LogoSISAAA.png">
    </div>
      <form method="post" id="form1" runat="server">
        <div class="input-group mb-3">
          <asp:TextBox runat="server" CssClass="form-control" placeholder="Email/Username" ID="txtUsername" ></asp:TextBox>
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-envelope"></span>
            </div>
          </div>
        </div>
        <div class="input-group mb-3">
          <asp:TextBox runat="server" CssClass="form-control" placeholder="Password" ID="txtPassword"></asp:TextBox>
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-lock"></span>
            </div>
          </div>
        </div>
        <div class="row">          
          <!-- /.col -->
          <div class="col-12">
            <asp:Button runat="server" CssClass="btn btn-primary btn-block" ID="btnLogin" style="background: #29A9E1;" OnClick="btnLogin_Click" Text="ENTRAR"></asp:Button>
          </div>
          <!-- /.col -->
        </div>
      </form>

    </div>
    <!-- /.login-card-body -->
  </div>
</div>
<!-- /.login-box -->

    <script src="/SISAA/plugins/jquery/jquery.min.js"></script> 
    <!-- Bootstrap 4 -->
    <script src="/SISAA/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- SweetAlert2 -->
    <script src="/SISAA/plugins/sweetalert2/sweetalert2.min.js"></script>
    <!-- AdminLTE App -->
    <script src="/SISAA/dist/js/adminlte.js"></script>
    <script src="/SISAA/Scripts/Global.js"></script>
     <script src="/SISAA/Scripts/Controller/Logins.js"></script>

</body>
</html>
