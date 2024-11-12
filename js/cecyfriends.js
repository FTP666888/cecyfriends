document.getElementById('toggle-btn').addEventListener('click', function() {
    const loginForm = document.getElementById('login-form');
    const registerForm = document.getElementById('register-form');
    const formTitle = document.getElementById('form-title');
    const toggleBtn = document.getElementById('toggle-btn');

    if (loginForm.style.opacity === '1' || loginForm.style.opacity === '') {
        // Ocultar loginForm con una transición suave
        loginForm.style.opacity = '0';
        setTimeout(() => {
            loginForm.style.visibility = 'hidden';
            registerForm.style.visibility = 'visible';
            registerForm.style.opacity = '1';
            formTitle.textContent = 'Register';
            toggleBtn.textContent = '¿Ya tienes una cuenta? Inicia sesión aquí';
        }, 500); // Tiempo igual al de la transición de opacidad
    } else {
        // Ocultar registerForm con una transición suave
        registerForm.style.opacity = '0';
        setTimeout(() => {
            registerForm.style.visibility = 'hidden';
            loginForm.style.visibility = 'visible';
            loginForm.style.opacity = '1';
            formTitle.textContent = 'Login';
            toggleBtn.textContent = '¿No tienes una cuenta? Regístrate aquí';
        }, 500); // Tiempo igual al de la transición de opacidad
    }
});
