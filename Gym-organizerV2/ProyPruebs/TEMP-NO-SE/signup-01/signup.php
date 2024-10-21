<?php

// Datos de conexión a la base de datos
$servername = "127.0.0.1";
$username = "root";
$password = ""; // Por defecto, en XAMPP la contraseña está vacía
$db_name = "DbGym";

// Crear conexión
$link = mysqli_connect($servername, $username, $password, $db_name) or die("Error");

// Verificar si se ha enviado el formulario
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Obtener y sanitizar los datos del formulario
    $email = mysqli_real_escape_string($link, $_POST['email']);
    $password = mysqli_real_escape_string($link, $_POST['password']);
    $cpassword = mysqli_real_escape_string($link, $_POST['cpassword']);
    
    // Verificar que las contraseñas coincidan
    if ($password !== $cpassword) {
        echo "Las contraseñas no coinciden";
    } else {
        // Hash de la contraseña
        $hashed_password = password_hash($password, PASSWORD_DEFAULT);
        
        // Preparar la consulta
        $query = "INSERT INTO signup (email, password) VALUES (?, ?)";
        $stmt = mysqli_prepare($link, $query);
        
        // Verificar si la consulta se preparó correctamente
        if ($stmt) {
            // Asignar parámetros y ejecutar la consulta
            mysqli_stmt_bind_param($stmt, "ss", $email, $hashed_password);
            if (mysqli_stmt_execute($stmt)) {
                echo             '<script>
                window.location.href = "index.php";
                alert("Exito")
            </script>';
            } else {
                echo             '<script>
                window.location.href = "index.php";
                alert(""Error al registrar usuario"")
            </script>';
            }
            // Cerrar la consulta preparada
            mysqli_stmt_close($stmt);
        } else {
            echo 
            '<script>
                        window.location.href = "index.php";
                        alert(""Error en la preparación de la consulta"")
                    </script>';
        }
    }
}

// Cerrar la conexión
mysqli_close($link);

?>
