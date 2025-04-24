package controller;

import java.io.IOException;
import javax.persistence.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import model.Customer;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private static final EntityManagerFactory emf = Persistence.createEntityManagerFactory("Appliance");

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        response.setContentType("text/html;charset=UTF-8");

        EntityManager em = null;

        try {
            em = emf.createEntityManager();

            TypedQuery<Customer> query = em.createQuery(
                "SELECT c FROM Customer c WHERE c.email = :email", Customer.class);
            query.setParameter("email", email);

            Customer customer = query.getSingleResult();
            
            if (customer.getPassword().equals(password)) {
                HttpSession session = request.getSession();
                session.setAttribute("email", customer.getEmail());
                session.setAttribute("name", customer.getName());
                response.sendRedirect("welcome.jsp");
            } else {
                response.sendRedirect("login.jsp?error=password");
            }
        }catch (NoResultException e) {
            response.sendRedirect("login.jsp?error=email");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("login.jsp?error=server");
        } finally {
            if (em != null) em.close();
        }

    }
    
}
