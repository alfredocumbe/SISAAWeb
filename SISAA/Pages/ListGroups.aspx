<%@ Page Title="Turmas" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ListGroups.aspx.cs" Inherits="SISAA.Pages.ListGroups" %>


<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server"></asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="Body" runat="server">

    <section class="content">
        <!-- Content Header (Page header) -->
        <div class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1 class="m-0 text-dark">Consulta de Turmas</h1>
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
                                <h3 class="card-title">Lista de Turmas</h3>
                            </div>

                            <div class="pt-1">
                            <!-- /.card-header -->
                            <div class=""> 
                                <input type="hidden" class="form-control" id="GroupsData">
                                <!-- /.card-header -->
                                <div class="card-body">
                                    <table class="table table-hover table-responsive" id="group" style="width:100%">
                                        <thead>
                                            <tr>
                                                <th>Nome</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        </tbody>
                                    </table>

                                    <!-- /.card-body -->
                                </div>
                                <!-- /.card-body -->

                            </div>
                            <!-- /.card -->
                            </div>
                        </div>
                        <!--/.col (right) -->
                    </div>
                    <!-- /.row -->
                </div>
                </div>
            <!-- /.container-fluid -->
        </section>

    </section>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ControllerScript" runat="server">
    <script type="text/javascript">
        $(function () {
            $('#group').removeAttr('width').DataTable({
                scrollX: false,
                scrollCollapse: false,
                paging: true,
                columnDefs: [
                    { width: 880, targets: 0}
                ],
                fixedColumns: true
            });

        })
    </script>
    <script src="/Scripts/Controller/ListGroup.js"></script>
</asp:Content>
