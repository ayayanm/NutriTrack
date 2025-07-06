package ma.ac.esi.nutritrack.controleur;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import ma.ac.esi.nutritrack.service.IngredientService;

import java.io.IOException;

@WebServlet("/IngredientController")
public class IngredientController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            // Récupérer les paramètres du formulaire
            int mealId = Integer.parseInt(request.getParameter("mealId"));
            String name = request.getParameter("name");
            int calories = Integer.parseInt(request.getParameter("calories"));

            // Appel au service
            IngredientService service = new IngredientService();
            boolean success = service.addIngredientToMeal(mealId, name, calories);

            // Redirection
            if (success) {
                response.sendRedirect("MealController");
            } else {
                request.setAttribute("errorMessage", "Échec de l'ajout de l'ingrédient.");
                request.getRequestDispatcher("error.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace(); // ❗ ICI : il manquait un `;` à la fin
            request.setAttribute("errorMessage", "Erreur lors du traitement : " + e.getMessage());
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
}
