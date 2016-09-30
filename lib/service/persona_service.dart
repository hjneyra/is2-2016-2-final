import '../repository/persona_repository.dart';
import '../model/persona.dart';
import 'dart:async';

class PersonaService {
  PersonaRepository personaRepository;
  PersonaService(this.personaRepository);

  Future<Persona> get(int id) {
    return personaRepository.find(id);
  }

  Future<List<Persona>> getAll() {
    return personaRepository.findAll();
  }
}