<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Devolución</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
	crossorigin="anonymous">

</head>
<body>
	<div class="container">
		<h1>Devolución</h1>
		<form action="alquileres?accion=devolver" method="post"
			onsubmit="return validarNumeroAlquiler();"
			class="form-group needs-validation" novalidate>
			<div class="mb-3">
				<label for="cedulaCliente" class="form-label">CI del Cliente</label>
				<input type="text" class="form-control" name="cedulaCliente"
					id="cedulaCliente" placeholder="10 digitos" required>
				<div class="valid-feedback">Completo</div>
				<div class="invalid-feedback">Campo Vacio o Erroneo, ingresa
					nuevamente</div>
			</div>
			<div class="mb-3">
				<label for="nombreCliente" class="form-label">Nombre</label> <input
					type="text" class="form-control" name="nombreCliente"
					id="nombreCliente" disabled="disabled">
				<div class="valid-feedback">Completo</div>
				<div class="invalid-feedback">Campo Vacio o Erroneo, ingresa
					nuevamente</div>
			</div>
			<div class="mb-3">
				<label for="apellidoCliente" class="form-label">Apellido</label> <input
					type="text" class="form-control" name="apellidoCliente"
					id="apellidoCliente" disabled="disabled">
				<div class="valid-feedback">Completo</div>
				<div class="invalid-feedback">Campo Vacio o Erroneo, ingresa
					nuevamente</div>
			</div>
			<div class="mb-3">
				<label for="numeroAlquiler" class="form-label">Nro de
					Alquiler </label> <input type="number" class="form-control"
					name="numeroAlquiler" id="numeroAlquiler" placeholder="Numero">
				<div class="valid-feedback">Completo</div>
				<div class="invalid-feedback">Campo Vacio o Erroneo, ingresa
					nuevamente</div>
			</div>
			<div class="mb-3">
				<label for="tienePercance">¿El ejemplar tiene percance?</label>
				<div class="valid-feedback">Completo</div>
				<div class="invalid-feedback">Campo Vacio o Erroneo, ingresa
					nuevamente</div>
			</div>
			<table id="tablaPeliculas" class="display" style="width: 100%">
				<thead>
					<tr>
						<th>ID</th>
						<th>Nombre</th>
						<th>Devuelta</th>
						<th>Pregunta con Percance</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>1</td>
						<td>Spider-Man: No Way Home</td>
						<td><input type="checkbox" id="tienePercance"
							name="tienePercance" value="si"></td>
						<td><input type="checkbox" id="tienePercance"
							name="tienePercance" value="si"></td>
					</tr>
					<tr>
						<td>2</td>
						<td>The Matrix Resurrections</td>
						<td><input type="checkbox" id="tienePercance"
							name="tienePercance" value="si"></td>
						<td><input type="checkbox" id="tienePercance"
							name="tienePercance" value="si"></td>

					</tr>
					<!-- Agregar más filas aquí -->
				</tbody>
			</table>

			<button type="submit" class="btn btn-primary">Devolver</button>
			<button type="button" class="btn btn-secondary"
				onclick="volverAIndex()">Volver</button>
		</form>
	</div>

	<script>
    // Example starter JavaScript for disabling form submissions if there are invalid fields
    (() => {
        'use strict'

        // Fetch all the forms we want to apply custom Bootstrap validation styles to
        const forms = document.querySelectorAll('.needs-validation')

        // Loop over them and prevent submission
        Array.from(forms).forEach(form => {
            form.addEventListener('submit', event => {
                if (!form.checkValidity()) {
                    event.preventDefault()
                    event.stopPropagation()
                }

                form.classList.add('was-validated')
            }, false)
        })
    })()
</script>
	<script>
	function volverAIndex() {
	    window.location.href = "index.jsp";
	}
    window.addEventListener('DOMContentLoaded', function() {
        const form = document.querySelector('form');
        const numeroAlquilerInput = document.querySelector('#numeroAlquiler');

        numeroAlquilerInput.addEventListener('input', function() {
            validarNumeroAlquiler(numeroAlquilerInput);
        });

        form.addEventListener('submit', function(event) {
            if (!form.checkValidity()) {
                event.preventDefault();
                event.stopPropagation();
            }
            form.classList.add('was-validated');
        });
    });

    function validarNumeroAlquiler(input) {
        const numeroAlquiler = Number(input.value);
        if (isNaN(numeroAlquiler)) {
            input.setCustomValidity("Ingrese un número válido para el número de alquiler");
        } else {
            input.setCustomValidity("");
        }
    }
</script>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.7/dist/umd/popper.min.js"
		integrity="sha384-zYPOMqeu1DAVkHiLqWBUTcbYfZ8osu1Nd6Z89ify25QV9guujx43ITvfi12/QExE"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.min.js"
		integrity="sha384-Y4oOpwW3duJdCWv5ly8SCFYWqFDsfob/3GkgExXKV4idmbt98QcxXYs9UoXAB7BZ"
		crossorigin="anonymous"></script>


</body>
</html>
