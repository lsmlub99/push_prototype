# push_prototype

## flutter 
 ### 백그라운드, 포그라운드, 종료상태시 알림 기능
 
 ### 1 . 초기 설정 (firebase와 프로젝트 연동은 firebase에 나온대로 연동)

 ### 1-1. pubspec.yaml
  #### firebase_core: ^3.2.0 
  #### firebase_messaging: ^15.0.3
  #### http: ^1.2.2
  #### flutter_local_notifications: ^17.2.1
  #### cloud_firestore: ^5.1.0 추가

 ### 1-2. app 수준 build.gradle 설정
  #### minSdk = 21 로 수정
  #### multiDexEnabled true 밑에 추가

 ### 1-3. 안드로이드 수준 build.gradle 설정
  #### buildscript 부분, allprojects 부분 필요

 ### 1-4. Android Manifest 설정
  #### <service
#### android:name="io.flutter.plugins.firebasemessaging.FlutterFirebaseMessagingService"
  ####    android:exported="false">
  ####    <intent-filter>
  ####        <action android:name="com.google.firebase.MESSAGING_EVENT"/>
  ####    </intent-filter>
  #### </service> 추가


### firebase 웹서버 nodejs 설정 방법

 #### firebase - 프로젝트 연동 -> 프로젝트 개요 옆 설정 버튼 -> 서비스 계정 -> 새 비공개 키 생성 -> 
 #### json 파일 다운로드 후 웹서버용 node 폴더에 넣기 -> server.js 파일에서 your firebase json에 다운받은 json 파일 이름 넣어서 연결

 #### 개인별 포트번호 부여 후 flutter 알림 코드에 포트번호 입력


### IOS 부분은 후에 추가 예정

### 참조 : https://42kchoi.tistory.com/356, https://tech.junhabaek.net/%EB%B0%B1%EC%97%94%EB%93%9C-%EC%84%9C%EB%B2%84-%EC%95%84%ED%82%A4%ED%85%8D%EC%B2%98-presentation-layer-3-%EC%9D%91%EB%8B%B5-%EC%9C%A0%ED%98%95%EC%97%90-%EB%94%B0%EB%A5%B8-variation-2-push-notification-1eacb4df4a7e
