<%@ Page Title="" Language="C#" MasterPageFile="~/Admin Control/AdminCafeATP.Master" AutoEventWireup="true" CodeBehind="SelfAdmin.aspx.cs" Inherits="FinalCafeATP.Admin_Control.SelfAdmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="pagetitle">
        <h1>Self</h1>
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="index.html">Self</a></li>
                <li class="breadcrumb-item active">Client Page Images</li>
            </ol>
        </nav>
    </div>



    <div class="container">
        <div class="row content">
            <asp:Repeater runat="server" ID="rgallery">

                <ItemTemplate>
                    <div class="col-md-4 m-list"></div>
                    <div class="col-md-4 m-list">
                        <a class="yash" >
                            <img src='<%# Eval("photo") %>' width="100%"><br />
                        </a>
                    </div>
                    <div class="col-md-4 m-list"></div>

                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>


    <div class="row">
        <h1 class="fe-2" style="text-align: center!important;">UPDATE...!</h1>

        <div class="col-lg-3"></div>
        <div class="col-lg-6">

            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Update Home Fild Photo</h5>

                    <!-- Vertical Form -->
                    <div class="services-content-icon">
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








    <%-- Second About Image  --%>
    
    <div class="container">
        <div class="row content">
            <asp:Repeater runat="server" ID="Aboutgallery">

                <ItemTemplate>
                    <div class="col-md-4 m-list"></div>
                    <div class="col-md-4 m-list">
                        <a class="yash" >
                            <img src='<%# Eval("photo") %>' width="100%"><br />                            
                        </a>
                    </div>
                    <div class="col-md-4 m-list"></div>

                </ItemTemplate>
            </asp:Repeater>
        </div>
    


    <div class="row">
        <h1 class="fe-2" style="text-align: center!important;">UPDATE...!</h1>

        <div class="col-lg-3"></div>
        <div class="col-lg-6">

            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Update About Fild Photo</h5>

                    <!-- Vertical Form -->
                    <div class="services-content-icon">
                        <div class="form-group tx-1">
                            <lable>Upload image:</lable>
                            <asp:FileUpload runat="server" CssClass="form-control" ID="Fileupload" AllowMultiple="false" Style="height: auto" />
                        </div>
                        <div class="tx-1">
                            <asp:Button runat="server" ID="Button1" OnClick="Button1_Click"  OnClientClick="return validAbout()" CssClass="btn btn-success" Text="Upload" Style="margin-top: 20px" />
                        </div>
                    </div>
                    <!-- Vertical Form -->

                </div>
            </div>
        </div>

        <div class="col-lg-3"></div>


    </div>
        </div>



    <script>
        function valid() {
        var file = document.getElementById('<%= this.file.ClientID %>').value;


            if (file == "" ) {
                swal("Please fill all details to proceed..!", "", "error");
                return false;
            }

            return true;
        }
    </script>

     <script>
         function validAbout() {
             var file = document.getElementById('<%= this.Fileupload.ClientID %>').value;


             if (file == "") {
                 swal("Please fill all details to proceed..!", "", "error");
                 return false;
             }

             return true;
         }
     </script>

</asp:Content>
