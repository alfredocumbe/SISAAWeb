<%@ Page Title="Encarregados" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CreateParent.aspx.cs" Inherits="SISAA.Pages.CreateParent" %>


<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server"></asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="Body" runat="server">

    <section class="content">
        <!-- Content Header (Page header) -->
        <div class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1 class="m-0 text-dark">Novo Encarregado</h1>
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
                                <div class="form-group">
                                    <label for="parentName">Nome Completo</label>
                                    <input type="text" class="form-control" id="parentName" placeholder="Digita nome" required="Este campo nao pode ser vazio">
                                </div>
                                <div class="row">
                                    <div class="col-6">
                                        <div class="form-group">
                                            <label for="parentProfissao">Profissao</label>
                                            <input type="text" class="form-control" id="parentProfissao" placeholder="Digita profissao" required>
                                        </div>
                                    </div>
                                    <div class="col-6">
                                                                                
                                        <div class="form-group">
                                            <label>Celular</label>

                                            <div class="input-group">
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text"><i class="fas fa-phone"></i></span>
                                                </div>
                                                <input type="text" id="parentPhone" class="form-control" data-inputmask="&quot;mask&quot;: &quot;(+258) 9999-99999&quot;" data-mask="" im-insert="true">
                                            </div>
                                            <!-- /.input group -->
                                        </div>
                                    </div>

                                </div>

                                <div class="form-group">
                                    <label for="parentAddress">Endereco</label>
                                    <input type="text" class="form-control" id="parentAddress" placeholder="Digita enderreco" required>
                                </div>


                                <div class="">
                                    <button type="submit" class="btn btn-primary">Criar Encarregado</button>
                                </div>

                            </div>
                            <!-- /.card-body -->
                        </div>
                        <!-- /.card -->

                    </div>
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
            loadingStop();
            //Datemask dd/mm/yyyy
            $('#datemask').inputmask('dd/mm/yyyy', { 'placeholder': 'dd/mm/yyyy' })
            //Datemask2 mm/dd/yyyy
            $('#datemask2').inputmask('mm/dd/yyyy', { 'placeholder': 'mm/dd/yyyy' })
            //Money Euro
            $('[data-mask]').inputmask()
        })
    </script>
    <script src="/Scripts/Controller/CreateParent.js"></script>
</asp:Content>
