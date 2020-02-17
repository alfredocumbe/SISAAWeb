<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ListAccountBalance.aspx.cs" Inherits="SISAA.Pages.AccountBalance" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Body" runat="server">
    <section class="content">

        <!-- Content Header (Page header) -->
        <div class="content-header">
            <div class="container-fluid">
                <div class="row mb-1">
                    <div class="col-sm-6">
                        <h1 class="m-0 text-dark">Saldos da Conta</h1>
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
        <div class="content-header">
            <div class="container-fluid">
                <div class="row ">
                    <div class="info-box col-md-12">
                        <div class="col-md-6 col-sm-6 col-12">

                            <div class="form-group row">
                                <label for="inputEmail3" class="col-sm-2 col-form-label">Empresa</label>
                                <div class="col-sm-10">
                                    <select class="form-control" id="Accounts">
                                </select>
                                </div>
                            </div>

                        </div>
                        <!-- /.col -->
                        <div class="col-m6-6 col-sm-6 col-12">
                            <div class="form-group">
                                <button type="submit" class="btn btn-primary">Pesquizar</button>
                            </div>


                        </div>
                    </div>
                    <!-- /.col -->
                </div>
                <!-- /.row -->
            </div>
            <!-- /.container-fluid -->
        </div>


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
    <script src="/Scripts/Controller/ListAccountBalance.js"></script>

    <script type="text/javascript">
        $(function () {

            $('#balance').removeAttr('width').DataTable({
                scrollX: false,
                scrollCollapse: false,
                paging: true,
                columnDefs: [
                    { width: 100, targets: 0 },
                    { width: 100, targets: 1 },
                    { width: 150, targets: 2},
                    { width: 200, targets: 3 },
                    { width: 200, targets: 4 }
                ],
                fixedColumns: true
            });
        })
    </script>
</asp:Content>
