<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ImportStudent.aspx.cs" Inherits="SISAA.Pages.ImportStudent" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Body" runat="server">

    <section class="content" ng-app="myApp">
        <!-- Content Header (Page header) -->
        <div class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-4">
                        <h1 class="m-0 text-dark">Cadastro de Estuandes Em Lote</h1>
                    </div>
                    <div class="col-sm-4">
                        <button  onclick="downLoadTemplate()" class="btn" type="button"><i class="fa fa-download"></i>Baixar Template</button>
                    </div>
                    <div class="col-sm-4"></div>
                </div>
                <!-- /.row -->
            </div>
            <!-- /.container-fluid -->
        </div>
        <!-- /.content-header -->

        <section class="content" ng-controller="MyController">
            <div class="container-fluid">
                <div class="row">
                    <!-- right column -->
                    <div class="col-md-12">
                        <!-- general form elements disabled -->
                        <div class="card card-primary" style="height: 305px;">
                            <div class="card-header" style="display: none;">
                                <h3 class="card-title">Dados do Encarregado</h3>
                            </div>
                            <!-- /.card-header -->
                            <div class="card-body">
                                <div id="table" class="table-editable">
                                    <div class="row">
                                        <div class="col-sm-4">
                                            <div class="input-group">
                                                <div class="input-group-prepend">
                                                    <span class="btn btn-success" onclick="createBatchStudent()" id="inputGroupFileAddon01">Cadastrar Estudantes</span>
                                                </div>
                                                <div class="custom-file">
                                                    <input type="file" onchange="angular.element(this).scope().uploadeExcel(this)" class="custom-file-input" id="file"
                                                        aria-describedby="inputGroupFileAddon01">
                                                    <label class="custom-file-label" for="inputGroupFile01">Carregar Ficheiro</label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-8">
                                            <span class="table-add float-right mb-2 mr-2">
                                                <a href="#!" class="text-success">
                                                    <i class="fas fa-plus fa-1x" aria-hidden="true"></i>
                                                </a>
                                            </span>
                                        </div>
                                    </div>

                                    <table id="batchStudent" class="table table-bordered table-responsive-md table-sm">
                                        <thead>
                                            <tr>
                                                <th class="text-center">Nome</th>
                                                <th class="text-center">Sexo</th>
                                                <th class="text-center">Nome Enc1</th>
                                                <th class="text-center">Prof. Enc1</th>
                                                <th class="text-center">End. Enc1</th>
                                                <th class="text-center">Cell. Enc1</th>
                                                <th class="text-center">Nome Enc2</th>
                                                <th class="text-center">Prof. Enc2</th>
                                                <th class="text-center">End. Enc2</th>
                                                <th class="text-center">Cell. Enc2</th>
                                                <th class="text-center">Remover</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        </tbody>
                                    </table>
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
            <!-- /.container-fluid -->
        </section>

    </section>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ControllerScript" runat="server">
    <script type="text/javascript" src="/Scripts/Vendor/angular.min.js"></script>
    <script type="text/javascript" src="/Scripts/Vendor/xlsx.full.min.js"></script>
    <script type="text/javascript" src="/Scripts/Controller/ImportStudent.js"></script>
    <script type="text/javascript" src="/Scripts/Controller/ImportStudentFileUpload.js"></script>
    <script type="text/javascript">
        loadingStop();
    </script>
</asp:Content>
