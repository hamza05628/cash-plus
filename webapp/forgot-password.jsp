<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Réinitialisation du mot de passe | Cash Plus</title>
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
    
    <script>
        function encodeURIComponentJS(value) {
            return encodeURIComponent(value);
        }

        function sendVerificationCode() {
            const email = document.getElementById("email").value;
            
            if (!email) {
                alert("Veuillez entrer votre adresse email");
                return;
            }
            
            fetch('forgot-password', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded',
                },
                body: 'email=' + encodeURIComponentJS(email) + '&action=send-code'
            })
            .then(response => response.json())
            .then(data => {
                if (data.status === "success") {
                    document.getElementById("verification-section").style.display = 'block';
                    document.getElementById("send-button").style.display = 'none';
                    document.getElementById("email").readOnly = true;
                } else {
                    alert("Erreur: " + (data.message || "Échec de l'envoi du code"));
                }
            })
            .catch(error => {
                console.error('Error:', error);
                alert("Une erreur s'est produite");
            });
        }

        function verifyCode() {
            const enteredCode = document.getElementById("verificationCode").value;
            const feedbackIcon = document.getElementById("feedback-icon");
            
            if (!enteredCode || enteredCode.length !== 6) {
                alert("Veuillez entrer un code de vérification valide (6 chiffres)");
                return;
            }
            
            fetch('forgot-password', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded',
                },
                body: 'verificationCode=' + encodeURIComponentJS(enteredCode) + '&action=verify-code'
            })
            .then(response => response.json())
            .then(data => {
                if (data.status === "success") {
                    feedbackIcon.className = "fa-solid fa-check text-green-500";
                    document.getElementById("newPassword-section").style.display = 'block';
                } else {
                    feedbackIcon.className = "fa-solid fa-xmark text-red-500";
                    alert("Code de vérification incorrect");
                }
            })
            .catch(error => {
                console.error('Error:', error);
                alert("Une erreur s'est produite");
            });
        }
        
        function resetPassword() {
            const newPassword = document.getElementById("newPassword").value;
            
            if (!newPassword || newPassword.length < 8) {
                alert("Le mot de passe doit contenir au moins 8 caractères");
                return;
            }
            
            fetch('forgot-password', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded',
                },
                body: 'newPassword=' + encodeURIComponentJS(newPassword) + '&action=reset-password'
            })
            .then(response => response.json())
            .then(data => {
                if (data.status === "success") {
                    alert("Votre mot de passe a été réinitialisé avec succès");
                    window.location.href = "/cashplus/login.jsp";
                } else {
                    alert("Erreur: " + (data.message || "Échec de la réinitialisation du mot de passe"));
                }
            })
            .catch(error => {
                console.error('Error:', error);
                alert("Une erreur s'est produite");
            });
        }
    </script>
</head>
<body class="bg-gradient-to-br from-primary to-secondary flex justify-center items-center min-h-screen p-4">

    <div class="bg-white p-8 rounded-xl shadow-2xl w-full max-w-md relative overflow-hidden">
        <!-- Decorative elements -->
        <div class="absolute -top-20 -right-20 w-40 h-40 rounded-full bg-accent/10"></div>
        <div class="absolute -bottom-20 -left-20 w-40 h-40 rounded-full bg-secondary/10"></div>
        
        <!-- Logo -->
        <div class="flex justify-center mb-6">
            <img src="img/Logo-Cashplus.png" alt="CashPlus Logo" class="w-40 h-auto">
        </div>

        <h2 class="text-2xl font-bold text-center text-primary mb-6">
            <i class="fas fa-key mr-2 text-secondary"></i> Réinitialisation du mot de passe
        </h2>

        <!-- Email Section -->
        <div id="email-section">
            <div class="mb-4">
                <label for="email" class="block text-sm font-medium text-primary mb-1">Email :</label>
                <div class="relative">
                    <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                        <i class="fas fa-envelope text-gray-400"></i>
                    </div>
                    <input type="email" id="email" name="email" required 
                        class="pl-10 pr-4 py-3 w-full border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-secondary focus:border-transparent"
                        placeholder="votre@email.com">
                </div>
            </div>

            <!-- Send Button to initiate the verification process -->
            <button type="button" id="send-button" onclick="sendVerificationCode()" 
                class="w-full py-3 bg-accent text-primary font-bold rounded-lg hover:bg-secondary hover:text-white transition duration-200">
                Envoyer le code
            </button>
        </div>

        <!-- Verification Code Section (Initially hidden) -->
        <div id="verification-section" style="display: none;">
            <div class="mb-4">
                <label for="verificationCode" class="block text-sm font-medium text-primary mb-1">Code de vérification :</label>
                <div class="relative">
                    <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                        <i class="fas fa-shield-alt text-gray-400"></i>
                    </div>
                    <input type="text" id="verificationCode" name="verificationCode" required 
                        class="pl-10 pr-4 py-3 w-full border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-secondary focus:border-transparent"
                        maxlength="6" pattern="\d{6}" title="Veuillez entrer 6 chiffres"
                        placeholder="123456">
                </div>
            </div>
            <!-- Icon Feedback for Code Verification -->
            <div id="feedback-icon" class="text-center text-xl mb-4"></div>
            <button type="button" onclick="verifyCode()" 
                class="w-full py-3 bg-accent text-primary font-bold rounded-lg hover:bg-secondary hover:text-white transition duration-200">
                Vérifier le code
            </button>
        </div>

        <!-- New Password Section (Initially hidden) -->
        <div id="newPassword-section" style="display: none;">
            <div class="mb-4">
                <label for="newPassword" class="block text-sm font-medium text-primary mb-1">Nouveau mot de passe :</label>
                <div class="relative">
                    <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                        <i class="fas fa-lock text-gray-400"></i>
                    </div>
                    <input type="password" id="newPassword" name="newPassword" required minlength="8"
                        class="pl-10 pr-4 py-3 w-full border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-secondary focus:border-transparent"
                        placeholder="••••••••">
                </div>
                <p class="text-xs text-gray-500 mt-1">Le mot de passe doit contenir au moins 8 caractères</p>
            </div>
            <button type="button" onclick="resetPassword()" 
                class="w-full py-3 bg-accent text-primary font-bold rounded-lg hover:bg-secondary hover:text-white transition duration-200">
                Réinitialiser
            </button>
        </div>

        <div class="mt-6 text-center text-sm">
            <p class="text-gray-600">Retour à la <a href="/cashplus/login.jsp" class="font-medium text-secondary hover:text-primary">connexion</a></p>
        </div>
    </div>

</body>
</html>