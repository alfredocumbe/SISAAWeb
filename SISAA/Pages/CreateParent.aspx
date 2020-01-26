<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CreateParent.aspx.cs" Inherits="SISAA.CreateParent" %>


<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server"></asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="Body" runat="server">

    <section class="content">

        <div class="card card-solid">
            <div class="card-body pb-10">
                <div class="row d-flex align-items-stretch">
                    <div class="col-9">
                        <div class="col-sm-9">
                            <h1>NOVO ENCARREGADO</h1>
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
                    <!-- left column -->
                    <div class="col-md-6">
                        <!-- general form elements -->
                        <div class="card card-primary">
                            <div class="card-header">
                                <h3 class="card-title">Dados Gerais</h3>
                            </div>
                            <!-- /.card-header -->
                            <!-- form start -->
                            <div class="card-body">
                                <div class="form-group">
                                    <label for="exampleInputName">Nome Completo</label>
                                    <input type="text" class="form-control" id="studentName" placeholder="Digita nome">
                                </div>
                                <div class="form-group">
                                    <label for="parentProfissao">Profissao</label>
                                    <input type="text" class="form-control" id="parentProfissao" placeholder="Digita nome">
                                </div>
                                <div class="form-group">
                                    <label for="parentAddress">Endereco</label>
                                    <input type="text" class="form-control" id="parentAddress" placeholder="Digita nome">
                                </div>

                                <div class="form-group">
                                    <label for="parentAddress">Celular</label>
                                    <input type="text" class="form-control" id="parentPhone" placeholder="Digita nome">
                                </div>

                                <div class="">
                                    <button type="submit" class="btn btn-primary">Criar Encarregado</button>
                                </div>

                            </div>
                            <!-- /.card-body -->
                        </div>
                        <!-- /.card -->

                    </div>
                    <!--/.col (left) -->
                    <!-- right column -->
                    <div class="col-md-6">
                        <!-- general form elements disabled -->
                        <div class="card card-primary">
                            <div class="card-header">
                                <h3 class="card-title">Dados de Estudantes</h3>
                            </div>
                            <!-- /.card-header -->
                            <div class="">
                                <div class="card-header">
                                    <h3 class="card-title">Associar Estudante</h3>

                                    <div class="card-tools">
                                        <div class="input-group input-group-sm" style="width: 150px;">
                                            <input type="text" name="table_search" class="form-control float-right" placeholder="Search">

                                            <div class="input-group-append">
                                                <button type="submit" class="btn btn-default"><i class="fas fa-search"></i></button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- /.card-header -->
                                <div class="card-body table-responsive p-0" style="height: 300px;">
                                    <div class="card-body">
                                        <div class="row">
                                            <div class="col-12">
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
                    <!--/.col (right) -->
                </div>
                <!-- /.row -->
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
