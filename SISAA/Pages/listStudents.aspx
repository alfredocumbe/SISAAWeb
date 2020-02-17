<%@ Page Title="Estudantes" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ListStudents.aspx.cs" Inherits="SISAA.Pages.ListStudents" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server"></asp:Content>

<asp:Content ID="BodyContent" ContentPlaceHolderID="Body" runat="server">

    <!-- Content Header (Page header) -->
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1 class="m-0 text-dark">Consulta de Estudantes</h1>
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
                            <h3 class="card-title">Lista de Estudantes</h3>
                        </div>
                        <!-- /.card-header -->
                        <div class="pt-1">
                            <div class="">

                                <div class="card-body">
                                    <table id="example1" class="table table-hover table-responsive"  style="width:100%">
                                        <thead>
                                            <tr>
                                                <th style="width: 70% !important;">Nome</th>
                                                <th style="width: 30% !important;">Sexo</th>
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



</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ControllerScript" runat="server">

    <script src="/Scripts/Controller/ListStudent.js"></script>

    <script type="text/javascript">
        $(function () {
            $('#example1').removeAttr('width').DataTable({
                scrollY: "200px",
                scrollX: false,
                scrollCollapse: false,
                paging: true,
                columnDefs: [
                    { width: 530, targets: 0 },
                    { width: 300, targets: 1 }
                ],
                fixedColumns: true
            });

        })
    </script>


</asp:Content>
