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
        $id_rutina = $_POST['id_rutina'];
        $fecha_inicio = $_POST['fecha_inicio'];

        $sql = "INSERT INTO Rutinas_Usuario (id_usuario, id_rutina, fecha_inicio) VALUES (?, ?, ?)";
        $stmt = $conn->prepare($sql);
        $stmt->execute([$id_usuario, $id_rutina, $fecha_inicio]);

        echo "Rutina asignada al usuario con éxito.";
    }
} catch(PDOException $e) {
    echo "Error: " . $e->getMessage();
}
$conn = null;
?>
