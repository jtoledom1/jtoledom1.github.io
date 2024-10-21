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
        $peso = $_POST['peso'];
        $estatura = $_POST['estatura'];
        $grasa_corporal = $_POST['grasa_corporal'];

        $sql = "INSERT INTO Mediciones (id_usuario, fecha_medicion, peso, estatura, grasa_corporal) VALUES (?, CURDATE(), ?, ?, ?)";
        $stmt = $conn->prepare($sql);
        $stmt->execute([$id_usuario, $peso, $estatura, $grasa_corporal]);

        echo "Mediciones registradas con éxito.";
    }
} catch(PDOException $e) {
    echo "Error: " . $e->getMessage();
}
$conn = null;
?>
