class CPF{
  late List<int> numerosCPF;


  CPF(String cpf){
    eVazio(cpf);
    cpf = cpf.replaceAll(RegExp(r'\D'), '');
    numerosCPF = cpf.split('').map(int.parse).toList();
    eOnzeNumeros();
    eNumeroDiferente();
    eDigitoCorreto();
  }


  eVazio(String cpf){
    if(cpf.isEmpty) throw Exception('CPF não pode ser vazio!');
  }


  bool eOnzeNumeros(){
    numerosCPF.forEach(print);
    if(numerosCPF.length!=11)throw Exception('CPF precisa ter 11 números');
    return true;
  }


  bool eNumeroDiferente(){
    var diferente = false;
    for(int i=0; i< 9; i++){
      if(numerosCPF[i] != numerosCPF[i+1]) {
        diferente = true;
        break;
      }
    }
    if(!diferente) throw Exception('CPF não pode ter números iguais');
    return diferente;
  }


  bool eDigitoCorreto(){
    verificarPrimeiroDigito();
    verificarSegundoDigito();
    return true;
  }


  int calcularDigito(int indice){
    var soma=0;
    for(var peso=9; indice >=0; peso--, indice--){
      soma += numerosCPF[indice] * peso;
    }
    var digito = soma % 11;
    if(digito==10) digito=0;
    return digito;
  }


  bool verificarPrimeiroDigito(){
    if(calcularDigito(8)!=numerosCPF[9]) throw Exception('Primeiro digito incorreto');
    return true;
  }


  bool verificarSegundoDigito(){
    if(calcularDigito(9)!=numerosCPF[10]) throw Exception('Segundo digito incorreto');
    return true;
  }
}
/*class CPF {
  late List<int> numerosCPF; // late, aguarda para depois
  
  CPF(String cpf) {
    if (cpf == '') throw Exception('CPF não pode ser vazio');
    cpf = cpf.replaceAll('.', '');
    cpf = cpf.replaceAll('-', '');
    // cpf = cpf.replaceAll(RegExp(r'\D'), '');
    List<String> temp = cpf.split('');

    /*
    numerosCPF = <int>[];
    for(var e in temp){
      int numero = int.parse(e);
      numerosCPF.add(numero);
      numerosCPF.add(numero);
    } */

    numerosCPF = cpf.split('').map((e) => int.parse(e)).toList();
  }

  bool eOnzeNumero() {
    if (numerosCPF.length != 11) throw Exception('CPF deve ter 11 números');
    return true;
  }

  bool eNumerosDiferentes() {
    int numTeste = numerosCPF[0];
    int numIguais = 0;
    for (int i = 1; i < 11; i++) {
      if (numTeste == numerosCPF[i]) {
        numIguais++;
      }
    }
    if (numIguais == 10) {
      return false;
    } else {
      return true;
    }
  }

  int calcularDigito(int indice) {
    var soma = 0;

    for (var i = 9; i > 0; i--, indice--) {
      soma += numerosCPF[indice] * i;
    }

    var digito = soma % 11;
    if (digito == 10) digito = 0;
    return digito;
  }

  bool eDigitosCorretos() {
    if (calcularDigito(8) != numerosCPF[9] ||
        calcularDigito(9) != numerosCPF[10]) {
      return false;
    } else {
      return true;
    }
  }

  bool eUnico() {
    return false;
  }
}

/*
  bool eDigitosCorretos() {
    int penultimo = 0;
    int ultimo = 0;
    int total = 0;
    for (int i = 0; i < 9; i++) {
      total = total + (numerosCPF[i] * (i + 1));
    }
    penultimo = total % 11;
    total = 0;
    for (int i = 0; i < 10; i++) {
      total = total + (numerosCPF[i] * i);
    }
    ultimo = total % 11;
    if(ultimo == 10){
      ultimo = 0;
    }else if(penultimo == 10){
      penultimo = 0;
    }
    if (penultimo == numerosCPF[9] && ultimo == numerosCPF[10]) {
      return true;
    } else {
      return false;
    }
  }
 */
*/