// app/javascript/channels/chatroom_channel.js
import consumer from "./consumer";

const initChatroomCable = () => {
  const messagesContainer = document.getElementById('messages');
  if (messagesContainer) {
    const id = messagesContainer.dataset.chatroomId;

    consumer.subscriptions.create({ channel: "ChatroomChannel", id: id }, {
      received(data) {
        console.log(data); // called when data is broadcast in the cable
      },
    });
  }
}
export { initChatroomCable };
