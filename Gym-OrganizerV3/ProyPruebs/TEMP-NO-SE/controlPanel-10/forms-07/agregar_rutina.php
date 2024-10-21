<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "gym_organizer";

try {
    $conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        $nombre_rutina = $_POST['nombre_rutina'];
        $descripcion = $_POST['descripcion'];
        $dificultad = $_POST['dificultad'];
        $categoria = $_POST['categoria'];

        $sql = "INSERT INTO Rutinas (nombre_rutina, descripcion, dificultad, categoria) VALUES (?, ?, ?, ?)";
        $stmt = $conn->prepare($sql);
        $stmt->execute([$nombre_rutina, $descripcion, $dificultad, $categoria]);

        echo "Rutina agregada con éxito.";
    }
} catch(PDOException $e) {
    echo "Error: " . $e->getMessage();
}
$conn = null;
?>
