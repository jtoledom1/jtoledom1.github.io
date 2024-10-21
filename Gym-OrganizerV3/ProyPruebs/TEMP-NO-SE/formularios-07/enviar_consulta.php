<?php
$servername = "localhost";
$username = "root";
$password = "";  // Asumiendo que no has configurado contraseña para root
$dbname = "gym_organizer";

try {
    $conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);  // Corregido aquí

    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        $nombre = $_POST['nombre'];
        $email = $_POST['email'];
        $telefono = $_POST['telefono'];
        $mensaje = $_POST['mensaje'];
        $fecha_consulta = date('Y-m-d');  // Fecha actual

        $sql = "INSERT INTO Consultas (nombre, email, telefono, mensaje, fecha_consulta) VALUES (?, ?, ?, ?, ?)";
        $stmt = $conn->prepare($sql);
        $stmt->execute([$nombre, $email, $telefono, $mensaje, $fecha_consulta]);  // Corregido aquí, agregando '$' a 'mensaje'

        echo "Consulta enviada con éxito.";
    }
} catch(PDOException $e) {
    echo "Error: " . $e->getMessage();
}
$conn = null;
?>
