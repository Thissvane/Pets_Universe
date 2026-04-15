/* ================================================
   PETS UNIVERSE - Scripts Compartidos
   ================================================ */

document.addEventListener('DOMContentLoaded', function () {

    // -----------------------------------------------
    // 1. VALIDACIÓN: Confirmar contraseñas (registro)
    // -----------------------------------------------
    const formRegistro = document.querySelector('form[action="registro_proceso.php"]');
    if (formRegistro) {
        formRegistro.addEventListener('submit', function (e) {
            const clave = formRegistro.querySelector('[name="clave"]').value;
            const claveConfirmar = formRegistro.querySelector('[name="clave_confirmar"]').value;

            if (clave !== claveConfirmar) {
                e.preventDefault();
                alert('⚠️ Las contraseñas no coinciden. Por favor, verifica e intenta de nuevo.');
                formRegistro.querySelector('[name="clave_confirmar"]').focus();
            }
        });
    }

    // -----------------------------------------------
    // 2. VALIDACIÓN: Teléfono exactamente 10 dígitos
    // -----------------------------------------------
    const telefonoInput = document.querySelector('[name="numero_telefono"]');
    if (telefonoInput) {
        telefonoInput.addEventListener('input', function () {
            // Solo permite números
            this.value = this.value.replace(/[^0-9]/g, '');
        });

        telefonoInput.addEventListener('blur', function () {
            if (this.value.length > 0 && this.value.length !== 10) {
                this.classList.add('is-invalid');
                mostrarError(this, 'El número de teléfono debe tener exactamente 10 dígitos.');
            } else {
                this.classList.remove('is-invalid');
                ocultarError(this);
            }
        });
    }

    // -----------------------------------------------
    // 3. MOSTRAR / OCULTAR CONTRASEÑA
    // -----------------------------------------------
    document.querySelectorAll('[data-toggle-password]').forEach(function (btn) {
        btn.addEventListener('click', function () {
            const targetId = this.getAttribute('data-toggle-password');
            const input = document.getElementById(targetId);
            if (!input) return;

            if (input.type === 'password') {
                input.type = 'text';
                this.textContent = '🙈';
            } else {
                input.type = 'password';
                this.textContent = '👁️';
            }
        });
    });

    // -----------------------------------------------
    // Funciones auxiliares
    // -----------------------------------------------
    function mostrarError(input, mensaje) {
        let feedback = input.nextElementSibling;
        if (!feedback || !feedback.classList.contains('invalid-feedback')) {
            feedback = document.createElement('div');
            feedback.classList.add('invalid-feedback');
            input.parentNode.insertBefore(feedback, input.nextSibling);
        }
        feedback.textContent = mensaje;
    }

    function ocultarError(input) {
        const feedback = input.nextElementSibling;
        if (feedback && feedback.classList.contains('invalid-feedback')) {
            feedback.textContent = '';
        }
    }

});