<%@ Page Title="" Language="C#" MasterPageFile="~/Admin Control/AdminCafeATP.Master" AutoEventWireup="true" CodeBehind="ViewDetails.aspx.cs" Inherits="FinalCafeATP.Admin_Control.ViewDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">




    <h1 class="headings" style="margin-top: 130px">Order</h1>

    <div class="container-fluid or-2">
        <div class="container">
            <div class="row">
                <div class="col-md-3"></div>
                <div class="col-md-6">
                    <div class=" text-center or-1">

                        <h1><b>Cafe<span class="text-secondary">ATP</span></b></h1>
                        <h4>Shop No. 16, The Empire Bulding,Near BTcollage , Shahupuri ,Kolhapur</h4>
                        <hr />
                        <br />
                        <h4 style="text-align: start!important">Name:
                            <asp:Literal runat="server" ID="lname"></asp:Literal></h4>
                        <h4 style="text-align: start!important">Date:
                            <asp:Literal runat="server" ID="ldate"></asp:Literal></h4>
                        <h4 style="text-align: start!important">Cashiar: Biller</h4>
                        <hr />
                        <br />
                        <div class="row">


                            <asp:GridView runat="server" ID="gridv" DataKeyNames="srno" AutoGenerateColumns="false" CssClass="table table-borderless" Style="text-align: center; border: 0px">
                                <columns>

                                    <asp:TemplateField HeaderText="<h5>Item:</h5>" ItemStyle-Height="100px">
                                        <itemtemplate>
                                            <h4>
                                                <asp:Label runat="server" ID="lblname" Text='<%# Eval("item_name") %>'></asp:Label>
                                            </h4>
                                        </itemtemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="<h5>Qty.:</h5>" ItemStyle-Height="100px">
                                        <itemtemplate>
                                            <h4>
                                                <asp:Label runat="server" ID="Label1" Text='<%# Eval("quantity") %>'></asp:Label>
                                            </h4>
                                        </itemtemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="<h5>Prise:</h5>" ItemStyle-Height="100px" >
                                        <itemtemplate>
                                            <h4>
                                                <asp:Label runat="server" ID="Label2" Text='<%# Eval("rate") + "/-" %>'></asp:Label>
                                            </h4>
                                        </itemtemplate>
                                    </asp:TemplateField>


                                    <asp:TemplateField HeaderText="<h5>Amount:</h5>" ItemStyle-Height="100px">
                                        <itemtemplate>
                                            <h4>
                                                <asp:Label runat="server" ID="lblprice" Text='<%# Eval("total") + "/-" %>'></asp:Label>
                                            </h4>
                                        </itemtemplate>
                                    </asp:TemplateField>
                                </columns>
                            </asp:GridView>


                            <hr />
                            <br />
                            <table class="table table-borderless">
                                <thead>
                                    <tr>
                                        <th scope="col">
                                            <h4>Total Qty :
                                                <asp:Literal runat="server" ID="ltotal_qty"></asp:Literal></h4>
                                        </th>
                                        <th scope="col">
                                            <h4>Total :
                                                <asp:Literal runat="server" ID="ltotal"></asp:Literal>/-</h4>
                                        </th>

                                </thead>
                            </table>
                            <hr />
                            <br />
                            <h4>Thanks</h4>

                        </div>
                    </div>
                    <div class="col-md-3" style="margin-bottom: 100px"></div>
                </div>

            </div>
        </div>
    </div>




</asp:Content>
