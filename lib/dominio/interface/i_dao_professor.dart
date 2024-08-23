import 'package:gestao/dominio/dto/dto_professor.dart';

abstract class IDaoProfessor { //como em dart não temos interface, criamos uma classe abstrata

  DtoProfessor salvar(DtoProfessor dto);

}