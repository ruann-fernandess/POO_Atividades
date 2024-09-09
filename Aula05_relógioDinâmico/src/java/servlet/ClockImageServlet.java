package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.awt.Color;
import java.awt.Graphics2D;
import java.awt.RenderingHints;
import java.awt.image.BufferedImage;
import static javax.swing.Spring.width;

@WebServlet(name = "ClockImageServlet", urlPatterns = {"/clock.png"})
public class ClockImageServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("image/png");
        
        int size = 200;
        BufferedImage image = new BufferedImage(size, size, BufferedImage.TYPE_INT_ARGB);
        Graphics2D g2d = image.createGraphics();
        g2d.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
        g2d.setColor(Color.WHITE);
        g2d.fillRect(0, 0, size, size);
        
        int hour = java.time.LocalTime.now().getHour();
        int minute = java.time.LocalTime.now().getMinute();
        int second = java.time.LocalTime.now().getSecond();
        double hourAngle = (hour + minute / 60.0) * 30.0;
        double minuteAngle = minute * 6.0;
        double secondAngle = second * 6.0;

        g2d.setColor(Color.BLACK);
        int hourHandLength = (int) (size * 0.3); 
        int hourHandWidth = (int) (size * 0.03); 
        int hourHandX = size / 2;
        int hourHandY = size / 2;
        int hourHandEndX = hourHandX + (int) (hourHandLength * Math.sin(Math.toRadians(hourAngle)));
        int hourHandEndY = hourHandY - (int) (hourHandLength * Math.cos(Math.toRadians(hourAngle)));
        g2d.setStroke(
                new java.awt.BasicStroke(
                        hourHandWidth,
                        java.awt.BasicStroke.CAP_ROUND,
                        java.awt.BasicStroke.JOIN_ROUND
                )
        );
        g2d.drawLine(hourHandX, hourHandY, hourHandEndX, hourHandEndY);

        int minuteHandLength = (int) (size * 0.5); 
        int minuteHandWidth = (int) (size * 0.02); 
        int minuteHandEndX = hourHandX + (int) (minuteHandLength * Math.sin(Math.toRadians(minuteAngle)));
        int minuteHandEndY = hourHandY - (int) (minuteHandLength * Math.cos(Math.toRadians(minuteAngle)));
        g2d.setStroke(
                new java.awt.BasicStroke(
                        minuteHandWidth,
                        java.awt.BasicStroke.CAP_ROUND,
                        java.awt.BasicStroke.JOIN_ROUND
                )
        );
        g2d.drawLine(hourHandX, hourHandY, minuteHandEndX, minuteHandEndY);

        g2d.setColor(Color.RED);
        int secondHandLength = (int) (size * 0.55);
        int secondHandWidth = (int) (size * 0.01); 
        int secondHandEndX = hourHandX + (int) (secondHandLength * Math.sin(Math.toRadians(secondAngle)));
        int secondHandEndY = hourHandY - (int) (secondHandLength * Math.cos(Math.toRadians(secondAngle)));
        g2d.setStroke(
                new java.awt.BasicStroke(
                        secondHandWidth,
                        java.awt.BasicStroke.CAP_ROUND,
                        java.awt.BasicStroke.JOIN_ROUND
                )
        );
        g2d.drawLine(hourHandX, hourHandY, secondHandEndX, secondHandEndY);

        g2d.dispose();
        javax.imageio.ImageIO.write(image, "png", response.getOutputStream());
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
