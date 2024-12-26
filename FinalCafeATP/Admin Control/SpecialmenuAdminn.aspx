<%@ Page Title="" Language="C#" MasterPageFile="~/Admin Control/AdminCafeATP.Master" AutoEventWireup="true" CodeBehind="SpecialmenuAdminn.aspx.cs" Inherits="FinalCafeATP.Admin_Control.SpecialmenuAdminn" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="pagetitle">
        <h1>Home</h1>
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                <li class="breadcrumb-item active">Special Menu</li>
            </ol>
        </nav>
    </div>
    <!-- End Page Title -->
    <section class="section">
        <div class="row">
            <h1 class="fe-2" style="text-align: center!important;">Special Menu...!</h1>

            <div class="col-lg-3"></div>
            <div class="col-lg-6">

                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Special Menu</h5>

                        <!-- Vertical Form -->
                        <div class="row g-3">
                            <div class="col-12">
                                <lable class="form-label">Item No:</lable>
                                <asp:TextBox runat="server" ID="txtitem" placeholder="Enter Item No*" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="col-12">
                                <lable class="form-label">Upload Image:</lable>
                                <asp:FileUpload runat="server" CssClass="form-control" ID="file" AllowMultiple="false" Style="height: auto" />
                            </div>
                            <div class="col-12">
                                <lable class="form-label">Item Name:</lable>
                                <asp:TextBox runat="server" ID="txtiname" placeholder="Enter Item Name*" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="col-12">
                                <lable class="form-label">Prise:</lable>
                                <asp:TextBox runat="server" ID="txtprise" placeholder="Enter Prise*" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="col-12">
                                <lable class="form-label">Main Prise:</lable>
                                <asp:TextBox runat="server" ID="txtmain" placeholder="Enter Main Prise*" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="text-center">
                                <asp:Button runat="server" ID="btnbutton" OnClick="btnbutton_Click" OnClientClick="return valid()" CssClass="btn btn-success" Text="Upload" Style="margin-top: 20px" />
                            </div>
                        </div>
                        <!-- Vertical Form -->

                    </div>
                </div>
            </div>

            <div class="col-lg-3"></div>

        </div>

        <div class="container py-5 my-5">

            <div class="row jhg">



                <asp:Repeater runat="server" ID="rgallery">

                    <ItemTemplate>
                        <div class='col-md-4'>
                            <div class='card menue ' data-aos='fade-left'>
                                <div class='card-header' style="text-transform: uppercase;"><%# Eval("header") %></div>
                                <img src='<%# Eval("image") %>' />
                                <div class='card-body'>
                                    <h5 class='card-title' style="text-transform: uppercase;"><%# Eval("title") %></h5>
                                    <p class='card-text'><strong>₹<%# Eval("text") %></strong> <del>₹<%# Eval("mainprice") %></del></p>
                                    <button type='button' class='btn btn-success'>Place Order</button>
                                </div>
                                <asp:LinkButton runat="server" ID="LinkButton1" OnClick="LinkButton1_Click" OnClientClick="return confirm('Do you want to delete this Photo?')" Style="background-color: orange; color: white; padding: 15px"><span class="fa fa-trash"></span> Delete</asp:LinkButton>
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
            var itemno = document.getElementById('<%= this.txtitem.ClientID %>').value;
         var itemname = document.getElementById('<%= this.txtiname.ClientID %>').value;
         var file = document.getElementById('<%= this.file.ClientID %>').value;
         var prise = document.getElementById('<%= this.txtprise.ClientID %>').value;
         var mprise = document.getElementById('<%= this.txtmain.ClientID %>').value;


            if (itemno == "" || file == "" || itemname == "" || prise == "" || mprise == "") {
                swal("Please fill all details to proceed..!", "", "error");
                return false;
            }

            return true;
        }
    </script>


</asp:Content>
