# 🏕 Rising Test
> '번개장터' 클론 코딩   
> 프로젝트 기간 : 22.08.20 ~ 22.09.02   
>'본 템플릿의 저작권은 (주)소프트스퀘어드에 있습니다. 상업적 용도의 사용을 금합니다'
## 📑 데이의 개발일지
<details>
<summary>2022.08.20</summary>
<div markdown="1">


    
    1. 기획서 제출 ✅
    2. 소셜 로그인 화면 구현 ✅
    

</div>
</details>
<details>
<summary>2022.08.21</summary>
<div markdown="1">


    
    1. 홈 화면 구현 중 🔥
    

</div>
</details>
<details>
<summary>2022.08.22</summary>
<div markdown="1">


    
    1. 홈 화면 중첩 스크롤 해결하느라 하루 순삭 🤦🏻‍♂️
    ㄴ 😊 결국 해결 못함 😊
    

</div>
</details>
<details>
<summary>2022.08.23 1차 피드백</summary>
<div markdown="1">


    
    1. 홈 화면 중첩 스크롤 해결!!🥹
    ㄴ nested scroll이라고 한다함
      ㄴ 해결 방법 : collection view로 재구현하여 해결
    2. 전체 메뉴 구현 ✅
    
    * 피드백 : UI 구현은 잘 함, but 지금은 api등 주요 기능에 우선 순위를 두는 게 먼저
    

</div>
</details>
</details>
<details>
<summary>2022.08.24</summary>
<div markdown="1">


    
    1. 회원가입 화면 ✅
    2. 회원가입 api ✅
    

</div>
</details>
<details>
<summary>2022.08.25</summary>
<div markdown="1">


    
    1. 로그인 화면 ✅
    2. 로그인 api ✅
    3. 상품등록 화면 구현 중 🔥
    3. 카테고리 api 3개 ✅
    

</div>
</details>
<details>
<summary>2022.08.26</summary>
<div markdown="1">


    
    1. 상품등록 화면 구현 ✅
    2. 사진 선택 화면 구현 ✅
    3. 사진 저장을 위한 firebase 연동 중 🔥
    

</div>
</details>
<details>
<summary>2022.08.27</summary>
<div markdown="1">


    
    1. 사진 저장을 위한 firebase 연동 ✅
    2. 게시물 등록 api 🔥
    

</div>
</details>
<details>
<summary>2022.08.28</summary>
<div markdown="1">


    
    1. 게시물 등록 api ✅
    2. 상품 세부 정보 화면 구현
    

</div>
</details>
<details>
<summary>2022.08.29 2차 피드백</summary>
<div markdown="1">


    
    1. 마이페이지 화면 구현 중 🔥
    
    * 피드백 : 1. 정량 평가(화면, api 등)를 위해서 쉽게 구현 가능한 화면으로 화면 개수를 확보해놓자
             2. 탭바에서 화면 present로 띄우기(shouldSelect)
    

</div>
</details>
<details>
<summary>2022.08.30</summary>
<div markdown="1">


    
    1. 마이페이지 화면 구현 ✅
    2. 마이페이지 api(메인, 판매 중, 예약 중, 판매 완료)
    

</div>
</details>
<details>
<summary>2022.08.31</summary>
<div markdown="1">


    
    1. 검색, 번개톡, 마이페이지 - 설정 화면 구현 ✅
    2. 상품 상세 정보 불러오기 api, 상품 삭제 api ✅
    

</div>
</details>
<details>
<summary>2022.09.01</summary>
<div markdown="1">


    
    1. 상점 수정 화면 구현, 상품 등록 view present로 구현 ✅
    2. 상점 정보 api, 상점 수정 api ✅
    3. & 상품 수정 api, 홈 피드 api 하는 중 🔥
    

</div>
</details>
<details>
<summary>2022.09.02</summary>
<div markdown="1">


    
    1. 설정 세부 화면 구현 ✅
    2. 홈 api, 상품 수정 api 완료 ✅
    

</div>
</details>

## 📌 기능 상세 화면
### - 회원가입
https://user-images.githubusercontent.com/97266875/196350339-cfed3d1d-173a-449a-a4c8-61fa24d343e0.mp4

<br>

### - 로그인
https://user-images.githubusercontent.com/97266875/196350679-e9265f0f-0642-4491-a5fd-e028d5ea2685.mp4

<br>

### - 홈 화면
<div>
<img width="250" src="https://user-images.githubusercontent.com/97266875/196352987-a1b6bca6-7909-44bc-86a0-1e5778bca0ba.gif">
<img width="250" src="https://user-images.githubusercontent.com/97266875/196351619-830d3f83-bbfb-4d7c-a7d8-5e126bc85ba0.gif">
</div>

<br>

### - 탭 바 페이지 화면
https://user-images.githubusercontent.com/97266875/196354241-0b1d7793-6dc1-4426-bb38-dd459f07741b.mp4

<br>

### - 판매 글 등록 화면
https://user-images.githubusercontent.com/97266875/196355883-7b363893-f58a-4bb4-9924-295febb31d69.mp4

<br>

### - 판매 글 수정 화면
https://user-images.githubusercontent.com/97266875/196356814-703da1db-84f0-460d-8482-997cffeefa8a.mp4

#### * 수정 후
| 마이페이지 | 홈 화면 |
| ---- | --- |
| <img width="250" src="https://user-images.githubusercontent.com/97266875/196368654-09012d61-284b-4875-8452-482f3eba6de7.gif"> | <img width="250" src="https://user-images.githubusercontent.com/97266875/196369683-5461bc65-ec2b-4214-9e92-084df14e0635.gif"> |

<br>

### - 판매 글 삭제 화면
<img width="250" src="https://user-images.githubusercontent.com/97266875/196371922-958eaf6e-b4a8-4af9-9cfb-ccb3c958e7f6.gif">
