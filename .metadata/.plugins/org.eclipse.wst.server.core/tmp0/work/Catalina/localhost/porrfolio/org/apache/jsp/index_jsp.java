/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.0.53
 * Generated at: 2018-10-25 08:54:49 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = null;
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
        throws java.io.IOException, javax.servlet.ServletException {

final java.lang.String _jspx_method = request.getMethod();
if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method) && !javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSPs only permit GET POST or HEAD");
return;
}

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"en\">\n");
      out.write("\n");
      out.write("  <head>\n");
      out.write("\n");
      out.write("    <meta charset=\"utf-8\">\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1, shrink-to-fit=no\">\n");
      out.write("    <meta name=\"description\" content=\"\">\n");
      out.write("    <meta name=\"author\" content=\"\">\n");
      out.write("\n");
      out.write("    <title>Freelancer - Start Bootstrap Theme</title>\n");
      out.write("\n");
      out.write("    <!-- Bootstrap core CSS -->\n");
      out.write("    <link href=\"vendor/bootstrap/css/bootstrap.min.css\" rel=\"stylesheet\">\n");
      out.write("\n");
      out.write("    <!-- Custom fonts for this template -->\n");
      out.write("    <link href=\"vendor/fontawesome-free/css/all.min.css\" rel=\"stylesheet\" type=\"text/css\">\n");
      out.write("    <link href=\"https://fonts.googleapis.com/css?family=Montserrat:400,700\" rel=\"stylesheet\" type=\"text/css\">\n");
      out.write("    <link href=\"https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic\" rel=\"stylesheet\" type=\"text/css\">\n");
      out.write("\n");
      out.write("    <!-- Plugin CSS -->\n");
      out.write("    <link href=\"vendor/magnific-popup/magnific-popup.css\" rel=\"stylesheet\" type=\"text/css\">\n");
      out.write("\n");
      out.write("    <!-- Custom styles for this template -->\n");
      out.write("    <link href=\"css/freelancer.min.css\" rel=\"stylesheet\">\n");
      out.write("\n");
      out.write("  </head>\n");
      out.write("\n");
      out.write("  <body id=\"page-top\">\n");
      out.write("\n");
      out.write("    <!-- Navigation -->\n");
      out.write("    <nav class=\"navbar navbar-expand-lg bg-secondary fixed-top text-uppercase\" id=\"mainNav\">\n");
      out.write("      <div class=\"container\">\n");
      out.write("        <a class=\"navbar-brand js-scroll-trigger\" href=\"#page-top\">Start Bootstrap</a>\n");
      out.write("        <button class=\"navbar-toggler navbar-toggler-right text-uppercase bg-primary text-white rounded\" type=\"button\" data-toggle=\"collapse\" data-target=\"#navbarResponsive\" aria-controls=\"navbarResponsive\" aria-expanded=\"false\" aria-label=\"Toggle navigation\">\n");
      out.write("          Menu\n");
      out.write("          <i class=\"fas fa-bars\"></i>\n");
      out.write("        </button>\n");
      out.write("        <div class=\"collapse navbar-collapse\" id=\"navbarResponsive\">\n");
      out.write("          <ul class=\"navbar-nav ml-auto\">\n");
      out.write("            <li class=\"nav-item mx-0 mx-lg-1\">\n");
      out.write("              <a class=\"nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger\" href=\"#portfolio\">Portfolio</a>\n");
      out.write("            </li>\n");
      out.write("            <li class=\"nav-item mx-0 mx-lg-1\">\n");
      out.write("              <a class=\"nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger\" href=\"#about\">About</a>\n");
      out.write("            </li>\n");
      out.write("            <li class=\"nav-item mx-0 mx-lg-1\">\n");
      out.write("              <a class=\"nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger\" href=\"#contact\">Contact</a>\n");
      out.write("            </li>\n");
      out.write("          </ul>\n");
      out.write("        </div>\n");
      out.write("      </div>\n");
      out.write("    </nav>\n");
      out.write("\n");
      out.write("    <!-- Header -->\n");
      out.write("    <header class=\"masthead bg-primary text-white text-center\">\n");
      out.write("      <div class=\"container\">\n");
      out.write("        <img class=\"img-fluid mb-5 d-block mx-auto\" src=\"img/profile.png\" alt=\"\">\n");
      out.write("        <h1 class=\"text-uppercase mb-0\">Start Bootstrap</h1>\n");
      out.write("        <hr class=\"star-light\">\n");
      out.write("        <h2 class=\"font-weight-light mb-0\">Web Developer - Graphic Artist - User Experience Designer</h2>\n");
      out.write("      </div>\n");
      out.write("    </header>\n");
      out.write("\n");
      out.write("    <!-- Portfolio Grid Section -->\n");
      out.write("    <section class=\"portfolio\" id=\"portfolio\">\n");
      out.write("      <div class=\"container\">\n");
      out.write("        <h2 class=\"text-center text-uppercase text-secondary mb-0\">Portfolio</h2>\n");
      out.write("        <hr class=\"star-dark mb-5\">\n");
      out.write("        <div class=\"row\">\n");
      out.write("          <div class=\"col-md-6 col-lg-4\">\n");
      out.write("            <a class=\"portfolio-item d-block mx-auto\" href=\"#portfolio-modal-1\">\n");
      out.write("              <div class=\"portfolio-item-caption d-flex position-absolute h-100 w-100\">\n");
      out.write("                <div class=\"portfolio-item-caption-content my-auto w-100 text-center text-white\">\n");
      out.write("                  <i class=\"fas fa-search-plus fa-3x\"></i>\n");
      out.write("                </div>\n");
      out.write("              </div>\n");
      out.write("              <img class=\"img-fluid\" src=\"img/portfolio/cabin.png\" alt=\"\">\n");
      out.write("            </a>\n");
      out.write("          </div>\n");
      out.write("          <div class=\"col-md-6 col-lg-4\">\n");
      out.write("            <a class=\"portfolio-item d-block mx-auto\" href=\"#portfolio-modal-2\">\n");
      out.write("              <div class=\"portfolio-item-caption d-flex position-absolute h-100 w-100\">\n");
      out.write("                <div class=\"portfolio-item-caption-content my-auto w-100 text-center text-white\">\n");
      out.write("                  <i class=\"fas fa-search-plus fa-3x\"></i>\n");
      out.write("                </div>\n");
      out.write("              </div>\n");
      out.write("              <img class=\"img-fluid\" src=\"img/portfolio/cake.png\" alt=\"\">\n");
      out.write("            </a>\n");
      out.write("          </div>\n");
      out.write("          <div class=\"col-md-6 col-lg-4\">\n");
      out.write("            <a class=\"portfolio-item d-block mx-auto\" href=\"#portfolio-modal-3\">\n");
      out.write("              <div class=\"portfolio-item-caption d-flex position-absolute h-100 w-100\">\n");
      out.write("                <div class=\"portfolio-item-caption-content my-auto w-100 text-center text-white\">\n");
      out.write("                  <i class=\"fas fa-search-plus fa-3x\"></i>\n");
      out.write("                </div>\n");
      out.write("              </div>\n");
      out.write("              <img class=\"img-fluid\" src=\"img/portfolio/circus.png\" alt=\"\">\n");
      out.write("            </a>\n");
      out.write("          </div>\n");
      out.write("          <div class=\"col-md-6 col-lg-4\">\n");
      out.write("            <a class=\"portfolio-item d-block mx-auto\" href=\"#portfolio-modal-4\">\n");
      out.write("              <div class=\"portfolio-item-caption d-flex position-absolute h-100 w-100\">\n");
      out.write("                <div class=\"portfolio-item-caption-content my-auto w-100 text-center text-white\">\n");
      out.write("                  <i class=\"fas fa-search-plus fa-3x\"></i>\n");
      out.write("                </div>\n");
      out.write("              </div>\n");
      out.write("              <img class=\"img-fluid\" src=\"img/portfolio/game.png\" alt=\"\">\n");
      out.write("            </a>\n");
      out.write("          </div>\n");
      out.write("          <div class=\"col-md-6 col-lg-4\">\n");
      out.write("            <a class=\"portfolio-item d-block mx-auto\" href=\"#portfolio-modal-5\">\n");
      out.write("              <div class=\"portfolio-item-caption d-flex position-absolute h-100 w-100\">\n");
      out.write("                <div class=\"portfolio-item-caption-content my-auto w-100 text-center text-white\">\n");
      out.write("                  <i class=\"fas fa-search-plus fa-3x\"></i>\n");
      out.write("                </div>\n");
      out.write("              </div>\n");
      out.write("              <img class=\"img-fluid\" src=\"img/portfolio/safe.png\" alt=\"\">\n");
      out.write("            </a>\n");
      out.write("          </div>\n");
      out.write("          <div class=\"col-md-6 col-lg-4\">\n");
      out.write("            <a class=\"portfolio-item d-block mx-auto\" href=\"#portfolio-modal-6\">\n");
      out.write("              <div class=\"portfolio-item-caption d-flex position-absolute h-100 w-100\">\n");
      out.write("                <div class=\"portfolio-item-caption-content my-auto w-100 text-center text-white\">\n");
      out.write("                  <i class=\"fas fa-search-plus fa-3x\"></i>\n");
      out.write("                </div>\n");
      out.write("              </div>\n");
      out.write("              <img class=\"img-fluid\" src=\"img/portfolio/submarine.png\" alt=\"\">\n");
      out.write("            </a>\n");
      out.write("          </div>\n");
      out.write("        </div>\n");
      out.write("      </div>\n");
      out.write("    </section>\n");
      out.write("\n");
      out.write("    <!-- About Section -->\n");
      out.write("    <section class=\"bg-primary text-white mb-0\" id=\"about\">\n");
      out.write("      <div class=\"container\">\n");
      out.write("        <h2 class=\"text-center text-uppercase text-white\">About</h2>\n");
      out.write("        <hr class=\"star-light mb-5\">\n");
      out.write("        <div class=\"row\">\n");
      out.write("          <div class=\"col-lg-4 ml-auto\">\n");
      out.write("            <p class=\"lead\">Freelancer is a free bootstrap theme created by Start Bootstrap. The download includes the complete source files including HTML, CSS, and JavaScript as well as optional LESS stylesheets for easy customization.</p>\n");
      out.write("          </div>\n");
      out.write("          <div class=\"col-lg-4 mr-auto\">\n");
      out.write("            <p class=\"lead\">Whether you're a student looking to showcase your work, a professional looking to attract clients, or a graphic artist looking to share your projects, this template is the perfect starting point!</p>\n");
      out.write("          </div>\n");
      out.write("        </div>\n");
      out.write("        <div class=\"text-center mt-4\">\n");
      out.write("          <a class=\"btn btn-xl btn-outline-light\" href=\"#\">\n");
      out.write("            <i class=\"fas fa-download mr-2\"></i>\n");
      out.write("            Download Now!\n");
      out.write("          </a>\n");
      out.write("        </div>\n");
      out.write("      </div>\n");
      out.write("    </section>\n");
      out.write("\n");
      out.write("    <!-- Contact Section -->\n");
      out.write("    <section id=\"contact\">\n");
      out.write("      <div class=\"container\">\n");
      out.write("        <h2 class=\"text-center text-uppercase text-secondary mb-0\">Contact Me</h2>\n");
      out.write("        <hr class=\"star-dark mb-5\">\n");
      out.write("        <div class=\"row\">\n");
      out.write("          <div class=\"col-lg-8 mx-auto\">\n");
      out.write("            <!-- To configure the contact form email address, go to mail/contact_me.php and update the email address in the PHP file on line 19. -->\n");
      out.write("            <!-- The form should work on most web servers, but if the form is not working you may need to configure your web server differently. -->\n");
      out.write("            <form name=\"sentMessage\" id=\"contactForm\" novalidate=\"novalidate\">\n");
      out.write("              <div class=\"control-group\">\n");
      out.write("                <div class=\"form-group floating-label-form-group controls mb-0 pb-2\">\n");
      out.write("                  <label>Name</label>\n");
      out.write("                  <input class=\"form-control\" id=\"name\" type=\"text\" placeholder=\"Name\" required=\"required\" data-validation-required-message=\"Please enter your name.\">\n");
      out.write("                  <p class=\"help-block text-danger\"></p>\n");
      out.write("                </div>\n");
      out.write("              </div>\n");
      out.write("              <div class=\"control-group\">\n");
      out.write("                <div class=\"form-group floating-label-form-group controls mb-0 pb-2\">\n");
      out.write("                  <label>Email Address</label>\n");
      out.write("                  <input class=\"form-control\" id=\"email\" type=\"email\" placeholder=\"Email Address\" required=\"required\" data-validation-required-message=\"Please enter your email address.\">\n");
      out.write("                  <p class=\"help-block text-danger\"></p>\n");
      out.write("                </div>\n");
      out.write("              </div>\n");
      out.write("              <div class=\"control-group\">\n");
      out.write("                <div class=\"form-group floating-label-form-group controls mb-0 pb-2\">\n");
      out.write("                  <label>Phone Number</label>\n");
      out.write("                  <input class=\"form-control\" id=\"phone\" type=\"tel\" placeholder=\"Phone Number\" required=\"required\" data-validation-required-message=\"Please enter your phone number.\">\n");
      out.write("                  <p class=\"help-block text-danger\"></p>\n");
      out.write("                </div>\n");
      out.write("              </div>\n");
      out.write("              <div class=\"control-group\">\n");
      out.write("                <div class=\"form-group floating-label-form-group controls mb-0 pb-2\">\n");
      out.write("                  <label>Message</label>\n");
      out.write("                  <textarea class=\"form-control\" id=\"message\" rows=\"5\" placeholder=\"Message\" required=\"required\" data-validation-required-message=\"Please enter a message.\"></textarea>\n");
      out.write("                  <p class=\"help-block text-danger\"></p>\n");
      out.write("                </div>\n");
      out.write("              </div>\n");
      out.write("              <br>\n");
      out.write("              <div id=\"success\"></div>\n");
      out.write("              <div class=\"form-group\">\n");
      out.write("                <button type=\"submit\" class=\"btn btn-primary btn-xl\" id=\"sendMessageButton\">Send</button>\n");
      out.write("              </div>\n");
      out.write("            </form>\n");
      out.write("          </div>\n");
      out.write("        </div>\n");
      out.write("      </div>\n");
      out.write("    </section>\n");
      out.write("\n");
      out.write("    <!-- Footer -->\n");
      out.write("    <footer class=\"footer text-center\">\n");
      out.write("      <div class=\"container\">\n");
      out.write("        <div class=\"row\">\n");
      out.write("          <div class=\"col-md-4 mb-5 mb-lg-0\">\n");
      out.write("            <h4 class=\"text-uppercase mb-4\">Location</h4>\n");
      out.write("            <p class=\"lead mb-0\">2215 John Daniel Drive\n");
      out.write("              <br>Clark, MO 65243</p>\n");
      out.write("          </div>\n");
      out.write("          <div class=\"col-md-4 mb-5 mb-lg-0\">\n");
      out.write("            <h4 class=\"text-uppercase mb-4\">Around the Web</h4>\n");
      out.write("            <ul class=\"list-inline mb-0\">\n");
      out.write("              <li class=\"list-inline-item\">\n");
      out.write("                <a class=\"btn btn-outline-light btn-social text-center rounded-circle\" href=\"#\">\n");
      out.write("                  <i class=\"fab fa-fw fa-facebook-f\"></i>\n");
      out.write("                </a>\n");
      out.write("              </li>\n");
      out.write("              <li class=\"list-inline-item\">\n");
      out.write("                <a class=\"btn btn-outline-light btn-social text-center rounded-circle\" href=\"#\">\n");
      out.write("                  <i class=\"fab fa-fw fa-google-plus-g\"></i>\n");
      out.write("                </a>\n");
      out.write("              </li>\n");
      out.write("              <li class=\"list-inline-item\">\n");
      out.write("                <a class=\"btn btn-outline-light btn-social text-center rounded-circle\" href=\"#\">\n");
      out.write("                  <i class=\"fab fa-fw fa-twitter\"></i>\n");
      out.write("                </a>\n");
      out.write("              </li>\n");
      out.write("              <li class=\"list-inline-item\">\n");
      out.write("                <a class=\"btn btn-outline-light btn-social text-center rounded-circle\" href=\"#\">\n");
      out.write("                  <i class=\"fab fa-fw fa-linkedin-in\"></i>\n");
      out.write("                </a>\n");
      out.write("              </li>\n");
      out.write("              <li class=\"list-inline-item\">\n");
      out.write("                <a class=\"btn btn-outline-light btn-social text-center rounded-circle\" href=\"#\">\n");
      out.write("                  <i class=\"fab fa-fw fa-dribbble\"></i>\n");
      out.write("                </a>\n");
      out.write("              </li>\n");
      out.write("            </ul>\n");
      out.write("          </div>\n");
      out.write("          <div class=\"col-md-4\">\n");
      out.write("            <h4 class=\"text-uppercase mb-4\">About Freelancer</h4>\n");
      out.write("            <p class=\"lead mb-0\">Freelance is a free to use, open source Bootstrap theme created by\n");
      out.write("              <a href=\"http://startbootstrap.com\">Start Bootstrap</a>.</p>\n");
      out.write("          </div>\n");
      out.write("        </div>\n");
      out.write("      </div>\n");
      out.write("    </footer>\n");
      out.write("\n");
      out.write("    <div class=\"copyright py-4 text-center text-white\">\n");
      out.write("      <div class=\"container\">\n");
      out.write("        <small>Copyright &copy; Your Website 2018</small>\n");
      out.write("      </div>\n");
      out.write("    </div>\n");
      out.write("\n");
      out.write("    <!-- Scroll to Top Button (Only visible on small and extra-small screen sizes) -->\n");
      out.write("    <div class=\"scroll-to-top d-lg-none position-fixed \">\n");
      out.write("      <a class=\"js-scroll-trigger d-block text-center text-white rounded\" href=\"#page-top\">\n");
      out.write("        <i class=\"fa fa-chevron-up\"></i>\n");
      out.write("      </a>\n");
      out.write("    </div>\n");
      out.write("\n");
      out.write("    <!-- Portfolio Modals -->\n");
      out.write("\n");
      out.write("    <!-- Portfolio Modal 1 -->\n");
      out.write("    <div class=\"portfolio-modal mfp-hide\" id=\"portfolio-modal-1\">\n");
      out.write("      <div class=\"portfolio-modal-dialog bg-white\">\n");
      out.write("        <a class=\"close-button d-none d-md-block portfolio-modal-dismiss\" href=\"#\">\n");
      out.write("          <i class=\"fa fa-3x fa-times\"></i>\n");
      out.write("        </a>\n");
      out.write("        <div class=\"container text-center\">\n");
      out.write("          <div class=\"row\">\n");
      out.write("            <div class=\"col-lg-8 mx-auto\">\n");
      out.write("              <h2 class=\"text-secondary text-uppercase mb-0\">Project Name</h2>\n");
      out.write("              <hr class=\"star-dark mb-5\">\n");
      out.write("              <img class=\"img-fluid mb-5\" src=\"img/portfolio/cabin.png\" alt=\"\">\n");
      out.write("              <p class=\"mb-5\">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Mollitia neque assumenda ipsam nihil, molestias magnam, recusandae quos quis inventore quisquam velit asperiores, vitae? Reprehenderit soluta, eos quod consequuntur itaque. Nam.</p>\n");
      out.write("              <a class=\"btn btn-primary btn-lg rounded-pill portfolio-modal-dismiss\" href=\"#\">\n");
      out.write("                <i class=\"fa fa-close\"></i>\n");
      out.write("                Close Project</a>\n");
      out.write("            </div>\n");
      out.write("          </div>\n");
      out.write("        </div>\n");
      out.write("      </div>\n");
      out.write("    </div>\n");
      out.write("\n");
      out.write("    <!-- Portfolio Modal 2 -->\n");
      out.write("    <div class=\"portfolio-modal mfp-hide\" id=\"portfolio-modal-2\">\n");
      out.write("      <div class=\"portfolio-modal-dialog bg-white\">\n");
      out.write("        <a class=\"close-button d-none d-md-block portfolio-modal-dismiss\" href=\"#\">\n");
      out.write("          <i class=\"fa fa-3x fa-times\"></i>\n");
      out.write("        </a>\n");
      out.write("        <div class=\"container text-center\">\n");
      out.write("          <div class=\"row\">\n");
      out.write("            <div class=\"col-lg-8 mx-auto\">\n");
      out.write("              <h2 class=\"text-secondary text-uppercase mb-0\">Project Name</h2>\n");
      out.write("              <hr class=\"star-dark mb-5\">\n");
      out.write("              <img class=\"img-fluid mb-5\" src=\"img/portfolio/cake.png\" alt=\"\">\n");
      out.write("              <p class=\"mb-5\">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Mollitia neque assumenda ipsam nihil, molestias magnam, recusandae quos quis inventore quisquam velit asperiores, vitae? Reprehenderit soluta, eos quod consequuntur itaque. Nam.</p>\n");
      out.write("              <a class=\"btn btn-primary btn-lg rounded-pill portfolio-modal-dismiss\" href=\"#\">\n");
      out.write("                <i class=\"fa fa-close\"></i>\n");
      out.write("                Close Project</a>\n");
      out.write("            </div>\n");
      out.write("          </div>\n");
      out.write("        </div>\n");
      out.write("      </div>\n");
      out.write("    </div>\n");
      out.write("\n");
      out.write("    <!-- Portfolio Modal 3 -->\n");
      out.write("    <div class=\"portfolio-modal mfp-hide\" id=\"portfolio-modal-3\">\n");
      out.write("      <div class=\"portfolio-modal-dialog bg-white\">\n");
      out.write("        <a class=\"close-button d-none d-md-block portfolio-modal-dismiss\" href=\"#\">\n");
      out.write("          <i class=\"fa fa-3x fa-times\"></i>\n");
      out.write("        </a>\n");
      out.write("        <div class=\"container text-center\">\n");
      out.write("          <div class=\"row\">\n");
      out.write("            <div class=\"col-lg-8 mx-auto\">\n");
      out.write("              <h2 class=\"text-secondary text-uppercase mb-0\">Project Name</h2>\n");
      out.write("              <hr class=\"star-dark mb-5\">\n");
      out.write("              <img class=\"img-fluid mb-5\" src=\"img/portfolio/circus.png\" alt=\"\">\n");
      out.write("              <p class=\"mb-5\">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Mollitia neque assumenda ipsam nihil, molestias magnam, recusandae quos quis inventore quisquam velit asperiores, vitae? Reprehenderit soluta, eos quod consequuntur itaque. Nam.</p>\n");
      out.write("              <a class=\"btn btn-primary btn-lg rounded-pill portfolio-modal-dismiss\" href=\"#\">\n");
      out.write("                <i class=\"fa fa-close\"></i>\n");
      out.write("                Close Project</a>\n");
      out.write("            </div>\n");
      out.write("          </div>\n");
      out.write("        </div>\n");
      out.write("      </div>\n");
      out.write("    </div>\n");
      out.write("\n");
      out.write("    <!-- Portfolio Modal 4 -->\n");
      out.write("    <div class=\"portfolio-modal mfp-hide\" id=\"portfolio-modal-4\">\n");
      out.write("      <div class=\"portfolio-modal-dialog bg-white\">\n");
      out.write("        <a class=\"close-button d-none d-md-block portfolio-modal-dismiss\" href=\"#\">\n");
      out.write("          <i class=\"fa fa-3x fa-times\"></i>\n");
      out.write("        </a>\n");
      out.write("        <div class=\"container text-center\">\n");
      out.write("          <div class=\"row\">\n");
      out.write("            <div class=\"col-lg-8 mx-auto\">\n");
      out.write("              <h2 class=\"text-secondary text-uppercase mb-0\">Project Name</h2>\n");
      out.write("              <hr class=\"star-dark mb-5\">\n");
      out.write("              <img class=\"img-fluid mb-5\" src=\"img/portfolio/game.png\" alt=\"\">\n");
      out.write("              <p class=\"mb-5\">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Mollitia neque assumenda ipsam nihil, molestias magnam, recusandae quos quis inventore quisquam velit asperiores, vitae? Reprehenderit soluta, eos quod consequuntur itaque. Nam.</p>\n");
      out.write("              <a class=\"btn btn-primary btn-lg rounded-pill portfolio-modal-dismiss\" href=\"#\">\n");
      out.write("                <i class=\"fa fa-close\"></i>\n");
      out.write("                Close Project</a>\n");
      out.write("            </div>\n");
      out.write("          </div>\n");
      out.write("        </div>\n");
      out.write("      </div>\n");
      out.write("    </div>\n");
      out.write("\n");
      out.write("    <!-- Portfolio Modal 5 -->\n");
      out.write("    <div class=\"portfolio-modal mfp-hide\" id=\"portfolio-modal-5\">\n");
      out.write("      <div class=\"portfolio-modal-dialog bg-white\">\n");
      out.write("        <a class=\"close-button d-none d-md-block portfolio-modal-dismiss\" href=\"#\">\n");
      out.write("          <i class=\"fa fa-3x fa-times\"></i>\n");
      out.write("        </a>\n");
      out.write("        <div class=\"container text-center\">\n");
      out.write("          <div class=\"row\">\n");
      out.write("            <div class=\"col-lg-8 mx-auto\">\n");
      out.write("              <h2 class=\"text-secondary text-uppercase mb-0\">Project Name</h2>\n");
      out.write("              <hr class=\"star-dark mb-5\">\n");
      out.write("              <img class=\"img-fluid mb-5\" src=\"img/portfolio/safe.png\" alt=\"\">\n");
      out.write("              <p class=\"mb-5\">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Mollitia neque assumenda ipsam nihil, molestias magnam, recusandae quos quis inventore quisquam velit asperiores, vitae? Reprehenderit soluta, eos quod consequuntur itaque. Nam.</p>\n");
      out.write("              <a class=\"btn btn-primary btn-lg rounded-pill portfolio-modal-dismiss\" href=\"#\">\n");
      out.write("                <i class=\"fa fa-close\"></i>\n");
      out.write("                Close Project</a>\n");
      out.write("            </div>\n");
      out.write("          </div>\n");
      out.write("        </div>\n");
      out.write("      </div>\n");
      out.write("    </div>\n");
      out.write("\n");
      out.write("    <!-- Portfolio Modal 6 -->\n");
      out.write("    <div class=\"portfolio-modal mfp-hide\" id=\"portfolio-modal-6\">\n");
      out.write("      <div class=\"portfolio-modal-dialog bg-white\">\n");
      out.write("        <a class=\"close-button d-none d-md-block portfolio-modal-dismiss\" href=\"#\">\n");
      out.write("          <i class=\"fa fa-3x fa-times\"></i>\n");
      out.write("        </a>\n");
      out.write("        <div class=\"container text-center\">\n");
      out.write("          <div class=\"row\">\n");
      out.write("            <div class=\"col-lg-8 mx-auto\">\n");
      out.write("              <h2 class=\"text-secondary text-uppercase mb-0\">Project Name</h2>\n");
      out.write("              <hr class=\"star-dark mb-5\">\n");
      out.write("              <img class=\"img-fluid mb-5\" src=\"img/portfolio/submarine.png\" alt=\"\">\n");
      out.write("              <p class=\"mb-5\">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Mollitia neque assumenda ipsam nihil, molestias magnam, recusandae quos quis inventore quisquam velit asperiores, vitae? Reprehenderit soluta, eos quod consequuntur itaque. Nam.</p>\n");
      out.write("              <a class=\"btn btn-primary btn-lg rounded-pill portfolio-modal-dismiss\" href=\"#\">\n");
      out.write("                <i class=\"fa fa-close\"></i>\n");
      out.write("                Close Project</a>\n");
      out.write("            </div>\n");
      out.write("          </div>\n");
      out.write("        </div>\n");
      out.write("      </div>\n");
      out.write("    </div>\n");
      out.write("\n");
      out.write("    <!-- Bootstrap core JavaScript -->\n");
      out.write("    <script src=\"vendor/jquery/jquery.min.js\"></script>\n");
      out.write("    <script src=\"vendor/bootstrap/js/bootstrap.bundle.min.js\"></script>\n");
      out.write("\n");
      out.write("    <!-- Plugin JavaScript -->\n");
      out.write("    <script src=\"vendor/jquery-easing/jquery.easing.min.js\"></script>\n");
      out.write("    <script src=\"vendor/magnific-popup/jquery.magnific-popup.min.js\"></script>\n");
      out.write("\n");
      out.write("    <!-- Contact Form JavaScript -->\n");
      out.write("    <script src=\"js/jqBootstrapValidation.js\"></script>\n");
      out.write("    <script src=\"js/contact_me.js\"></script>\n");
      out.write("\n");
      out.write("    <!-- Custom scripts for this template -->\n");
      out.write("    <script src=\"js/freelancer.min.js\"></script>\n");
      out.write("\n");
      out.write("  </body>\n");
      out.write("\n");
      out.write("</html>\n");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
