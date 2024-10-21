<?php
session_start();
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "gym_organizer";

try {
    $conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        $email = $_POST['email'];
        $contraseña = $_POST['contraseña'];

        // Preparar la sentencia SQL para evitar inyecciones SQL
        $sql = "SELECT id_usuario, nombre, contraseña FROM usuarios WHERE email = ?";
        $stmt = $conn->prepare($sql);
        $stmt->execute([$email]);
        $user = $stmt->fetch(PDO::FETCH_ASSOC);

        // Verificar que la contraseña en la base de datos coincide con la ingresada por el usuario
        if ($user && password_verify($contraseña, $user['contraseña'])) {
            $_SESSION['user_id'] = $user['id_usuario'];
            $_SESSION['user_name'] = $user['nombre'];
            header('Location: dashboard.html');
            exit;
        } else {
            // Notificar al usuario que el email o contraseña son incorrectos
            echo "Email o contraseña incorrectos.";
        }
    }
} catch (PDOException $e) {
    // Manejo de errores de conexión a la base de datos
    echo "Error de conexión: " . $e->getMessage();
}
$conn = null;
?>
