<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>TalkPlus Example</title>
  <script src="https://asset.talkplus.io/npm/talkplus-0.4.18"></script>
</head>
<body>
  <div id="messages"></div>
  <input type="text" id="message-input">
  <button id="send-button">Send</button>

  <script>
    // Initialize TalkPlus client
    const client = new TalkPlus.Client({ appId: '94c4543b-80b2-4b7d-91eb-11a67dbe5261' });

    // Login anonymously
    client.loginAnonymous({
      userId: 'user-123',
      username: 'user-123',
      profileImageUrl: '',
    })
    .then((data) => {
      console.log('Logged in:', data);
      // Join a channel after successful login
      return client.joinChannel({ channelId: 'asdf7745' });
    })
    .then((data) => {
      console.log('Joined channel:', data);
      // Listen for new messages
      client.on('event', (payload) => {
        if (payload.type === 'message') {
          const message = payload.message;
          displayMessage(message);
        }
      });
    })
    .catch((err) => {
      console.error('Error:', err);
    });

    // Send a message
    document.getElementById('send-button').addEventListener('click', () => {
      const messageInput = document.getElementById('message-input');
      const messageText = messageInput.value;
      if (messageText.trim() !== '') {
        client.sendMessage({
          channelId: 'asdf7745',
          type: 'text',
          text: messageText,
        })
        .then((data) => {
          console.log('Message sent:', data);
          messageInput.value = '';
        })
        .catch((err) => {
          console.error('Error sending message:', err);
        });
      }
    });

    // Display a message in the UI
    function displayMessage(message) {
      const messagesDiv = document.getElementById('messages');
      const messageElement = document.createElement('div');
      messageElement.textContent = `${message.username}: ${message.text}`;
      messagesDiv.appendChild(messageElement);
    }
  </script>
</body>
</html>