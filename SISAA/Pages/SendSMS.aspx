<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SendSMS.aspx.cs" Inherits="SISAA.SendSMS" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="Body" runat="server">

    <section class="content">

        <div class="card card-solid">
            <div class="card-body pb-10">
                <div class="row d-flex align-items-stretch">
                    <div class="col-9">
                        <div class="col-sm-6">
                            <h1>ENVIAR SMS</h1>
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
                    <div class="col-md-3">
                        <div class="card">
                            <div class="card-header">
                                <h3 class="card-title">Diretorio</h3>

                                <div class="card-tools">
                                    <button type="button" class="btn btn-tool" data-card-widget="collapse">
                                        <i class="fas fa-minus"></i>
                                    </button>
                                </div>
                            </div>
                            <div class="card-body p-0">
                                <ul class="nav nav-pills flex-column">

                                    <li class="nav-item">
                                        <a href="/SISAA/Pages/Sent.aspx" class="nav-link">
                                            <i class="far fa-envelope"></i>Enviadas
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="/SISAA/Pages/Panding.aspx" class="nav-link">
                                            <i class="far fa-file-alt"></i>Pendentes
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="/SISAA/Pages/NotSent.aspx" class="nav-link">
                                            <i class="fas fa-filter"></i>Nao Enviadas
                                        </a>
                                    </li>
                                </ul>
                            </div>
                            <!-- /.card-body -->
                        </div>
                        <!-- /.card -->
                        <div class="card">
                            <div class="card-header">
                                <h3 class="card-title">Grupos</h3>

                                <div class="card-tools">
                                    <button type="button" class="btn btn-tool" data-card-widget="collapse">
                                        <i class="fas fa-minus"></i>
                                    </button>
                                </div>
                            </div>
                            <!-- /.card-header -->
                            <div class="card-body p-0">
                                <ul class="nav nav-pills flex-column">
                                    <li>
                                        <div class="icheck-success d-inline">
                                            <input type="checkbox" id="checkboxSuccess3">
                                            <label for="checkboxSuccess3">
                                                Success checkbox
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="icheck-success d-inline">
                                            <input type="checkbox" id="checkboxSuccess2">
                                            <label for="checkboxSuccess2">
                                                Success checkbox
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="icheck-success d-inline">
                                            <input type="checkbox" id="checkboxSuccess1">
                                            <label for="checkboxSuccess1">
                                                Success checkbox
                                            </label>
                                        </div>
                                    </li>
                                </ul>


                            </div>
                            <!-- /.card-body -->
                        </div>
                        <!-- /.card -->
                    </div>
                    <!-- /.col -->
                    <div class="col-md-9">
                        <div class="card card-primary">
                            <div class="card-header">
                                <h3 class="card-title">Compor nova Mensagem</h3>
                            </div>
                            <!-- /.card-header -->
                            <div class="card-body">
                                <div class="form-group">
                                    <input class="form-control" placeholder="Para:">
                                </div>
                                <div class="form-group">
                                    <textarea id="compose-textarea" class="form-control" style="height: 150px;">
                        
                    </textarea>
                                </div>
                            </div>
                            <!-- /.card-body -->
                            <div class="card-footer">
                                <div class="float-right">
                                    <button type="submit" class="btn btn-primary"><i class="far fa-envelope"></i>Enviar</button>
                                </div>
                                <button type="reset" class="btn btn-default"><i class="fas fa-times"></i>Limpar</button>
                            </div>
                            <!-- /.card-footer -->
                        </div>
                        <!-- /.card -->
                    </div>
                    <!-- /.col -->
                </div>
                <!-- /.row -->
            </div>
            <!-- /.container-fluid -->
        </section>

    </section>

</asp:Content>
