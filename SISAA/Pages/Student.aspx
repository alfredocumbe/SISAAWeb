<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Student.aspx.cs" Inherits="SISAA.Student" %>


<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server"></asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="Body" runat="server">

<section class="content">

        <div class="card card-solid">
            <div class="card-body pb-10">
                <div class="row d-flex align-items-stretch">
                    <div class="col-9">
                        <div class="col-sm-9">
                            <h1>LISTA DE ESTUDANTES</h1>
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
                    <!-- right column -->
                    <div class="col-md-12">
                        <!-- general form elements disabled -->
                        <div class="card card-primary">
                            <div class="card-header">
                                <h3 class="card-title">LISTA DE ESTUDANTES</h3>
                            </div>
                            <!-- /.card-header -->
                            <div class="">
                                <div class="card-header">
                                    <h3 class="card-title"></h3>

                                    <div class="card-tools">
                                        <div class="input-group input-group-sm" style="width: 300px;">
                                            <input type="text" name="table_search" class="form-control float-right" placeholder="Search">

                                            <div class="input-group-append">
                                                <button type="submit" class="btn btn-default"><i class="fas fa-search"></i></button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- /.card-header -->
                                <div class="card-body table-responsive p-0" style="height: 300px;">
                                    <table class="table table-head-fixed text-nowrap" id="parents">
                                        <thead>
                                            <tr>
                                                <th class="d-none">ID</th>
                                                <th style="width: 60%">Nome</th>
                                                <th style="width: 20%">Sexo</th>
                                                <th style="width: 20%"></th>
                                            </tr>
                                        </thead>
                                        <tbody>>
                                        </tbody>
                                    </table>
                                </div>
                                <!-- /.card-body -->
                            </div>
                            <!-- /.card-body -->

                        </div>
                        <!-- /.card -->

                    </div>
                    <!--/.col (right) -->
                </div>
                <!-- /.row -->
            </div>

<%-- Lista de Modal --%>
             
             <div  id="modelContainer">

                   

             </div>
                       
<%-- Fim Lista de Modal --%>
            <!-- /.container-fluid -->

            <!-- /.container-fluid -->
        </section>

    </section>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ControllerScript" runat="server">

<script src="/SISAA/Scripts/Controller/Student.js"></script>

    <script type="text/javascript">
        $(function () {
            //Bootstrap Duallistbox
            // $('.duallistbox').bootstrapDualListbox(); *@
        })
    </script>

    
</asp:Content>
