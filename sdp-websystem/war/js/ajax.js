$(document).ready(function(){
	$('select[name=curso]').on('change', function(){
		$.ajax({
			type: 'GET',
			url: '/consultacurso',
			data: 'codigocurso='+$('select[name=curso]').val(),
			statusCode:{
				404: function(){
					alert('Pagina no encontrada');
				},
				500: function(){
					alert('Error no servidor');
				}
			},
			success: function(dados){
				$('select[name=alumno] option').remove();
				var pegadados = dados.split(":");
				if(dados == ''){
					$('select[name=alumno]').append('<option>Curso sin alumnos</option>')
				}else{
				
				for(var i = 0; i < pegadados.length - 1; i++){
					var dnialumno = pegadados[i].split("-")[0];
					var nombrealumno = pegadados[i].split("-")[1];
					$('select[name=alumno]').append('<option value = "'+dnialumno+'">'+nombrealumno+'</option>')
				}
				}
			}
		});
	})
});