<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="ma.ac.esi.nutritrack.model.Meal" %>
<%@ page import="ma.ac.esi.nutritrack.model.Ingredient" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Meals</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h2 class="mb-4">Liste des Repas</h2>

    <!-- Bouton Ajouter un ingrédient-->
    <button class="btn btn-primary mb-3" data-bs-toggle="modal" data-bs-target="#addIngredientModal">
        <i class="bi bi-plus-lg"></i> Ajouter un ingrédient
    </button>

    <!-- Fenêtre modale -->
    <div class="modal fade" id="addIngredientModal" tabindex="-1" aria-labelledby="addIngredientModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5>Ajouter un nouvel ingrédient</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form action="IngredientController" method="post">
                        <div class="mb-3">
                            <label class="form-label">Repas</label>
                            <select class="form-control" id="mealId" name="mealId" required>
                                <% List<Meal> meals = (List<Meal>) request.getAttribute("meals");
                                   for (Meal meal : meals) { %>
                                    <option value="<%= meal.getMealId() %>"><%= meal.getmealName() %></option>
                                <% } %>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Nom de l'ingrédient</label>
                            <input type="text" class="form-control" id="ingredientName" name="name" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Calories</label>
                            <input type="number" class="form-control" id="ingredientCalories" name="calories" required>
                        </div>
                        <button type="submit" class="btn btn-success">Ajouter</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Affichage des repas et ingrédients -->
    <div class="row">
        <% 
        if (meals != null) {
            for (Meal meal : meals) {
        %>
            <div class="col-md-3 mb-4">
                <div class="card">
                    <div class="card-header text-center">
                        <strong><%= meal.getmealName() %></strong>
                    </div>
                    <div class="card-body">
                        <% for (Ingredient ing : meal.getIngredients()) { %>
                            <div class="meal-item mb-2">
                                <img src="img/<%= ing.getName().replaceAll(" ", "") %>.jpg" alt="<%= ing.getName() %>" style="width: 80px; height: 80px; object-fit: cover;">
                                <span><%= ing.getName() %></span><br>
                                <small><%= ing.getCalories() %> kcal</small>
                            </div>
                        <% } %>
                    </div>
                </div>
            </div>
        <% 
            }
        } else {
        %>
            <p>Aucun repas disponible.</p>
        <% } %>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
