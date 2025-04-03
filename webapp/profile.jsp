<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profil - CashPlus</title>
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
                    <a href="profile.jsp" class="flex items-center p-3 rounded-md bg-[#008995]">
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
            <h1 class="text-xl font-bold text-[#1a5d75]">Mon Profil</h1>
        </div>

        <!-- Profile Section -->
        <div class="bg-white p-8 rounded-lg shadow-md max-w-2xl mx-auto">
            <div class="text-center">
                <!-- Profile Picture -->
                <div class="relative w-32 h-32 mx-auto">
                    <img src="img/default-user.png" alt="Profile Image" class="w-full h-full rounded-full shadow-md">
                    <label for="upload" class="absolute bottom-0 right-0 bg-[#008995] text-white p-2 rounded-full cursor-pointer">
                        <i class="fas fa-camera"></i>
                    </label>
                    <input type="file" id="upload" class="hidden">
                </div>

                <h2 class="text-2xl font-semibold text-[#1a5d75] mt-4">Utilisateur</h2>
                <p class="text-gray-500">Membre depuis Janvier 2024</p>
            </div>

            <!-- Profile Details -->
            <div class="mt-6 space-y-4">
                <div class="flex items-center justify-between">
                    <p class="text-gray-600">Email :</p>
                    <p class="font-medium">utilisateur@cashplus.com</p>
                </div>
                <div class="flex items-center justify-between">
                    <p class="text-gray-600">Téléphone :</p>
                    <p class="font-medium">+212 6 00 00 00 00</p>
                </div>
                <div class="flex items-center justify-between">
                    <p class="text-gray-600">Solde Actuel :</p>
                    <p class="font-medium text-[#008995]">1,250 MAD</p>
                </div>
            </div>

            <!-- Edit Profile Button -->
            <div class="text-center mt-6">
                <a href="edit-profile.jsp" class="bg-[#ffc600] text-white px-6 py-2 rounded-md font-bold hover:bg-[#008995]">
                    Modifier le Profil
                </a>
            </div>
        </div>
    </main>

</body>
</html>
