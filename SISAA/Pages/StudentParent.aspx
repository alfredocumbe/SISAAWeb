<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="StudentParent.aspx.cs" Inherits="SISAA.Pages.StudentParent" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Body" runat="server">
    <section class="content">

        <!-- Content Header (Page header) -->
        <div class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1 class="m-0 text-dark">Encarregados  do estudante <small class="studentName text-bold"></small></h1>
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
                                <h3 class="card-title">Encarregados do Estudante</h3>
                            </div>
                            <!-- /.card-header -->
                            <div class="pt-1">
                                <div class="">

                                    <div class="card-body">
                                        <table id="studentsParents" class="table table-hover table-responsive">
                                            <thead>
                                                <tr>
                                                    <th>Nome</th>
                                                    <th>Profissção</th>
                                                    <th>Endereço</th>
                                                    <th>Celular</th>
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
                                <h3 class="card-title">Associar Encarregados</h3>
                            </div>
                            <!-- /.card-header -->
                            <div class="pt-1">
                                <input type="hidden" class="form-control" id="StudentsData">
                                <div class="">

                                    <div class="card-body">
                                        <table id="parents" class="table table-hover table-responsive">
                                            <thead>
                                                <tr>
                                                    <th>Nome</th>
                                                    <th>Profissção</th>
                                                    <th>Endereço</th>
                                                    <th>Celular</th>
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
    <script src="/Scripts/Controller/StudentParent.js"></script>

    <script type="text/javascript">
        $(function () {

            
            $('#parents').removeAttr('width').DataTable({
                scrollX: false,
                scrollCollapse: false,
                paging: true,
                columnDefs: [
                    { width: 300, targets: 0 },
                    { width: 100, targets: 1 },
                    { width: 250, targets: 2 },
                    { width: 150, targets: 3 },
                    { width: 75, targets: 4 }
                ],
                fixedColumns: true
            });

            $('#studentsParents').removeAttr('width').DataTable({
                scrollX: false,
                scrollCollapse: false,
                paging: true,
                columnDefs: [
                    { width: 300, targets: 0 },
                    { width: 100, targets: 1 },
                    { width: 250, targets: 2 },
                    { width: 150, targets: 3 },
                    { width: 75, targets: 4 }
                ],
                fixedColumns: true
            });
                       
        })
    </script>
</asp:Content>
