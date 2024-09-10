package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.Date;
import org.json.JSONObject;

@WebServlet(name = "ApiLoteriaServlet", urlPatterns = {"/loteria.json"})
public class ApiLoteriaServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            //Data
            JSONObject date = new JSONObject();
            date.put("Horário: ", new Date());
            out.print(date);
            
            //Loteria
            int[] n = new int[6];
            int count = 0;
            while (count < 6) {
                int numero = (int) (Math.random() * 100) + 1;
                boolean repetido = false;
                for (int i = 0; i < count; i++) {
                    if (n[i] == numero) {
                        repetido = true;
                        break;
                    }
                }
                if (!repetido) {
                    n[count] = numero;
                    count++;
                }
            }
            out.println();
            out.println("Seus números são: ");
            for (int i = 0; i < 6; i++) {
                out.println(n[i]);
        }
        }
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
