<%@ Page Title="Estudantes" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Student.aspx.cs" Inherits="SISAA.Pages.Student" %>

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
                            <input type="hidden" class="form-control" id="StudentsData">
                            <div class="">

                                <div class="card-body">
                                    <table id="example1" class="table table-hover table-responsive">
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

                </div>
                <!--/.col (right) -->
            </div>
            <!-- /.row -->
        </div>

        <%-- Lista de Modal --%>

        <div id="modelContainer">
        </div>

        <div class="modal fade" id="editStudent">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">

                    <div class="modal-header">
                        <h4 class="modal-title">Editar Estudante()</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">

                        <!-- form start -->
                        <div class="card-body">
                            <div class="form-group">
                                <label for="exampleInputName">Nome Completo</label>
                                <input type="hidden" class="form-control" id="studentID">
                                <input type="text" class="form-control" id="studentName" placeholder="Digita nome" required>
                            </div>
                            <div class="form-group">
                                <label for="exampleInputGender">Sexo</label>
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" value="M" name="gender" id="gender_1" checked="true">
                                    <label class="form-check-label">Masculino</label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" value="F" name="gender" id="gender_2">
                                    <label class="form-check-label">Femenino</label>
                                </div>
                            </div>
                        </div>
                        <!-- /.card-body -->
                    </div>
                    <div class="modal-footer justify-content-between">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Fechar</button>
                        <button type="submit" class="btn btn-primary">Editar Utilizador</button>
                    </div>
                </div>
                <!-- /.modal-content -->
            </div>

            <!-- /.modal-dialog -->
        </div>




        <%-- Fim Lista de Modal --%>
        <!-- /.container-fluid -->

        <!-- /.container-fluid -->
    </section>



</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ControllerScript" runat="server">

    <script src="/Scripts/Controller/Student.js"></script>

    <script type="text/javascript">
        $(function () {
            
            $('#example1').removeAttr('width').DataTable({
                scrollX: false,
                scrollCollapse: false,
                paging: true,
                columnDefs: [
                    { width: 500, targets: 0 },
                    { width: 200, targets: 1 },
                    { width: 150, targets: 2 }
                ],
                fixedColumns: true
            });
        })
    </script>


</asp:Content>
