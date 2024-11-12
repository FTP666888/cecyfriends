document.getElementById('toggle-btn').addEventListener('click', function() {
    const loginForm = document.getElementById('login-form');
    const registerForm = document.getElementById('register-form');
    const formTitle = document.getElementById('form-title');
    const toggleBtn = document.getElementById('toggle-btn');

    if (loginForm.classList.contains('d-none')) {
        loginForm.classList.remove('d-none');
        registerForm.classList.add('d-none');
        formTitle.textContent = 'Login';
        toggleBtn.textContent = 'Switch to Register';
    } else {
        loginForm.classList.add('d-none');
        registerForm.classList.remove('d-none');
        formTitle.textContent = 'Register';
        toggleBtn.textContent = 'Switch to Login';
    }
});
