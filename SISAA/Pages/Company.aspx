<%@ Page Title="Empresas" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Company.aspx.cs" Inherits="SISAA.Pages.Company" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Body" runat="server">
    <section class="content">

        <!-- Content Header (Page header) -->
        <div class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1 class="m-0 text-dark">Consulta de Escolas</h1>
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
                                <h3 class="card-title">Lista de Escolas</h3>
                            </div>
                            <div class="pt-1">
                                <!-- /.card-header -->
                                <div class="">
                                    <input type="hidden" class="form-control" id="AccountsData">
                                    <!-- /.card-header -->
                                    <div class="card-body">
                                        <table id="accounts" class="table table-hover table-responsive">
                                            <thead>
                                                <tr>
                                                    <th class="d-none">ID</th>
                                                    <th style="width: 20%">Nome Abreviatura</th>
                                                    <th style="width: 50%">Nome Longo</th>
                                                    <th style="width: 10%">Saldo</th>
                                                    <th style="width: 10%">Activo</th>
                                                    <th style="width: 10%">Operações</th>
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

            <div class="modal fade" id="editAccount">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title">Altarar dados da Escola</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">

                            <!-- form start -->
                            <div class="card-body">
                                    <div class="form-group">
                                        <label for="exampleInputName">Nome Abreviado</label>
                                        <input type="hidden" class="form-control" id="accountID" >
                                        <input type="text" class="form-control" id="ShortName">
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputEmail">Nome Longo</label>
                                        <input type="text" class="form-control" id="LongName">
                                    </div>

                            </div>
                            <!-- /.card-body -->
                        </div>
                        <div class="modal-footer justify-content-between">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Fechar</button>
                            <button type="submit" class="btn btn-primary">Editar Escola</button>
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
    <script src="/Scripts/Controller/Company.js"></script>
    <script type="text/javascript">
        $(function () {
            $("#accounts").DataTable(
                {
                    "columnDefs": [
                        {
                            "targets": [0],
                            "visible": false,
                            "searchable": false
                        }
                    ]
                });
        })
    </script>

</asp:Content>
