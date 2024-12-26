<%@ Page Title="" Language="C#" MasterPageFile="~/Admin Control/AdminCafeATP.Master" AutoEventWireup="true" CodeBehind="RegistrationAdminn.aspx.cs" Inherits="FinalCafeATP.Admin_Control.Registrations" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



    <div class="pagetitle">
        <h1>Register</h1>
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                <li class="breadcrumb-item active">Register</li>
            </ol>
        </nav>
    </div>


    <!-- End Page Title -->
    <section class="section">
        <div class="row">
            <h1 class="fe-2" style="text-align: center!important;">Registrations...!</h1>
            <div class="col-lg-3"></div>
            <div class="col-lg-6">

                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Resister Form</h5>

                        <!-- Vertical Form -->
                        <div class="row g-3">
                            <div class="col-12">
                                <label for="inputNanme4" class="form-label">Name</label>
                                <asp:TextBox runat="server" ID="txtname" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="col-12">
                                <label for="inputEmail4" class="form-label">Email</label>
                                <asp:TextBox runat="server" ID="txtemail" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="col-12">
                                <label for="inputContact" class="form-label">Contact</label>
                                <asp:TextBox runat="server" ID="txtcont" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="col-12">
                                <label for="inputPassword4" class="form-label">Password</label>
                                <asp:TextBox runat="server" ID="txtpass" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="text-center">
                                <asp:Button runat="server" OnClick="btnbutton_Click" OnClientClick="return valid()" ID="btnbutton" Text="ADD" CssClass="btn btn-success" />
                                <button type="reset" class="btn btn-secondary">Reset</button>
                            </div>
                        </div>
                        <!-- Vertical Form -->

                    </div>
                </div>
            </div>

            <div class="col-lg-3"></div>


        </div>




        <div class="row">
            <div class="col-lg-12">

                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Registered</h5>


                        <div class="table-responsive">
                            <asp:GridView runat="server" ID="gridv" DataKeyNames="srno" AutoGenerateColumns="false" OnRowEditing="gridv_RowEditing" OnRowCancelingEdit="gridv_RowCancelingEdit" OnRowUpdating="gridv_RowUpdating" OnRowDeleting="gridv_RowDeleting" CssClass="table " Style="text-align: center; margin-top: 90px">
                                <Columns>
                                    <asp:TemplateField HeaderText="Name:">
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="lblname" Text='<%# Eval("name") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox runat="server" ID="txtname" Text='<%# Eval("name") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Email:">
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="lblemail" Text='<%# Eval("email") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox runat="server" ID="txtemail" Text='<%# Eval("email") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Contact:">
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="lblcont" Text='<%# Eval("contact") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox runat="server" ID="txtcont" Text='<%# Eval("contact") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Password:">
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="lblpass" Text='<%# Eval("password") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox runat="server" ID="txtpass" Text='<%# Eval("password") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Date:">
                                        <ItemTemplate>
                                            <asp:Label runat="server" Text='<%# Eval("date") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:CommandField ButtonType="Button" ShowEditButton="true" ShowDeleteButton="true" ItemStyle-Width="190" />
                                </Columns>
                            </asp:GridView>
                        </div>




                    </div>
                </div>
            </div>
        </div>
    </section>

    <script>
        function valid() {
            var name = document.getElementById('<%= this.txtname.ClientID %>').value;
            var email = document.getElementById('<%= this.txtemail.ClientID %>').value;
            var phone = document.getElementById('<%= this.txtcont.ClientID %>').value;
            var pass = document.getElementById('<%= this.txtpass.ClientID %>').value;
            mobilecon = /^\d{10}$/;
            emailcon = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([com\co\.\in])+$/;

            if (name == "" || email == "" || phone == "" || pass == "" ) {
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
