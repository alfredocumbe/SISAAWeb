<%@ Page Title="Estudantes" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CreateStudent.aspx.cs" Inherits="SISAA.Pages.CreateContact" %>


<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server"></asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="Body" runat="server">

    <section class="content">

        <!-- Content Header (Page header) -->
        <div class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1 class="m-0 text-dark">Novo Estudante</h1>
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
                                    <input type="text" class="form-control" id="studentName" placeholder="Digita nome" required>
                                    <%--<input type="text" name="studentName" class="form-control is-invalid" id="studentName" placeholder="Enter email" aria-describedby="studentName-error" aria-invalid="true">
                                    <span id="studentName-error" class="error invalid-feedback">Please enter a email address</span>--%>
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
                        <div class="card card-primary" style="height: 305px;">
                            <div class="card-header">
                                <h3 class="card-title">Dados do Encarregado</h3>
                            </div>
                            <!-- /.card-header -->
                            <div class="card-body">
                                <div id="table" class="table-editable">
                                    <span class="table-add float-right mb-2 mr-2"><a href="#!" class="text-success">
                                        <i class="fas fa-plus fa-1x" aria-hidden="true"></i></a></span>
                                    <table id="parents" class="table table-bordered table-responsive-md table-sm">
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
    <script src="/Scripts/Controller/CreateStudent.js"></script>
        <script src="/Scripts/Site.js"></script>
    <script>
        loadingStop();
        //Datemask dd/mm/yyyy
        $('#datemask').inputmask('dd/mm/yyyy', { 'placeholder': 'dd/mm/yyyy' })
        //Datemask2 mm/dd/yyyy
        $('#datemask2').inputmask('mm/dd/yyyy', { 'placeholder': 'mm/dd/yyyy' })
        //Money Euro
        $('[data-mask]').inputmask()
    </script>
</asp:Content>
