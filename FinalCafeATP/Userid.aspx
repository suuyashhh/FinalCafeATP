<%@ Page Title="" Language="C#" MasterPageFile="~/Cafe.Master" AutoEventWireup="true" CodeBehind="Userid.aspx.cs" Inherits="FinalCafeATP.Userid" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="container">
        <div class="row justify-content-center" style="margin-top: 250px">
            <div class="col-lg-4 col-md-6 d-flex flex-column align-items-center justify-content-center">

                <div class="d-flex justify-content-center py-4">
                    <div class="card" style="padding: 5px;">
                       <asp:LinkButton runat="server" OnClick="Unnamed_Click"><h1>Logout</h1></asp:LinkButton>
                    </div>
                </div>
            </div>
        </div>

        <div class="row justify-content-center" style="margin-top:50px;margin-bottom:100px;">
            <div class="col-lg-4 col-md-6 d-flex flex-column align-items-center justify-content-center">

                <div class="d-flex justify-content-center py-4">
                    <div class="card" style="padding: 5px;">
                        <a href="ohistory.aspx"><h1>Order History</h1></a>
                    </div>
                </div>
            </div>
        </div>

    </div>

</asp:Content>
