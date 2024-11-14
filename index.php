<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="css/styles.css" rel="stylesheet">
</head>
<body>
    <div class="container">
        <div class="row justify-content-center align-items-center min-vh-100">
            <div class="col-md-6">
                <div class="card shadow-lg border-0">
                    <div class="card-header text-center">
                        <h3 id="form-title">Login</h3>
                    </div>
                    <div class="card-body p-4">
                    <form id="login-form" action="" method="post" style="display: block;">
                            <div class="form-group">
                                <label for="login-email">Email Institucional</label>
                                <input type="email" class="form-control" id="login-email" placeholder="Ingresa tu email">
                            </div>
                            <div class="form-group">
                                <label for="login-password">Contraseña</label>
                                <input type="password" class="form-control" id="login-password" placeholder="Contraseña">
                            </div>
                            <button type="submit" class="btn btn-primary btn-block mt-4">Login</button>
                        </form>
                        <form id="register-form" action="" method="post" style="display: none;">
                            <div class="form-group">
                                <label for="register-email">Email Institucional</label>
                                <input type="email" class="form-control" id="register-email" name="register-email" 
                                    placeholder="Ingresa tu email" required 
                                    title="Por favor, ingrese un correo institucional que termine en @cecyteq.edu.mx">
                            </div>
                            <div class="form-group">
                                <label for="register-phone">Número de Teléfono</label>
                                <input type="tel" class="form-control" id="register-phone" name="register-phone" placeholder="Ingresa tu número de teléfono" minlength="10" maxlength="10" pattern="[0-9]{10}" title="Debe tener 10 dígitos">
                            </div>
                            <div class="form-group">
                                <label for="register-password">Contraseña</label>
                                <input type="password" class="form-control" id="register-password" placeholder="Contraseña" required>
                            </div>
                            <button type="submit" class="btn btn-primary btn-block mt-4">Register</button>
                        </form>
                    </div>
                    <div class="card-footer text-center">
                        <button id="toggle-btn" class="btn btn-link text-muted">¿No tienes una cuenta? Regístrate aquí</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <!-- Custom JS -->
    <script src="js/cecyfriends.js"></script>
</body>
</html>
