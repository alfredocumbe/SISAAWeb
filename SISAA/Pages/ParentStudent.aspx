<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ParentStudent.aspx.cs" Inherits="SISAA.Pages.ParentStudent" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Body" runat="server">
    <section class="content">

        <!-- Content Header (Page header) -->
        <div class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1 class="m-0 text-dark">Estudantes do encarregado <small class="parentName text-bold"></small></h1>
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
                                <h3 class="card-title">Estudantes Associados</h3>
                            </div>
                            <!-- /.card-header -->
                            <div class="pt-1">
                                <div class="">

                                    <div class="card-body">
                                        <table id="studentsParents" class="table table-hover table-responsive">
                                            <thead>
                                                <tr>
                                                    <th>Nome</th>
                                                    <th>Sexo</th>
                                                    <th>Operações</th>
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

                        <div class="card card-primary">
                            <div class="card-header">
                                <h3 class="card-title">Associar Estudantes</h3>
                            </div>
                            <!-- /.card-header -->
                            <div class="pt-1">
                                <div class="">

                                    <div class="card-body">
                                        <table id="students" class="table table-hover table-responsive">
                                            <thead>
                                                <tr>
                                                    <th>Nome</th>
                                                    <th>Sexo</th>
                                                    <th>Operações</th>
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
    <script src="/Scripts/Controller/ParentStudent.js"></script>

    <script type="text/javascript">
        $(function () {

            $('#students').removeAttr('width').DataTable({
                scrollX: false,
                scrollCollapse: false,
                paging: true,
                columnDefs: [
                    { width: 500, targets: 0 },
                    { width: 200, targets: 1 },
                    { width: 75, targets: 2 }
                ],
                fixedColumns: true
            });

            $('#studentsParents').removeAttr('width').DataTable({
                scrollX: false,
                scrollCollapse: false,
                paging: true,
                columnDefs: [
                    { width: 500, targets: 0 },
                    { width: 200, targets: 1 },
                    { width: 75, targets: 2 }
                ],
                fixedColumns: true
            });
                       
        })
    </script>
</asp:Content>
