<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ContactGroup.aspx.cs" Inherits="SISAA.Pages.ContactGroup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Body" runat="server">
    <section class="content">

        <!-- Content Header (Page header) -->
        <div class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1 class="m-0 text-dark">Contactos  [<small class="groupName text-bold"></small>]</h1>
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
                    <!-- right column -->
                    <div class="col-md-12">
                        <!-- general form elements disabled -->
                        <div class="card card-primary">
                            <div class="card-header">
                                <h3 class="card-title">Contactos Associados</h3>
                            </div>
                            <!-- /.card-header -->
                            <div class="pt-1">
                                <div class="">

                                    <div class="card-body">
                                        <table id="groupContacts" class="table table-hover table-responsive">
                                            <thead>
                                                <tr>
                                                    <th>Nome</th>
                                                    <th>Celular</th>
                                                    <th>Email</th>
                                                    <th>Operações</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            </tbody>

                                        </table>
                                    </div>
                                    <!-- /.card-body -->
                                </div>


                            </div>
                            <!-- /.card-body -->

                        </div>
                        <!-- /.card -->

                        <div class="card card-primary">
                            <div class="card-header">
                                <h3 class="card-title">Associar Contactos</h3>
                            </div>
                            <!-- /.card-header -->
                            <div class="pt-1">
                                <div class="">

                                    <div class="card-body">
                                        <table id="contacts" class="table table-hover table-responsive">
                                            <thead>
                                                <tr>
                                                    <th>Nome</th>
                                                    <th>Celular</th>
                                                    <th>Email</th>
                                                    <th>Operações</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            </tbody>

                                        </table>
                                    </div>
                                    <!-- /.card-body -->
                                </div>


                            </div>
                            <!-- /.card-body -->

                        </div>


                    </div>
                    <!--/.col (right) -->
                </div>
                <!-- /.row -->
            </div>
        </section>

        <section>
        </section>

    </section>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ControllerScript" runat="server">
    <script src="/Scripts/Controller/ContactGroup.js"></script>

    <script type="text/javascript">
        $(function () {

            
            $('#contacts').removeAttr('width').DataTable({
                scrollX: false,
                scrollCollapse: false,
                paging: true,
                columnDefs: [
                    { width: 400, targets: 0 },
                    { width: 200, targets: 1 },
                    { width: 250, targets: 2 },
                    { width: 75, targets: 3 }
                ],
                fixedColumns: true
            });

            $('#groupContacts').removeAttr('width').DataTable({
                scrollX: false,
                scrollCollapse: false,
                paging: true,
                columnDefs: [
                    { width: 400, targets: 0 },
                    { width: 200, targets: 1 },
                    { width: 300, targets: 2 },
                    { width: 75, targets: 3 }
                ],
                fixedColumns: true
            });
                       
        })
    </script>
</asp:Content>
