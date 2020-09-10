import consumer from "./consumer";
// ACTION CABLE
const initHouseholdCable = () => {
  // code for the players that are waiting for the random pick
  const tableContainer = document.querySelector('.household-start-game');
  if (tableContainer) {
    const id = tableContainer.dataset.householdId;
    console.log('subscribed to household random pick' + id);

    consumer.subscriptions.create({ channel: "HouseholdChannel", id: id }, {
      received(data) {
        if (tableContainer.dataset.currentUserId != data.sender_id) {
          const movieContainer = document.querySelector('#movie-name');
          if (!movieContainer) return
           let movienameh3present = document.querySelector(".netflix-name")
          if (movienameh3present) {
            movienameh3.innerHTML = "";
            movienameh3.innerHTML = data.movie_name;
          } else {
            let movienameh3 = document.createElement("H3")
            movienameh3.classList.add("netflix-name")
            movienameh3.innerHTML = data.movie_name;
            movieContainer.appendChild(movienameh3);

          }
          

          

          const vetoContainer = document.querySelector('#playing-user-2');
          vetoContainer.classList.remove('d-none');
        }
      },
    });
  }

  // code for the player that picked movie and he is waiting for vetos
  const tableVetoContainer = document.querySelector('.household-random-pick');
  if (tableVetoContainer) {
    const id = tableVetoContainer.dataset.householdId;
    console.log('subscribed to household veto' + id);

    consumer.subscriptions.create({ channel: "HouseholdChannel", id: id }, {
      received(data) {
        if (tableVetoContainer.dataset.currentUserId != data.sender_id) {
          window.location.href = tableVetoContainer.dataset.startgameUrl;
          alert('Veto by ' + data.veto_from); // Use Sweet alert https://sweetalert2.github.io/#download
        }
      },
    });
  }
}

export { initHouseholdCable };
