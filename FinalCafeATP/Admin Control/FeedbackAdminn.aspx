<%@ Page Title="" Language="C#" MasterPageFile="~/Admin Control/AdminCafeATP.Master" AutoEventWireup="true" CodeBehind="FeedbackAdminn.aspx.cs" Inherits="FinalCafeATP.Admin_Control.FeedbackAdminn" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



    <div class="pagetitle">
        <h1>Feedback</h1>
    </div>


    <div class="row">
        <h1 class="fe-2" style="text-align: center!important;">Feedback...!</h1>

        <div class="col-lg-3"></div>
        <div class="col-lg-6">

            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Resister Form</h5>

                    <!-- Vertical Form -->
                    <div class="services-content-icon">
                        <div class="form-group tx-1">
                            <lable>Name:</lable>
                            <asp:TextBox runat="server" ID="txtname" placeholder="Enter your name*" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="form-group tx-1">
                            <lable>Message:</lable>
                            <asp:TextBox runat="server" ID="txtmsg" TextMode="multiline" Rows="5" placeholder="Enter your message*" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="form-group tx-1">
                            <lable>Upload image:</lable>
                            <asp:FileUpload runat="server" CssClass="form-control" ID="file" AllowMultiple="false" Style="height: auto" />
                        </div>
                        <div class="tx-1">
                            <asp:Button runat="server" ID="btnbutton" OnClick="btnbutton_Click" OnClientClick="return valid()" CssClass="btn btn-success" Text="Upload" Style="margin-top: 20px" />
                        </div>
                    </div>
                    <!-- Vertical Form -->

                </div>
            </div>
        </div>

        <div class="col-lg-3"></div>


    </div>


    <%--<div class="container py-5 mb-5 ">
        <div class="container">
            <div class="row g-5">
                <h1 class="fe-2" style="text-align: center!important;">Customer Feedback...!</h1>


                <div class="col-md-6 col-lg-4 ">
                    <div class="services-item bg-light fe-1">
                        <div class="p-4">
                            <div class="services-content-icon">
                                <div class="form-group tx-1">
                                    <lable>Name:</lable>
                                    <asp:TextBox runat="server" ID="txtname" placeholder="Enter your name*" CssClass="form-control"></asp:TextBox>
                                </div>
                                <div class="form-group tx-1">
                                    <lable>Message:</lable>
                                    <asp:TextBox runat="server" ID="txtmsg" TextMode="multiline" Rows="5" placeholder="Enter your message*" CssClass="form-control"></asp:TextBox>
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
    </div>--%>


    <div class="container-fluid py-5 mb-5 ">
        <div class="container">
            <div class="row g-5">


                <asp:Repeater runat="server" ID="rgallery">


                    <ItemTemplate>
                        <div class="col-md-6 col-lg-4 ">
                            <div>
                                <div class="services-item bg-light fe-1">
                                    <div class="p-4" style="background: gray; border-radius: 10px;">
                                        <div>

                                            <div class="testimonial-item border p-4">
                                                <div class="d-flex align-items-center">
                                                    <div class="">
                                                        <img src="../images/Proflie.png" alt="">
                                                    </div>
                                                    <div class="ms-4">
                                                        <h4 class="text-secondary"><%# Eval("name") %></h4>

                                                        <div class="d-flex pe-5">
                                                            <i class="fas fa-star me-1 text-primary"></i>
                                                            <i class="fas fa-star me-1 text-primary"></i>
                                                            <i class="fas fa-star me-1 text-primary"></i>
                                                            <i class="fas fa-star me-1 text-primary"></i>
                                                            <i class="fas fa-star me-1 text-primary"></i>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="border-top mt-4 pt-3">
                                                    <p class="mb-0" style="height: 130px;"><%# Eval("message") %></p>
                                                </div>
                                                <img src='<%# Eval("photos") %>' style="width: 100%; height: 400px;" alt="">
                                            </div>

                                        </div>
                                        <div>
                                        </div>
                                    </div>
                                </div>
                                <asp:LinkButton runat="server" ID="LinkButton" OnClick="LinkButton_Click" OnClientClick="return confirm('Do you want to delete this Photo?')" Style="background-color: orange; color: white; padding: 15px"><span class="fa fa-trash"></span> Delete</asp:LinkButton>
                            </div>
                        </div>
                        <asp:Label runat="server" ID="lphotos" Style="display: none" Text='<%# Eval("Srno") %>'></asp:Label>
                    </ItemTemplate>
                </asp:Repeater>


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
