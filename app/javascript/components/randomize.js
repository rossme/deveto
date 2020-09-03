const randomizeMovieNameOnClick = () => {

const movies = document.querySelector("#randomize").dataset.movies.split(",");
const moviename = document.querySelector("#randomize");
Array.prototype.random = function () {
    return this[Math.floor((Math.random()*this.length))];
  }

document.querySelector("#randomize-button").addEventListener('click', function()
{
 document.querySelector("#randomize").innerHTML = "";
 let movie = movies.random().replace(/("|"$)/g, '');
 let movierandom = document.createElement("H1")
 movierandom.innerHTML = movie
 moviename.prepend(movierandom)
})
};

export { randomizeMovieNameOnClick }

