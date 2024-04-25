<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SendBird Chat</title>
<script src="https://cdn.SendBird.com/widget/SendBird.js"></script>
</head>
<body>
		<div id="chat-container"></div>
		
		<script type="text/javascript">
				// SendBird 초기화
				var sb = new window.SendBirdDesktop.SendBird({
						appId: 'CC133701-7458-496F-A356-F1ED93072615'
				});
				
				// 채널 입장
				var channelUrl = 'sendbird_open_channel_url'; // 채널 URL 입력
				sb.OpenChannel.getChannel(channelUrl, function(openChannel, error){
					if (error){
						console.error(error);
						return;
					}
					
					openChannel.enter(function(reponse,error){
						if(error){
							console.error(error);
							return;
						}
						
						// 채팅 UI 렌더링
						renderChat(openChannel);
					});
				});
				
				// 채팅 UI 렌더링 함수
				function renderChat(openChannel){
					var chatContainer = document.getElementById('chat-container');
					
					// 채팅 UI 코드 작성
					
					// 메세지 수신 이벤트 리스너
					var ChannelHandler = new openChannel.ChannelHandler();
					ChannelHandler.onMessageReceived = function(openChannel, message){
						// 메세지 UI 업데이트 코드 작성
					};
				}
		</script>
</body>
</html>