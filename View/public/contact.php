<script src="Resources/public/js/general/contact.js" type="text/javascript"></script>

<!--/ Intro Single star /-->
<section class="intro-single">
    <div class="container">
        <div class="row">
            <div class="col-md-12 col-lg-8">
                <div class="title-single-box">
                    <h1 class="title-single">Contáctenos</h1>
                    <span class="color-text-a">Comuníquese con nosotros telefónicamente y hable con unos de nuestros gestores, así como en los viejos tiempos. Si no está de ánimo para hablar, escribanos al WhatsApp 3002680564. También puede hacerlo diligenciando el siguiente formulario sin temor a que lo llenemos de spam. O para una atención personalizada visite nuestras instalaciones.</span>
                </div>
            </div>
            <div class="col-md-12 col-lg-4">
                <nav aria-label="breadcrumb" class="breadcrumb-box d-flex justify-content-lg-end">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">
                            <a href="index.html">Inicio</a>
                        </li>
                        <li class="breadcrumb-item active" aria-current="page">
                            Contáctenos
                        </li>
                    </ol>
                </nav>
            </div>
        </div>
    </div>
</section>
<!--/ Intro Single End /-->

<!--/ Contact Star /-->
<section class="contact">
    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <div class="contact-map box">
                    <div id="map" class="contact-map">
                        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d994.3050204737946!2d-75.6561782708539!3d4.554391136663567!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x8e38f4ef61f76f35%3A0xf7649df507fd8a5d!2sCl.+17+Nte.+%2311-07%2C+Armenia%2C+Quind%C3%ADo!5e0!3m2!1ses-419!2sco!4v1545256147544" width="100%" height="450" frameborder="0" style="border:0" allowfullscreen></iframe>
                    </div>
                </div>
            </div>
            <div class="col-sm-12 section-t8">
                <section id="FormContainerContact">
                    <div class="row">
                        <div class="col-md-7">
                            <form class="form-a contactForm" action="" method="post" role="form">
                                <div id="sendmessage">Su mensaje ha sido enviado. Gracias por confiar en nosotros!</div>
                                <div id="errormessage"></div>
                                <div class="row">
                                    <div class="col-md-6 mb-3">
                                        <div class="form-group">
                                            <input type="text" id="txtNameUser" name="name" class="form-control form-control-lg form-control-a" placeholder="Nombre Completo" data-rule="minlen:4" data-msg="Please enter at least 4 chars">
                                            <div class="validation"></div>
                                        </div>
                                    </div>
                                    <div class="col-md-6 mb-3">
                                        <div class="form-group">
                                            <input id="txtEmailUserContact" name="email"  type="email" class="form-control form-control-lg form-control-a" placeholder="Email" data-rule="email" data-msg="Please enter a valid email">
                                            <div class="validation"></div>
                                        </div>
                                    </div>
                                    <div class="col-md-12 mb-3">
                                        <div class="form-group">
                                            <input type="number" id="txtPhoneUser" name="phone" class="form-control form-control-lg form-control-a" placeholder="Teléfono" data-rule="minlen:4" data-msg="Please enter at least 8 chars of subject">
                                            <div class="validation"></div>
                                        </div>
                                    </div>
                                    <div class="col-md-12 mb-3">
                                        <div class="form-group">
                                            <textarea id="txtMessage" name="message" class="form-control"  cols="45" rows="8" data-rule="required" data-msg="Please write something for us" placeholder="Escriba su mensaje"></textarea>
                                            <div class="validation"></div>
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <button id="btnSave" onclick="sendContact();" type ="button" class="btn btn-a">Enviar Mensaje</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <div class="col-md-5 section-md-t3">
                            <div class="icon-box section-b2">
                                <div class="icon-box-icon">
                                    <span class="ion-ios-paper-plane"></span>
                                </div>
                                <div class="icon-box-content table-cell">
                                    <div class="icon-box-title">
                                        <h4 class="icon-title">Escríbenos </h4>
                                    </div>
                                    <div class="icon-box-content">
                                        <p class="mb-1">Email.
                                            <span class="color-a">contacto@hexagonogestores.com</span>
                                        </p>
                                        <p class="mb-1">Teléfono.
                                            <span class="color-a">+57 300 2680564</span>
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <div class="icon-box section-b2">
                                <div class="icon-box-icon">
                                    <span class="ion-ios-pin"></span>
                                </div>
                                <div class="icon-box-content table-cell">
                                    <div class="icon-box-title">
                                        <h4 class="icon-title">Encuentranos en</h4>
                                    </div>
                                    <div class="icon-box-content">
                                        <p class="mb-1">
                                            Calle 17 Norte # 11-07. 
                                            <br> Armenia, Quindío.
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <div class="icon-box">
                                <div class="icon-box-icon">
                                    <span class="ion-ios-redo"></span>
                                </div>
                                <div class="icon-box-content table-cell">
                                    <div class="icon-box-title">
                                        <h4 class="icon-title">Redes Sociales</h4>
                                    </div>
                                    <div class="icon-box-content">
                                        <div class="socials-footer">
                                            <ul class="list-inline">
                                                <li class="list-inline-item">
                                                    <a href="#" class="link-one">
                                                        <i class="fa fa-facebook" aria-hidden="true"></i>
                                                    </a>
                                                </li>
                                                <li class="list-inline-item">
                                                    <a href="#" class="link-one">
                                                        <i class="fa fa-twitter" aria-hidden="true"></i>
                                                    </a>
                                                </li>
                                                <li class="list-inline-item">
                                                    <a href="#" class="link-one">
                                                        <i class="fa fa-instagram" aria-hidden="true"></i>
                                                    </a>
                                                </li>
                                                <li class="list-inline-item">
                                                    <a href="#" class="link-one">
                                                        <i class="fa fa-pinterest-p" aria-hidden="true"></i>
                                                    </a>
                                                </li>
                                                <li class="list-inline-item">
                                                    <a href="#" class="link-one">
                                                        <i class="fa fa-dribbble" aria-hidden="true"></i>
                                                    </a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
        </div>
    </div>
</section>
<!--/ Contact End /-->

