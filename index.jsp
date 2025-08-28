<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Create</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
  <style>
    body {
      min-height: 100vh;
      background: linear-gradient(-45deg, #6f42c1, #d63384, #fd7e14, #20c997);
      background-size: 400% 400%;
      animation: gradientBG 12s ease infinite;
      display: flex;
      align-items: center;
      justify-content: center;
    }

    @keyframes gradientBG {
      0% {background-position: 0% 50%;}
      50% {background-position: 100% 50%;}
      100% {background-position: 0% 50%;}
    }

    .card {
      border-radius: 20px;
      overflow: hidden;
      box-shadow: 0 0 25px rgba(0,0,0,0.4);
      animation: fadeIn 1s ease;
    }

    @keyframes fadeIn {
      from {opacity: 0; transform: translateY(-30px);}
      to {opacity: 1; transform: translateY(0);}
    }

    .card-header {
      background: linear-gradient(90deg, #6f42c1, #d63384, #fd7e14);
      font-family: 'Poppins', sans-serif;
      font-size: 1.6rem;
      letter-spacing: 1px;
      text-shadow: 1px 1px 4px rgba(0,0,0,0.5);
    }

    .form-control {
      border: 2px solid transparent;
      transition: all 0.3s ease-in-out;
    }

    .form-control:focus {
      border-color: #6f42c1;
      box-shadow: 0 0 12px rgba(111,66,193,0.7);
      transform: scale(1.02);
    }

    .btn-lg {
      border-radius: 12px;
      transition: all 0.3s ease-in-out;
    }

    .btn-lg:hover {
      transform: scale(1.08);
      box-shadow: 0 0 15px rgba(0,0,0,0.3);
    }

    .btn-menu {
      margin-top: 25px;
      display: inline-block;
      padding: 14px 28px;
      background: linear-gradient(135deg, #20c997, #0dcaf0);
      color: rgb(247, 247, 247);
      font-weight: bold;
      border-radius: 50px;
      text-decoration: none;
      transition: all 0.3s ease;
      box-shadow: 0 0 12px rgba(13,202,240,0.6);
    }
    .btn-menu:hover {
      background: linear-gradient(135deg, #0dcaf0, #20c997);
      transform: scale(1.07);
    }
  </style>
</head>
<body>

  <div class="card shadow-lg border-0" style="max-width: 900px; width: 100%;">
    <div class="card-header text-white text-center py-4">
      <h2 class="fw-bold mb-0"><i class="bi bi-stars"></i> ✨ Create - Registro de Persona ✨</h2>
    </div>
    <div class="card-body p-5">
      <!-- Formulario -->
      <form action="insertar.jsp" method="post" class="row g-4 needs-validation" novalidate>

        <!-- Nombre -->
        <div class="col-md-6">
          <label class="form-label"><i class="bi bi-person-badge"></i> Nombre</label>
          <input type="text" name="nombre" class="form-control form-control-lg" placeholder="Ej: Juan Pérez" required>
          <div class="invalid-feedback">Por favor ingresa tu nombre.</div>
        </div>

        <!-- Correo -->
        <div class="col-md-6">
          <label class="form-label"><i class="bi bi-envelope"></i> Correo</label>
          <input type="email" name="correo" class="form-control form-control-lg" placeholder="Ej: correo@ejemplo.com" required>
          <div class="invalid-feedback">Por favor ingresa un correo válido.</div>
        </div>

        <!-- Teléfono -->
        <div class="col-md-6">
          <label class="form-label"><i class="bi bi-telephone"></i> Teléfono</label>
          <input type="text" name="telefono" maxlength="15" class="form-control form-control-lg" placeholder="Ej: 3001234567" required>
          <div class="invalid-feedback">Por favor ingresa tu teléfono.</div>
        </div>

        <!-- Sexo -->
        <div class="col-md-6">
          <label class="form-label d-block"><i class="bi bi-gender-ambiguous"></i> Sexo</label>
          <div class="btn-group w-100" role="group">
            <input type="radio" class="btn-check" name="sexo" id="sexM" value="Masculino" required>
            <label class="btn btn-outline-info btn-lg" for="sexM"><i class="bi bi-gender-male"></i> Masculino</label>
            <input type="radio" class="btn-check" name="sexo" id="sexF" value="Femenino">
            <label class="btn btn-outline-danger btn-lg" for="sexF"><i class="bi bi-gender-female"></i> Femenino</label>
          </div>
        </div>

        <!-- Dirección -->
        <div class="col-md-6">
          <label class="form-label"><i class="bi bi-geo-alt"></i> Dirección</label>
          <input type="text" name="direccion" class="form-control form-control-lg" placeholder="Ej: Calle 123 #45-67" required>
          <div class="invalid-feedback">Por favor ingresa tu dirección.</div>
        </div>

        <!-- Fecha de Nacimiento -->
        <div class="col-md-6">
          <label class="form-label"><i class="bi bi-calendar-event"></i> Fecha de Nacimiento</label>
          <input type="date" name="fechaNacimiento" class="form-control form-control-lg" required>
          <div class="invalid-feedback">Por favor selecciona tu fecha de nacimiento.</div>
        </div>

        <!-- Botones -->
        <div class="col-12 text-center mt-4">
          <button type="reset" class="btn btn-outline-secondary btn-lg px-4">
            <i class="bi bi-arrow-counterclockwise"></i> Restablecer
          </button>
          <button type="submit" class="btn btn-success btn-lg px-4">
            <i class="bi bi-send-fill"></i> Registrar
          </button>
        </div>
      </form>

      <!-- Botón menú -->
      <div class="text-center">
        <a href="listar.jsp" class="btn-menu"><i class="bi bi-house-door"></i> Ir a CRUD (Read - Update - Delete)</a>
      </div>
    </div>
  </div>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
  <script>
    // Validación Bootstrap
    (function () {
      'use strict'
      const forms = document.querySelectorAll('.needs-validation')
      Array.from(forms).forEach(form => {
        form.addEventListener('submit', event => {
          if (!form.checkValidity()) {
            event.preventDefault()
            event.stopPropagation()
          }
          form.classList.add('was-validated')
        }, false)
      })
    })();
  </script>
</body>
</html>
