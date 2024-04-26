// 전역 변수로 사용자 ID와 아티스트 ID 초기화
let userId = '';
let artistId = '';

document.addEventListener('DOMContentLoaded', function () {
    const urlParams = new URLSearchParams(window.location.search);
    userId = urlParams.get('userEmail');
    artistId = urlParams.get('artistEmail');

    // 로그인한 유저의 정보가 없을 경우 로그인 페이지로 리다이렉트
    if (!userId) {
        window.location.href = '/login'; // 로그인 페이지 URL로 변경
        return;
    }

    // 로그인한 유저의 정보를 로컬 스토리지에 저장
    localStorage.setItem('loggedInUserId', userId);

    // 이전에 사용자 채팅이 표시되었던 쪽을 로컬 스토리지에서 불러옴
    let userChatPosition = localStorage.getItem('userChatPosition');
    // 이전에 저장된 값이 없다면 기본값은 'right'로 설정
    if (!userChatPosition) {
        userChatPosition = 'right';
    }

    // 페이지 로드 시 기존 채팅 메시지 불러오기
    getChatMessages();
    setInterval(getChatMessages, 5000);

    // 사용자 채팅 위치 초기화
    setUserChatPosition(userChatPosition);
});

// 사용자 채팅 위치 설정 함수
function setUserChatPosition(position) {
    const chatMessages = document.getElementById('chat-messages');
    if (position === 'right') {
        // 사용자 채팅을 오른쪽에 배치
        chatMessages.classList.add('user-chat-right');
    } else {
        // 사용자 채팅을 왼쪽에 배치
        chatMessages.classList.remove('user-chat-right');
    }
}


// 채팅 메시지 목록 엘리먼트
const chatMessages = document.getElementById('chat-messages');
// 메시지 입력 필드 엘리먼트
const chatInput = document.getElementById('chat-input');
// 전송 버튼 엘리먼트
const sendButton = document.getElementById('send-button');

// 메시지 전송 함수
function sendMessage() {
    const message = chatInput.value.trim();
    if (message !== '') {
        const senderId = userId;
        const receiverId = artistId;

        // AJAX 요청으로 메시지 서버에 전송
        fetch('/Artistry_Project/ChatService', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded',
            },
            body: `senderId=${encodeURIComponent(senderId)}&receiverId=${encodeURIComponent(receiverId)}&message=${encodeURIComponent(message)}`
        })
            .then(response => response.text())
            .then(text => console.log(text))
            .catch(error => console.error('Error:', error));

        // UI 업데이트
        addMessageToUI(message, senderId, userId);
        chatInput.value = '';
        chatMessages.scrollTop = chatMessages.scrollHeight;
    }
}
// 전송 버튼 클릭 이벤트 처리
sendButton.addEventListener('click', sendMessage);

// 메시지 입력 필드에서 엔터 키 이벤트 처리
chatInput.addEventListener('keypress', function (event) {
    if (event.key === 'Enter') {
        event.preventDefault(); // 엔터 키로 인한 폼 제출 방지
        sendMessage();
    }
});

function getChatMessages() {
    fetch(`/Artistry_Project/GetChatMessagesService?senderId=${encodeURIComponent(userId)}&receiverId=${encodeURIComponent(artistId)}`)
        .then(response => {
            if (!response.ok) {
                throw new Error('Network response was not ok');
            }
            return response.json();
        })
        .then(data => {
            const existingIds = new Set(Array.from(chatMessages.children).map(child => child.dataset.msgId));
            data.forEach(message => {
                if (!existingIds.has(message.id.toString())) {
                    addMessageToUI(message.message, message.senderId, userId, message.id);
                }
            });
        })
        .catch(error => {
            console.error('Error:', error);
            alert('Failed to retrieve chat messages. Please try again later.');
        });
}

function addMessageToUI(message, senderId, loggedInUserId, messageId) {
    const messageBox = document.createElement('div');
    messageBox.className = 'message-box';
    messageBox.dataset.msgId = messageId; // 메시지 ID 저장

    const messageElement = document.createElement('div');
    messageElement.className = 'message';
    messageElement.classList.add(senderId === loggedInUserId ? 'sent' : 'received');

    const messageContent = document.createElement('div');
    messageContent.className = 'message-content';
    messageContent.textContent = message;

    const senderElement = document.createElement('div');
    senderElement.className = 'sender-name';
    senderElement.textContent = senderId === loggedInUserId ? 'You' : senderId;

    messageElement.appendChild(messageContent);
    messageBox.appendChild(senderElement);
    messageBox.appendChild(messageElement);
    chatMessages.appendChild(messageBox);
}