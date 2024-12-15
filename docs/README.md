<a href="https://club-project-one.vercel.app/" target="_blank">

</a>
<br/>
<br/>

# 0. Getting Started (시작하기!)

<img src="https://github.com/ProjectInTheClass/Umai/blob/main/docs/images/team.png" width="2000">

<br/>
<br/>

# 1. Project Overview (프로젝트 개요)

- 프로젝트 이름: Umai!
- 프로젝트 설명: 개인맞춤형 맛집추천 어플

<br/>
<br/>

# 2. Team Members (팀원 및 팀 소개)

|                            박호연                            |                            김진태                            |                               전주환                               |
| :----------------------------------------------------------: | :----------------------------------------------------------: | :----------------------------------------------------------------: |
| <img src="./images/사원박호연.png" alt="박호연" width="150"> | <img src="./images/팀장김진태.png" alt="김진태" width="150"> | <img src="./images/인턴전주호ㅓㅏㄴ.png" alt="전주환" width="150"> |
|                             사원                             |                             인턴                             |                                팀장                                |
|         [GitHub](https://github.com/HoYeonPark1221)          |           [GitHub](https://github.com/KimJinTae1)            |                             [GitHub]()                             |

<br/>
<br/>

# 3. Key Features (주요 기능)

- **회원가입**:

  - 회원가입 전 설문을 통해 맛BTI 정보를 수집합니다.
  - 회원가입 시 DB에 유저정보가 등록됩니다.

- **로그인**:

  - 사용자 인증 정보를 통해 로그인합니다.
  - 토큰 인증으로 진행합니다.

- **내 맛BTI로 맛집 추천**:

  - 설문조사로 통해 맛BTI 도출
  - 맛BTI별 음식 추천

- **Umai가 선정한 맛집**:
  - 인증된 맛집을 유저들에게 제공
  -
- **유저 프로필**:
  - 해당 맛BTI를 보여주고 맛BTI카드라는 재미요소를 추가함
  - 프로필 편집기능
  - 친구들에게 공유하는 기능(맛BTI카드 or QR카드)

<br/>
<br/>

# 4. Tasks & Responsibilities (작업 및 역할 분담)

|        |                                                                    |                                                                                                                               |
| ------ | ------------------------------------------------------------------ | ----------------------------------------------------------------------------------------------------------------------------- |
| 박호연 | <img src="./images/사원박호연.png" alt="박호연" width="100">       | <ul><li>프론트엔드</li><li>매인 화면 구현</li><li>Umai Picks화면 구현</li><li> 맛BTI 카드 구현</li><li> 디자인 설계</li></ul> |
| 김진태 | <img src="./images/팀장김진태.png" alt="김진태" width="100">       | <ul><li>백엔드</li><li>DB설계</li><li>프론트-백 통신 담당</li><li>앱 기획담당</li></ul>                                       |
| 전주환 | <img src="./images/인턴전주호ㅓㅏㄴ.png" alt="전주환" width="100"> | <ul><li>프론트엔드</li><li>개인화면 수정</li><li>프론트와 백앤드 연동 분석및 구현</li><li>로고 제작</li></ul>                 |

<br/>
<br/>

# 5. Technology Stack (기술 스택)

## 5.1 Frotend

|         |                                                        |         |
| ------- | ------------------------------------------------------ | ------- |
| SwiftUI | <img src="./images/swift.png" alt="swift" width="100"> | 1.11.12 |

<br/>

## 5.2 Backend

|         |                                                          |         |
| ------- | -------------------------------------------------------- | ------- |
| Node.js | <img src="./images/nodejs.png" alt="nodejs" width="100"> | 10.12.5 |
| MySQl   | <img src="./images/mysql.png" alt="mysql" width="100">   | 10.12.5 |

## 6. Project Structure (프로젝트 구조)

```plaintext
UMAI_BACK/
├── config/                   # 설정 파일 (DB, 환경변수 등)
│
├── controllers/              # 비즈니스 로직 처리 (컨트롤러)
│   └── restaurant.js        # 레스토랑 관련 컨트롤러
│
├── middlewares/              # 미들웨어 (인증 및 요청 처리)
│   └── auth.js              # 인증 관련 미들웨어
│
├── models/                   # 데이터베이스 모델 정의
│   ├── mbti.js              # MBTI 모델
│   ├── menus.js             # 메뉴 모델
│   ├── restaurant.js        # 레스토랑 모델
│   └── user.js              # 사용자 모델
│
├── node_modules/             # 설치된 npm 패키지
│
├── passport/                 # 인증 관련 전략 설정 (예: JWT, 로컬)
│
├── routers/                  # 라우터 정의 (URL 라우팅)
│   ├── auth.js              # 인증 관련 라우팅
│   ├── restaurant.js        # 레스토랑 관련 라우팅
│   └── user.js              # 사용자 관련 라우팅
│
├── views/                    # 뷰 파일 (EJS 템플릿)
│   └── index.js             # 메인 페이지 (EJS 템플릿 엔진 사용)
│
├── index.js                  # 메인 애플리케이션 진입점
├── package-lock.json         # 종속성 버전 기록 파일
├── package.json              # 프로젝트 설정 및 종속성
└── seed.js                   # 초기 데이터베이스 시드 스크립트
```
