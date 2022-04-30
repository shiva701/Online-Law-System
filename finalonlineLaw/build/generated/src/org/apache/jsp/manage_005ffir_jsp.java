package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import onlineLaw.db;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Connection;

public final class manage_005ffir_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

String s = "";
  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(3);
    _jspx_dependants.add("/header.html");
    _jspx_dependants.add("/adminprofilenav.html");
    _jspx_dependants.add("/footer.html");
  }

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html  xmlns=\"http://www.w3.org/1999/xhtml\">\n");
      out.write("    <head>\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n");
      out.write("            <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("                <link href=\"main.css\" rel=\"stylesheet\">\n");
      out.write("                    <link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css\">\n");
      out.write("                        <script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js\"></script>\n");
      out.write("                        <script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js\"></script>\n");
      out.write("                        <title>Manage FIR</title>\n");
      out.write("                        <script>\n");
      out.write("                            function send(frm)\n");
      out.write("                            {\n");
      out.write("                                var id = document.getElementById(\"editbtn\").innerHTML;\n");
      out.write("                                window.location = \"manage_fir?id=\" + id;\n");
      out.write("                                return false;\n");
      out.write("                            }\n");
      out.write("                        </script>\n");
      out.write("                        </head>\n");
      out.write("                        <body style=\"background-image: url('images/backuser1.png'); background-size: 100% 100%; background-repeat: no-repeat;\">\n");
      out.write("                            <div class=\"container-fluid\"> \n");
      out.write("                                ");
      out.write("<div class=\"row\" >\n");
      out.write("    <div class=\"col-sm-12\" style=\" width:100%; background-image: url('images/supremecourt.jpg'); background-repeat: no-repeat; background-size : 100% 100%;\">\n");
      out.write("        <div id=\"header\">\n");
      out.write("            <div id=\"logo\">\n");
      out.write("                <a href=\"index.html\" style=\"text-decoration: none;\"><h1>online law system </h1></a>\n");
      out.write("                <p>Bringing Justice</p>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("        <div class=\"row\">\n");
      out.write("            <div class=\"col-sm-6\">\n");
      out.write("\n");
      out.write("            </div>\n");
      out.write("            <div class=\"col-sm-6\" style=\"float:right; margin-right:4%;\">\n");
      out.write("                <nav class=\"navbar navbar-inverse\" style=\"margin-top: 30%; width:92%; background-color: darkslategrey;\">\n");
      out.write("                    <div class=\"container-fluid\">\n");
      out.write("                        <ul class=\"nav navbar-nav\">\n");
      out.write("                            <li class=\"active\"><a href=\"index.html\">Home</a></li>\n");
      out.write("                            <li><a href=\"admin.jsp\">Admin</a></li>\n");
      out.write("                            <li><a href=\"user.jsp\">User</a></li>\n");
      out.write("                            <li><a href=\"lawyerlogin.jsp\">Lawyers</a></li>\n");
      out.write("                            <li class=\"dropdown\">\n");
      out.write("                                <a class=\"dropdown-toggle\" data-toggle=\"dropdown\" href=\"#\">Information\n");
      out.write("                                    <span class=\"caret\"></span></a>\n");
      out.write("                                <ul class=\"dropdown-menu\">\n");
      out.write("                                    <li><a href=\"toplawyers.html\" target=\"_blank\" >Top Lawyers</a></li>\n");
      out.write("                                    <li><a href=\"renownedcases.html\" target=\"_blank\" >Renowned Cases</a></li>\n");
      out.write("                                    <li><a href=\"topcriminals.html\" target=\"_blank\" >Top Criminals</a></li>\n");
      out.write("                                </ul>\n");
      out.write("                            </li>\n");
      out.write("                            <li><a href=\"suggestions.jsp\">Suggestions</a></li>\n");
      out.write("                        </ul>\n");
      out.write("                    </div>\n");
      out.write("                </nav>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("    </div>\n");
      out.write("</div>");
      out.write("\n");
      out.write("                                ");
      out.write("\n");
      out.write("\n");
      out.write("                                <div class=\"row\">\n");
      out.write("                                    <div class=\"col-sm-12\">\n");
      out.write("                                        ");

                                            if (session.getAttribute("name") != null) {
                                                String name = (String) session.getAttribute("name");
                                        
      out.write("\n");
      out.write("                                        <div id=\"welcome\">\n");
      out.write("                                            ");

                                                out.print("<font class='report' >Welcome " + name + "</font>");
                                            
      out.write("\n");
      out.write("                                        </div>\n");
      out.write("                                    </div>\n");
      out.write("                                </div>\n");
      out.write("                                ");

                                } else {
                                    request.setAttribute("Error1", "Please do login first!");
                                
      out.write("\n");
      out.write("\n");
      out.write("                                ");
      if (true) {
        _jspx_page_context.forward("admin.jsp");
        return;
      }
      out.write("\n");
      out.write("                                ");
 }
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("                                <center>\n");
      out.write("                                    <div class=\"row\" id=\"welcome\">\n");
      out.write("                                        <div class=\"col-sm-6\">\n");
      out.write("                                            <h2 id=\"userhead\">Manage FIR</h2>\n");
      out.write("                                        </div>\n");
      out.write("                                    </div>\n");
      out.write("                                    <div class=\"row\" style=\"overflow-y: scroll ;\">\n");
      out.write("                                        <div class=\"col-sm-12\">\n");
      out.write("\n");
      out.write("                                            <br>\n");
      out.write("\n");
      out.write("                                                ");

                                                    Connection con = null;
                                                    PreparedStatement ps = null;
                                                    ResultSet rs = null;
                                                    try {
                                                        con = db.gc();
                                                        ps = con.prepareStatement("select * from fir order by id");
                                                        rs = ps.executeQuery();
                                                        out.println("<form action='managecomp' method='post'>");
                                                        out.println("<div class='table-responsive'><table class='table table-hover'>");
                                                        out.println("<thead><tr><th>Id</th>"
                                                                + "<th>Victim</th>"
                                                                + "<th>Accused</th>"
                                                                + "<th>Crime</th>"
                                                                + "<th>Date</th>"
                                                                + "<th>Place</th>"
                                                                + "<th>Status</th>"
                                                                + "</tr>"
                                                                + "</thead><tbody>");
                                                        while (rs.next()) {
                                                            String status = rs.getString(7);
                                                            String date = rs.getString(5);
                                                            s = rs.getString(1);
                                                            String yy = date.substring(0, 4);
                                                            String dd = date.substring(8, 10);
                                                            String mm = date.substring(5, 7);
                                                            out.println("<tr ><td ><button class='btn btn-danger' id='editbtn' onclick='send()'>" + rs.getString(1) + "</button></td>"
                                                                    + "</td><td>" + rs.getString(2)
                                                                    + "</td><td>" + rs.getString(3)
                                                                    + "</td><td>" + rs.getString(4)
                                                                    + "</td><td>" + dd + "/" + mm + "/" + yy
                                                                    + "</td><td>" + rs.getString(6)
                                                                    + "</td><td>" + rs.getString(7) + "</td></tr>");
                                                        }
                                                        con.close();
                                                    } catch (Exception e) {
                                                        System.out.println("Error : " + e);
                                                    }
                                                    out.println("</tbody>");
                                                    out.println("</table></div>");
                                                
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("                                                ");

                                                    out.println("</form>");
                                                    if (request.getAttribute("success") != null) {
                                                        String success = (String) request.getAttribute("success");
                                                        out.print("<font style='color:red'>" + success + "</font>");
                                                    } else if (request.getAttribute("failure") != null) {
                                                        String Error = (String) request.getAttribute("failure");
                                                        out.print("<font style='color:red'>" + Error + "</font>");
                                                    } else if (request.getAttribute("autherr") != null) {
                                                        String Err = (String) request.getAttribute("autherr");
                                                        out.print("<font style='color:red'>" + Err + "</font>");
                                                    }
                                                
      out.write("\n");
      out.write("                                        </div>\n");
      out.write("                                    </div>\n");
      out.write("                                </center>\n");
      out.write("                                ");
      out.write("<div class=\"row\">\n");
      out.write("    <div id=\"userprofilenav\">\n");
      out.write("\n");
      out.write("        <a href=\"addlaw.jsp\">Add Law</a> | <a href=\"addcourt.jsp\">Add Court</a> | <a\n");
      out.write("            href=\"addlawyer.jsp\">Add Lawyer</a> | <a\n");
      out.write("            href=\"removelawyer.jsp\">Remove Lawyer</a> | <a href=\"manage_fir_admin.jsp\">Manage FIR(s)</a> | \n");
      out.write("        <a href=\"adminprofile.jsp\">Profile</a>\n");
      out.write("        <br>\n");
      out.write("    </div>\n");
      out.write("</div>");
      out.write("\n");
      out.write("                                <br>\n");
      out.write("                                    ");
      out.write("<div class=\"row\" style=\"background-color:#2e2e1f; color:white;\">\n");
      out.write("    <div class=\"col-sm-6\">\n");
      out.write("        <h2 class=\"headh2\" style=\"color: white; margin-left: 2%;\">The Supreme Court Of India</h2>\n");
      out.write("        <div class=\"col-sm-6\"><a href=\"http://supremecourt.gov.in/\" target=\"_blank\" > <img class=\"img-thumbnail\" style=\"background-color:#000000;\" src=\"images/supreme.jpg\" height=\"500\" width=\"200\" alt=\"\" /></a></div>\n");
      out.write("        <div class=\"col-sm-6\" style=\"color:white;\"><p>The Supreme Court of India is the highest judicial forum and final court of appeal under the Constitution of India, the highest constitutional court, with the power of constitutional review. Consisting of the Chief Justice of India and 30 other judges, it has extensive powers in the form of original, appellate and advisory jurisdictions.</p></div>\n");
      out.write("    </div>\n");
      out.write("    <div class=\"col-sm-6\">\n");
      out.write("        <h2 class=\"headh2\" style=\"color: white;\">Courts In India</h2>\n");
      out.write("        <div class=\"row\">\n");
      out.write("            <div class=\"col-sm-4\"><a href=\"http://bombayhighcourt.nic.in/\" target=\"_blank\" ><img src=\"images/bombay_high_court.jpg\" height=\"80px\" width=\"80px\" title=\"Bombay\" alt=\"\" style=\"padding-right: 20px; padding-bottom: 20px;\"/></a></div>\n");
      out.write("            <div class=\"col-sm-4\"><a href=\"http://www.allahabadhighcourt.in/indexhigh.html\" target=\"_blank\" ><img src=\"images/allahabad-hc.jpg\" height=\"80px\" width=\"80px\" title=\"Allahabad\" alt=\"\" style=\"padding-right: 20px; padding-bottom: 20px;\"  /></a></div>\n");
      out.write("            <div class=\"col-sm-4\"><a href=\"http://www.hcmadras.tn.nic.in/\" target=\"_blank\" ><img src=\"images/madrashighcourt.jpg\" hegiht=\"80px\" width=\"80px\" title=\"Madras\" style=\"padding-right: 20px; padding-bottom: 20px;\"></a></div>\n");
      out.write("        </div>\n");
      out.write("        <div class=\"row\">\n");
      out.write("            <div class=\"col-sm-4\"><a href=\"http://gujarathighcourt.nic.in/\" target=\"_blank\" ><img src=\"images/gujarathc.jpg\" height=\"80px\" width=\"80px\" title=\"Gujarat\" alt=\"\" style=\"padding-right: 20px; padding-bottom: 20px;\" /></a></div>\n");
      out.write("            <div class=\"col-sm-4\"><a href=\"http://hcraj.nic.in/\" target=\"_blank\" ><img src=\"images/rajasthanhc.jpg\" height=\"80px\" width=\"80px\" title=\"Rajasthan\" alt=\"\" style=\"padding-right: 20px; padding-bottom: 20px;\" /></a></div>\n");
      out.write("            <div class=\"col-sm-4\"><a href=\"http://calcuttahighcourt.nic.in/\" target=\"_blank\" ><img src=\"images/calcuttahc.jpg\" height=\"80px\" width=\"80px\" title=\"Calcutta\" alt=\"\" style=\"padding-right: 20px; padding-bottom: 20px;\" /></a></div>\n");
      out.write("\n");
      out.write("        </div>\n");
      out.write("    </div>\n");
      out.write("</div>\n");
      out.write("\n");
      out.write("<div class=\"row\" style=\"background-color:black; color:white;\" >\n");
      out.write("    <div class=\"col-sm-6\">\n");
      out.write("        <p style=\"margin-left: 6%;\">ONLINE LAW SYSTEM</p>\n");
      out.write("    </div>\n");
      out.write("    <div class=\"col-lg-6\">\n");
      out.write("        <p><a href=\"https://www.tcs.com/\" style=\" float:right; margin-right: 6%; color:white;\">TATA CONSULTANCY SERVICES</a></p>\n");
      out.write("    </div>\n");
      out.write("</div>");
      out.write("\n");
      out.write("                            </div>\n");
      out.write("\n");
      out.write("                        </body>\n");
      out.write("                        </html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
