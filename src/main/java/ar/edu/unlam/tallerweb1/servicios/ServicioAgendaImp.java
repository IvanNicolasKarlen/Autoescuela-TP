package ar.edu.unlam.tallerweb1.servicios;

import java.util.ArrayList;
import java.util.List;
import java.util.TreeSet;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ar.edu.unlam.ViewModel.AgendasViewModel;
import ar.edu.unlam.ViewModel.CursosViewModel;
import ar.edu.unlam.tallerweb1.dao.AgendaDao;
import ar.edu.unlam.tallerweb1.dao.EstadoInscripcionDao;
import ar.edu.unlam.tallerweb1.modelo.Agenda;
import ar.edu.unlam.tallerweb1.modelo.Alumno;
import ar.edu.unlam.tallerweb1.modelo.Curso;
import ar.edu.unlam.tallerweb1.modelo.EstadoInscripcion;
import ar.edu.unlam.tallerweb1.modelo.Inscripcion;
@Service("servicioAgenda")
@Transactional
public class ServicioAgendaImp implements ServicioAgenda{
	@Inject
	private AgendaDao  servicioAgendaDao;
	@Inject
	private EstadoInscripcionDao estadoinscripcionDao;
	
	
	@Override
	public List<Agenda> buscarDiaYHorarioDeTurnoDeUnInstructor(Long idInstructor) {
		return servicioAgendaDao.buscarDiaYHorarioDeTurnoDeUnInstructor(idInstructor);
	}
	
	
	/********************************* Alumno ********************************/
	@Override
	public TreeSet<Agenda> traerAgendasConFechasNoRepetidas(Curso Curso) {

		return servicioAgendaDao.traerAgendasConFechasNoRepetidas(Curso);
	}
	
	
	
	@Override
	public Boolean constatarQueNadieSeAnotaraEnLasFechasAsignadas(AgendasViewModel agendasViewModel, Curso curso) {
		//Declaramos una lista para guardar las agendas buscadas
		List<Agenda> Agendas= new ArrayList();
		
		//Reorremos los ID de las agendas seleccionadas que pasamos por parametro
		for(Long a: agendasViewModel.getIdAgendasDepurado())
		{	
			//tratamos la excepcion nullPointer en caso que el
			// *metodo devuelva null
			try
			{
				// *metodo
				Agenda aBuscada=servicioAgendaDao.buscarAgendasElegidas(a, curso); //alumnoAgendaDao
				
				//comparamos que el id de la agenda buscada
				// sea igual que el de la agenda que le pasamos por parametro
				if(a.equals(aBuscada.getId())){
					
					Agendas.add(aBuscada);
					}else{
						return false;
					}
				
			}
			catch(NullPointerException e)
			{
				break; //finalizamos el for
			}

		}

		// si la cantidad de la lista con las agendas buscadas
		// es igual a la cant de las agendas pasadas por parametro,
		// las agendas estan disponibles y retorna true
		if(Agendas.size() == agendasViewModel.getIdAgendasDepurado().size())
			{
			 return true;
				
			}
		
		return false;
	}
	
	
	@Override
	public List<Agenda> traerTodasLasClasesQueEstaAnotado(Long idAlumno) {
		
		//Busco el id del estado que dice "Cursando"
		 EstadoInscripcion estado = estadoinscripcionDao.buscarEstadoCursando();
		
		return servicioAgendaDao.traerTodasLasClasesQueEstaAnotado(idAlumno);
	}
	
	
	
	@Override
	public List<Agenda> traerTodasLasClasesQueSeEncuentraAnotado(CursosViewModel cursosViewModel, Long idAlumno) {
		
		//Busco el id del estado que dice "Cursando"
		 EstadoInscripcion estado = estadoinscripcionDao.buscarEstadoCursando();
		
		 List<Agenda> listaAgregarInscripcion  = new ArrayList();
		 
		 for(Long c: cursosViewModel.getListaCursos())
		 {
			 
		List<Agenda> listaInscripcion = servicioAgendaDao.traerTodasLasClasesQueSeEncuentraAnotado(c, estado, idAlumno);
		
		listaAgregarInscripcion.addAll(listaInscripcion);
		 }
		 
		return listaAgregarInscripcion;
	}
	@Override
	public List<Agenda> traerTodasLasClasesDeUnaSolaEspecialidad(Long idEspecialidad, Long idAlumno) {
		
		return servicioAgendaDao.traerTodasLasClasesDeUnaSolaEspecialidad(idEspecialidad, idAlumno);
	}
	@Override
	public Agenda traerClaseQueQuiereEliminar(Long idAgendaSeleccionado, Long idAlumno) {
		
		
		
		return servicioAgendaDao.traerClaseQueQuiereEliminar( idAgendaSeleccionado,  idAlumno);
	}
	
	@Override
	public void eliminarClaseDeLaAgenda(Long idAgendaSeleccionado, Long idAlumno) {
	
		Agenda agenda= servicioAgendaDao.traerClaseQueQuiereEliminar( idAgendaSeleccionado,  idAlumno);
		
		agenda.setInscripcion(null);
		
		//Eliminar esta clase
		 servicioAgendaDao.eliminarClaseDeLaAgenda(agenda);
		
	}
	
	

	
}
