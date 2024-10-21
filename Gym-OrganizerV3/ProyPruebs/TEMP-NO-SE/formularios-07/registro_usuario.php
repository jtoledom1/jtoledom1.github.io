<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "gym_organizer";

try {
    $conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        $nombre = $_POST['nombre'];
        $email = $_POST['email'];
        $contraseña = $_POST['contraseña'];
        $confirmar_contraseña = $_POST['confirmar_contraseña'];

        if ($contraseña !== $confirmar_contraseña) {
            echo "Las contraseñas no coinciden.";
            exit;
        }

        $contraseña_hash = password_hash($contraseña, PASSWORD_DEFAULT);

        $sql = "INSERT INTO Usuarios (nombre, email, contraseña, fecha_creacion) VALUES (?, ?, ?, CURDATE())";
        $stmt = $conn->prepare($sql);
        if ($stmt->execute([$nombre, $email, $contraseña_hash])) {
            echo "success";
        } else {
            echo "Error al insertar el usuario.";
        }
    }
} catch(PDOException $e) {
    echo "Error de conexión: " . $e->getMessage();
}
$conn = null;
?>