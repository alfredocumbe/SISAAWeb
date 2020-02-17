<%@ Page Title="Envidas" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Sent.aspx.cs" Inherits="SISAA.Pages.Sent" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server"></asp:Content>

<asp:Content ID="BodyContent" ContentPlaceHolderID="Body" runat="server">

    <!-- Content Header (Page header) -->
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1 class="m-0 text-dark">Historico de Mensagens Enviadas</h1>
                </div>
                <!-- /.col -->
                <div class="col-sm-6">
                </div>
                <!-- /.col -->
            </div>
            <!-- /.row -->
        </div>
        <!-- /.container-fluid -->
    </section>
    <!-- /.content-header -->

    <section class="content">
        <div class="container-fluid">
            <div class="row">
                <!-- right column -->
                <div class="col-md-12">
                    <!-- general form elements disabled -->
                    <div class="card card-primary">
                        <div class="card-header">
                            <h3 class="card-title">Historico de Mensagens Enviadas</h3>
                        </div>
                        <!-- /.card-header -->
                        <div class="pt-1">
                            <input type="hidden" class="form-control" id="SentData">
                            <div class="">

                                <div class="card-body">
                                    <table id="sentsms" class="table table-hover table-responsive">
                                        <thead>
                                            <tr>
                                                <th style="width: 50%;">Mensagem</th>
                                                <th style="width: 20%;">Data de Envio</th>
                                                <th style="width: 20%;">Turma</th>
                                                <th style="width: 10%;">Operações</th>
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

        <!-- /.container-fluid -->
    </section>



</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ControllerScript" runat="server">

    <script src="/Scripts/Controller/SentSms.js"></script>

    <script type="text/javascript">
        $(function () {

            $("#sentsms").DataTable();
        })
    </script>


</asp:Content>
