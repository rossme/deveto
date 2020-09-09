const randomizeMovieNameOnClick = () => {
  const movies = document.querySelector("#randomize").dataset.movies;
  const moviesjson = JSON.parse(movies);
  const countdown = document.querySelector("#countdown");
  function getRandomInt(min, max) {
    min = Math.ceil(min);
    max = Math.floor(max);
    return Math.floor(Math.random() * (max - min) + min); //The maximum is exclusive and the minimum is inclusive
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
    let number = getRandomInt(1,moviesjson.length)
    let movie = moviesjson[number]
    let movierandom = document.createElement("H1");
    movierandom.innerHTML = movie.title;
    let movielink = document.createElement("a");
    movielink.href = "https://www.netflix.com/watch/"+movie.id
    movielink.appendChild(movierandom)
    let moviename = document.querySelector("#randomize").prepend(movielink);
    // window.clearTimeout(btimer);
    // timer(30, callback);
  
  })
};


export { randomizeMovieNameOnClick }
