<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "gym_organizer";

try {
    $conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        $id_usuario = $_POST['id_usuario'];
        $descripcion = $_POST['descripcion'];
        $fecha_inicio = $_POST['fecha_inicio'];
        $fecha_fin = $_POST['fecha_fin'];

        $sql = "INSERT INTO Objetivos (id_usuario, descripcion, fecha_inicio, fecha_fin) VALUES (?, ?, ?, ?)";
        $stmt = $conn->prepare($sql);
        $stmt->execute([$id_usuario, $descripcion, $fecha_inicio, $fecha_fin]);

        echo "Objetivo establecido con éxito.";
    }
} catch(PDOException $e) {
    echo "Error: " . $e->getMessage();
}
$conn = null;
?>
