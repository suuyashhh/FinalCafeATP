<%@ Page Title="" Language="C#" MasterPageFile="~/Cafe.Master" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="FinalCafeATP.Registration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <main>
        <div class="container">

            <section class="section register min-vh-100 d-flex flex-column align-items-center justify-content-center py-4">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-lg-4 col-md-6 d-flex flex-column align-items-center justify-content-center">

                            <div class="d-flex justify-content-center py-4">
                                <h1 class="text-white fw-bold d-block" style="margin-top: 50px;">Cafe<span class="text-secondary">ATP</span> </h1>
                            </div>
                            <!-- End Logo -->

                            <div class="card yashh mb-3">

                                <div class="card-body">

                                    <div>
                                        <h1 class=" text-center" style="color: white;">Register</h1>
                                    </div>

                                    <div class="row g-3 needs-validation" novalidate="">

                                        <div class="col-12">
                                            <div class="input-box">
                                                <asp:TextBox runat="server" ID="txtname" MaxLength="16" ToolTip="Maximum 16 Characters" placeholder="Enter Your Name" CssClass="form-control"></asp:TextBox>
                                                <i class='bx bxs-user'></i>
                                            </div>
                                        </div>

                                        <div class="col-12">
                                            <div class="input-box">
                                                <asp:TextBox runat="server" ID="txtemail" placeholder="Enter Your Email" CssClass="form-control"></asp:TextBox>
                                                <i class='bx bxs-envelope'></i>
                                            </div>
                                        </div>

                                        <div class="col-12">
                                            <div class="input-box">
                                                <asp:TextBox runat="server" ID="txtcontact" placeholder="Enter Your Contact No." CssClass="form-control"></asp:TextBox>
                                                <i class='bx bxs-phone-call'></i>
                                            </div>
                                        </div>

                                        <div class="col-12">
                                            <div class="input-box">
                                                <asp:TextBox runat="server" ID="txtpass" MaxLength="8" ToolTip="Maximum 8 Characters" placeholder="Create Password" CssClass="form-control"></asp:TextBox>
                                                <i class='bx bxs-lock-alt'></i>
                                            </div>
                                        </div>

                                        <div class="col-12">
                                            <div class="input-box">
                                                <asp:TextBox runat="server" ID="txtcon" placeholder="Confirm Password" CssClass="form-control"></asp:TextBox>
                                                <i class='bx bxs-lock-alt'></i>
                                            </div>
                                        </div>

                                        <div class="col-12">
                                            <asp:Button runat="server" ID="btnbutton" class="btn" OnClick="btnbutton_Click" OnClientClick="return valid()" CssClass="btn btn-success w-100" Text="Register" />
                                        </div>
                                        <div class="col-12">
                                            <div class="register-link">
                                                <p>Already have an account?<a href="Login.aspx">Login</a></p>
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
    </main>

    <script>
        function valid() {
            var name = document.getElementById('<%= this.txtname.ClientID %>').value;
            var email = document.getElementById('<%= this.txtemail.ClientID %>').value;
            var phone = document.getElementById('<%= this.txtcontact.ClientID %>').value;
            var pass = document.getElementById('<%= this.txtpass.ClientID %>').value;
            var conf = document.getElementById('<%= this.txtcon.ClientID %>').value;
            mobilecon = /^\d{10}$/;
            emailcon = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([com\co\.\in])+$/;

            if (name == "" || email == "" || phone == "" || pass == "" || conf == "") {
                swal("Please fill all details to proceed..!", "", "error");
                return false;
            }
            if (phone != '') {
                if (!phone.match(mobilecon)) {
                    swal("Please Enter Valid Contact Number", "", "warning");
                    return false;

                }
            }
            if (email != '') {
                if (!email.match(emailcon)) {
                    swal("Please Enter Valid Email-Id", "", "error");
                    return false;
                }
            }
            if (conf != pass) {

                swal("Please Enter Valid Confirm Password", "", "error");
                return false;

            }

            return true;
        }
    </script>

</asp:Content>
