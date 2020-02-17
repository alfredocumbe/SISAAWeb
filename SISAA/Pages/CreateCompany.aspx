<%@ Page Title="Criação de Empresas" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CreateCompany.aspx.cs" Inherits="SISAA.Pages.CreateCompany" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Body" runat="server">

<section class="content">

        <!-- Content Header (Page header) -->
        <div class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1 class="m-0 text-dark">Nova Escola</h1>
                    </div>
                    <!-- /.col -->
                    <div class="col-sm-6">
                    </div>
                    <!-- /.col -->
                </div>
                <!-- /.row -->
            </div>
            <!-- /.container-fluid -->
        </div>
        <!-- /.content-header -->

        <section class="content">
            <div class="container-fluid">
                <div class="row">
                    <!-- left column -->
                    <div class="col-md-12">
                        <!-- general form elements -->
                        <div class="card card-primary">
                            <div class="card-header">
                                <h3 class="card-title">Dados Gerais</h3>
                            </div>
                            <!-- /.card-header -->
                            <!-- form start -->
                            <div class="card-body">

                                <div class="row">
                                    <div class="col-sm-3">
                                        <div class="form-group">
                                            <label for="companyShortName">Nome Abreviado</label>
                                            <input type="text" class="form-control" id="companyShortName" placeholder="Digita Nome Abreviado" required="Campo de caracter obrigatório">
                                        </div>                                                                             
                                        
                                    </div>
                                    <div class="col-sm-9">                                        

                                        <div class="form-group">
                                            <label for="userName">Nome Longo</label>
                                            <input type="text" class="form-control" id="companyLongName" placeholder="Digite Nome Longo" required="Campo de caracter obrigatório">
                                        </div>

                                    </div>

                                </div>
                                                         

                                <div class="">
                                    <button type="submit" class="btn btn-primary">Criar Escola</button>
                                </div>

                            </div>
                            <!-- /.card-body -->
                        </div>
                        <!-- /.card -->

                    </div>
                    <!--/.col (left) -->
                </div>
                <!-- /.row -->
            </div>
            <!-- /.container-fluid -->
        </section>

    </section>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ControllerScript" runat="server">
    <script src="/Scripts/Controller/CreateAccount.js"></script>
    <script type="text/javascript">
        $(function () {
            loadingStop();
        })
    </script>

</asp:Content>
