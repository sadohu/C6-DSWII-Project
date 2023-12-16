<!DOCTYPE html>
<meta charset="UTF-8" />
<title>Institución Educativa</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
</head>
<body style="background-color: #428bca;">
	<header>
		<nav
			class="navbar navbar-expand-lg navbar-dark bg-dark d-flex justify-content-center">
			<div class="navbar-brand">Institución Educativa</div>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarNav" aria-controls="navbarNav"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
		</nav>
	</header>
	<section class="vh-100">
		<div class="container py-5 h-100">
			<div
				class="row d-flex justify-content-center align-items-center h-100">
				<div class="col-12 col-md-8 col-lg-6 col-xl-5">
					<div class="card shadow-2-strong" style="border-radius: 1rem;">
						<div class="card-body p-5 text-center">
							<div class="mb-5">
								<img alt="imagenProfesor"
									src="https://cdn-icons-png.flaticon.com/512/3750/3750020.png"
									width="128px" height="128px">
								<h3>Inicio de sesión</h3>
							</div>

							<form method="post">
								<div class="form-outline mb-4">
									<input type="text" id="username" name="username"
										class="form-control form-control-lg" /> <label
										class="form-label" for="typeEmailX-2">Nombre de
										usuario</label>
								</div>
								<div class="form-outline mb-4">
									<input type="password" id="password" name="password"
										class="form-control form-control-lg" /> <label
										class="form-label" for="typePasswordX-2">Password</label>
								</div>
								<button class="btn btn-primary btn-lg btn-block" type="submit">

									<span>Ingresar</span>
								</button>
							</form>
							<hr class="my-4">
							<p style="font-size:12px;">Confia en el señor, sigue el camino de Cheems...  <img alt="cheems" src="https://i.pinimg.com/1200x/23/c1/de/23c1de3c708ed6eb565a038fb5a26e63.jpg" width="36px"></p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- MENSAJE -->
	<%
		String successMessage = (String) request.getAttribute("message");
		String men = "";

		if (successMessage == "invalid") {
			men = successMessage;
		}
	%>
	<div align="center" id="successMessage" style="display: none;">
		<%=men%>
	</div>
	<!-- MENSAJE -->

	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>

	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="toastr.min.js"></script>

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
	<!-- <script src="https://code.jquery.com/jquery-3.5.1.js"></script> -->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script>
		/* Agrega este script para ocultar el mensaje despu de 5 segundos */
		setTimeout(function() {
			// document.getElementById('successMessage').style.display = 'none';
			document.getElementById('successMessage').style.display = 'none';
		}, 100);

		// Obt el valor de idSolicitud desde el elemento span
		// var mensaje = document.getElementById('successMessage').innerText.trim();
		var mensaje = document.getElementById('successMessage').innerText
				.trim();
		// Muestra el toast con el mensaje 
		if (mensaje == null || mensaje == "") {
			console.log("Blah");
		} else if (mensaje == "invalid") {
			toastr.error("Credenciales incorrectas");
			console.log("Si hay guardado");
		} else {
			toastr.info("Holiiiiiiiiiiiiiiii :v");
			console.log("Si hay actualizado");
		}
	</script>
</body>
</html>