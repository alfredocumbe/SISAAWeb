<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CreateStudent.aspx.cs" Inherits="SISAA.CreateContact" %>


<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server"></asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="Body" runat="server">

    <section class="content">

        <div class="card card-solid">
            <div class="card-body pb-10">
                <div class="row d-flex align-items-stretch">
                    <div class="col-9">
                        <div class="col-sm-6">
                            <h1>NOVO ESTUDANTE</h1>
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
                    <div class="col-md-4">
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

                                <div class="">
                                    <button type="submit" class="btn btn-primary">Criar Estudante</button>
                                </div>

                            </div>
                            <!-- /.card-body -->
                        </div>
                        <!-- /.card -->

                    </div>
                    <!--/.col (left) -->
                    <!-- right column -->
                    <div class="col-md-8">
                        <!-- general form elements disabled -->
                        <div class="card card-primary">
                            <div class="card-header">
                                <h3 class="card-title">Dados do Encarregado</h3>
                            </div>
                            <!-- /.card-header -->
                            <div class="card-body">
                                <div id="table" class="table-editable">
                                    <span class="table-add float-right mb-3 mr-2"><a href="#!" class="text-success">
                                        <i class="fas fa-plus fa-1x" aria-hidden="true"></i></a></span>
                                    <table id="parents" class="table table-bordered table-responsive-md table-striped text-center">
                                        <thead>
                                            <tr>
                                                <th class="text-center">Nome</th>
                                                <th class="text-center">Profissão</th>
                                                <th class="text-center">Endereço</th>
                                                <th class="text-center">Celular</th>
                                                <th class="text-center">Remover</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td class="pt-1-half" contenteditable="true">Nome do Pai</td>
                                                <td class="pt-1-half" contenteditable="true">Profissão</td>
                                                <td class="pt-1-half" contenteditable="true">Endereço</td>
                                                <td class="pt-1-half" contenteditable="true">Celular</td>
                                                <td>
                                                    <span class="table-remove">
                                                        <button type="button"
                                                            class="btn btn-danger btn-rounded btn-sm my-0">
                                                            Remove</button></span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="pt-1-half" contenteditable="true">Nome da Mãe</td>
                                                <td class="pt-1-half" contenteditable="true">Profissão</td>
                                                <td class="pt-1-half" contenteditable="true">Endereço</td>
                                                <td class="pt-1-half" contenteditable="true">Celular</td>
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
<asp:Content ID="Content2" ContentPlaceHolderID="ControllerScript" runat="server">
    <script src="/SISAA/Scripts/Controller/CreateStudent.js"></script>
</asp:Content>
