
# Push Prototype

## Flutter 알림 기능

Flutter 애플리케이션에서 백그라운드, 포그라운드, 종료 상태 시 알림을 처리하는 방법을 설명합니다.

## 목차
- [1. 초기 설정](#1-초기-설정)
  - [1.1. pubspec.yaml 수정](#11-pubspecyaml-수정)
  - [1.2. app 수준 build.gradle 설정](#12-app-수준-buildgradle-설정)
  - [1.3. Android 수준 build.gradle 설정](#13-android-수준-buildgradle-설정)
  - [1.4. Android Manifest 설정](#14-android-manifest-설정)
- [2. Firebase 웹 서버 Node.js 설정 방법](#2-firebase-웹-서버-nodejs-설정-방법)
- [참조](#참조)

## 1. 초기 설정

Firebase와 프로젝트 연동은 Firebase의 공식 문서를 참조하여 진행하세요.

### 1.1. pubspec.yaml 수정

다음의 의존성을 `pubspec.yaml` 파일에 추가합니다:

```yaml
dependencies:
  firebase_core: ^3.2.0 
  firebase_messaging: ^15.0.3
  http: ^1.2.2
  flutter_local_notifications: ^17.2.1
  cloud_firestore: ^5.1.0
```

### 1.2. app 수준 build.gradle 설정

`android/app/build.gradle` 파일에서 아래와 같이 설정합니다:

``` gradle
android {
    defaultConfig {
        minSdkVersion 21  // minSdkVersion을 21로 수정
        multiDexEnabled true  // multiDexEnabled를 true로 설정
    }
}
```

### 1.3. Android 수준 build.gradle 설정

`android/build.gradle` 파일에서 다음과 같은 설정을 확인합니다:

```gradle
buildscript {
    // 필요한 의존성을 여기에 추가
}

allprojects {
    repositories {
        // 필요한 저장소를 여기에 추가
    }
}
```

### 1.4. Android Manifest 설정

`AndroidManifest.xml` 파일에 다음 코드를 추가합니다:

```xml
<service
    android:name="io.flutter.plugins.firebasemessaging.FlutterFirebaseMessagingService"
    android:exported="false">
    <intent-filter>
        <action android:name="com.google.firebase.MESSAGING_EVENT"/>
    </intent-filter>
</service>
```

## 2. Firebase 웹 서버 Node.js 설정 방법

1. Firebase 프로젝트와 연동합니다.
2. Firebase 콘솔에서 "프로젝트 개요" 옆의 설정 버튼을 클릭합니다.
3. "서비스 계정" 탭으로 이동하여 "새 비공개 키 생성"을 클릭합니다.
4. 생성된 JSON 파일을 웹 서버용 Node.js 프로젝트 폴더에 넣습니다.
5. `server.js` 파일에서 JSON 파일의 이름을 사용하여 Firebase와 연결합니다.
6. Flutter 알림 코드에 개인별 포트 번호를 입력합니다.

## 참조

- [42kchoi 블로그](https://42kchoi.tistory.com/356)
- [Firebase Server 설정](https://tech.junhabaek.net/백엔드-서버-아키텍처-presentation-layer-3-응답-유형에-따른-variation-2-push-notification-1eacb4df4a7e)
- [nodejs 초기 설정](https://dev-vlog200ok.tistory.com/32) 

```

