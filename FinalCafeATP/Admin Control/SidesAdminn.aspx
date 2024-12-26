<%@ Page Title="" Language="C#" MasterPageFile="~/Admin Control/AdminCafeATP.Master" AutoEventWireup="true" CodeBehind="SidesAdminn.aspx.cs" Inherits="FinalCafeATP.Admin_Control.Slides" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="pagetitle">
        <h1>Menu</h1>
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="index.html">Menu</a></li>
                <li class="breadcrumb-item active">Slides</li>
            </ol>
        </nav>
    </div>

    <div class="container">
        <div class="row content">
            <div class="col-md-4 m-list"></div>
            <div class="col-md-4 m-list">
                <a class="yash" href="Burgers.aspx">
                    <img decoding="async" src="../images/Sides.png" class="img-fluidd" alt="Burgers"><br />
                    Sides</a>
            </div>
            <div class="col-md-4 m-list"></div>
        </div>
    </div>


    <!-- End Page Title -->
    <section class="section">
        <div class="row">

            <div class="col-lg-3"></div>
            <div class="col-lg-6">

                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Side Name / Prise</h5>

                        <!-- No Labels Form -->
                        <div class="row g-3">

                            <div class="col-md-8">
                                <asp:TextBox runat="server" ID="txtm" CssClass="form-control" Style="border: 1px solid black" placeholder="Food Name*"></asp:TextBox>
                            </div>
                            <div class="col-md-3">
                                <asp:TextBox runat="server" ID="txtmh" CssClass="form-control" TextMode="Number" Style="border: 1px solid black" placeholder="Food Price*"></asp:TextBox>
                            </div>

                            <div class="text-center">
                                <asp:Button runat="server" ID="btnnonveg" OnClick="btnnonveg_Click" OnClientClick="return valid()" CssClass="btn btn-success" Text="Upload" Style="margin-top: 10px" />
                            </div>
                        </div>
                        <!-- End No Labels Form -->

                    </div>
                </div>


            </div>

            <div class="col-lg-3"></div>
        </div>




        <div class="container py-5 my-5">

            <div class="row jhg">


                <asp:Repeater runat="server" ID="rgallery">

                    <ItemTemplate>
                        <div class='col-md-6'>
                            <div class='card'>
                                <div class='card-body sub'>
                                    <button class='badge badge-success'>VEG</button><br />
                                    <h4 style='float: left'><a href='#'><%# Eval("food") %></a></h4>
                                    <h3 style='float: right; color: white;'><a href='#'><%# Eval("price") + "/-" %></a> /-</h3>
                                </div>
                                <asp:LinkButton runat="server" ID="LinkButton1" OnClick="LinkButton1_Click" OnClientClick="return confirm('Do you want to delete this Item?')" Style="background-color: orange; color: white; padding: 15px"><span class="fa fa-trash"></span> Delete</asp:LinkButton>
                            </div>

                        </div>

                        <asp:Label runat="server" ID="lphotos" Style="display: none" Text='<%# Eval("Srno") %>'></asp:Label>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </section>

    <script>
        function valid() {
            var foodname = document.getElementById('<%= this.txtm.ClientID %>').value;
        var prise = document.getElementById('<%= this.txtmh.ClientID %>').value;


            if (foodname == "" || prise == "") {
                swal("Please fill all details to proceed..!", "", "error");
                return false;
            }

            return true;
        }
    </script>

</asp:Content>
