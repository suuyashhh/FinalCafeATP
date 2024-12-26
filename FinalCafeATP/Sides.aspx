<%@ Page Title="" Language="C#" MasterPageFile="~/Cafe.Master" AutoEventWireup="true" CodeBehind="Sides.aspx.cs" Inherits="FinalCafeATP.Sides" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        input[type="checkbox"] {
            height: 20px;
            width: 25px;
        }

        .tot_b {
            font-family: "Trirong", sans-serif;
            color: #ffc107;
        }

        .menu-action {
            color: #26d48c !important
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- Page Header Start -->
    <div class="container-fluid menur py-5">
        <div class="container text-center py-5">
            <h1 class="display-2 text-white mb-4 animated slideInDown">Menu</h1>
            <nav aria-label="breadcrumb animated slideInDown">
                <ol class="breadcrumb justify-content-center  mb-0">
                    <li class="breadcrumb-item"><a href="#">Home</a></li>
                    <li class="breadcrumb-item"><a href="Menu.aspx">Menu</a></li>
                    <li class="breadcrumb-item"><a href="#">Login</a></li>
                </ol>
            </nav>
        </div>
    </div>
    <!-- Page Header End -->


    <div class="container">
        <div class="row content">
            <div class="col-md-4 m-list"></div>
            <div class="col-md-4 m-list">
                <a class="yash" href="Sides.aspx">
                    <img decoding="async" src="Images/Sides.png" class="img-fluidd" alt="Sides"><br />
                    Sides</a>
            </div>
            <div class="col-md-4 m-list"></div>
        </div>
    </div>





    <div class="container">
        <div class="row">


            <div class="col-md-0"></div>
            <div class="col-md-12 g-menu">
                <asp:GridView runat="server" ID="gridv" DataKeyNames="srno" AutoGenerateColumns="false" CssClass="table table-borderless" Style="text-align: center; border: 0px">
                    <Columns>
                        <asp:TemplateField ItemStyle-Height="100px">
                            <ItemTemplate>
                                <asp:CheckBox CssClass="cb" ID="rememberMe" runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField ItemStyle-Height="100px">
                            <ItemTemplate>
                                <asp:DropDownList ID="Ddlqty" runat="server" Style="text-align: center; width: 80px;">
                                    <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                    <asp:ListItem Text="3" Value="3"></asp:ListItem>
                                    <asp:ListItem Text="4" Value="4"></asp:ListItem>
                                    <asp:ListItem Text="5" Value="5"></asp:ListItem>
                                </asp:DropDownList>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ItemStyle-Height="100px">
                            <ItemTemplate>
                                <h2 class="g-menu">
                                    <asp:Label runat="server" ID="lblname" Text='<%# Eval("food") %>'></asp:Label></h2>
                            </ItemTemplate>
                        </asp:TemplateField>


                        <asp:TemplateField ItemStyle-Height="100px">
                            <ItemTemplate>
                                <h2 class="g-menu">
                                    <asp:Label runat="server" ID="lblprice" Text='<%# Eval("price") %>'></asp:Label></h2>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
            <div class="col-md-0"></div>


        </div>
        <div class="row">

            <asp:GridView runat="server" ID="GridView1" DataKeyNames="srno" AutoGenerateColumns="false" CssClass="table table-borderless" Style="text-align: center; border: 0px">
                <Columns>

                    <asp:TemplateField ItemStyle-Height="100px">
                        <ItemTemplate>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField ItemStyle-Height="100px">
                        <ItemTemplate>
                            <h3 style="width: 100px"></h3>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-Height="100px">
                        <ItemTemplate>
                        </ItemTemplate>
                    </asp:TemplateField>


                    <asp:TemplateField ItemStyle-Height="100px">
                        <ItemTemplate>
                            <h2 class="tot_b">
                                <asp:Label runat="server" ID="lblprice" Text='<%# "Total    :    " + Eval("total") + "/-" %>'></asp:Label></h2>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>


        </div>

        <div class="row">
            <div class="text-center" style="margin-top: 50px; margin-bottom: 10px">
                <asp:Button runat="server" ID="Total_bt" OnClick="Total_bt_Click" OnClientClick="return validateCheckbox()" Text="Get Total" CssClass="btn btn-warning" Style="width: 100px" />
            </div>
            <div class="text-center" style="margin-top: 50px; margin-bottom: 150px">
                <asp:Button runat="server" OnClick="Unnamed_Click" OnClientClick="return validateCheckbox()" Text="Place Order" CssClass="btn btn-success" Style="width: 150px" />
            </div>
        </div>
    </div>

    <script>
        function validateCheckbox() {

            var checkboxes = document.querySelectorAll('input[type="checkbox"]');
            var checked = false;

            checkboxes.forEach(function (checkbox) {
                if (checkbox.checked) {
                    checked = true;
                    return;
                }
            });

            if (!checked) {
                swal("Please check at least one checkbox.", "", "error");
                return false;
            }

            return true;
        }
    </script>


</asp:Content>
