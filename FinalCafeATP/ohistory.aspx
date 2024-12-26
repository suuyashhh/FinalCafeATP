<%@ Page Title="" Language="C#" MasterPageFile="~/Cafe.Master" AutoEventWireup="true" CodeBehind="ohistory.aspx.cs" Inherits="FinalCafeATP.ohistory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        h4 {
            color: #198754;
        }

        h3 {
            color: white;
        }

        .h4-header {
            font-size: 1.5rem;
            font-weight: bold;
            color: #198754;
            margin-bottom: 10px;
        }

        .h3-item {
            font-size: 24px;
            color: white;
            font-weight: bold;
        }
    </style>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <!--Owner start-->
    <div class="container py-5 my-5">

        <div class="row r-con" style="margin-top: 50px; color: white">

            <div class="table-responsive">
                <asp:GridView runat="server" ID="gridv" DataKeyNames="srno" AutoGenerateColumns="false" CssClass="table table-borderless" Style="text-align: center; border: 0px">
                    <Columns>
                        <asp:TemplateField HeaderText="<h4>OrderId:</h4>" ItemStyle-Height="100px">
                            <ItemTemplate>
                                <h3>
                                    <asp:Label runat="server" ID="lblname" Text='<%# Eval("srno") %>'></asp:Label></h3>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <%--                    <asp:BoundField  DataField="date" HeaderText="<h4>Date</h4>" DataFormatString="<h3>{0:dd/MM/yyyy}<h3>" />--%>

                        <asp:BoundField DataField="date" HeaderText="Date" SortExpression="ColumnName" DataFormatString="{0:dd/MM/yyyy hh:mm tt}">
                            <HeaderStyle CssClass="h4-header" />
                            <ItemStyle CssClass="h3-item" />
                        </asp:BoundField>

                        <asp:TemplateField HeaderText="<h4>Amount:</h4>" ItemStyle-Height="100px">
                            <ItemTemplate>
                                <h3 class="g-menu">
                                    <asp:Label runat="server" ID="lblprice" Text='<%# Eval("order_total") + "/-" %>'></asp:Label></h3>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="<h4>View Details</h4>">

                            <ItemTemplate>

                                <a class="btn btn-primary" href='order.aspx?id=<%# Eval("order_id")%>'>View Details</a>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>

        </div>
    </div>
    <!--Owner end-->


</asp:Content>
