<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ContactGroupReceiveSMS.aspx.cs" Inherits="SISAA.Pages.ContactGroupReceiveSMS" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Body" runat="server">
    <section class="content">

        <!-- Content Header (Page header) -->
        <div class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1 class="m-0 text-dark">Detalhes de Mensagens</h1>
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
                                <h3 class="card-title">Detalhes de Mensagens</h3>
                            </div>
                            <!-- /.card-header -->
                            <div class="pt-1">
                                <div class="">

                                    <div class="card-body">
                                        <table id="smsDetails" class="table table-hover table-responsive">
                                            <thead>
                                                <tr>
                                                    <th style="width: 40%">Mensagem</th>
                                                    <th style="width: 15%">Data</th>
                                                    <th style="width: 20%">Turma</th>
                                                    <th style="width: 10%">Nome</th>
                                                    <th style="width: 10%;">Celular</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            </tbody>

                                        </table>
                                    </div>
                                    <!-- /.card-body -->
                                </div>


                            </div>
                            <!-- /.card-body -->

                        </div>
                        <!-- /.card -->
                                               

                    </div>
                    <!--/.col (right) -->
                </div>
                <!-- /.row -->
            </div>
        </section>

        <section>
        </section>

    </section>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ControllerScript" runat="server">
    <script src="/Scripts/Controller/ContactGroupReceiveSMS.js"></script>

    <script type="text/javascript">
        $(function () {

            $('#smsDetails').removeAttr('width').DataTable({
                scrollX: false,
                scrollCollapse: false,
                paging: true,
                columnDefs: [
                    { width: 400, targets: 0 },
                    { width: 150, targets: 1 },
                    { width: 70, targets: 2 },
                    { width: 100, targets: 3 },
                    { width: 100, targets: 4 }
                ],
                fixedColumns: true
            });
                       
        })
    </script>
</asp:Content>
