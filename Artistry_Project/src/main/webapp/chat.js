// 전역 변수로 사용자 ID 와 아티스트 ID 초기화
let userId = '';
let artistId = '';

document.addEventListener('DOMContentLoaded', function() {
    const urlParams = new URLSearchParams(window.location.search);
    userId = urlParams.get('userEmail');
    artistId = urlParams.get('artistEmail');
    getChatMessages();
    setInterval(getChatMessages, 5000);
});

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
        const senderId = userId; // 사용자 ID 적절하게 설정하세요
        const receiverId = artistId; // 아티스트 ID 적절하게 설정하세요

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
        addMessageToUI(message, userId);
        chatInput.value = '';
        chatMessages.scrollTop = chatMessages.scrollHeight;
        lastSender = userId; // 현재 메시지의 발신자를 이전 메시지의 발신자로 저장
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

function getChatMessages() {
    const senderId = userId;
    const receiverId = artistId;

    fetch(`/Artistry_Project/GetChatMessagesService?senderId=${encodeURIComponent(senderId)}&receiverId=${encodeURIComponent(receiverId)}`)
        .then(response => {
            if (!response.ok) {
                throw new Error('Network response was not ok');
            }
            return response.json();
        })
        .then(data => {
            chatMessages.innerHTML = ''; // 기존 채팅 내역 초기화
            data.forEach(message => {
                const sender = message.senderId === userId ? 'Me' : message.senderId;
                addMessageToUI(message.message, sender, message.senderId === userId);
            });
            chatMessages.scrollTop = chatMessages.scrollHeight;
        })
        .catch(error => {
            console.error('Error:', error);
            alert('Failed to retrieve chat messages. Please try again later.');
        });
}

function addMessageToUI(message, sender, isSentByMe) {
    const messageBox = document.createElement('div');
    messageBox.className = 'message-box';

    if (isSentByMe) {
        messageBox.style.alignItems = 'flex-end';
    } else {
        messageBox.style.alignItems = 'flex-start';
    }

    if (sender !== lastSender) {
        const senderName = document.createElement('div');
        senderName.className = 'sender-name';
        senderName.textContent = sender;
        messageBox.appendChild(senderName);
    }

    const messageElement = document.createElement('div');
    messageElement.className = isSentByMe ? 'message sent' : 'message received';
    messageElement.textContent = message;

    messageBox.appendChild(messageElement);
    chatMessages.appendChild(messageBox);

    chatMessages.scrollTop = chatMessages.scrollHeight;
    lastSender = sender;
}