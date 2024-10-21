<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "gym_organizer";

$email = $_GET['email'];

try {
    $conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    $sql = "SELECT nombre, email, fecha_creacion FROM usuarios WHERE email = ?";
    $stmt = $conn->prepare($sql);
    $stmt->execute([$email]);
    $result = $stmt->fetch(PDO::FETCH_ASSOC);

    if ($result) {
        echo "<h1>Perfil de Usuario</h1>";
        echo "Nombre: " . htmlspecialchars($result['nombre']) . "<br>";
        echo "Email: " . htmlspecialchars($result['email']) . "<br>";
        echo "Fecha de Creación: " . $result['fecha_creacion'] . "<br>";
    } else {
        echo "No se encontró un usuario con ese correo electrónico.";
    }
} catch(PDOException $e) {
    echo "Error: " . $e->getMessage();
}
$conn = null;
?>
