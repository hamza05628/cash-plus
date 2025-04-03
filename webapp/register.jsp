<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%
    String successMessage = (String) session.getAttribute("successMessage");
    String errorMessage = (String) session.getAttribute("errorMessage");

    // Remove messages after displaying to prevent reappearing on refresh
    session.removeAttribute("successMessage");
    session.removeAttribute("errorMessage");
%>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inscription | Cash Plus</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script>
        tailwind.config = {
            theme: {
                extend: {
                    colors: {
                        primary: '#1a5d75',
                        secondary: '#008995',
                        accent: '#ffc600',
                        light: '#f0f9ff'
                    }
                }
            }
        }
    </script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
</head>
<body class="bg-gradient-to-br from-primary to-secondary flex justify-center items-center min-h-screen p-4">

    <div class="bg-white p-8 rounded-xl shadow-2xl w-full max-w-md relative overflow-hidden">
        <!-- Decorative elements -->
        <div class="absolute -top-20 -right-20 w-40 h-40 rounded-full bg-accent/10"></div>
        <div class="absolute -bottom-20 -left-20 w-40 h-40 rounded-full bg-secondary/10"></div>
        
        <!-- Logo -->
        <div class="flex justify-center mb-6 relative z-10">
            <img src="img/Logo-Cashplus.png" alt="CashPlus Logo" class="w-48 h-auto">
        </div>

        <!-- Tagline -->
        <p class="text-center text-gray-600 mb-8 relative z-10 font-medium">
            Rejoignez Cash Plus et simplifiez la gestion de votre argent
        </p>

        <!-- Messages -->
        <div class="relative z-10">
            <!-- Success Message -->
            <% if (successMessage != null) { %>
                <div class="mb-4 p-4 text-green-800 bg-green-100 border-l-4 border-green-500 rounded-md flex items-start">
                    <i class="fas fa-check-circle mt-1 mr-3 text-green-500"></i>
                    <div>
                        <p class="font-medium"><%= successMessage %></p>
                    </div>
                </div>
            <% } %>

            <!-- Error Message -->
            <% if (errorMessage != null) { %>
                <div class="mb-4 p-4 text-red-800 bg-red-100 border-l-4 border-red-500 rounded-md flex items-start">
                    <i class="fas fa-exclamation-circle mt-1 mr-3 text-red-500"></i>
                    <div>
                        <p class="font-medium"><%= errorMessage %></p>
                    </div>
                </div>
            <% } %>
        </div>

        <!-- Form Container -->
        <div class="bg-light p-6 rounded-lg relative z-10">
            <!-- Heading -->
            <h2 class="text-2xl font-bold text-center text-primary mb-6">
                <i class="fas fa-user-plus mr-2 text-secondary"></i> Créer un compte
            </h2>

            <!-- Form -->
            <form action="register" method="post" class="space-y-4">
                <div>
                    <label for="email" class="block text-sm font-medium text-primary mb-1">Email</label>
                    <div class="relative">
                        <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                            <i class="fas fa-envelope text-gray-400"></i>
                        </div>
                        <input type="email" id="email" name="email" required
                            class="pl-10 pr-4 py-3 w-full border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-secondary focus:border-transparent transition duration-200"
                            placeholder="votre@email.com">
                    </div>
                </div>

                <div>
                    <label for="password" class="block text-sm font-medium text-primary mb-1">Mot de passe</label>
                    <div class="relative">
                        <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                            <i class="fas fa-lock text-gray-400"></i>
                        </div>
                        <input type="password" id="password" name="password" required
                            class="pl-10 pr-4 py-3 w-full border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-secondary focus:border-transparent transition duration-200"
                            placeholder="••••••••">
                    </div>
                    <p class="mt-1 text-xs text-gray-500">Minimum 8 caractères</p>
                </div>

                <div class="flex items-center">
                    <input id="terms" name="terms" type="checkbox" required class="h-4 w-4 text-secondary focus:ring-secondary border-gray-300 rounded">
                    <label for="terms" class="ml-2 block text-sm text-gray-700">
                        J'accepte les <a href="#" class="text-secondary hover:text-primary">conditions d'utilisation</a>
                    </label>
                </div>

                <!-- Submit Button -->
                <button type="submit" class="w-full py-3 bg-accent text-primary font-bold rounded-lg hover:bg-secondary hover:text-white transition duration-200 ease-in-out transform hover:scale-[1.01] shadow-md">
                    S'inscrire
                </button>
            </form>
        </div>

        <!-- Footer Links -->
        <div class="mt-6 text-center text-sm relative z-10">
            <p class="text-gray-600">Déjà un compte ? <a href="/cashplus/login.jsp" class="font-medium text-secondary hover:text-primary">Se connecter</a></p>
        </div>
    </div>

</body>
</html>