<%@ Page Title="Encarregados" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Parent.aspx.cs" Inherits="SISAA.Pages.Parent" %>


<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server"></asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="Body" runat="server">

    <section class="content">

        <!-- Content Header (Page header) -->
        <div class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1 class="m-0 text-dark">Consulta de Encarregados</h1>
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
                                <h3 class="card-title">Lista de Encarregados</h3>
                            </div>
                            <!-- /.card-header -->
                            <div class="pt-1">
                                <div class="">
                                    <input type="hidden" class="form-control" id="ParentsData">
                                    <!-- /.card-header -->
                                    <div class="card-body">
                                        <table id="parentes" class="table table-hover table-responsive">

                                            <thead>
                                                <tr>
                                                    <th >Nome</th>
                                                    <th >Profissão</th>
                                                    <th >Enderreço</th>
                                                    <th >Celular</th>
                                                    <th >Operações</th>
                                                </tr>
                                            </thead>

                                            <tbody>
                                            </tbody>
                                        </table>
                                    </div>
                                    <!-- /.card-body -->
                                </div>
                                <!-- /.card-body -->
                            </div>
                        </div>
                        <!-- /.card -->

                    </div>
                    <!--/.col (right) -->
                </div>
                <!-- /.row -->
            </div>
            <%--Modals--%>

            <div class="modal fade" id="editParent">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title">Alterar Dados do Encarregado</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">

                            <!-- form start -->
                            <div class="card-body">
                                <div class="form-group">
                                    <label for="parentName">Nome Completo</label>
                                    <input type="hidden" class="form-control" id="parentID">
                                    <input type="text" class="form-control" id="parentName" required>
                                </div>
                                <div class="row">
                                    <div class="col-6">
                                        <div class="form-group">
                                            <label for="parentProfissao">Profissao</label>
                                            <input type="text" class="form-control" id="parentProfissao" required>
                                        </div>

                                    </div>
                                    <div class="col-6">
                                        <div class="form-group">
                                            <label for="parentPhone">Celular</label>
                                            <input type="text" class="form-control" id="parentPhone" required>
                                        </div>

                                    </div>

                                </div>

                                <div class="form-group">
                                    <label for="parentAddress">Endereco</label>
                                    <input type="text" class="form-control" id="parentAddress" required>
                                </div>



                            </div>
                            <!-- /.card-body -->
                        </div>
                        <div class="modal-footer justify-content-between">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Fechar</button>
                            <button type="submit" class="btn btn-primary">Editar Encarregado</button>
                        </div>
                    </div>
                    <!-- /.modal-content -->
                </div>



                <!-- /.modal-dialog -->
            </div>
                       
            <div id="modelContainer">
            </div>

            <%-- Fim Lista de Modal --%>



            <!-- /.container-fluid -->
        </section>

    </section>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ControllerScript" runat="server">
    <script type="text/javascript">
        $(function () {

            $('#parentes').removeAttr('width').DataTable({
                scrollX: false,
                scrollCollapse: false,
                paging: true,
                columnDefs: [
                    { width: 200, targets: 0 },
                    { width: 200, targets: 1 },
                    { width: 150, targets: 2 },
                    { width: 120, targets: 3 },
                    { width: 70, targets: 4 }
                ],
                fixedColumns: true
            });

        })
    </script>

    <script src="/Scripts/Controller/Parent.js"></script>

</asp:Content>
