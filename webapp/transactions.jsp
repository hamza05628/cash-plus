<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Transactions - CashPlus</title>
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
                    <a href="transactions.jsp" class="flex items-center p-3 rounded-md bg-[#008995]">
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
            <h1 class="text-xl font-bold text-[#1a5d75]">Historique des Transactions</h1>
            <input type="text" placeholder="Rechercher..." class="border p-2 rounded-md focus:ring-2 focus:ring-[#008995]">
        </div>

        <!-- Transactions Table -->
        <div class="bg-white p-6 rounded-lg shadow-md">
            <table class="w-full text-left border-collapse">
                <thead>
                    <tr class="bg-[#1a5d75] text-white">
                        <th class="p-3">Date</th>
                        <th class="p-3">Montant</th>
                        <th class="p-3">Statut</th>
                        <th class="p-3">Détails</th>
                    </tr>
                </thead>
                <tbody>
                    <tr class="border-b">
                        <td class="p-3">10 Mars 2025</td>
                        <td class="p-3 text-green-600 font-bold">+500 MAD</td>
                        <td class="p-3">
                            <span class="bg-green-500 text-white px-2 py-1 rounded-md text-sm">Réussi</span>
                        </td>
                        <td class="p-3"><i class="fas fa-info-circle text-[#008995] cursor-pointer"></i></td>
                    </tr>
                    <tr class="border-b">
                        <td class="p-3">08 Mars 2025</td>
                        <td class="p-3 text-red-600 font-bold">-300 MAD</td>
                        <td class="p-3">
                            <span class="bg-red-500 text-white px-2 py-1 rounded-md text-sm">Échoué</span>
                        </td>
                        <td class="p-3"><i class="fas fa-info-circle text-[#008995] cursor-pointer"></i></td>
                    </tr>
                    <tr class="border-b">
                        <td class="p-3">05 Mars 2025</td>
                        <td class="p-3 text-green-600 font-bold">+750 MAD</td>
                        <td class="p-3">
                            <span class="bg-green-500 text-white px-2 py-1 rounded-md text-sm">Réussi</span>
                        </td>
                        <td class="p-3"><i class="fas fa-info-circle text-[#008995] cursor-pointer"></i></td>
                    </tr>
                </tbody>
            </table>
        </div>

    </main>

</body>
</html>
