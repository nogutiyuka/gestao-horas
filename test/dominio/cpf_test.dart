import 'package:flutter_test/flutter_test.dart';
import 'package:gestao/dominio/cpf.dart';

main() {
  group('Entidade cpf', () {
    group('Teste de CPF vazio', () {
      test('Entidade CPF - não pode ser vazio', () {
        expect(() => new CPF('070.304.390-07'),
            returnsNormally); // ()=> Função anônima
      });
      test('Entidade CPF - teste cpf vazio', () {
        expect(() => new CPF(''), throwsException); // ()=> Função anônima
      });
    });
    group('[e04]', () {
      test('CPF - deve ter 11 números', () {
        expect(() => new CPF('070.304.390-07').eOnzeNumeros(), returnsNormally);
      });
      test('CPF - 10 números', () {
        expect(() => CPF('070.304.390-0').eOnzeNumeros(), throwsException);
      });
    });

    group('[e05]', () {
      test('teste CPF numeros diferentes', () {
        expect(CPF("070.304.390-07").eNumeroDiferente(), true);
      });
      test('teste CPF inicio igual', () {
        expect(CPF("333.304.390-07").eNumeroDiferente(), true);
      });
      test('teste CPF 10 numeros iguais', () {
        expect(CPF("333.333.333-37").eNumeroDiferente(), true);
      });
      test('teste CPF numeros iguais', () {
        expect(CPF("222.222.222-22").eNumeroDiferente(), false);
      });
      test('CPF - deve ter 11 números', () {
        expect(() => new CPF('070.304.390-07').eOnzeNumeros(), returnsNormally);
      });
      test('CPF - 10 números', () {
        expect(() => CPF('070.304.390-0').eOnzeNumeros(), throwsException);
      });
      test('Entidade CPF - não pode ser vazio', () {
        expect(() => new CPF('070.304.390-07'),
            returnsNormally); // ()=> Função anônima
      });
      test('Entidade CPF - teste cpf vazio', () {
        expect(() => new CPF(''), throwsException); // ()=> Função anônima
      });
    });

    group("[e06]", () {
      test("teste cpf numeros válidos", () {
        expect(CPF("123.456.897-73").eDigitoCorreto(), true);
      });
      test("teste cpf numeros inválidos", () {
        expect(CPF("123.456.897-74").eDigitoCorreto(), false);
      });
      test(" cpf edu", () {
        expect(CPF("055.035.719-08").eDigitoCorreto(), true);
      });
      test(" cpf carla", () {
        expect(CPF("109.169.999-20").eDigitoCorreto(), true);
      });
    });
  });
}
