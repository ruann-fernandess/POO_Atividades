package Package;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "RandomServlet", urlPatterns = {"/random.html"})
public class RandomServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        // Array para armazenar os números sorteados
        int[] numeros = new int[6];
        int count = 0;

        // Gerar 6 números aleatórios não repetidos entre 1 e 60
        while (count < 6) {
            int numero = (int) (Math.random() * 60) + 1;
            boolean repetido = false;

            // Verificar se o número já foi sorteado
            for (int i = 0; i < count; i++) {
                if (numeros[i] == numero) {
                    repetido = true;
                    break;
                }
            }

            // Adicionar o número ao array se não for repetido
            if (!repetido) {
                numeros[count] = numero;
                count++;
            }
        }
        
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>RandomServlet</title>");
            out.println("<style>");
            out.println("</style>");
            out.println("</head>");
            out.println("<body>");
            out.println("<table border='1'>");
            out.println("<tr>"); // Início da linha da tabela

            // Imprimir os números em uma linha da tabela
            for (int numero : numeros) {
                out.println("<tr>");
                out.println("<td>" + numero + "</td>");
                out.println("</tr>");
            }

            out.println("</tr>"); // Fim da linha da tabela
            out.println("</table>");
            out.println("<h4><a href='index.html'>voltar</a></h4>");
            out.println("</body>");
            out.println("</html>");
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
