<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AdmCreateUser.aspx.cs" Inherits="SISAA.Pages.AdmCreateUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Body" runat="server">

    <section class="content">

        <div class="card card-solid">
            <div class="card-body pb-10">
                <div class="row d-flex align-items-stretch">
                    <div class="col-9">
                        <div class="col-sm-9">
                            <h1>NOVO UTILIZADOR</h1>
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
                                            <label for="exampleInputName">Nome Completo</label>
                                            <input type="text" class="form-control" id="studentName" placeholder="Digita nome">
                                        </div>

                                        <div class="form-group">
                                            <label for="userName">Login</label>
                                            <input type="text" class="form-control" id="userName" placeholder="Username">
                                        </div>

                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label>Empresa</label>
                                            <select class="form-control">
                                                <option>BIM</option>
                                                <option>SIM</option>
                                                <option>Vodacom</option>
                                                <option>BCI</option>
                                                <option>Moza Banco</option>
                                            </select>
                                        </div>

                                        <div class="form-group">
                                            <label for="exampleInputEmail">Email</label>
                                            <input type="email" class="form-control" id="exampleInputEmail" placeholder="Digita email">
                                        </div>

                                    </div>

                                </div>

                                <div class="row">
                                    <div class="col-sm-3">
                                        <div class="form-group">
                                            <label for="userPassword">Password</label>
                                            <input type="password" class="form-control" id="userPassword" placeholder="Password">
                                        </div>
                                        <div class="form-group">
                                            <label for="userConfirm">Confirm Password</label>
                                            <input type="password" class="form-control" id="userConfirm" placeholder="Confirm Password">
                                        </div>
                                    </div>
                                    <div class="col-sm-9">
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
            $('.select2').select2()

            //Initialize Select2 Elements
            $('.select2bs4').select2({
                theme: 'bootstrap4'
            })
        })
    </script>
</asp:Content>
