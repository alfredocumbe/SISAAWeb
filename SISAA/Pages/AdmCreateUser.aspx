﻿<%@ Page Title="Utilizadores" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AdmCreateUser.aspx.cs" Inherits="SISAA.Pages.AdmCreateUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Body" runat="server">

    <section class="content">
        
        <!-- Content Header (Page header) -->
        <div class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1 class="m-0 text-dark">Novo Utilizador</h1>
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
                    <div class="col-md-12">
                        <!-- general form elements -->
                        <div class="card card-primary">
                            <div class="card-header">
                                <h3 class="card-title">Dados Gerais</h3>
                            </div>
                            <!-- /.card-header -->
                            <!-- form start -->
                            <div class="card-body">

                                <div class="row">
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label for="userFullName">Nome Completo</label>                                            
                                            <input type="text" class="form-control" id="userFullName" placeholder="Digita nome" required="Campo de caracter obrigatório">
                                        </div>

                                        <div class="form-group">
                                            <label for="userName">Nome de Usuario</label>
                                            <input type="text" class="form-control" id="userName" placeholder="Username" required ="Campo de caracter obrigatório">
                                        </div>

                                    </div>
                                    <div class="col-sm-6">

                                        <div class="form-group">
                                            <label>Empresa</label>
                                            <select class="form-control" id="Accounts">
                                            </select>
                                        </div>


                                        <div class="form-group">
                                            <label>Celular</label>

                                            <div class="input-group">
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text"><i class="fas fa-phone"></i></span>
                                                </div>
                                                <input type="text" id="userPhone" class="form-control" data-inputmask="&quot;mask&quot;: &quot;(+258) 9999-99999&quot;" data-mask="" im-insert="true">
                                            </div>
                                            <!-- /.input group -->
                                        </div>

                                        <div class="form-group"  style="display: none">
                                            <label for="userPassword">Password</label>
                                            <input type="password" class="form-control" id="userPassword" placeholder="Password">
                                        </div>

                                        <div class="form-group" style="display: none">
                                            <label for="userConfirm">Confirm Password</label>
                                            <input type="password" class="form-control" id="userConfirm" placeholder="Confirm Password">
                                        </div>                                                                   
                                    </div> 
                                </div>
                                <div class="">
                                    <button type="submit" class="btn btn-primary">Criar Utilizador</button>
                                </div>

                            </div>
                            <!-- /.card-body -->
                        </div>
                        <!-- /.card -->

                    </div>
                    <!--/.col (left) -->
                </div>
                <!-- /.row -->
            </div>
            <!-- /.container-fluid -->
        </section>

    </section>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ControllerScript" runat="server">
    <script>
        $(function () {
            //Initialize Select2 Elements
            $('.select2').select2();

            //Initialize Select2 Elements
            $('.select2bs4').select2({
                theme: 'bootstrap4'
            });

            //Datemask dd/mm/yyyy
            $('#datemask').inputmask('dd/mm/yyyy', { 'placeholder': 'dd/mm/yyyy' })
            //Datemask2 mm/dd/yyyy
            $('#datemask2').inputmask('mm/dd/yyyy', { 'placeholder': 'mm/dd/yyyy' })
            //Money Euro
            $('[data-mask]').inputmask()

            loadingStop();
        })
    </script>
    <script src="/Scripts/Controller/CreateAdmUser.js"></script>
</asp:Content>
