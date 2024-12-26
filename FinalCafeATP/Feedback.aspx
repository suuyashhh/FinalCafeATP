<%@ Page Title="" Language="C#" MasterPageFile="~/Cafe.Master" AutoEventWireup="true" CodeBehind="Feedback.aspx.cs" Inherits="FinalCafeATP.Feedback" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .Feedback-action{
             color: #26d48c !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- Page Header Start -->
    <div class="container-fluid page-header py-5">
        <div class="container text-center py-5">
            <h1 class="display-2 text-white mb-4 animated slideInDown">Feedback</h1>
            <nav aria-label="breadcrumb animated slideInDown">
                <ol class="breadcrumb justify-content-center mb-0">
                    <li class="breadcrumb-item"><a href="Home.aspx">Home</a></li>
                    <li class="breadcrumb-item"><a class="text-secondary" href="#">Feedback</a></li>
                    <li class="breadcrumb-item" aria-current="page"><asp:LinkButton runat="server" OnClick="Unnamed_Click"><asp:Label runat="server" Id="logout_btn"></asp:Label></asp:LinkButton><a runat="server" id="btn_sign" href="Login.aspx">Login</a></li>
                </ol>
            </nav>
        </div>
    </div>
    <!-- Page Header End -->


    <div class="container py-5 mb-5 ">
        <div class="container">
            <div class="row g-5">
                <h1 class="fe-2">Give Your Feedback Here...!</h1>
                <div class="col-md-6 col-lg-4 ">
                    <div class="services-item bg-light fe-1">
                        <div class="p-4">
                            <div class="services-content-icon">
                                <div class="form-group tx-1">
                                    <lable>Name:</lable>
                                    <asp:TextBox runat="server" ID="txtname" MaxLength="15" ToolTip="Maximum 15 Characters" placeholder="Enter your name*" CssClass="form-control"></asp:TextBox>
                                </div>
                                <div class="form-group tx-1">
                                    <lable>Message:</lable>
                                    <asp:TextBox runat="server" ID="txtmsg" TextMode="multiline" MaxLength="140" Rows="5" placeholder="Enter your message*" CssClass="form-control"></asp:TextBox>
                                </div>
                                <div class="form-group tx-1">
                                    <lable>Upload image:</lable>
                                    <asp:FileUpload runat="server" CssClass="form-control" ID="file" AllowMultiple="false" Style="height: auto" />
                                </div>
                                <div class="tx-1">
                                    <asp:Button runat="server" ID="btnbutton" OnClick="btnbutton_Click" OnClientClick="return valid()" CssClass="btn btn-success" Text="Upload" Style="margin-top: 20px" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>



    <div class="container-fluid py-5 mb-5 ">
        <div class="container">
            <div class="row g-5">
                <h1 class="fe-2" style="text-align: center!important;">Customer Feedback...!</h1>

                <asp:Literal runat="server" ID="Mmenus"></asp:Literal>


            </div>
        </div>
    </div>

    <script>
        function valid() {
            var name = document.getElementById('<%= this.txtname.ClientID %>').value;
            var file = document.getElementById('<%= this.file.ClientID %>').value;
            var msg = document.getElementById('<%= this.txtmsg.ClientID %>').value;

            if (name == "" || file == "" || msg == "") {
                swal("Please fill all details to proceed..!", "", "error");
                return false;
            }
           
            return true;
        }
    </script>



</asp:Content>
