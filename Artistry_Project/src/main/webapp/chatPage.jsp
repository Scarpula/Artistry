<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>SendBird Chat</title>
    <script src="https://cdn.SendBird.com/widget/SendBird.js"></script>
    <script>
        function initSendBird() {
            window.SendBirdDesktop.SendBird.init({
                appId: 'CC133701-7458-496F-A356-F1ED93072615'
            }, function(sendBird) {
                var sb = sendBird;

                // 채널 입장 및 UI 렌더링 코드
                var channelUrl = 'sendbird_open_channel_url'; // 채널 URL 입력
                sb.OpenChannel.getChannel(channelUrl, function(openChannel, error) {
                    if (error) {
                        console.error(error);
                        return;
                    }

                    openChannel.enter(function(response, error) {
                        if (error) {
                            console.error(error);
                            return;
                        }

                        // 채팅 UI 렌더링
                        renderChat(openChannel);
                    });
                });

                // 채팅 UI 렌더링 함수
                function renderChat(openChannel) {
                    var chatContainer = document.getElementById('chat-container');
                    // 채팅 UI 코드 작성

                    // 메시지 수신 이벤트 리스너
                    var ChannelHandler = new openChannel.ChannelHandler();
                    ChannelHandler.onMessageReceived = function(openChannel, message) {
                        // 메시지 UI 업데이트 코드 작성
                    };
                }
            });
        }

        // SDK 로드 완료 후 initSendBird 함수 호출
        window.addEventListener('load', function() {
            if (window.SendBirdDesktop && window.SendBirdDesktop.SendBird) {
                initSendBird();
            } else {
                console.error('SendBird SDK 로드 실패');
            }
        });
    </script>
</head>
<body>
    <div id="chat-container"></div>
</body>
</html>