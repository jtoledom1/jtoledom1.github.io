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
        $fecha_registro = $_POST['fecha_registro'];
        $ejercicio = $_POST['ejercicio'];
        $peso_cargado = $_POST['peso_cargado'];
        $repeticiones = $_POST['repeticiones'];
        $series = $_POST['series'];

        $sql = "INSERT INTO Registros_Ejercicios (id_usuario, fecha_registro, ejercicio, peso_cargado, repeticiones, series) VALUES (?, ?, ?, ?, ?, ?)";
        $stmt = $conn->prepare($sql);
        $stmt->execute([$id_usuario, $fecha_registro, $ejercicio, $peso_cargado, repeticiones, series]);

        echo "Ejercicio registrado con éxito.";
    }
} catch(PDOException $e) {
    echo "Error: " . $e->getMessage();
}
$conn = null;
?>
