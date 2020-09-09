const randomizeMovieNameOnClick = () => {
  const movies = document.querySelector("#randomize").dataset.movies.split(",");
  const moviename = document.querySelector("#randomize");
  const countdown = document.querySelector("#countdown");
  Array.prototype.random = function () {
    return this[Math.floor((Math.random()*this.length))];
  }

 /*  let btimer;

  function timer(seconds, cb) {
    var remaningTime = seconds;
    btimer = window.setTimeout(function() {
      cb();
      if (remaningTime > 0) {
        timer(remaningTime - 1, cb);
        document.getElementById("countdown").innerHTML = remaningTime + " seconds remaining";
      }
      else {
        document.getElementById("countdown").innerHTML = "EXPIRED";
        document.querySelector("#randomize-button").remove();
      }
    }, 1000);
  }

  var callback = function() {
    clearTimeout(btimer)
  }; */

  document.querySelector("#randomize-button").addEventListener('click', function() {
    document.querySelector("#randomize").innerHTML = "";
    let movie = movies.random().replace(/("|"$)/g, '');
    let movierandom = document.createElement("H1");
    movierandom.innerHTML = movie.slice(0, 20) + '...';
    moviename.prepend(movierandom);
    // window.clearTimeout(btimer);
    // timer(30, callback);
  })
};

export { randomizeMovieNameOnClick }
