document.getElementById('toggle-btn').addEventListener('click', function() {
    const loginForm = document.getElementById('login-form');
    const registerForm = document.getElementById('register-form');
    const formTitle = document.getElementById('form-title');
    const toggleBtn = document.getElementById('toggle-btn');

    if (loginForm.style.display === 'none') {
        // Mostrar el formulario de login y ocultar el de registro
        loginForm.style.display = 'block';
        registerForm.style.display = 'none';
        formTitle.textContent = 'Login';
        toggleBtn.textContent = '¿No tienes una cuenta? Regístrate aquí';
    } else {
        // Mostrar el formulario de registro y ocultar el de login
        loginForm.style.display = 'none';
        registerForm.style.display = 'block';
        formTitle.textContent = 'Register';
        toggleBtn.textContent = '¿Ya tienes una cuenta? Inicia sesión aquí';
    }
});

document.getElementById('register-form').addEventListener('submit', function(event) {
    const emailInput = document.getElementById('register-email');
    const emailValue = emailInput.value;
    const emailPattern = /^[a-zA-Z0-9._%+-]+@cecyteq\.edu\.mx$/;

    if (!emailPattern.test(emailValue)) {
        event.preventDefault(); // Detiene el envío del formulario
        alert("Por favor, ingrese un correo institucional que termine en @cecyteq.edu.mx");
        emailInput.focus(); // Enfoca el campo de correo
    }
});
