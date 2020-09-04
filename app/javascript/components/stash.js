let timeleft = 30;
 // Update the count down every 1 second
  const timer = setInterval(function startTimer() {
  // Get today's date and time
  
  if(timeleft <= 0){
    clearInterval(timer);
    document.getElementById("countdown").innerHTML = "EXPIRED";
    document.querySelector("#randomize-button").remove();
  } else {
    document.getElementById("countdown").innerHTML = timeleft + " seconds remaining";
  }
  timeleft -= 1;
}, 1000);