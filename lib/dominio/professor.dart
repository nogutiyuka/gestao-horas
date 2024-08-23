import 'package:gestao/dominio/cpf.dart' as validador; //definir um apelido
import 'package:gestao/dominio/dto/dto_professor.dart';
import 'package:gestao/dominio/interface/i_dao_professor.dart';

class Professor{
  late dynamic id;
  late String nome;
  late String? descricao;
  late String cpf;
  late String _status; //deixa o atributo privado

  String get status => _status;

  set status (String status){
    if(status != 'A' || status != 'I') throw Exception('Status deve ser "A" ou "I"');
    _status = status;
  }

  late IDaoProfessor dao;
  late DtoProfessor dto;

  Professor({required this.dto}) {
    id = dto.id;
    nome = dto.nome;
    descricao = dto.descricao;
    cpf = dto.cpf;
    status = dto.status;
    validador.CPF(cpf); //como não precisamos do cpf novamnete, podemor colocar ele diretamente
  }

  eNomeNaoVazio(){
    if(nome.isEmpty) throw Exception('Nome não pode ser vazio.');
  }

  DtoProfessor salvar(DtoProfessor dto) {
    eNomeNaoVazio();
    return dao.salvar(dto);
  }
}