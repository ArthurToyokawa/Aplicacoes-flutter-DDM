

main () async {
  print('abre a pag');
  await buscarDados();
  print('carrega os btn');
  print('carrega os campos');
  print('carrega os img');
}

buscarDados () async {
  await Future.delayed(Duration(seconds: 3), () => print('carrega os dados')
  );
}