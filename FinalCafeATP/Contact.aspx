<%@ Page Title="" Language="C#" MasterPageFile="~/Cafe.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="FinalCafeATP.Contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .Contact-action{
             color: #26d48c !important
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- Page Header Start -->
    <div class="container-fluid page-header contactt py-5">
        <div class="container text-center py-5">
            <h1 class="display-2 text-white mb-4 animated slideInDown">Contact Us</h1>
            <nav aria-label="breadcrumb animated slideInDown">
                <ol class="breadcrumb justify-content-center mb-0">
                    <li class="breadcrumb-item"><a href="#">Home</a></li>
                    <li class="breadcrumb-item"><a class="text-secondary" href="#">Contact Us</a></li>
                    <li class="breadcrumb-item" aria-current="page"><asp:LinkButton runat="server" OnClick="Unnamed_Click"><asp:Label runat="server" Id="logout_btn"></asp:Label></asp:LinkButton><a runat="server" id="btn_sign" href="Login.aspx">Login</a></li>
                </ol>
            </nav>
        </div>
    </div>
    <!-- Page Header End -->


    <!-- Contact Start -->
    <div class="container-fluid py-5 mt-5">
        <div class="container py-5">
            <div class="contact-detail position-relative p-5">
                <div class="row g-5 mb-5 justify-content-center">
                    <div class="col-xl-4 col-lg-6 wow fadeIn" data-wow-delay=".3s">
                        <div class="d-flex bg-light p-3 rounded">
                            <div class="flex-shrink-0 btn-square bg-secondary rounded-circle" style="width: 44px; height: 44px;">
                                <i class="fas fa-map-marker-alt text-white"></i>
                            </div>
                            <div class="ms-3">
                                <h4 class="text-primary">Address</h4>
                                <a href="https://maps.app.goo.gl/BWxP1V3JwmZcyqBn9" target="_blank" class="h5">CafeAtp,Shahupuri 5th lane,Kolhapur  </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-4 col-lg-6 wow fadeIn" data-wow-delay=".5s">
                        <div class="d-flex bg-light p-3 rounded">
                            <div class="flex-shrink-0 btn-square bg-secondary rounded-circle" style="width: 44px; height: 44px;">
                                <i class="fa fa-phone text-white"></i>
                            </div>
                            <div class="ms-3">
                                <h4 class="text-primary">Call Us</h4>
                                <a class="h5" href="tel:+918180821173" target="_blank">+91 8180821173</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-4 col-lg-6 wow fadeIn" data-wow-delay=".7s">
                        <div class="d-flex bg-light p-3 rounded">
                            <div class="flex-shrink-0 btn-square bg-secondary rounded-circle" style="width: 44px; height: 44px;">
                                <i class="fa fa-envelope text-white"></i>
                            </div>
                            <div class="ms-3">
                                <h4 class="text-primary">Email Us</h4>
                                <a class="h5" href="mailto:suyashpatil2113@gmail.com" target="_blank">suyashpatil2113@gmail.com</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row g-5">
                    <div class="col-lg-6 wow fadeIn" data-wow-delay=".3s">
                        <div class="p-5 h-100 rounded contact-map">
                            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3821.5322089481983!2d74.23238437477266!3d16.700276284074448!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3bc1006cc782f961%3A0xa8f84c6f2dffa71d!2sShahupuri%205th%20Ln%2C%20E%20Ward%2C%20Shahupuri%2C%20Kolhapur%2C%20Maharashtra%20416001!5e0!3m2!1sen!2sin!4v1709047633089!5m2!1sen!2sin" style="border: 0; width: 100%; height: 100%" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                        </div>
                    </div>
                    <div class="col-lg-6 wow fadeIn" data-wow-delay=".5s">
                        <div class="cu-1 rounded contact-form">
                            <div class="mb-4">
                                <asp:TextBox runat="server" type="text" ID="txtname" ToolTip="Enter Name" CssClass="form-control border-0 py-3" placeholder="Enter Name*"></asp:TextBox>
                            </div>
                            <div class="mb-4">
                                <asp:TextBox runat="server" type="email" ID="txtemail" ToolTip="Enter Email" CssClass="form-control border-0 py-3" placeholder="Enter Email*"></asp:TextBox>
                            </div>
                            <div class="mb-4">
                                <asp:TextBox runat="server" type="number" ID="txtcontact" ToolTip="Enter Contact" CssClass="form-control border-0 py-3" placeholder="Enter Contact*"></asp:TextBox>
                            </div>
                            <div class="mb-4">
                                <asp:TextBox runat="server" ID="txtmsg" ToolTip="Enter Your Message" TextMode="MultiLine" Rows="7" CssClass="w-100 form-control border-0 py-3" placeholder="Enter Message*"></asp:TextBox>
                            </div>
                            <div class="text-start">
                                <asp:Button runat="server" ID="btn_contact" OnClick="btn_contact_Click" OnClientClick="return valid()" CssClass="btn bg-success text-white py-3 px-5" Text="Send" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Contact End -->

    <script>
        function valid() {
            var name = document.getElementById('<%= this.txtname.ClientID %>').value;
           var email = document.getElementById('<%= this.txtemail.ClientID %>').value;
           var phone = document.getElementById('<%= this.txtcontact.ClientID %>').value;
           var msg = document.getElementById('<%= this.txtmsg.ClientID %>').value;
            mobilecon = /^\d{10}$/;
            emailcon = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([com\co\.\in])+$/;

            if (name == "" || email == "" || phone == "" || msg == "") {
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

            return true;
        }
    </script>

</asp:Content>
