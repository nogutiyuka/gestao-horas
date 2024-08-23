class DtoProfessor {
  late dynamic id;
  late String nome;
  late String? descricao;
  late String cpf;
  late String status;

  DtoProfessor({this.id, required this.nome, this.descricao, required this.cpf, this.status = 'A'});
}