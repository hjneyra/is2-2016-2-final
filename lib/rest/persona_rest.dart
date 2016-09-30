import 'dart:async';
import 'package:rpc/rpc.dart';

import '../service/persona_service.dart';
import '../model/persona.dart';

@ApiClass(name: 'persona', version: 'v1', description: 'User server side API')
class PersonaRest {
  PersonaService personaService;

  PersonaRest(this.personaService);

  @ApiMethod(path: 'persona/{id}')
  Future<Persona> getPersona(String id) {
    return personaService.get(int.parse(id));
  }

  @ApiMethod(path: 'all')
  Future<List<Persona>> getPersons() {
    return personaService.getAll();
  }
}
