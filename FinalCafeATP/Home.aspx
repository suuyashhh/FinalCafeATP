<%@ Page Title="" Language="C#" MasterPageFile="~/Cafe.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="FinalCafeATP.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .Home-action {
            color: #26d48c !important
        }

        input[type="checkbox"] {
            height: 20px;
            width: 25px;
        }

        .tot_b {
            font-family: "Trirong", sans-serif;
            color: #ffc107;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- Carousel Start -->
     <div class="container-fluid px-0">
        <div id="carouselId" class="carousel slide" data-bs-ride="carousel">
            <%--<ol class="carousel-indicators">
                <li data-bs-target="#carouselId" data-bs-slide-to="0" class="active" aria-current="true" aria-label="First slide"></li>
                <li data-bs-target="#carouselId" data-bs-slide-to="1" aria-label="Second slide"></li>
            </ol>--%>
            <div class="carousel-inner" role="listbox">
                <div class="carousel-item active">
                    <img src="images/himg-1.jpg" class="img-fluid" alt="First slide">
                    <div class="carousel-caption">
                        <div class="container carousel-content">
                            <h1 class="text-white display-1 mb-4 animated fadeInRight">CAFE<span class="text-secondary">ATP</span> </h1>
                            <p class="mb-4 text-white fs-5 animated fadeInDown">Give yourself a testy burger....!</p>
                            
                                <asp:Button runat="server" ID="boxBtnn" OnClick="boxBtnn_Click" type="button" Text="EXPLORE MENU" class="px-4 py-sm-3 px-sm-5 btn btn-success rounded-pill carousel-content-btn1 animated fadeInCenter" />
                        </div>
                    </div>
                </div>
                <div class="carousel-item">
                    <img src="images/himg-3.jpg" class="img-fluid" alt="Second slide">
                    <div class="carousel-caption">
                        <div class="container carousel-content">
                            <h1 class="text-white display-1 mb-4 animated fadeInRight">CAFE<span class="text-secondary">ATP</span> </h1>
                            <p class="mb-4 text-white fs-5 animated fadeInDown">Give yourself a testy burger....!</p>
                            
                                <asp:Button runat="server" type="button" ID="btn1Box" OnClick="btn1Box_Click" Text="EXPLORE MENU" class="px-4 py-sm-3 px-sm-5 btn btn-success rounded-pill carousel-content-btn1 animated fadeInCenter" />
                        </div>
                    </div>
                </div>
            </div>            
        </div>
    </div>
    <!-- Carousel End -->



    <!--Todays spetial deals start-->
    <div class="container py-5 my-5">
        <h1 class="headings">TODAY'S SPECIAL DEALS:</h1>

        <div class="row jhg">
            <asp:Literal runat="server" ID="lphotos"></asp:Literal>
        </div>

    </div>
    <!--Todays spetial deals start-->




    <!--Owner start-->
    <div class="container py-5 my-5" style="cursor: default">
        <h1 class="headings">OWNER:</h1>
        <div class="row r-con" style="margin-top: 50px;">
            <div class="col-md-6">
                <asp:Literal runat="server" ID="lowner"></asp:Literal>                
            </div>
            <div class="col-md-6 owner">
                <h1>Suyash Patil....!</h1>
                <div>
                    <p>Cafe <span class="text-secondary">Adenosine Triphosphate</span> is more than a cafe; it's a commitment to culinary excellence. Join us for an experience where good food isn't just a promise; it's a guarantee.</p>
                    <p style="margin-left: 50px;">At Cafe ATP, we're not just serving food; we're crafting experiences.pure satisfaction  flavors and quality. Because we believe that good food is the foundation of great moments.</p>
                </div>
            </div>
        </div>
    </div>
    <!--Owner end-->


    <!--Home menu start-->
    <div class="container" style="padding-bottom: 100px; cursor: default">
        <h1 class="headings" id="Omenu">MENU:</h1>
        <div class="row r-con" style="margin-top: 50px;">

            <div class="col-md-0"></div>
            <div class="col-md-12 g-menu">
                <asp:GridView runat="server" ID="gridv" DataKeyNames="srno" AutoGenerateColumns="false" CssClass="table table-borderless" Style="text-align: center; border: 0px">
                    <Columns>
                        <asp:TemplateField ItemStyle-Height="100px">
                            <ItemTemplate>
                                <asp:CheckBox CssClass="cb" ID="rememberMe" runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField ItemStyle-Height="100px">
                            <ItemTemplate>
                                <asp:DropDownList ID="Ddlqty" runat="server" Style="text-align: center; width: 80px;">
                                    <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                    <asp:ListItem Text="3" Value="3"></asp:ListItem>
                                    <asp:ListItem Text="4" Value="4"></asp:ListItem>
                                    <asp:ListItem Text="5" Value="5"></asp:ListItem>
                                </asp:DropDownList>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ItemStyle-Height="100px">
                            <ItemTemplate>
                                <h2 class="g-menu">
                                    <asp:Label runat="server" ID="lblname" Text='<%# Eval("menu_name") %>'></asp:Label></h2>
                            </ItemTemplate>
                        </asp:TemplateField>


                        <asp:TemplateField ItemStyle-Height="100px">
                            <ItemTemplate>
                                <h2 class="g-menu">
                                    <asp:Label runat="server" ID="lblprice" Text='<%# Eval("price") %>'></asp:Label></h2>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
            <div class="col-md-0"></div>


        </div>
        <div class="row">

            <asp:GridView runat="server" ID="GridView1" DataKeyNames="srno" AutoGenerateColumns="false" CssClass="table table-borderless" Style="text-align: center; border: 0px">
                <Columns>

                    <asp:TemplateField ItemStyle-Height="100px">
                        <ItemTemplate>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField ItemStyle-Height="100px">
                        <ItemTemplate>
                            <h3 style="width: 100px"></h3>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-Height="100px">
                        <ItemTemplate>
                        </ItemTemplate>
                    </asp:TemplateField>


                    <asp:TemplateField ItemStyle-Height="100px">
                        <ItemTemplate>
                            <h2 class="tot_b">
                                <asp:Label runat="server" ID="lblprice" Text='<%# "Total    :    " + Eval("total") + "/-" %>'></asp:Label></h2>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>


        </div>

        <div class="row">
            <div class="text-center" style="margin-top: 30px; margin-bottom: 50px;">
                <asp:Button runat="server" ID="Boxbtn" OnClick="Unnamed_Click1" Text="View More" CssClass="btn btn-none" Style="width: 150px; background: #26d48c;color:white" />
            </div>
            <div class="text-center" style="margin-top: 50px; margin-bottom: 10px">
                <asp:Button runat="server" ID="Total_bt" OnClick="Total_bt_Click" OnClientClick="return validateCheckbox()" Text="Get Total" CssClass="btn btn-warning" Style="width: 100px" />
            </div>
            <div class="text-center" style="margin-top: 50px; margin-bottom: 150px">
                <asp:Button runat="server" OnClick="Unnamed_Click" OnClientClick="return validateCheckbox()" Text="Place Order" CssClass="btn btn-success" Style="width: 150px" />
            </div>
        </div>
    </div>
    <!--Home menu end-->

    <script>
        function validateCheckbox() {

            var checkboxes = document.querySelectorAll('input[type="checkbox"]');
            var checked = false;

            checkboxes.forEach(function (checkbox) {
                if (checkbox.checked) {
                    checked = true;
                    return;
                }
            });

            if (!checked) {
                swal("Please check at least one checkbox.", "", "error");
                return false;
            }

            return true;
        }
    </script>

</asp:Content>
