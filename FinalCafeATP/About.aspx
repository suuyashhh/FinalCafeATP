<%@ Page Title="" Language="C#" MasterPageFile="~/Cafe.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="FinalCafeATP.About" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .About-action{
             color: #26d48c !important
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- Page Header Start -->
    <div class="container-fluid page-header contactt py-5">
        <div class="container text-center py-5">
            <h1 class="display-2 text-white mb-4 animated slideInDown">About Us</h1>
            <nav aria-label="breadcrumb animated slideInDown">
                <ol class="breadcrumb justify-content-center  mb-0">
                    <li class="breadcrumb-item"><a href="Home.aspx">Home</a></li>
                    <li class="breadcrumb-item"><a class="text-secondary" href="#">About Us</a></li>
                    <li class="breadcrumb-item" aria-current="page"><asp:LinkButton runat="server" OnClick="Unnamed_Click"><asp:Label runat="server" Id="logout_btn"></asp:Label></asp:LinkButton><a runat="server" id="btn_sign" href="Login.aspx">Login</a></li>
                </ol>
            </nav>
        </div>
    </div>
    <!-- Page Header End -->

    <div class="container-fluid py-5 mb-5">
        <div class="container">
            <div class="contact-detail bg-co position-relative p-5">
                <div class="text-center mx-auto pb-5 wow fadeIn" data-wow-delay=".3s" style="max-width: 600px;">
                    <h1 class="top">Cafe<span class="text-secondary">ATP</span></h1>
                    <h2 class="top" style="color: orange">Why Cafe ATP?</h2>
                    <h6 class="top">Because where every sip and bite is infused with the essence of energy and flavor. Our name, inspired by <span class="highlight">Adenosine Triphosphate</span>, symbolizes a commitment to providing a revitalizing dining experience. Join us for a journey of taste and vitality, where good food meets the science of satisfaction.</h6>
                    <h6 class="top">Cafe ATP exists for one simple reason: to bring you the joy of good food. We believe in the power of a delicious meal to create smiles and build connections.At Cafe ATP, our raison is clear – we are here to serve you exceptional food. Step into a haven where every plate is a testament to our passion for quality dining.</h6>
                    <h6 class="top">We're passionate about delivering more than just food; we're offering a culinary journey that transforms each bite into a memorable delight.In a world where good food matters, Cafe ATP stands out. Our kitchen is dedicated to preparing dishes that not only satisfy hunger but ignite your taste buds with pure satisfaction.</h6>
                </div>
            </div>
        </div>
    </div>

    <h1 class="headings">About The Founder</h1>

    <div class="container-fluid py-5 mb-5 team">
        <div class="container">
            <div class="row">
                <div class="col-md-3"></div>
                <div class="col-md-6">
                    <div class="rounded team-item">
                        <div class="team-content">
                            <div class="team-img-icon">
                                <div class="team-img rounded-circle">
                                     <img src="images/ownerr.png" class='img-fluid w-100 rounded-circle' alt='' / > 
                                    
                                </div>
                                <div class="team-name text-center py-3">
                                    <h4 class="top">Suyash Patil</h4>

                                </div>
                                <div class="team-icon justify-content-center pb-4">
                                    <h6 class="top" style="margin-top: 40px;color:black!important">Hi, I'm Suyash Patil, a dedicated .NET developer who enjoys creating advanced web solutions. I specialize in using the latest technologies to build smooth and effective applications. I love tackling challenges and committed to delivering great results. I have a strong background in the Microsoft .NET framework and skilled at creating strong and scalable web applications.</h6>
                                    <h6 class="top" style="color:black!important" >I'm particularly proud of creating Cafe ATP Web, a project that reflects my passion for making applications that are easy to use and visually attractive. This web platform is intended for cafes, allowing customers to order food, provide feedback, and upload photos from the cafe. However, to access these features, users need to sign in. Without signing in, they can only view the menu and feedback. After placing an order, they can also check their order history and the bill.</h6>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-3"></div>
            </div>

        </div>
    </div>
</asp:Content>
