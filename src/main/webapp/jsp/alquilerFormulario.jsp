<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Alquiler</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
	crossorigin="anonymous">
</head>
<body>
	<div class="container">
		<h1>Alquiler</h1>
		<form action="alquileres?accion=registrar" method="post"
			class="form-group needs-validation"
			onsubmit="return validarCedula(); validarCodigo();"
			name="buscarDatosParaAlquiler" novalidate>
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
			<div id="seccionCombo" style="display: none;">
				<div class="mb-3">
					<label for="tipoAlquiler" class="form-label">Tipo de
						Alquiler</label> <select class="form-select" name="tipoAlquiler"
						id="tipoAlquiler">
						
						<option>----Selecciona una opción----</option>
						<option value="normal">Alquiler Normal</option>
						<option value="fidelidad">Alquiler por Fidelidad</option>
						<option value="temporada">Alquiler por Temporada</option>
					</select>
				</div>
			</div>
			<div class="mb-3">
				<label for="codigoTemporada" class="form-label"
					style="display: none;">Código de Temporada</label> <input
					type="text" class="form-control" name="codigoTemporada"
					id="codigoTemporada" placeholder="Código Temporada" required
					style="display: none;">
				<div class="valid-feedback">Completo</div>
				<div class="invalid-feedback">Campo Vacio o Erroneo, ingresa
					nuevamente</div>
			</div>
			<div class="mb-3">
				<label for="codigoEjemplar" class="form-label"
					style="display: none;">Código del Ejemplar</label> <input
					type="text" class="form-control" name="codigoEjemplar"
					id="codigoEjemplar" placeholder="Código" required
					style="display: none;">
				<div class="valid-feedback">Completo</div>
				<div class="invalid-feedback">Campo Vacio o Erroneo, ingresa
					nuevamente</div>
			</div>
			<div class="mb-3">
				<label for="numeroDias" class="form-label" style="display: none;">Número
					de días de alquiler</label> <input type="number" class="form-control"
					name="numeroDias" id="numeroDias" placeholder="Días" required
					style="display: none;" >
				<div class="valid-feedback">Completo</div>
				<div class="invalid-feedback">Campo Vacio o Erroneo, ingresa
					nuevamente</div>
			</div>


			<button type="submit" class="btn btn-primary">Alquilar</button>
			<button type="button" class="btn btn-secondary"
				onclick="volverAIndex()">Volver</button>
		</form>
	</div>
	<script>

    // Define cedulaInput en un alcance más amplio
    const cedulaInput = document.querySelector('#cedulaCliente');

    function validarCedula(input) {
        const cedulaRegex = /^\d{10}$/;
        if (!cedulaRegex.test(input.value)) {
            input.setCustomValidity("Ingrese una cédula válida (10 dígitos)");
        } else {
            input.setCustomValidity("");
        }
    }

    function validarCodigo(input) {
        const codigoRegex = /^\d{4}$/;
        if (!codigoRegex.test(input.value)) {
            input.setCustomValidity("Ingrese un código válido de 4 dígitos (por ejemplo, 0001)");
        } else {
            input.setCustomValidity("");
        }
    }
    
    function mostrarSeccionCombo() {
        const seccionCombo = document.getElementById('seccionCombo');

        if ( cedulaInput.value.match(/^\d{10}$/)) {
            seccionCombo.style.display = 'block';
        } else {
            seccionCombo.style.display = 'none';
        }
    }

    // Usa el evento input de la cédula para llamar a la función mostrarSeccionCombo()
    cedulaInput.addEventListener('input', function() {
        validarCedula(cedulaInput);
        mostrarSeccionCombo();
    });


    window.addEventListener('DOMContentLoaded', function() {
        const form = document.querySelector('form');
        const select = document.getElementById("tipoAlquiler");
        const codigoTemporadaLabel = document.querySelector('label[for="codigoTemporada"]');
        const codigoTemporadaInput = document.getElementById("codigoTemporada");
        const codigoEjemplarLabel = document.querySelector('label[for="codigoEjemplar"]');
        const codigoEjemplarInput = document.getElementById("codigoEjemplar");
        const numeroDiasLabel = document.querySelector('label[for="numeroDias"]');
        const numeroDiasInput = document.getElementById("numeroDias");

        select.addEventListener("change", function() {
            if (select.value === "temporada") {
                codigoTemporadaLabel.style.display = 'block';
                codigoTemporadaInput.style.display = 'block';
                codigoEjemplarLabel.style.display = 'block';
                codigoEjemplarInput.style.display = 'block';
                numeroDiasLabel.style.display = 'block';
                numeroDiasInput.style.display = 'block';
            } else {
                codigoTemporadaLabel.style.display = 'none';
                codigoTemporadaInput.style.display = 'none';
                codigoEjemplarLabel.style.display = 'block';
                codigoEjemplarInput.style.display = 'block';
                numeroDiasLabel.style.display = 'block';
                numeroDiasInput.style.display = 'block';
            }
        });

        form.addEventListener('submit', function(event) {
            if (!form.checkValidity()) {
                event.preventDefault();
                event.stopPropagation();
            }
            form.classList.add('was-validated');
        });
    });
</script>

	<script>
	function volverAIndex() {
	    window.location.href = "index.jsp";
	}
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
