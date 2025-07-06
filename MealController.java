package ma.ac.esi.nutritrack.controleur;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import ma.ac.esi.nutritrack.service.MealService;
import ma.ac.esi.nutritrack.model.Meal;

/**
 * Servlet implementation class MealController
 */
@WebServlet("/MealController")
public class MealController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private MealService mealService;

    public MealController() {
        super();
        this.mealService = new MealService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Récupérer la liste des repas depuis le service
        List<Meal> meals = mealService.getMeals();

        // Ajouter la liste des repas à la requête
        request.setAttribute("meals", meals);

        // Transférer la requête vers meals.jsp pour affichage
        request.getRequestDispatcher("meals.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}

