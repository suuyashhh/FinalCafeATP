<%@ Page Title="" Language="C#" MasterPageFile="~/Cafe.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="FinalCafeATP.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

        <div class="container">

            <section class="section register min-vh-100 d-flex flex-column align-items-center justify-content-center py-4">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-lg-4 col-md-6 d-flex flex-column align-items-center justify-content-center">

                            <div class="d-flex justify-content-center py-4">
                                <h1 class="text-white fw-bold d-block">Cafe<span class="text-secondary">ATP</span> </h1>
                            </div>
                            <!-- End Logo -->

                            <div class="card yashh mb-3">

                                <div class="card-body">

                                    <div>
                                        <h1 class=" text-center" style="color: white;">Login</h1>
                                    </div>

                                    <div class="row g-3 needs-validation" novalidate="">

                                        <div class="col-12">
                                            <div class="input-box">
                                                <asp:TextBox runat="server" ID="txtcontact" placeholder="Contact No." CssClass="form-control"></asp:TextBox>
                                               
                                            </div>
                                        </div>

                                        <div class="col-12">
                                            <div class="input-box">
                                                <asp:TextBox runat="server" ID="txtpass" placeholder="Password" CssClass="form-control"></asp:TextBox>
                                                <i class='bx bxs-lock-alt'></i>
                                            </div>
                                        </div>

                                        <div class="col-12">
                                            <asp:Button runat="server" OnClientClick="return valid()" ID="btnbutton" class="btn" OnClick="btnbutton_Click" CssClass="btn btn-success w-100" Text="Login" />
                                        </div>
                                        <div class="col-12">
                                            <div class="register-link">
                                                <p>Don't have an account?<a href="Registration.aspx">Resister</a></p>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>


                        </div>
                    </div>
                </div>

            </section>

        </div>

    <script>
        function valid() {
            var phone = document.getElementById('<%= this.txtcontact.ClientID %>').value;
            var pass = document.getElementById('<%= this.txtpass.ClientID %>').value;
                       

            if (phone == "" || pass == "" || ) {
                swal("Please fill Login details..!", "", "error");
                return false;
            }          

            return true;
        }
    </script>

</asp:Content>
