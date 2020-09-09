import consumer from "./consumer";
// ACTION CABLE
const initHouseholdCable = () => {
  // code for the players that are waiting for the random pick
  const tableContainer = document.querySelector('.household-start-game');
  if (tableContainer) {
    const id = tableContainer.dataset.householdId;
    console.log('subscribed to household' + id);

    consumer.subscriptions.create({ channel: "HouseholdChannel", id: id }, {
      received(data) {
        if (tableContainer.dataset.currentUserId != data.sender_id) {
          const movieContainer = document.querySelector('#movie-name h1');
          movieContainer.innerHTML = data.movie_name;

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
    console.log('subscribed to household' + id);

    consumer.subscriptions.create({ channel: "HouseholdChannel", id: id }, {
      received(data) {
        if (tableVetoContainer.dataset.currentUserId != data.sender_id) {
          window.location.href = tableVetoContainer.dataset.startgameUrl;
          Swal.fire('Veto by ' + data.veto_from); // Use Sweet alert https://sweetalert2.github.io/#download
        }
      },
    });
  }
}

export { initHouseholdCable };
