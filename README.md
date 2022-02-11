## 오픈마켓 쇼핑몰

## 1. 목차

[1.개요](#2-개요)

[2.기술](#3-기술)

[3.ERD](#4-ERD)

[4.기능](#5-기능)

## 2. 개요
이번 프로젝트에서 구현한 것은 기존 팀 프로젝트를 기반에 판매자를 추가하여 구매자가 판매활동도 할 수 있는 오픈마켓을 구현하였습니다.
spring framework를 이용한 오픈마켓 쇼핑몰입니다. 상품을 보며 좋아요를 클릭해 따로 볼 수 있으며, 장바구니에 물건을 넣고 바로 구매를 할 수 있는 웹페이지 입니다.
또한 구매자가 판매자 등록을 하면 판매활동도 할 수 있도록 구현해놓은 오픈마켓 쇼핑몰입니다.
## 3. 기술
![152901116-233b5700-9ab9-410e-ab8a-4f978d08a393](https://user-images.githubusercontent.com/96754807/153322061-f5395f89-bc03-4e3b-8ff0-42c0f2ba7776.png)
## 4. ERD
 ![ERD](https://user-images.githubusercontent.com/96754807/153321912-20fc51ae-5ad5-4b03-9916-e67a808b7e2c.PNG)
## 5. 기능

### 1. 일반회원의 판매자 등록기능

#### 고객센터 뷰에서 판매자 등록 버튼
![a1](https://user-images.githubusercontent.com/96754807/153533420-7de4cb74-dbba-4f08-ba4a-87f742c8da5d.png)

#### 이미 판매자 등록이 되어있는 경우
![a2](https://user-images.githubusercontent.com/96754807/153533451-afbddea7-d3d0-4592-b2b3-bcb0147558d0.png)

#### 판매자 등록이 되어있지 않는 경우
![a3](https://user-images.githubusercontent.com/96754807/153533540-0fb67994-fc38-4867-939b-38d7bcb971a7.png)

#### 등록을 취소했을 경우
![a4](https://user-images.githubusercontent.com/96754807/153533561-e90c2b1a-9d56-429f-82df-da539018c268.png)

#### 등록을 신청 했을 경우 (재 로그인요청) 
![a5](https://user-images.githubusercontent.com/96754807/153533588-8da36f44-9dff-4f87-bf0a-7d5c18dd17f8.png)



 ### 2. 판매자 기능
#### 기본 홈에서 판매자 홈으로 이동 할 수 있게 다른 뷰를 구현. 
![bb](https://user-images.githubusercontent.com/96754807/153532243-15bb28b9-9538-4af3-8020-75e6f7906975.png)

#### 판매자 홈에서 판매에 관련된 기능을 사용 할 수 있도록 구현.
![cc](https://user-images.githubusercontent.com/96754807/153532245-b41f02db-81f7-41bd-a543-d12acf5c5930.png)

#### 마켓에 상품등록을 할 수 있는 기능.
![ee](https://user-images.githubusercontent.com/96754807/153532255-0a64c5e7-34dd-4385-b604-12cc9f44fd11.png)

#### 내가 등록한 상품이 주문된 상태를 확인 / 주문상태를 변경 가능.
![dd](https://user-images.githubusercontent.com/96754807/153532249-574b78af-dd33-478b-9a85-17c4ac6605c2.png)

#### 내가 등록한 상품을 추가/ 수정/ 삭제를 할 수 있는 기능.
![ff](https://user-images.githubusercontent.com/96754807/153532309-941d3599-6fc7-4127-9afa-a9176735b331.png)



### 3. 관리자 기능


#### 관리자 페이지에서 별도 로그인을 한 후 일반 홈으로 이동후 보여지는 뷰.
![gg](https://user-images.githubusercontent.com/96754807/153532320-c7ee31cb-6d2b-4799-ad9e-4573fcd148c1.png)

#### 관리자가 마켓내의 전체 주문 조회가 가능. 하지만 회원이 등록한 상품의 대한 수정은 불가능.
![hh](https://user-images.githubusercontent.com/96754807/153532343-68598501-f5ae-4e83-b595-024d170fce11.png)

#### 관리자가 마켓내의 전체 등록 상품의 조회가 가능. 하지만 주문에 대한 수정은 불가능.
![ii](https://user-images.githubusercontent.com/96754807/153532350-dd12d8cf-451f-41bc-923d-b8e16dfc0f32.png)

### 경영자 기능

#### 쇼핑몰 전체 매출 확인 기능
![b1](https://user-images.githubusercontent.com/96754807/153540612-e8b5bfd2-e025-4c55-959e-ef8486e165a3.png)

#### 인기 상품 순위
![b2](https://user-images.githubusercontent.com/96754807/153540650-c977b992-ea83-4790-b8ed-9f7a74bdc650.png)

#### 가입 연령대 별 집계
![b5](https://user-images.githubusercontent.com/96754807/153540711-e5f806a7-a93a-4260-a8da-f6747921f90f.png)

#### 인기 상품 판매량
![b3](https://user-images.githubusercontent.com/96754807/153540734-d298164e-e3a6-47c6-b572-8194ae7db3f7.png)
