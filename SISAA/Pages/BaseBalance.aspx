<%@ Page Title="Utilizadores" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BaseBalance.aspx.cs" Inherits="SISAA.Pages.BaseBalance" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Body" runat="server">

    <section class="content">

        <!-- Content Header (Page header) -->
        <div class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1 class="m-0 text-dark">Conta principal</h1>
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
                                <h3 class="card-title">Recarregar a conta</h3>
                            </div>
                            <!-- /.card-header -->
                            <!-- form start -->
                            <div class="card-body">

                                <div class="row">
                                    <div class="info-box col-md-12">

                                        <div class="col-md-3 col-sm-3 col-4">
                                            <div class="info-box">
                                                <span class="info-box-icon bg-success"><i class="far fa-envelope"></i></span>

                                                <div class="info-box-content">
                                                    <span class="info-box-text">Saldo disponivel</span>
                                                    <span class="info-box-number" id="currentBalance"></span>
                                                </div>
                                                <!-- /.info-box-content -->
                                            </div>
                                            <!-- /.info-box -->
                                        </div>

                                        <div class="col-md-3 col-sm-3 col-4">

                                            <div class="form-group row">
                                                <label for="inputEmail3" class="col-sm-6 col-form-label">Tipo de Operação</label>
                                                <div class="col-sm-6">
                                                    <select class="form-control" id="transationType">
                                                        <option value='0'></option>
                                                        <option value='IN'>Crédito</option>
                                                        <option value='OUT'>Débito</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-md-3 col-sm-3 col-4">
                                            <div class="form-group row">
                                                <label for="inputEmail3" class="col-sm-6 col-form-label">Quantidade de SMS's</label>
                                                <div class="col-sm-6">
                                                    <input type="number" class="form-control" id="quantity" min="1" max="99999999999" required="Campo de caracter obrigatório">
                                                </div>
                                            </div>
                                        </div>
                                        <!-- /.col -->
                                        <div class="col-md-3 col-sm-3 col-4">
                                            <div class="form-group">
                                                <button type="submit" class="btn btn-primary">Gravar operação</button>
                                            </div>

                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <!-- /.card-body -->
                    </div>
                    <!-- /.card -->

                </div>
                <!--/.col (left) -->
            </div>
            <!-- /.row -->
        </section>
        <section class="content">
            <div class="container-fluid">
                <div class="row">
                    <!-- right column -->
                    <div class="col-md-12">

                        <div class="card card-primary">
                            <div class="card-header border-transparent">
                                <h3 class="card-title">Histórico de Operações</h3>

                                <div class="card-tools">
                                    <button type="button" class="btn btn-tool" data-card-widget="collapse">
                                        <i class="fas fa-minus"></i>
                                    </button>
                                </div>
                            </div>
                            <!-- /.card-header -->
                            <div class="card-body p-1" style="display: block;">

                                <table id="balance" class="table table-hover table-responsive">
                                    <thead style="width: 100%">
                                        <tr>
                                            <th style="width: 10%;">Tipo</th>
                                            <th style="width: 20%;">Valor</th>
                                            <th style="width: 10%;">Saldo</th>
                                            <th style="width: 20%;">Novo Saldo</th>
                                            <th style="width: 50%;">Data da operacao</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    </tbody>

                                </table>
                                <!-- /.table-responsive -->
                            </div>
                        </div>

                    </div>
                    <!--/.col (right) -->
                </div>
                <!-- /.row -->
            </div>
        </section>
    </section>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ControllerScript" runat="server">
    <script>
        $(function () {

            $('#balance').removeAttr('width').DataTable({
                scrollX: false,
                scrollCollapse: false,
                paging: true,
                columnDefs: [
                    { width: 100, targets: 0 },
                    { width: 100, targets: 1 },
                    { width: 150, targets: 2 },
                    { width: 200, targets: 3 },
                    { width: 200, targets: 4 }
                ],
                fixedColumns: true
            });

            loadingStop();
        })
    </script>
    <script src="/Scripts/Controller/BaseBalance.js"></script>
</asp:Content>
