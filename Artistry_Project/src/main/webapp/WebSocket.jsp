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
    body { font-size: 28px; font-family: 'Noto Sans KR', sans-serif; display: flex; justify-content: center; align-items: center; flex-direction: column; height: 100vh; }
    .chat-container {
        height: 850px;
        width: 1450px;
        margin-top: 90px;
        max-height: 700px; /* 채팅 컨테이너의 최대 높이 설정 */
        overflow-y: auto; /* 세로 스크롤 추가 */
    }
    .message-box { display: flex; flex-direction: column; align-items: flex-start; margin-bottom: 8px; margin-right: 15px;}
    .message { padding: 10px; border-radius: 8px; margin-bottom: 4px; width: 300px; display:flex;  }
    .received { background-color: #E5E7EB; }
    .sent { background-color: #EFF6FF; align-self: flex-end; }
    .sender-name { font-weight: 700; font-size: 0.875rem; color: #6B7280; padding-right: 30px;}
    .chat-input-area { display: flex; width: 60%; justify-content: center; padding-top: 20px; margin-left: 45px;}
    .chat-input { flex-grow: 1; border: 2px solid #E5E7EB; border-radius: 9999px; padding: 12px 16px; margin-right: 8px; padding-left : 35px; }
    .send-button { background-color: #3B82F6; border-radius: 9999px; padding: 16px; color: white; }
    .plus-icon {
      font-size: 1.5rem;
      color: #3B82F6;
      cursor: pointer;
      margin-left: 8px;
    }

    .tab-container {
  display: none;
  position: absolute;
  bottom: 100%; /* `plus-icon` 바로 위에 위치하도록 bottom 속성을 사용합니다. */
  left: 50%;
  transform: translate(-50%, -10px); /* 좌우 중앙 정렬 후, 조금 위로 올라오게 조정 */
  background-color: white;
  border-radius: 8px;
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
  padding: 8px;
  z-index: 10; /* 다른 요소들 위에 나타나도록 z-index를 설정합니다. */
  transition: all 0.3s ease; /* 부드러운 효과를 위해 transition을 추가합니다. */
}

    .tab-container.show {
      display: block;
    }

    .tab-item {
      padding: 8px 16px;
      cursor: pointer;
      
    }

    .tab-item:hover {
      background-color: #F3F4F6;
    }
  </style>
</head>
<body class="bg-gray-100 p-4">
    <div class="chat-container bg-white p-4 rounded-lg shadow">
    <div class="flex justify-between items-center mb-4">
        <h2 class="text-2xl font-bold">채팅방</h2>
        <button id="exit-chat" class="bg-red-500 text-white px-4 py-2 rounded">채팅방 나가기</button>
    </div>
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
			getChatHistory();
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
            fetch(`/Artistry_Project/GetChatMessagesService?senderId=` + encodeURIComponent(userId) + `&receiverId=` + encodeURIComponent(artistId))
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
        
     // 채팅방 나가기 버튼 엘리먼트
        const exitChatButton = document.getElementById('exit-chat');

        // 채팅방 나가기 함수
        function exitChat() {
            // 채팅 내역 저장 로직 추가
            saveChatHistory();
            
            // 이전 페이지로 이동
            window.history.back();
        }

        // 채팅방 나가기 버튼 클릭 이벤트 처리
        exitChatButton.addEventListener('click', exitChat);
        
     // 채팅 내역 저장 함수
        function saveChatHistory() {
            const chatHistory = chatMessages.innerHTML;
            
            // AJAX 요청으로 채팅 내역을 서버에 전송하여 저장
            fetch('/Artistry_Project/SaveChatHistoryService', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded',
                },
                body: `senderId=${encodeURIComponent(userId)}&receiverId=${encodeURIComponent(artistId)}&chatHistory=${encodeURIComponent(chatHistory)}`
            })
                .then(response => response.text())
                .then(text => console.log(text))
                .catch(error => console.error('Error:', error));
        }
     
     function getChatHistory(){
    	 fetch(`/Artistry_Project/ChatHistoryService?senderId=${encodeURIComponent(userId)}&receiverId=${encodeURIComponent(artistId)}`)
    	 		.then(response => response.json())
    	 		.then(data => {
    	 			if(data.chatHistory){
    	 				const chatHistory = data.chatHistory;
    	 				const messageBoxes = chatHistory.split('<div class="message-box">').slice(1);
    	 				messageBoxes.forEach(messageBox =>{
    	 					const messageElement = document.createElement('div');
    	 					messageElement.className = 'message-box';
    	 					messageElement.innerHTML = `<div class="message-box">${messageBox}`;
    	 					chatMessage.appendChild(messageElement);
    	 				});
    	 				chatMessages.scrollTop = chatMessages.scrollHeight;
    	 			}
    	 		})
    	 		.catch(error =>{
    	 			console.error('Error:',error);
    	 			alert('Failed to retrieve chat history. Please try again later.');
    	 		});
     }
        
    </script>
</body>
</html>