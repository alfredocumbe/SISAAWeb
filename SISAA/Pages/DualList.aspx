<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DualList.aspx.cs" Inherits="SISAA.Pages.DualList" MasterPageFile="~/Site2.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server"></asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="Body" runat="server">

    <section class="content">

        <div class="card card-solid">
            <div class="card-body pb-10">
                <div class="row d-flex align-items-stretch">
                    <div class="col-9">
                        <div class="col-sm-9">
                            <h1>LISTA DE GRUPOS</h1>
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
                                <h3 class="card-title">LISTA DE GRUPOS</h3>
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
                                                <th style="width: 80%">Nome</th>
                                                <th style="width: 20%"></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td class="d-none">183</td>
                                                <td>John Doe</td>
                                                <td>
                                                    <div class="btn-group" role="group" aria-label="Button group with nested dropdown">
                                                        <div class="btn-group" role="group">
                                                            <button id="btnGroupDrop1" type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                                Comando
                                                            </button>
                                                            <div class="dropdown-menu" aria-labelledby="btnGroupDrop1">
                                                                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#EditarGrupo">Editar Grupo</a>
                                                                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#AdicionarContactos">Adicionar Contactos</a>
                                                                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#VerContactos">Ver Contactos</a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="d-none">219</td>
                                                <td>Alexander Pierce</td>
                                                <td>
                                                    <div class="btn-group" role="group" aria-label="Button group with nested dropdown">
                                                        <div class="btn-group" role="group">
                                                            <button id="btnGroupDrop2" type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                                Comando
                                                            </button>
                                                            <div class="dropdown-menu" aria-labelledby="btnGroupDrop1">
                                                                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#EditarGrupo">Editar Grupo</a>
                                                                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#AdicionarContactos">Adicionar Contactos</a>
                                                                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#VerContactos">Ver Contactos</a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>

                                        </tbody>
                                    </table>

                                    <div class="card card-default">
                                <div class="card-header">
                                    <h3 class="card-title">Lista de Contactos</h3>

                                    <div class="card-tools">
                                        <button type="button" class="btn btn-tool" data-card-widget="collapse"><i class="fas fa-minus"></i></button>
                                        <button type="button" class="btn btn-tool" data-card-widget="remove"><i class="fas fa-remove"></i></button>
                                    </div>
                                </div>
                                <!-- /.card-header -->
                                <div class="card-body" style="display: block;">
                                    <div class="row">
                                        <div class="col-12">
                                            <div class="form-group">
                                                <label>Multiple</label>
                                                <div class="bootstrap-duallistbox-container row moveonselect moveondoubleclick">
                                                    <div class="box1 col-md-6">
                                                        <label for="bootstrap-duallistbox-nonselected-list_" style="display: none;"></label>
                                                        <span class="info-container"><span class="info">Showing all 6</span>
                                                            <button type="button" class="btn btn-sm clear1" style="float: right!important;">show all</button>
                                                        </span>
                                                        <input class="form-control filter" type="text" placeholder="Filter">
                                                        <div class="btn-group buttons">
                                                            <button type="button" class="btn moveall btn-outline-secondary" title="Move all">&gt;&gt;</button>
                                                        </div>
                                                        <select multiple="multiple" id="bootstrap-duallistbox-nonselected-list_" name="_helper1" style="height: 102px;">
                                                            <option selected="">Alabama</option>
                                                            <option>Alaska</option>
                                                            <option>Delaware</option>
                                                            <option>Tennessee</option>
                                                            <option>Texas</option>
                                                            <option>Washington</option>
                                                        </select>
                                                    </div>
                                                    <div class="box2 col-md-6">
                                                        <label for="bootstrap-duallistbox-selected-list_" style="display: none;"></label>
                                                        <span class="info-container"><span class="info">Showing all 1</span>
                                                            <button type="button" class="btn btn-sm clear2" style="float: right!important;">show all</button>
                                                        </span>
                                                        <input class="form-control filter" type="text" placeholder="Filter">
                                                        <div class="btn-group buttons">
                                                            <button type="button" class="btn removeall btn-outline-secondary" title="Remove all">&lt;&lt;</button>
                                                        </div>
                                                        <select multiple="multiple" id="bootstrap-duallistbox-selected-list_" name="_helper2" style="height: 102px;">
                                                            <option data-sortindex="7">California</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <select class="duallistbox" multiple="multiple" style="display: none;">
                                                    <option selected="">Alabama</option>
                                                    <option>Alaska</option>
                                                    <option data-sortindex="7">California</option>
                                                    <option>Delaware</option>
                                                    <option>Tennessee</option>
                                                    <option>Texas</option>
                                                    <option>Washington</option>
                                                </select>
                                            </div>
                                            <!-- /.form-group -->
                                        </div>
                                        <!-- /.col -->
                                    </div>
                                    <!-- /.row -->
                                </div>

                            </div>



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
                            <h4 class="modal-title">Alterar Dados do Gruop</h4>
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

            <div class="modal fade" id="VerContactos">
                <div class="modal-dialog modal-xl">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title">Ver Contactos</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">

                            <div id="table" class="table-editable">
                                <span class="table-add float-right mb-3 mr-2"><a href="#!" class="text-success">
                                    <i class="fas fa-plus fa-1x" aria-hidden="true"></i></a></span>
                                <table id="parents" class="table table-bordered table-responsive-md table-striped text-center">
                                    <thead>
                                        <tr>
                                            <th class="text-center">Nome</th>
                                            <th class="text-center">Celular</th>
                                            <th class="text-center">Email</th>
                                            <th class="text-center"></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td class="pt-1-half" contenteditable="true">Nome</td>
                                            <td class="pt-1-half" contenteditable="true">Celular</td>
                                            <td class="pt-1-half" contenteditable="true">Email</td>
                                            <td>
                                                <span class="table-remove">
                                                    <button type="button"
                                                        class="btn btn-danger btn-rounded btn-sm my-0">
                                                        Remove</button></span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="pt-1-half" contenteditable="true">Nome</td>
                                            <td class="pt-1-half" contenteditable="true">Celular</td>
                                            <td class="pt-1-half" contenteditable="true">Email</td>
                                            <td>
                                                <span class="table-remove">
                                                    <button type="button"
                                                        class="btn btn-danger btn-rounded btn-sm my-0">
                                                        Remove</button></span>
                                            </td>
                                        </tr>
                                        <!-- This is our clonable table line -->

                                    </tbody>
                                </table>
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

            <div class="modal fade" id="AdicionarContactos">
                <div class="modal-dialog modal-xl">
                    <div class="modal-content">
                        <div class="modal-header">

                            <h4 class="modal-title">Adicionar Contactos</h4>

                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">

                            

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
            ////Initialize Select2 Elements
            //$('.select2').select2()

            ////Initialize Select2 Elements
            //$('.select2bs4').select2({
            //    theme: 'bootstrap4'
            //})

            //Bootstrap Duallistbox
            $('.duallistbox').bootstrapDualListbox();

            $("input[data-bootstrap-switch]").each(function () {
                $(this).bootstrapSwitch('state', $(this).prop('checked'));
            });


        })

    </script>

    <script src="/SISAA/Scripts/Controller/CreateStudent.js"></script>

</asp:Content>