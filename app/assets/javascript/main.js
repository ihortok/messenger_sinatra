let container = document.getElementById("container");
let messages = document.getElementById("messages");

container.style.height = `${window.innerHeight}px`;

if (messages !== null) {
  messages.scrollTop = messages.scrollHeight;
}
