<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Parent.aspx.cs" Inherits="SISAA.Parent" %>


<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server"></asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="Body" runat="server">

    <section class="content">

        <div class="card card-solid">
            <div class="card-body pb-10">
                <div class="row d-flex align-items-stretch">
                    <div class="col-9">
                        <div class="col-sm-9">
                            <h1>LISTA DE ENCARREGADOS</h1>
                        </div>
                    </div>
                    <div class="col-3">
                    </div>
                </div>
            </div>
        </div>

        <section class="content">
            <div class="container-fluid">
                <div class="row">
                    <!-- right column -->
                    <div class="col-md-12">
                        <!-- general form elements disabled -->
                        <div class="card card-primary">
                            <div class="card-header">
                                <h3 class="card-title">LISTA DE ENCARREGADOS</h3>
                            </div>
                            <!-- /.card-header -->
                            <div class="">
                                <div class="card-header">
                                    <h3 class="card-title"></h3>

                                    <div class="card-tools">
                                        <div class="input-group input-group-sm" style="width: 300px;">
                                            <input type="text" name="table_search" class="form-control float-right" placeholder="Search">

                                            <div class="input-group-append">
                                                <button type="submit" class="btn btn-default"><i class="fas fa-search"></i></button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- /.card-header -->
                                <div class="card-body table-responsive p-0" style="height: 300px;">
                                    <table class="table table-head-fixed text-nowrap">
                                        <thead>
                                            <tr>
                                                <th class="d-none">ID</th>
                                                <th style="width: 40%">Nome</th>
                                                <th style="width: 15%">Profissao</th>
                                                <th style="width: 25%">Endereco</th>
                                                <th style="width: 10%">Celular</th>
                                                <th style="width: 20%"></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td class="d-none">183</td>
                                                <td>John Doe</td>
                                                <td>Tecnico IT</td>
                                                <td>Cidade de Maputo</td>
                                                <td>824844980</td>
                                                <td>
                                                    <div class="btn-group" role="group" aria-label="Button group with nested dropdown">
                                                        <div class="btn-group" role="group">
                                                            <button id="btnGroupDrop1" type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                                Comando
                                                            </button>
                                                            <div class="dropdown-menu" aria-labelledby="btnGroupDrop1">
                                                                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#EditarGrupo">Editar Encarregado</a>
                                                                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#VerEstudante">Ver Estudantes</a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="d-none">219</td>
                                                <td>Alexander Pierce</td>
                                                <td>Tecnico IT</td>
                                                <td>Cidade de Maputo</td>
                                                <td>824844980</td>
                                                <td>
                                                    <div class="btn-group" role="group" aria-label="Button group with nested dropdown">
                                                        <div class="btn-group" role="group">
                                                            <button id="btnGroupDrop2" type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                                Comando
                                                            </button>
                                                            <div class="dropdown-menu" aria-labelledby="btnGroupDrop1">
                                                                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#EditarGrupo">Editar Encarregado</a>
                                                                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#VerEstudante">Ver Estudantes</a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>

                                        </tbody>
                                    </table>
                                </div>
                                <!-- /.card-body -->
                            </div>
                            <!-- /.card-body -->

                        </div>
                        <!-- /.card -->

                    </div>
                    <!--/.col (right) -->
                </div>
                <!-- /.row -->
            </div>
            <%--Modals--%>

            <div class="modal fade" id="EditarGrupo">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title">Alterar Dados do Estudante</h4>
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
                                    <input type="text" class="form-control" id="groupName" placeholder="Digita nome">
                                </div>

                                <div class="form-group">
                                    <label for="exampleInputGender">Sexo</label>
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" value="M" name="gender" checked="true">
                                        <label class="form-check-label">Masculino</label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" value="F" name="gender">
                                        <label class="form-check-label">Femenino</label>
                                    </div>
                                </div>


                            </div>
                            <!-- /.card-body -->
                        </div>
                        <div class="modal-footer justify-content-between">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Fechar</button>
                            <button type="button" class="btn btn-primary">Gravar</button>
                        </div>
                    </div>
                    <!-- /.modal-content -->
                </div>



                <!-- /.modal-dialog -->
            </div>
                      

            <div class="modal fade" id="VerEstudante">
                <div class="modal-dialog modal-xl">
                    <div class="modal-content">
                        <div class="modal-header">

                            <h4 class="modal-title">Ver Estudantes</h4>

                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">

                            <div class="form-group">
                                <select class="duallistbox" multiple="multiple">
                                    <option selected>Alabama</option>
                                    <option>Alaska</option>
                                    <option>California</option>
                                    <option>Delaware</option>
                                    <option>Tennessee</option>
                                    <option>Texas</option>
                                    <option>Washington</option>
                                </select>
                            </div>

                        </div>
                        <div class="modal-footer justify-content-between">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            <button type="button" class="btn btn-primary">Save changes</button>
                        </div>
                    </div>
                    <!-- /.modal-content -->
                </div>
                <!-- /.modal-dialog -->
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
        })
    </script>

    <script src="/SISAA/Scripts/Controller/CreateStudent.js"></script>
</asp:Content>
