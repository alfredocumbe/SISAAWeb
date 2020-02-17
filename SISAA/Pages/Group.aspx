<%@ Page Title="Turmas" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Group.aspx.cs" Inherits="SISAA.Pages.Group" %>


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
                                    <table class="table table-hover table-responsive" id="group">
                                        <thead>
                                            <tr>
                                                <th>Nome</th>
                                                <th>Operações</th>
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
                <%--Modals--%>

                <div class="modal fade" id="editGroup">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title">Alterar Dados da Turma</h4>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">

                                <!-- form start -->
                                <div class="card-body">
                                    <div class="form-group">
                                        <label for="groupName">Nome</label>
                                        <input type="hidden" class="form-control" id="groupID">
                                        <input type="text" class="form-control" id="groupName" placeholder="">
                                    </div>


                                </div>
                                <!-- /.card-body -->
                            </div>
                            <div class="modal-footer justify-content-between">
                                <button type="button" class="btn btn-default" data-dismiss="modal">Fechar</button>
                                <button type="submit" class="btn btn-primary">Editar Turma</button>
                            </div>
                        </div>
                        <!-- /.modal-content -->
                    </div>
                    <!-- /.modal-dialog -->
                </div>

            </div>
            <!-- /.container-fluid -->
        </section>

    </section>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ControllerScript" runat="server">
    <script type="text/javascript">
        $(function () {
            //Bootstrap Duallistbox
            $('.duallistbox').bootstrapDualListbox();
       
            $('#group').removeAttr('width').DataTable({
                scrollX: false,
                scrollCollapse: false,
                paging: true,
                columnDefs: [
                    { width: 700, targets: 0 },
                    { width: 200, targets: 1 }
                ],
                fixedColumns: true
            });

        })
    </script>
    <script src="/Scripts/Controller/Group.js"></script>
</asp:Content>
