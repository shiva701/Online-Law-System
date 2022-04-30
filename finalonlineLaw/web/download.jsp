<%@page import="onlineLaw.db"%>
<%@page import="java.sql.*,java.io.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
    String title = request.getParameter("title");
    Statement stmt = null;
    Connection con = null;
    Blob b = null;
    try {
        String filename = title + ".pdf";
        con = db.gc();
        stmt = con.createStatement();
        String qry = "select * from law where title ='" + title + "'";

        ResultSet rst = stmt.executeQuery(qry);
        if (rst.next()) {
            b = rst.getBlob(6);
        }
        response.setContentType("multipart/form-data");

        response.setHeader("Content-disposition", "attachment; filename=" + filename);
        InputStream in = b.getBinaryStream();
        byte b1[] = new byte[(int) b.length()];
        in.read(b1);
        ServletOutputStream out1 = response.getOutputStream();
        out1.write(b1);
        con.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>