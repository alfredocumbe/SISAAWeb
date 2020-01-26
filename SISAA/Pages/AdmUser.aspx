<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AdmUser.aspx.cs" Inherits="SISAA.Pages.AdmUser" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Body" runat="server">

    <section class="content">

        <div class="card card-solid">
            <div class="card-body pb-10">
                <div class="row d-flex align-items-stretch">
                    <div class="col-9">
                        <div class="col-sm-9">
                            <h1>CONSULTA DE UTILIZADORES</h1>
                        </div>
                    </div>
                    <div class="col-3">
                    </div>
                </div>
            </div>
        </div>

        <section class="content">
            <div class="container-fluid">
                <div class="row">
                    <!-- right column -->
                    <div class="col-md-12">
                        <!-- general form elements disabled -->
                        <div class="card card-primary">
                            <div class="card-header">
                                <h3 class="card-title">LISTA DE UTILIZADORES</h3>
                            </div>
                            <!-- /.card-header -->
                            <div class="">
                                <div class="card-header">
                                    <h3 class="card-title"></h3>

                                    <div class="card-tools">
                                        <div class="input-group input-group-sm" style="width: 300px;">
                                            <input type="text" name="table_search" class="form-control float-right" placeholder="Search">

                                            <div class="input-group-append">
                                                <button type="submit" class="btn btn-default"><i class="fas fa-search"></i></button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- /.card-header -->
                                <div class="card-body table-responsive p-0" style="height: 300px;">
                                    <table class="table table-head-fixed text-nowrap">
                                        <thead>
                                            <tr>
                                                <th class="d-none">ID</th>
                                                <th style="width: 50%">Nome</th>
                                                <th style="width: 15%">Username</th>
                                                <th style="width: 25%">Email</th>
                                                <th style="width: 20%"></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td class="d-none">183</td>
                                                <td>John Doe</td>
                                                <td>emananze</td>
                                                <td>elisiomananze@gmail.com</td>
                                                <td>
                                                    <div class="btn-group" role="group" aria-label="Button group with nested dropdown">
                                                        <div class="btn-group" role="group">
                                                            <button id="btnGroupDrop1" type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                                Comando
                                                            </button>
                                                            <div class="dropdown-menu" aria-labelledby="btnGroupDrop1">
                                                                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#EditarGrupo">Editar Utilizador</a>
                                                                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#ChangePasssword">Alterar Password</a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="d-none">183</td>
                                                <td>John Doe</td>
                                                <td>emananze</td>
                                                <td>elisiomananze@gmail.com</td>
                                                <td>
                                                    <div class="btn-group" role="group" aria-label="Button group with nested dropdown">
                                                        <div class="btn-group" role="group">
                                                            <button id="btnGroupDrop2" type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                                Comando
                                                            </button>
                                                            <div class="dropdown-menu" aria-labelledby="btnGroupDrop1">
                                                                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#EditarGrupo">Editar Utilizador</a>
                                                                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#ChangePasssword">Alterar Password</a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>

                                        </tbody>
                                    </table>
                                </div>
                                <!-- /.card-body -->
                            </div>
                            <!-- /.card-body -->

                        </div>
                        <!-- /.card -->

                    </div>
                    <!--/.col (right) -->
                </div>
                <!-- /.row -->
            </div>

            <%--Modals--%>

            <div class="modal fade" id="EditarGrupo">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title">ALTERAR DADOS DE UTILIZADOR</h4>
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
                                            <label for="exampleInputName">Nome Completo</label>
                                            <input type="text" class="form-control" id="studentName">
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputEmail">Email</label>
                                            <input type="email" class="form-control" id="exampleInputEmail">
                                        </div>
                                    </div>

                                </div>
                                <div class="row">
                                    <div class="col-sm-6">

                                        <div class="form-group">
                                            <div class="form-check">
                                                <input class="form-check-input" type="checkbox" value="M" name="enabled">
                                                <label class="form-check-label">Desativar</label>
                                            </div>
                                            <div class="form-check">
                                                <input class="form-check-input" type="checkbox" value="F" name="bloqued">
                                                <label class="form-check-label">Bloquear</label>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                            <!-- /.card-body -->
                        </div>
                        <div class="modal-footer justify-content-between">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Fechar</button>
                            <button type="button" class="btn btn-primary">Editar Utilizador</button>
                        </div>
                    </div>
                    <!-- /.modal-content -->
                </div>

                <!-- /.modal-dialog -->
            </div>


            <div class="modal fade" id="ChangePasssword">
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
                                            <input type="password" class="form-control" id="userPassword" placeholder="Password">
                                        </div>
                                        <div class="form-group">
                                            <label for="userConfirm">Confirm Password</label>
                                            <input type="password" class="form-control" id="userConfirm" placeholder="Confirm Password">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- /.card-body -->
                        </div>
                        <div class="modal-footer justify-content-between">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Fechar</button>
                            <button type="button" class="btn btn-primary">Alterar Password</button>
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
</asp:Content>
