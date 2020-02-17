<%@ Page Title="Login" Language="C#"  AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="SISAA.Pages.Login" %>
<!DOCTYPE html>

<html lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title><%: Page.Title %> - SISAA</title>

    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="/plugins/fontawesome-free/css/all.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
    <!-- iCheck -->
    <link rel="stylesheet" href="/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="/dist/css/adminlte.min.css">
    <!-- Google Font: Source Sans Pro -->
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">

    <%--for editable table --%>
    <link rel="stylesheet" href="/Content/Site.css">

</head>
<body class="hold-transition login-page" style="background-image:url('/dist/img/login-register.jpg'); background-color:#c0c0c0;background-attachment:fixed; background-repeat: repeat-y;background-size: cover;">

<div class="login-box" style="width: 400px !important; height: 400px !important;">  
  <!-- /.login-logo -->
  <div class="card">
    <div class="card-body login-card-body">
    <div class="row pb-3">
        <img class="profile-img" src="/dist/img/LogoSISAAA.png">
    </div>
      <form method="post" id="form1" runat="server">
        <div class="input-group mb-3">
          <asp:TextBox runat="server" CssClass="form-control" placeholder="Email/Username" ID="txtUsername" Required="Invalid UserName"></asp:TextBox>
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-envelope"></span>
            </div>
          </div>
        </div>
        <div class="input-group mb-3">
          <asp:TextBox runat="server" CssClass="form-control" placeholder="Password" ID="txtPassword" TextMode="Password" Required="Invalid Password"></asp:TextBox>
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-lock"></span>
            </div>
          </div>
        </div>
        <div class="input-group mb-3">          
          <asp:Button runat="server" CssClass="btn btn-primary btn-block" ID="btnLogin" style="background: #29A9E1;" OnClick="btnLogin_Click" Text="ENTRAR"></asp:Button>
            <div class="col-12">
                <small id="passwordHelp" class="text-danger" runat="server">
                </small>  
            </div>
            <p class="mb-1">
               <a href="ForgotPassword">Esqueci minha senha</a>
            </p>
          <!-- /.col -->
        </div>
      </form>

    </div>
    <!-- /.login-card-body -->
  </div>
</div>
<!-- /.login-box -->

    <script src="/plugins/jquery/jquery.min.js"></script> 
    <!-- Bootstrap 4 -->
    <script src="/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- SweetAlert2 -->
    <script src="/plugins/sweetalert2/sweetalert2.min.js"></script>
    <!-- AdminLTE App -->
    <script src="/dist/js/adminlte.js"></script>
    <script src="/Scripts/Global.js"></script>
<%--     <script src="/SISAA/Scripts/Controller/Logins.js"></script>--%>

</body>
</html>