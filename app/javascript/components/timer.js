function vetoTimer() {
  let counter = document.getElementById("veto-timer");
  let seconds = Number(counter.innerHTML) -1;
  counter.innerHTML = seconds;
  if( seconds > 0 ) {
    setTimeout(vetoTimer, 1000);
  } else {
    document.getElementById('watch-btn').classList.remove('d-none');
    document.querySelector('.waiting-veto').classList.add('d-none');
  }
}

export { vetoTimer };
