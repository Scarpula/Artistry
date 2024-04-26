<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>채팅방 UI</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&display=swap" rel="stylesheet">
    <style>
        /* 기존 CSS 코드 */
    </style>
</head>
<body class="bg-gray-100 p-4">
    <div class="chat-container bg-white p-4 rounded-lg shadow">
        <div id="chat-messages" class="flex flex-col">
            <!-- 채팅 메시지들이 동적으로 추가될 영역 -->
        </div>
    </div>
    <div class="chat-input-area">
        <input type="text" id="chat-input" placeholder="메시지를 입력하세요." class="chat-input">
        <button id="send-button" class="send-button"><i class="fas fa-paper-plane"></i></button>
        <i id="plus-icon" class="fas fa-plus plus-icon"></i>
        <div id="tab-container" class="tab-container">
            <div class="tab-item">이미지 보내기</div>
        </div>
    </div>

    <script>
        // 전역 변수로 사용자 ID와 아티스트 ID 초기화
        let userId = '';
        let artistId = '';

        document.addEventListener('DOMContentLoaded', function () {
            const urlParams = new URLSearchParams(window.location.search);
            userId = urlParams.get('userEmail');
            artistId = urlParams.get('artistEmail');
            initializeChat(userId, artistId);
            getChatMessages();
            setInterval(getChatMessages, 5000);
        });

        function initializeChat(userEmail, artistEmail) {
            // 채팅 인터페이스 또는 WebSocket 연결 설정
            console.log("채팅 세션 시작:", userEmail, "와(과)", artistEmail);
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
                    body: `senderId=\${encodeURIComponent(senderId)}&receiverId=\${encodeURIComponent(receiverId)}&message=\${encodeURIComponent(message)}`
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
            fetch(`/Artistry_Project/GetChatMessagesService?senderId=\${encodeURIComponent(userId)}&receiverId=\${encodeURIComponent(artistId)}`)
                .then(response => {
                    if (!response.ok) {
                        throw new Error('Network response was not ok');
                    }
                    return response.json();
                })
                .then(data => {
                    data.forEach(message => {
                        const existingMessage = Array.from(chatMessages.children).find(
                            child => child.querySelector('.message-content').textContent === message.message
                        );
                        if (!existingMessage) {
                            addMessageToUI(message.message, message.senderId, userId);
                        }
                    });
                    chatMessages.scrollTop = chatMessages.scrollHeight;
                })
                .catch(error => {
                    console.error('Error:', error);
                    alert('Failed to retrieve chat messages. Please try again later.');
                });
        }

        function addMessageToUI(message, senderId, loggedInUserEmail) {
            const messageBox = document.createElement('div');
            messageBox.className = 'message-box';

            const messageElement = document.createElement('div');
            messageElement.className = senderId === loggedInUserEmail ? 'message sent' : 'message received';

            const messageContent = document.createElement('div');
            messageContent.className = 'message-content';
            messageContent.textContent = message;

            const senderElement = document.createElement('div');
            senderElement.className = 'sender-name';
            senderElement.textContent = senderId === loggedInUserEmail ? 'Me' : senderId;

            messageElement.appendChild(messageContent);

            if (senderId === loggedInUserEmail) {
                messageBox.style.alignItems = 'flex-end';
                messageBox.appendChild(messageElement);
                messageBox.appendChild(senderElement);
            } else {
                messageBox.style.alignItems = 'flex-start';
                messageBox.appendChild(senderElement);
                messageBox.appendChild(messageElement);
            }

            chatMessages.appendChild(messageBox);
            chatMessages.scrollTop = chatMessages.scrollHeight;
        }

        const plusIcon = document.getElementById('plus-icon');
        const tabContainer = document.getElementById('tab-container');
        plusIcon.addEventListener('click', function() {
            tabContainer.classList.toggle('show');
        });
    </script>
</body>
</html>