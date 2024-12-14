# Umai

Request

import Alamofire // import 먼저 하기

Alamofire.request("호출 URL") // HTTP의 기본값은 GET 방식

Alamofire.request("호출 URL", method: .post) // POST 방식으로 전송하고 싶다면 인자값 추가

/_
전달해야 할 값이 있을 경우에는 세 번째 매개변수인 parameters를 사용하면 된다.
이 변수는 키-값 형식의 타입을 기반으로 한다.
_/
let param : Parameters = [
"userId" : "lgvv",
"name" : "h한글"
]

/_
전달하는 값에 특수문자나 한글 등이 포함되어 있을 경우
서버에서 잘못 받아들이지 않도록 인코딩 과정을 거쳐야 하는데,
이떄 request 메소드의 네 번째 매개변수 encoding이 사용된다.
_/
Alamofire.request("호출 URL", method: .post, parameters : param, encoding : URLEncodeing.httpbody)

/\*
매개변수 encoding은 프로토콜인 ParameterEncoding 타입으로,
이 프로토콜을 구현한 열거형이나 구조체 또는 클래스 객체를 인자값으로 입력받을 수 있다.
대표적으로 사용하는 것이 URLEncoding 구조체로, 이 구조체에는 다음과 같은 세가지 인코딩 타입의
정적 변수로 선언되어 있다.

.methodDependent : 메소드에 따라 인코딩 타입이 자동으로 결정됨.
가령 GET방식이면 .queryString
POST 방식이면 .httpbody가 적용된다.

.queryString : GET 전송에서 사용되는 쿼리 스트링 방식으로 인코딩한다.

.httpbody : POST 전송에서 사용되는 HTTP body 방식으로 인코딩한다.

만약 .httpbody 타입을 적용하면 Content-Type 헤더에는 자동으로
'application/x-www-form-urlencoded;charset=utf-8' 이 적용된다
\*/
JSON 방식으로 값을 전송할 때에는 인코딩 타입으로 URLEncoding 대신 JSONEncoding을 사용해야 한다.
(예시구문)
let param : Parameters = [
"userId" : "lgvv",
"name" : "한글2"
]
Alamofire.request("호출 URL", method: .post, parameters : param, encoding : JSONEncoding.default)

//Content-Type 헤더에 'application/json' 값이 자동으로 설정된다.
//Content-Length 헤더 역시 파라미터 인자값과 인코딩 설정을 참고하여 Alamofire 라이브러리가 자동으로 계산한다.

//HTTP 메시지에 별도의 헤더를 추가하고 싶을 경우 headers 매개변수를 사용하면 된다.
//이것도 역시 딕셔너리 형식을 따른다.
(예시구문)
let headers: HTTPHeaders = [
"Authorization" : "Basic QWxhZGRpbjpvcGVuIHNc2FtZQ==",
"Accept" : "application/json"
]
Alamofire.request("호출 URL", method: .post, parameters : param, encoding : JSONEncoding.default, headers : headers)
