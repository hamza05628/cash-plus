<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CashPlus - Accueil</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
</head>
<body class="bg-gray-100 flex h-screen">

    <!-- Sidebar -->
    <aside class="bg-[#1a5d75] text-white w-64 min-h-screen p-6">
        <!-- Logo -->
        <div class="flex justify-center mb-6">
            <img src="img/Logo-Cashplus.png" alt="CashPlus Logo" class="w-40 h-auto">
        </div>

        <!-- Navigation -->
        <nav>
            <ul>
                <li class="mb-4">
                    <a href="home.jsp" class="flex items-center p-3 rounded-md hover:bg-[#008995]">
                        <i class="fas fa-home mr-3"></i> Accueil
                    </a>
                </li>
                <li class="mb-4">
                    <a href="transactions.jsp" class="flex items-center p-3 rounded-md hover:bg-[#008995]">
                        <i class="fas fa-exchange-alt mr-3"></i> Transactions
                    </a>
                </li>
                <li class="mb-4">
                    <a href="profile.jsp" class="flex items-center p-3 rounded-md hover:bg-[#008995]">
                        <i class="fas fa-user mr-3"></i> Mon Compte
                    </a>
                </li>
                <li class="mt-10">
                    <a href="logout.jsp" class="flex items-center p-3 bg-red-600 text-white rounded-md hover:bg-red-700">
                        <i class="fas fa-sign-out-alt mr-3"></i> Déconnexion
                    </a>
                </li>
            </ul>
        </nav>
    </aside>

    <!-- Main Content -->
    <main class="flex-1 p-8">
        <!-- Top Navbar -->
        <div class="flex justify-between items-center bg-white shadow-md p-4 rounded-lg mb-6">
            <h1 class="text-xl font-bold text-[#1a5d75]">Bienvenue sur CashPlus</h1>
            <div class="flex items-center space-x-4">
                <span class="text-gray-700">Bonjour, <strong>Utilisateur</strong></span>
                <i class="fas fa-user-circle text-2xl text-[#1a5d75]"></i>
            </div>
        </div>

        <!-- Dashboard Content -->
        <div class="grid grid-cols-1 md:grid-cols-3 gap-6">
            <!-- Card: Balance -->
            <div class="bg-white p-6 rounded-lg shadow-md flex items-center">
                <i class="fas fa-wallet text-4xl text-[#1a5d75] mr-4"></i>
                <div>
                    <p class="text-gray-600">Solde Actuel</p>
                    <h2 class="text-2xl font-bold">1,250 MAD</h2>
                </div>
            </div>

            <!-- Card: Recent Transactions -->
            <div class="bg-white p-6 rounded-lg shadow-md flex items-center">
                <i class="fas fa-exchange-alt text-4xl text-[#008995] mr-4"></i>
                <div>
                    <p class="text-gray-600">Dernières Transactions</p>
                    <h2 class="text-lg font-bold">Voir l’historique</h2>
                </div>
            </div>

            <!-- Card: Support -->
            <div class="bg-white p-6 rounded-lg shadow-md flex items-center">
                <i class="fas fa-headset text-4xl text-[#ffc600] mr-4"></i>
                <div>
                    <p class="text-gray-600">Assistance</p>
                    <h2 class="text-lg font-bold">Contacter le support</h2>
                </div>
            </div>
        </div>
    </main>

</body>
</html>
