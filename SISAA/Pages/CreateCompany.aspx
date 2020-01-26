<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CreateCompany.aspx.cs" Inherits="SISAA.Pages.CreateCompany" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Body" runat="server">

<section class="content">

        <div class="card card-solid">
            <div class="card-body pb-10">
                <div class="row d-flex align-items-stretch">
                    <div class="col-9">
                        <div class="col-sm-9">
                            <h1>NOVA EMPRESA</h1>
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
                                    <div class="col-sm-3">
                                        <div class="form-group">
                                            <label for="exampleInputName">Nome Abreviado</label>
                                            <input type="text" class="form-control" id="studentName" placeholder="Digita Nome Abreviado">
                                        </div>                                                                             
                                        

                                    </div>
                                    <div class="col-sm-9">                                        

                                        <div class="form-group">
                                            <label for="userName">Nome Longo</label>
                                            <input type="text" class="form-control" id="userName" placeholder="Digite Nome Longo">
                                        </div>

                                    </div>

                                </div>
                                                         

                                <div class="">
                                    <button type="submit" class="btn btn-primary">Criar Empresa</button>
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
</asp:Content>
