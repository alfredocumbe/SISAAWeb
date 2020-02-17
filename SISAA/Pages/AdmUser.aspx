<%@ Page Title="Utilizadores" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AdmUser.aspx.cs" Inherits="SISAA.Pages.AdmUser" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Body" runat="server">

    <section class="content">
                        
        <!-- Content Header (Page header) -->
        <div class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1 class="m-0 text-dark">Consulta de Utilizadores</h1>
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
                    <!-- right column -->
                    <div class="col-md-12">
                        <!-- general form elements disabled -->
                        <div class="card card-primary">
                            <div class="card-header">
                                <h3 class="card-title">Lista de Utilizadores</h3>
                            </div>
                            <div class="pt-1">
                            <!-- /.card-header -->
                            <div class="">
                                <input type="hidden" class="form-control" id="UsersData">
                                <!-- /.card-header -->
                                <div class="card-body">
                                    <table id="users" class="table table-hover table-responsive">
                                        <thead>
                                                <tr>
                                                    <th style="width: 40%">Nome</th>
                                                    <th style="width: 10%">Username</th>
                                                    <th style="width: 10%">Celular</th>
                                                    <th style="width: 10%">Bloqueado</th>
                                                    <th style="width: 20%">OPERA&Ccedil;&Otilde;ES</th>
                                                </tr>
                                            </thead>
                                        <tbody>                                      

                                        </tbody>
                                    </table>
                                </div>
                                <!-- /.card-body -->
                            </div>
                            <!-- /.card-body -->
                            </div>
                        </div>
                        <!-- /.card -->

                    </div>
                    <!--/.col (right) -->
                </div>
                <!-- /.row -->
            </div>

            <%--Modals--%>

            <div class="modal fade" id="editUser">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title">Alterar dados do utilizador</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">

                            <!-- form start -->
                            <div class="card-body">
                                <div class="form-group">
                                    <label for="userFullName">Nome Completo</label>
                                    <input type="hidden" class="form-control" id="userID">
                                    <input type="text" class="form-control" id="userFullName" required>
                                </div>

                                <div class="form-group">
                                    <label for="userName">Login</label>
                                    <input type="text" class="form-control" id="userName" placeholder="Username" required>
                                </div>

                                <!-- /.card-body -->
                            </div>
                            <div class="modal-footer justify-content-between">
                                <button type="button" class="btn btn-default" data-dismiss="modal">Fechar</button>
                                <button type="submit" class="btn btn-primary">Editar Utilizador</button>
                            </div>
                        </div>
                        <!-- /.modal-content -->
                    </div>

                    <!-- /.modal-dialog -->
                </div>

                </div>
            <div class="modal fade" id="changePassword">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title">DADOS DE ACESSO</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">

                            <!-- form start -->
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-sm-12">
                                        <div class="form-group">
                                            <label for="userPassword">Password</label>
                                            <input type="password" class="form-control" id="userPassword">
                                        </div>
                                        <div class="form-group">
                                            <label for="userConfirm">Confirm Password</label>
                                            <input type="password" class="form-control" id="userConfirm">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- /.card-body -->
                        </div>
                        <div class="modal-footer justify-content-between">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Fechar</button>
                            <button type="submit" class="btn btn-primary">Alterar Password</button>
                        </div>
                    </div>
                    <!-- /.modal-content -->
                </div>

                <!-- /.modal-dialog -->
            </div>

            <!-- /.container-fluid -->
        </section>

    </section>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ControllerScript" runat="server">
<script src="/Scripts/Controller/AdmUser.js"></script>

    <script type="text/javascript">
        $(function () {
            loadingStop();
            $("#users").DataTable();
        })
    </script>


</asp:Content>
