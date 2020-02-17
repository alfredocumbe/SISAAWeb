<%@ Page Title="Utilizadores" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddBalance.aspx.cs" Inherits="SISAA.Pages.AddBalance" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Body" runat="server">

    <section class="content">

        <!-- Content Header (Page header) -->
        <div class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1 class="m-0 text-dark">Recarregar contas</h1>
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

                                   <div class="col-md-3 col-sm-3">
                                            <div class="info-box">
                                                <span class="info-box-icon bg-success"><i class="far fa-envelope"></i></span>

                                                <div class="info-box-content">
                                                    <span class="info-box-text">Saldo disponivel</span>
                                                    <span class="info-box-number" id="currentBalance"></span>
                                                </div>
                                                <!-- /.info-box-content -->
                                            </div>
                                            <!-- /.info-box -->
                                    </div>

                                    <div class="col-sm-3">
                                        <label>Tipo de Operacao</label>
                                        <select class="form-control" id="transationType">
                                            <option value='0'></option>
                                           <option value='IN'>Credito</option>
                                           <option value='OUT'>Debito</option>
                                        </select>
                                    </div>

                                    <div class="col-sm-2">
                                        <div class="form-group">
                                            <label for="userFullName">Quantidade</label>
                                            <input type="number" class="form-control" id="quantity"  min="1" max="99999999999"  required>
                                        </div>
                                    </div>

                                    <div class="col-sm-4">
                                        <div class="form-group">
                                            <label>Empresa</label>
                                            <select class="form-control" id="Accounts">
                                            </select>
                                        </div>
                                    </div>

                                </div>


                                <div class="">
                                    <button type="submit" class="btn btn-primary">Gravar operação</button>
                                </div>
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
    <script src="/Scripts/Controller/AddBalance.js"></script>
</asp:Content>
