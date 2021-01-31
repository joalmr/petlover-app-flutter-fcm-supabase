//rutas de carpetas
String pathGif(String gif) {
  return 'images/gif/$gif.gif';
}

String pathLottie(String lottie) {
  return 'images/lottie/$lottie.json';
}

String pathSvg(String svg) {
  return 'images/svg/$svg.svg';
}

String pathImg(String name, String type) {
  return 'images/$name.$type';
}

String pathImgNotification(String name) {
  return 'images/notificacion/$name.png';
}
