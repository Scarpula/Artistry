// 채팅 메시지 목록 엘리먼트
const chatMessages = document.getElementById('chat-messages');
// 메시지 입력 필드 엘리먼트
const chatInput = document.getElementById('chat-input');
// 전송 버튼 엘리먼트
const sendButton = document.getElementById('send-button');

let lastSender = ''; // 이전 메시지의 발신자를 저장할 변수

// 메시지 전송 함수
function sendMessage() {
  const message = chatInput.value.trim();
  if (message !== '') {
    const senderId = '사용자 ID'; // 사용자 ID 적절하게 설정하세요
    const receiverId = '아티스트 ID'; // 아티스트 ID 적절하게 설정하세요

    // AJAX 요청으로 메시지 서버에 전송
    fetch('/Artistry_Project/ChatService', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: `senderId=${encodeURIComponent(senderId)}&receiverId=${encodeURIComponent(receiverId)}&message=${encodeURIComponent(message)}`
    }).then(response => response.text())
      .then(text => console.log(text))
      .catch(error => console.error('Error:', error));

    // UI 업데이트
    addMessageToUI(message, '나'); // '나' 대신 실제 사용자 닉네임이나 아이디 사용 가능
    chatInput.value = '';
    chatMessages.scrollTop = chatMessages.scrollHeight;
    lastSender = '나'; // 현재 메시지의 발신자를 이전 메시지의 발신자로 저장
  }
}

// 전송 버튼 클릭 이벤트 처리
sendButton.addEventListener('click', sendMessage);

// 메시지 입력 필드에서 엔터 키 이벤트 처리
chatInput.addEventListener('keypress', function(event) {
  if (event.key === 'Enter') {
    event.preventDefault(); // 엔터 키로 인한 폼 제출 방지
    sendMessage();
  }
});

// UI에 메시지 추가 함수
function addMessageToUI(message, sender) {
    const messageBox = document.createElement('div');
    messageBox.className = 'message-box';
    messageBox.style.alignItems = 'flex-end';

    if (sender !== lastSender) {
        const senderName = document.createElement('div');
        senderName.className = 'sender-name';
        senderName.textContent = sender;
        messageBox.appendChild(senderName);
    }

    const messageElement = document.createElement('div');
    messageElement.className = 'message sent';
    messageElement.textContent = message;

    messageBox.appendChild(messageElement);
    chatMessages.appendChild(messageBox);

    chatMessages.scrollTop = chatMessages.scrollHeight;
    lastSender = sender;
}
