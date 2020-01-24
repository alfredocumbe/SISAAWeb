﻿<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Student.aspx.cs" Inherits="SISAA.Student" %>


<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server"></asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="Body" runat="server">

    <section class="content">

        <div class="card card-solid">
            <div class="card-body pb-10">
                <div class="row d-flex align-items-stretch">
                    <div class="col-9">
                        <div class="col-sm-9">
                            <h1>LISTA DE ESTUDANTES</h1>
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
                                <h3 class="card-title">LISTA DE ESTUDANTES</h3>
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
                                    <table class="table table-head-fixed text-nowrap" id="parents">
                                        <thead>
                                            <tr>
                                                <th class="d-none">ID</th>
                                                <th style="width: 60%">Nome</th>
                                                <th style="width: 20%">Sexo</th>
                                                <th style="width: 20%"></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td class="d-none">183</td>
                                                <td>John Doe</td>
                                                <td>Male</td>
                                                <td>
                                                    <div class="btn-group" role="group" aria-label="Button group with nested dropdown">
                                                        <div class="btn-group" role="group">
                                                            <button id="btnGroupDrop1" type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                                Comando
                                                            </button>
                                                            <div class="dropdown-menu" aria-labelledby="btnGroupDrop1">
                                                                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#EditarGrupo">Editar Estudante</a>
                                                                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#VerEncarregado">Ver Encarregados</a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="d-none">219</td>
                                                <td>Alexander Pierce</td>
                                                <td>Famele</td>
                                                <td>
                                                    <div class="btn-group" role="group" aria-label="Button group with nested dropdown">
                                                        <div class="btn-group" role="group">
                                                            <button id="btnGroupDrop2" type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                                Comando
                                                            </button>
                                                            <div class="dropdown-menu" aria-labelledby="btnGroupDrop1">
                                                                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#EditarGrupo">Editar Estudante</a>
                                                                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#VerEncarregado">Ver Encarregados</a>
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

<%-- Lista de Modal --%>
             
             <div  id="modelContainer">

                   

             </div>
                       
            <div class="modal fade" id="VerEncarregado">
                <div class="modal-dialog modal-xl">
                    <div class="modal-content">
                        <div class="modal-header">

                            <h4 class="modal-title">Ver Encarregados</h4>

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
<%-- Fim Lista de Modal --%>
            <!-- /.container-fluid -->

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

    <script src="/SISAA/Scripts/Controller/Student.js"></script>
</asp:Content>