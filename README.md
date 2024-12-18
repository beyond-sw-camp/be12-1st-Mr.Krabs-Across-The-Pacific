![header](https://capsule-render.vercel.app/api?type=waving&height=300&color=gradient&text=Across%20the%20Pacific&textBg=false)
# 📈Across The Pacific (미국 주식 포트폴리오 공유 앱)


## 🗂️ 목차
1. [💻 기술 스택](#-기술-스택)  
2. [👩‍💻 팀원 소개](#-팀원-소개)
3. [📊 프로젝트 개요](#-프로젝트-개요)  
   1.1. [소개](#1️⃣-소개)  
   1.2. [배경](#2️⃣-배경) 
4. [📁 요구사항 명세서](#-요구사항-명세서)  
5. [📝 ERD 작성](#ERD-작성)  
6. [📰 시스템 아키텍처](#-시스템-아키텍처)  
7. [🔧 DB 성능 개선](#-db-성능-개선)  
8. [📄 기타 문서](#-기타-문서)

## 💻 기술 스택

### ☑️ FRONT END
<img src="https://img.shields.io/badge/html5-%23E34F26.svg?&style=for-the-badge&logo=html5&logoColor=white" />
<img src="https://img.shields.io/badge/css3-%231572B6.svg?&style=for-the-badge&logo=css3&logoColor=white" />
<img src="https://img.shields.io/badge/vue.js-%234FC08D.svg?&style=for-the-badge&logo=vue.js&logoColor=white" />
<img src="https://img.shields.io/badge/nginx-%23269539.svg?&style=for-the-badge&logo=nginx&logoColor=white" />

<br>

### ☑️ DB
<img src="https://img.shields.io/badge/mariadb-%23003545.svg?&style=for-the-badge&logo=mariadb&logoColor=white" />
<img src="https://img.shields.io/badge/mysql-%234479A1.svg?&style=for-the-badge&logo=mysql&logoColor=white" />
<img src="https://img.shields.io/badge/grafana-%23F46800.svg?&style=for-the-badge&logo=grafana&logoColor=white" />
<img src="https://img.shields.io/badge/prometheus-%23E6522C.svg?&style=for-the-badge&logo=prometheus&logoColor=white" />
<img src="https://img.shields.io/badge/linux-%23FCC624.svg?&style=for-the-badge&logo=linux&logoColor=black" />

<br>

##  👩‍💻 팀원 소개
<table>
  <tbody>
    <tr>
      <td align="center"><a href=""><img src="images/tesla.png" width="100px;" alt=""/><br /><sub><b> 팀장: 김경준 </b></sub></a><br /></td>
      <td align="center"><a href=""><img src="images/google.png" width="100px;" alt=""/><br /><sub><b> 팀원: 김혜정</b></sub></a><br /></td>
      <td align="center"><a href=""><img src="images/nvidia.png" width="100px;" alt=""/><br /><sub><b>팀원: 신지현</b></sub></a><br /></td>
      <td align="center"><a href=""><img src="images/apple.png" width="100px;" alt=""/><br /><sub><b>팀원: 이의범</b></sub></a><br /></td>
      <td align="center"><a href=""><img src="images/amazon.png" width="100px;" alt=""/><br /><sub><b>팀원: 황경윤</b></sub></a><br /></td>
  </tbody>
</table>



## 📊 프로젝트 개요
### 1️⃣ 소개
"모두가 함께 성장하는 투자 플랫폼, Across The Pacific"

![이미지](images/across_the_Pacific.PNG)

Across The Pacific은 미국 주식 투자 포트폴리오 공유 및 투자 전략 학습을 위한 소셜 기반 플랫폼입니다.  

> **목표**: 정보의 비대칭성을 해소하고 개인 투자자들에게 투자 인사이트를 제공하여 함께 성장하는 투자 문화를 구축

<details>
  <summary>Across The Pacific 상세 소개</summary>
 Across The Pacific 은 사용자끼리 자신의 미국 주식 투자 포트폴리오를 공유하여 다양한 투자 전략과 정보를 교류할 수 있는 소셜 기반의 투자 플랫폼입니다.

사용자는 Across The Pacific 시스템읕 통해 포트폴리오를 생성하여 자신의 투자 성과를 시각화하여 볼 수 있으며, 기간별 수익률을 시뮬레이션할 수 있으며, 다른 투자자들의 포트폴리오를 참고하여 새로운 투자 기회를 탐색하여 투자 인사이트를 확장하고, 타인과 함께 성장할 수 있습니다.

Across The Pacific은 단순히 주식 투자 수익률 추적을 넘어, 미국 주식 투자에 처음으로 발을 들이려는 이, 혹은 꾸준히 투자를 했으나 자신이 제대로 잘 하고 있는지 길라잡이가 필요한 사람들, 자신의 경험을 공유하고 타인에게 도움을 주려는 사람들이 서로 정보를 공유할 수 있는 장을 만들어 사용자 간의 공유, 학습, 성장이라는 새로운 투자 문화를 형성하는 것이 목표입니다.

</details>


### 2️⃣ 배경
#### 1. 제안 배경

<details> 
  <summary> 제안 배경 상세 소개</summary>

1. 기대 수명의 꾸준한 증가
![기대수명 이미지](./images/기대수명.PNG)
출처 : https://www.index.go.kr/unify/idx-info.do?idxCd=8016

한국 인구의 기대수명은 1970년 62.3세에서 2023년 83.5세로 약 21년 늘어났으나, 정년퇴직 나이는 여전히 법적으로는 60세에 그쳐, 이제 노동 소득뿐만 아니라 금융 소득을 가지는 것도 중요하게 되었습니다. 그러나 대한민국 주식 시장의 제도 개선이 늦어지면서 장기적인 투자를 위해 자금 투입을 할 경우 안정적인 투자가 어려워, 많은 사람들이 활황을 보이는 미국 주식에 관심을 가지는 등 주식투자 성향이 다변화 되었습니다.

2. 미국 주식 투자에 대한 관심 증가
![이미지](images/news.PNG)

최근 개인 투자자들의 미국 주식에 대한 관심이 급증하고 있습니다. 해외 주식 거래 플랫폼의 확산과 다양한 미디어의 주식 정보 제공으로, 더 많은 사람들이 해외 주식 투자를 시작하고 있습니다.

3. 투자 정보의 불균형 해소 필요 
![이미지](images/news2.PNG)

대형 투자 기관이나 전문 투자자들은 방대한 데이터와 분석 도구를 활용할 수 있지만, 일반 개인 투자자들은 제한된 정보와 소수의 투자 종목에 집중하는 경향이 있습니다. 이로 인해 투자 시야가 제한되고, 투자 기회를 놓칠 가능성이 큽니다.

4. 단순 기록을 넘어선 ‘투자 인사이트 제공’의 필요성
단순 기록을 넘어선 ‘투자 인사이트 제공’의 필요성 기존의 투자 앱들은 주로 투자 기록 관리나 수익률 확인에 국한되어 있습니다. 하지만 사용자들은 단순한 수익률 조회가 아니라, 어떻게 투자 전략을 개선할 수 있는지에 대한 인사이트를 원합니다.

</details>

#### 2. Across The Pacific 서비스의 필요성
<details>
<summary>서비스 필요성 세부 사항</summary>

1. 타인의 주식을 참고해 투자를 시작하고싶으나 시작 정보를 어디서 얻어야할지 모르는 사람들이 많다.

2. 자신의 투자가 안정적인지, 현재 투자 상황의 위험도가 어느정도인지 정확히 인지하지 못하는 사람들이 있다.

3. 타인이 올린 투자 상황 및 시각 데이터가 얼마나 믿을만한지 신뢰성을 따지기 어렵다.

</details>

#### 3. Across The Pacific 서비스를 통한 해결 방안
<details>
  <summary>서비스를 통한 해결 방안 세부 사항</summary>

1. 자신의 포트폴리오 작성 및 분석을 통해 자신의 투자 판단을 객관적인 시계열 데이터에 기반해 검증할 수 있다.

2. 분산투자를 장려할 수 있도록 시뮬레이션을 통해 명확하게 시각화된 정보를 제공한다.

3. 서로간의 투자 정보를 공유함으로써 정보 비대칭을 해소하는 데에 도움을 줄 수 있다.

4. 자신의 포트폴리오 공개를 장려하기 위해 분기 단위로 북마크 기능에 기반하여 인기 포트폴리오 순위를 선정해 많은 북마크 수를 가진 사용자들에게 분기별 인증 마크를 부여한다.

Across The Pacific은 위의 문제점들을 보완하여 꾸준히 높아지는 기대 수명에 맞춰 투자가 필요하다고 느끼고 처음으로 진입하는 사람들 혹은 투자는 하고 있지만 방향성을 제대로 잡지 못한 사람들을 위해 포트폴리오를 생성하고 시뮬레이션 및 수익률을 분석, 타인과의 공유를 통해 투자 전략 개선 제안 등의 기능을 제공합니다.

</details>

### <summary><b>3️⃣ 시나리오</b></summary>
<details>
<summary> 시나리오 1</summary>
<div markdown="1">
1. 자신의 포트폴리오를 확인하려는 사용자(가명 김경준씨, 20살 주식 6개월 차)

친구따라서 주식을 시작하게된 김경준씨. 친구를 따라서 구매한 테슬라 주식의 가격이 급등해 돈을 번 순간 자신감이 넘쳐 위험투자를 했다가 돈을 잃게된다. 조금 더 객관적으로 자신의 투자를 분석해야겠다는 생각이 들어 주식포트폴리오를 작성하고자 하였고 ATP사이트를 방문하게 된다. 사이트 방문 후 개인 포트폴리오 작성 버튼을 누른다. 회원 가입을 하라는 사이트의 알림에 회원가입을 진행하고 로그인 후 개인 포트폴리오 작성을 시작한다. 우선 자신의 현재 돈을 적고 구입하고 팔았던 주식과 시기 가격을 작성하여 포트폴리오를 만든다. 해당 정보를 기입하니 자산변화 그래프와 구입했던 주식들 목록이 나오게 된다.

일주일 후 새롭게 애플 주식을 구입한 김경준씨 더 나은 주식 생활을 위해 포트폴리오를 꾸준히 작성하기로 하고 다시 사이트를 방문한다. 로그인을 하고 마이페이지로 들어가 내 포트폴리오 관리를 누른다. 저번주에 작성한 포트폴리오가 있었고 저번 주까지의 주식들의 총 변동량을 그래프로 보여준다. 변동을 확인하고 구매한 애플 주식을 추가하기 위해서 수정 버튼을 눌러 새롭게 구매한 주식의 정보를 적고 수정한다.

</div>
</details>
<details>
<summary>시나리오 2</summary>
<div markdown="2">

2. 타인의 포트폴리오를 확인하려는 사용자(김경준씨)

자신의 포트폴리오를 작성했지만 더 뭘 사야할지 모르겠는 김경준씨는 남들이 어떻게 하는지 궁금해서 타인의 포트폴리오를 보기로 한다. 사이트의 포트폴리오를 클릭하니 인기순으로 정렬된 타인의 포트폴리오 목록이 나와서 찬찬히 둘러본다. 자신과 비슷한 사용자는 어떻게 구매를 했나 보려고 검색 버튼을 눌러 자신이 구매했던 테슬라와 애플 주식을 검색하니 현재 포트폴리오에 해당 주식을 가진 포트폴리오들이 인기순으로 정렬되어 나온다. 해당 포트폴리오를 클릭하여 포트폴리오 상새정보를 클릭해보니 자신이 목표로 하는 수익을 지난 기간동안 냈었고, 이를 참고하기 위해 북마크 버튼을 클릭해서 북마크에 등록하였다. 그리고 비슷한 다른 포트폴리오들을 확인해보니 수익이 좋은 사람들이 공통적으로 구매한 주식을 찾을 수 있었고 김경준씨는 그 주식을 구매하게 된다.

</div>
</details>

<details>
<summary>시나리오 3</summary>
<div markdown="3">

3. 숨은 주식 고수 (가명 이의범씨, 50세, 주식 고수)

주식으로 월 300을 벌면서 경제적 자유를 이룩한 이의범씨는 회사를 은퇴하고 주식을 관리하게 된다. 자신의 포트폴리오를 등록해서 운영하던 와중에 자신의 포트폴리오의 북마크가 늘어나서 남들이 추천을 하니 기분이 좋아진다. 그리고 사이트에서 뱃지를 달아줘서 명예로워졌다. 그러자 당신의 프로파일을 주시하는 사용자가 늘어나 현재 4321명의 사용자가 당신의 프로파일을 팔로우하고 있다.

</div>
</details>
<details>
<summary>시나리오 4</summary>
<div markdown="4">

4. 이번 분기 GOAT 포트폴리오 (가명 김혜정씨, 23세)

올해 8월에 자신의 주식 포트폴리오를 만들어 공개한 김혜정씨는 크리스마스에 홈페이지에 자신의 포트폴리오가 대문에 있는 ‘이번 분기의 인기 포트폴리오’에 1등으로 올라온 것을 보게 되었다. 혜정씨의 포트폴리오가 19720개의 북마크를 받아 4분기에서 가장 많은 북마크를 받은 것이다. 그리고 새해가 되자 다른 사람들이 혜정씨의 포트폴리오를 볼 때마다 작성자란 옆에 ‘202X년 4분기 인기 포트폴리오 제작자’ 마크를 볼 수 있게 되었고, 혜정님의 회원 등급이 1점 상승했다. 혜정씨는 다음 분기 포트폴리오를 잘 짜서 한 번 더 마크를 받는 데 도전하기로 한다.

</div>
</details>

</details>


## 📁 요구사항 명세서

<details>
<summary> 요구사항 정의서</summary>

![요구사항 정의서](images/요구사항%20정의서.png)

</details>

## 📝 ERD 작성
- 1차
![ERD draft](https://cdn.discordapp.com/attachments/1315834496116985926/1315919349768388648/ATP_ERD.png?ex=675b2325&is=6759d1a5&hm=795c30340ff5704da00af9d3d5f1cb46db3e0d329cb98677f2256931525a08ba&)

## 📰 시스템 아키텍처

![Architecture](images/SystemArchitecture.png)


**하나의 Master DB Server와 여러 대의 Slave DB Server**

포트폴리오 생성보다는 조회에 초점을 맞춰, 데이터 조회 요청을 집중적으로 처리하는 Query-off Loading 방식 채택

+) 만일 마스터 DB 서버가 멈출 경우 복제 DB 서버의 동기화가 끊어지는 상황이 있을 수 있다. 이에 대비해 DB Server들은 HAProxy와 같은 로드 밸런서를 통해 가상의 IP를 통해 백엔드와 통신하게 하여, 마스터가 멈추더라도 남은 슬레이브 DB들을 통해 단순한 포트폴리오 조회 작업 정도는 가능하게 만드는 등의 논의를 진행 중

## 🔧 SQL 파일 및 DB 성능 개선
### DDL
<details>
<summary> 유저 </summary>

```sql
CREATE TABLE `user` (
	`idx`	INT PRIMARY KEY AUTO_INCREMENT,
	`name`	VARCHAR(30)	NOT NULL,
	`email`	VARCHAR(50)	NOT NULL,
	`password`	VARCHAR(256)	NULL,
	`created_at`	DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
	`updated_at`	DATETIME DEFAULT CURRENT_TIMESTAMP  ON UPDATE CURRENT_TIMESTAMP NOT NULL,
	`tier_grade`	INT	NOT NULL DEFAULT 1,
	`profile_image`	TEXT	NULL,
    `auth_provider` INT NOT NULL,
    FOREIGN KEY (tier_grade) REFERENCES user_tier(idx)
);
```

```sql
CREATE TABLE `user_tier` (
	`idx`	INT PRIMARY KEY AUTO_INCREMENT,
	`grade`	VARCHAR(10)	NOT NULL
);
```

```sql
CREATE TABLE `follow` (
	`idx`	INT	PRIMARY KEY AUTO_INCREMENT,
	`follower`	INT	NOT NULL,
	`followee`	INT	NOT NULL,
	`created_at`	DATETIME NOT NULL,
    FOREIGN KEY (follower) REFERENCES user(idx),
    FOREIGN KEY (followee) REFERENCES user(idx)
);
```
</details>

<details>
<summary>포트폴리오</summary>

```sql
CREATE TABLE portfolio (
	idx INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(255) NOT NULL,
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NOT NULL NOT NULL,
	user_id INT NOT NULL,
    is_public BOOLEAN NOT NULL DEFAULT TRUE,
	FOREIGN KEY (user_id) REFERENCES user(idx)
);
```

```sql
CREATE TABLE bookmark (
	idx INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	portfolio_id INT NOT NULL,
	user_id INT NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
    FOREIGN KEY (portfolio_id) REFERENCES portfolio(idx),
    FOREIGN KEY (user_id) REFERENCES user(idx)
);
```

```sql
CREATE TABLE portfolio_reply (
    idx INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    contents VARCHAR(255) NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    parent_reply_id INT NULL,
    user_id INT NOT NULL,
    portfolio_id INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES user(idx),
    FOREIGN KEY (portfolio_id) REFERENCES portfolio(idx),
    FOREIGN KEY (parent_reply_id) REFERENCES portfolio_reply(idx)
);
```

```sql
CREATE TABLE portfolio_reply_likes (
    idx INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    reply_id INT NOT NULL,
    user_id INT NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (reply_id) REFERENCES portfolio_reply(idx),
    FOREIGN KEY (user_id) REFERENCES user(idx)
    
);
```
```sql
CREATE TABLE badge (
	idx INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name  VARCHAR(255) NOT NULL,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL
);
```
```sql
CREATE TABLE reward (
	idx INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	portfolio_id INT NOT NULL,
    badge_id INT NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
    FOREIGN KEY (portfolio_id) REFERENCES portfolio(idx),
    FOREIGN KEY (badge_id) REFERENCES badge(idx)
);

```
</details>

<details>
<summary>주식</summary>

```sql
CREATE TABLE stock(
    idx        INT AUTO_INCREMENT PRIMARY KEY,
    name    VARCHAR(100) NOT NULL,
    market    VARCHAR(100) NOT NULL,
    code    VARCHAR(10) NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NOT NULL
);
```
```sql
CREATE TABLE acquisition(
    idx INT AUTO_INCREMENT PRIMARY KEY,
    order_at    DATETIME NOT NULL,
    portfolio_id    INT NOT NULL,
    stock_id    INT NOT NULL,
    quantity    INT NOT NULL,
    price    INT NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NOT NULL,
    FOREIGN KEY (portfolio_id) REFERENCES portfolio(idx),
    FOREIGN KEY (stock_id) REFERENCES stock(idx)
); 
```
```sql
CREATE TABLE stock_reply (
	idx INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	stock_id INT NOT NULL,
	user_id INT NOT NULL,
	comment VARCHAR(200) NOT NULL,
    parent_reply_id INT NULL,
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NOT NULL NOT NULL,
	FOREIGN KEY (stock_id) REFERENCES stock(idx),
	FOREIGN KEY (user_id) REFERENCES user(idx),
	FOREIGN KEY (parent_reply_id) REFERENCES stock_reply(idx)
);
```
```sql
CREATE TABLE stock_reply_likes (
    idx INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    reply_id INT NOT NULL,
    user_id INT NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (reply_id) REFERENCES stock_reply(idx),
    FOREIGN KEY (user_id) REFERENCES user(idx)
);
```
```sql
CREATE TABLE interested_stock(
    idx            INT AUTO_INCREMENT PRIMARY KEY,
    user_id    INT NOT NULL,
    stock_id    INT NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES user(idx),
    FOREIGN KEY (stock_id) REFERENCES stock(idx)
);
```
</details>

### DB 성능 개선안


<details>
<summary>index로 성능개선</summary>

우리 서비스를 이용하는 시나리오에서는 포트폴리오에 딸린 주식에 관한 정보를 확인하는 일이 잦을 것으로 판단하였다. 따라서 주식에 대한 정보와 포트폴리오에 관한 정보들을 연결할 경우 두 테이블과 모두 1대다 관계를 가지며 주식 소유의 의미를 가진 acquisition 테이블이 제일 JOIN 연산이 많을 것으로 예상되었다. 해당 테이블에 SELECT 질의 결과 약 11만의 카디널리티가 존재하였다.

따라서 해당 테이블에 단순 인덱스를 생성하였으며, 복합 인덱스는 생성하지 않았다. 왜냐하면 포트폴리오를 생성할 때에만 컬럼 간에 서로 관계가 생기며, 단순히 JOIN 연산을 통해 조회할 때에는 acquisition의 외래 키를 통한 stock 테이블과 portfolio 테이블을 연결하는 상황이 다수로 예상되기 때문이다.

![acquisition의 인덱스 상황](https://github.com/beyond-sw-camp/be12-1st-Mr.Krabs-Across-The-Pacific/blob/main/images/%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7%202024-12-13%20194258.png?raw=true)

또한 user table의 경우에는 로그인 시 email로 특정 유저를 찾아내야 한다. 모든 튜플을 조회하지 않도록 INDEX를 이용해서 성능 개선을 노릴 수 있다.

![user index 적용](/images/user_index_test.png)

user가 10만명일때를 기준으로 테스트한 결과 상당히 빠른 속도로 개선되었다.

한편 복합 키를 사용하여 다음과 같이 성능 테스트 비교를 하였다. 캐시 미스로 CPU - RAM 간 데이터 전송이 지연된 경우의 영향을 최소화하기 위해 다음 절차대로 진행했다.
- 먼저 필요한 쿼리를 실행한다.
- 인덱스 생성 후 이전의 쿼리를 순서대로 실행한다.
- 인덱스를 삭제한 후 이전의 쿼리를 순서대로 실행한다.
  - 생성한 인덱스

  ![생성한 인덱스](https://github.com/beyond-sw-camp/be12-1st-Mr.Krabs-Across-The-Pacific/blob/main/images/%EB%B3%B5%ED%95%A9%ED%82%A4_HGY.png?raw=true)
- 생성 후 테스트 예시: 두 번째 열의 값이 Metric이 되는 Duration 값이다.

  ![생성 후 테스트](https://github.com/beyond-sw-camp/be12-1st-Mr.Krabs-Across-The-Pacific/blob/main/images/%EB%B3%B5%ED%95%A9%20%ED%82%A4%20%EC%9D%B8%EB%8D%B1%EC%8A%A4%20%EC%83%9D%EC%84%B1%20%ED%9B%84_HGY.png?raw=true)
- 삭제 후 테스트 예시: 두 번째 열의 값이 Metric이 되는 Duration 값이다.

  ![삭제 후 테스트](https://github.com/beyond-sw-camp/be12-1st-Mr.Krabs-Across-The-Pacific/blob/main/images/%EB%B3%B5%ED%95%A9%20%ED%82%A4%20%EC%9D%B8%EB%8D%B1%EC%8A%A4%20%EC%82%AD%EC%A0%9C%20%ED%9B%84_HGY.png?raw=true)

지연 시간이 줄어든 값도 있지만 상승한 값도 있어 복합 키를 가진 인덱스가 무조건 유용하다고 보기 힘든 점을 확인하였다.

</details>

<details>
<summary>stored procedure로 성능개선</summary>
주요 기능별로 자주 사용하는 쿼리들을 미리 프로시저로 만들어 놓음으로써 성능 개선을 노린다.

예를 들어 특정 유저의 포트폴리오 목록을 처리하는 쿼리의 경우 다음과 같다.

```sql
SELECT	portfolio.idx, portfolio.name, portfolio.created_at,portfolio.updated_at, count(badge.idx) 
	FROM portfolio 
	LEFT JOIN reward ON portfolio.idx = reward.portfolio_id 
	LEFT JOIN badge ON reward.badge_id = badge.idx 
	WHERE portfolio.user_id = 3 
        	GROUP BY portfolio.idx 
        	LIMIT 0, 30; 
```

이제 서버에 5명이 동시에 다른 유저의 쿼리를 조회할 경우 다음과 같은 시간이 걸린다.

![stored procedure 적용 전](/images/before_SP.png)

이후 다음과 같은 프로시저를 적용한 후 동일하게 5번 시험해보았다.

```sql
DELIMITER $$ 
CREATE PROCEDURE SP_SELECT_PORTFOLIO_WITH_USER_ID(userId INT, idx INT) 
BEGIN 
SELECT portfolio.idx, portfolio.name, portfolio.created_at, portfolio.updated_at, count( badge.idx) 
	FROM portfolio 
	LEFT JOIN reward ON portfolio.idx = reward.portfolio_id 
	LEFT JOIN badge ON reward.badge_id = badge.idx 
	WHERE portfolio.user_id = userId 
          ORDER BY portfolio.created_at DESC 
          LIMIT idx, 30; 
END $$ 
DELIMITER ; 
```

시험 결과
![stored procedure 적용 전](/images/after_SP.png)
5회 총합 비교 

쿼리 실행 : 0.00654149(초) 
SP 실행 : 0.00393446(초)

portfolio개수 10000개 기준으로 위와 같이 개선되었다.

이를 반영해 모든 주요 쿼리에 STORED PROCEDURE를 적용하였다.

[👉🏼 주요 기능별 STORED PROCEDURE 목록](./images/SP.pdf)

[👉🏼 생성 쿼리문](/create_stored_procedure.sql)
</details>


### 성능 
## 📄 기타 문서
[👉🏼 프로젝트 기획안](https://docs.google.com/document/d/10S8pPWJzgGtz6S1djeimFvKHkFpN2KdOCY7mrUeAtj4/edit?pli=1&tab=t.b3v4vsjloy9)

<br>

[👉🏼 요구사항 정의서](https://docs.google.com/spreadsheets/d/1woSNDRkSPBwEEkWzr27yUoJJfmwXYKzcMOCcOs6mO3c/edit?usp=sharing)
