<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CFT.Default" %>
<asp:Content ID="cntHead" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="cntBody" ContentPlaceHolderID="main" runat="server">
    <section id="featured">
	    <div class="container">
		    <div class="row">
			    <div class="col-lg-12">
                    <div id="main-slider" class="flexslider">
                        <ul class="slides">
                          <li>
                            <img src="img/cursos/banner2.jpg" alt="" />
                          </li>
                          <li>
                            <img src="img/cursos/banner1.jpg" alt="" />
                          </li>
                          <li>
                            <img src="img/cursos/banner3.jpg" alt="" />
                          </li>
                        </ul>
                    </div>
			    </div>
		    </div>
	    </div>
	</section>
    <section class="callaction">
	    <div class="container">
		    <div class="row">
			    <div class="col-lg-12">
				    <div class="big-cta">
					    <div class="cta-text">
						    <h2><span>Novedades</span></h2>
					    </div>
				    </div>
			    </div>
		    </div>
	    </div>
	</section>
    <section id="content">
	    <div class="container">
		    <div class="row">
			    <div class="col-lg-12">
				    <div class="row">
					    <div class="col-lg-3">
						    <div class="box">
							    <div class="box-gray aligncenter">
								    <h4>Programación</h4>
								    <div class="icon">
								        <i class="fa fa-desktop fa-3x"></i>
								    </div>
								    <p>
								     Lenguajes, frameworks y todo lo que puedas imaginar.
								    </p>
							    </div>
							    <div class="box-bottom">
								    <a href="#">Saber más</a>
							    </div>
						    </div>
					    </div>
					    <div class="col-lg-3">
						    <div class="box">
							    <div class="box-gray aligncenter">
								    <h4>Marketing online</h4>
								    <div class="icon">
								        <i class="fa fa-pagelines fa-3x"></i>
								    </div>
								    <p>
								        Sé un community manager, todo sobre las redes sociales.
								    </p>
							    </div>
							    <div class="box-bottom">
								    <a href="#">Saber más</a>
							    </div>
						    </div>
					    </div>
					    <div class="col-lg-3">
						    <div class="box">
							    <div class="box-gray aligncenter">
								    <h4>Networking y Cisco</h4>
								    <div class="icon">
								        <i class="fa fa-edit fa-3x"></i>
								    </div>
								    <p>
								     Aprende todo lo relacionado a las redes de comunicación.
								    </p>
							    </div>
							    <div class="box-bottom">
								    <a href="#">Saber más</a>
							    </div>
						    </div>
					    </div>
					    <div class="col-lg-3">
						    <div class="box">
							    <div class="box-gray aligncenter">
								    <h4>Codifícalo todo</h4>
								    <div class="icon">
								    <i class="fa fa-code fa-3x"></i>
								    </div>
								    <p>
								     Incursiona en el amplio mundo de la programación.
								    </p>
							    </div>
							    <div class="box-bottom">
								    <a href="#">Saber más</a>
							    </div>
						    </div>
					    </div>
				    </div>
			    </div>
		    </div>
		    <div class="row">
			    <div class="col-lg-12">
				    <div class="solidline">
				    </div>
			    </div>
		    </div>
		    <div class="row">
			    <div class="col-lg-12">
				    <h4 class="heading">Cursos que ofrecemos</h4>
				    <div class="row">
					    <section id="projects">
					        <ul id="thumbs" class="portfolio">
						        <li class="col-lg-3 design" data-id="id-0" data-type="web">
						            <div class="item-thumbs">
						            <a class="hover-wrap fancybox" data-fancybox-group="gallery" title="Work 1" href="img/works/1.jpg">
						            <span class="overlay-img"></span>
						            <span class="overlay-img-thumb font-icon-plus"></span>
						            </a>
						            <img src="img/works/1.jpg" alt="Cursos"/>
						            </div>
						        </li>
						            <li class="item-thumbs col-lg-3 design" data-id="id-1" data-type="icon">
						            <a class="hover-wrap fancybox" data-fancybox-group="gallery" title="Work 2" href="img/works/2.jpg">
						            <span class="overlay-img"></span>
						            <span class="overlay-img-thumb font-icon-plus"></span>
						            </a>
						            <img src="img/works/2.jpg" alt="Cursos."/>
						        </li>
						        <li class="item-thumbs col-lg-3 photography" data-id="id-2" data-type="illustrator">
						            <a class="hover-wrap fancybox" data-fancybox-group="gallery" title="Work 3" href="img/works/3.jpg">
						            <span class="overlay-img"></span>
						            <span class="overlay-img-thumb font-icon-plus"></span>
						            </a>
						            <img src="img/works/3.jpg" alt="Cursos"/>
						        </li>
						        <li class="item-thumbs col-lg-3 photography" data-id="id-2" data-type="illustrator">
						            <a class="hover-wrap fancybox" data-fancybox-group="gallery" title="Work 4" href="img/works/4.jpg">
						            <span class="overlay-img"></span>
						            <span class="overlay-img-thumb font-icon-plus"></span>
						            </a>
						            <img src="img/works/4.jpg" alt="Cursos."/>
						        </li>
					        </ul>
					    </section>
				    </div>
			    </div>
		    </div>
	    </div>
	</section>
</asp:Content>
