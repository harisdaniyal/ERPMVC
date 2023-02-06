function randombg() {
  var random = Math.floor(Math.random() * 1) + 0;
  var bigSize = [
    "url('/AdminLte/dist/img/iStock-trade-logistics-montage.jpg')",

 ];
  document.getElementById("right").style.backgroundImage = bigSize[random];
}