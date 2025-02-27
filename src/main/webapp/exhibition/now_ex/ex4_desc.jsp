<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전시회 상세페이지</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
    integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous" />
 
<!-- 캘린더 -->    
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

<!-- 지도 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7262ac3337a597a3bb0dd8dc4b881cd1"></script>

  <style>
    /* 전체 설정 css start */
    :root {
      --color1: #3d3d3d;
      --color2: white;
      --color3: #181818;
      --color4: #212121;
      --color5: #373749;
      --color6: #5f4b8b;
      --color7: #998ab4;
      --color8: #afa8ba;
      --color9: #4caf50;
      --color10: #c4302b;
      --color11: #9d2622;
    }

    html,body,div,span,applet,object,iframe,h1,h2,h3,h4,h5,h6,p,
    blockquote,pre,a,abbr,acronym,address,big,cite,code,del,dfn,
    em,img,ins,kbd,q,s,samp,small,strike,strong,sub,sup,tt,var,
    b,u,i,center,dl,dt,dd,ol,ul,li,fieldset,form,label,legend,
    table,caption,tbody,tfoot,thead,tr,th,td,article,aside,canvas,
    details,embed,figure,figcaption,footer,header,hgroup,menu,nav,
    output,ruby,section,summary,time,mark,audio,video {
      margin: 0;
      padding: 0;
    }

    * {
      box-sizing: border-box;
    }

    div {
      /* border: 1px solid black; */
    }
    /* 전체 설정 css end */

    /* container start */
    .container {
      width: 1200px;
      margin: auto;
    }
    /* container end */
    
    
    /* header start */
    .header {
      height: 40px;
      background-color: var(--color3); 
      color: var(--color2);
    }
    
    .header_list {
      display: flex;
      justify-content: flex-end;
      line-height: 40px;
    }
    
    .header_list li {
      list-style-type: none;
      padding-right: 20px;
      font-size: 0.9rem;
    }
    
    .header_list li a {
      text-decoration: none;
      color: var(--color2);
    }

    .search_wrap {
      padding: 5px;
      border-radius: 10px;
      background-color: var(--color4);
      color: var(--text-color);
    }

    .search_text {
      background-color: transparent;
      color: var(--text-color);
      border: 0;
      border-bottom: 1px solid var(--color2);
    }

    .search_text::placeholder {
      color: var(--text-color);
    }

    .search_text:focus {
      outline: none;
    }

    .user_detail {
      color: silver;
      padding-right: 10px;
    }

    #user_grade{
      background-color: var(--color2);
      border-radius: 5px;
      padding: 1px 3px 1px 3px;
    }

    /* header end */

    /* nav start */
    .nav {
      display: flex;
      height: 60px;
    }
    
    .nav_logo {
      text-align: center;
      line-height: 60px;
      width: 25%;
      height: 100%;
      font-size: 2rem;
    }
    
    .nav_side {
      align-items: right;
      width: 75%;
      height: 100%;
    }
    
    .nav_menu_list {
      display: flex;
      justify-content: space-around;
      line-height: 55px;
      padding-right: 20px;  
      
    }
    
    .nav_menu_list li {
      border: 0px;
      list-style-type: none;
      font-size: 1.2rem;
      font-weight: bold;
    }
    
    .nav_menu_list li:hover {
      border-bottom: solid var(--color11);
    }

    .nav_menu_list a {
      text-decoration: none;
      color: var(--color3);
    }

    .nav_menu_list a:hover {
      text-decoration: none;
      color: var(--color7);
    }
    /* nav end */
    
    
    .carousel_timeline {
      display: flex;
    }
    
    .main {
      height: 1200px;
    }

    .sidebar {
      width: 20%;
      height: 100%;
      background-color: var(--color3);
      float: left;
    }

    .list_title {
      color: var(--color2);
      padding-top: 20px;
      text-align: center;
    }

    .sidebar_item_list {
      padding-top: 20px;
      list-style-type: none;
      display: flex;
      flex-direction: column;
    }

    .sidebar_item {
      width: 100%;
      padding-top: 10px;
      padding-bottom: 10px;
      text-align: center;
    }

    .sidebar_item:hover {
      background-color: var(--color11);
    }

    .sidebar_item a {
      font-size: 1rem;
      text-decoration: none;
      color: var(--color2);
    }

    /* 전시 내용 */
    .contents {
      width: 80%;
      height: 100%;
      float: left; 
      padding-top: 100px;
    }

    .contents_wrap1{
      width: 50%;
      height: 60%;
      float: left;
    }

    .contents_wrap2{
      width: 50%;
      height: 60%;
      float: left;
    }

    .contents_wrap2>div{
      width: 100%;
      height: 40px;
      line-height: 40px;
      /* text-align: center; */
      font-size: large;
      margin-bottom: 10px;
    }

  .contents_wrap2>div>div{
      width: 50%;
      height: 40px;
      line-height: 40px;
      /* text-align: center; */
      float : left;
      padding: 2px ;
    }

    .contents_wrap2>div>div:nth-child(1){
      width: 50%;
      height: 40px;
      line-height: 40px;
      /* text-align: center; */
      float : left;
      text-align: right;
      padding-right: 50px;
      font-weight: 550;
    }

    .contents_sub1{
      width: 100%;
      height: 50%;
      text-align: center;
      padding-top: 40px;
      padding-left:50px;
    }

    .contents_sub2{
      width: 100%;
      height: 50%;
      padding-left: 70px;
    }

    #title{
      width: 100%;
      height: 15%;
      text-align: center;
      font-size: large;
      font-weight: bolder;
      padding-top: 5px;
      
    }

    #map{
      width: 100%;
      height:85%;
      text-align: center;

    }

    #buy_btn:hover{
      cursor: pointer;
    }

    .contents_wrap3{
      width: 100%;
      height: 40%;
      padding-left: 80px;
      padding-right: 80px;
      padding-top: 40px;
      float: left;
    }

    .menu_top{
      width: 100%;
      height: 13%;
    }

    .menu_top>div{
      float: left;
      font-size:larger;
      width: 20%;
      text-align: center;
      height: 50px;
      line-height: 50px;
    }

    .menu_top>div:hover{
      cursor: pointer;
      border-bottom: solid var(--color11);
    }

    .menu_content1{
      padding: 20px;
    }
    .menu_content2{
      padding: 20px;
      display : none;
    }
    .menu_content3{
      padding: 20px;
      display : none;
    }

    .footer {
      height: 150px;
      background-color: var(--color1);
    }

    .carousel img {
      width: 100%;
      height: 100%;
    }

    #buy_btn{
      border: 0;
      outline: 0;
      width: 200px; height: 40px; font-size: large; padding: 5px; background-color: black; color: white;
    }

    #buy_btn:hover{
      background-color: #9d2622;;
    }
    
        a{
         	text-align: center;
  			text-decoration: none; /* 링크의 밑줄 제거 */
 		 	color: inherit; /* 링크의 색상 제거 */
        }
            
        a:hover{
            color: black; /* 링크의 색상 제거 */
        }
  </style>
  
   <!-- 리뷰 css  -->
      <style>


/* 레이아웃 외곽 너비 400px 제한*/
.wrap{
    max-width: 100%;
    margin: 0 auto; /* 화면 가운데로 */
    background-color: #fff;
    height: 30%;
   /*  padding: 20px; */
    box-sizing: border-box;

}
.reviewform textarea{
    width: 100%;
    padding: 10px;
    box-sizing: border-box;
}
.rating .rate_radio {
    position: relative;
    display: inline-block;
    z-index: 20;
    opacity: 0.001;
    width: 30px;
    height: 30px;
    background-color: #fff;
    cursor: pointer;
    vertical-align: top;
    display: none;
}
.rating .rate_radio + label {
    position: relative;
    display: inline-block;
    margin-left: -4px;
    z-index: 10;
    width: 30px;
    height: 30px;
    background-image: url('../img/starrate.png');
    background-repeat: no-repeat;
    background-size: 30px 30px;
    cursor: pointer;
    background-color: #f0f0f0;
}
.rating .rate_radio:checked + label {
    background-color: rgb(255, 60, 0);
}

.warning_msg {
    display: none;
    position: relative;
    text-align: left;
    background: #ffffff;
    line-height: 20px;
    width: 100%;
    color: red;
    padding: 5px;
    box-sizing: border-box;
    /* border: 1px solid #e0e0e0; */
}
.cmd{
	text-align:right;
	padding :5px;
}
    </style>
</head>

<body>
  <div class="container">
    <c:choose>
          <c:when test="${loginId!=null}">
            <div class="header" id="topTarget">
              <ul class="header_list">
                <li class="user_detail"><span id="user_grade"><i class="fas fa-crown"></i> ${dto.mem_grade}</li></span>
                <li id="welcome"> ${loginId } 님 환영합니다.</li>
                <li id="mypage"><a href="/modifyForm.mem">마이페이지</a></li>
                <li id="basket"><a href="/basket/basket.jsp" id="basket">장바구니</a></li>
                <li id=logout><a href="/logout.mem"  id="logout">로그아웃</a></li>
              </ul>
            </div>
          </c:when>
          <c:otherwise>
            <div class="header" id="topTarget">
              <ul class="header_list">
                <li id=login><a href="/home.mem">로그인</a></li>
                <li id=signup><a href="/signup.mem">회원가입</a></li>
              </ul>
            </div>
          </c:otherwise>
     </c:choose>
    <div class="nav">
      <div class="nav_logo">
        <a href="/artexMain/mainpage.jsp"><i class="fab fa-artstation"> Artex Vision</i></a>
      </div>
      <div class="nav_side">
        <div class="nav_menu">
          <ul class="nav_menu_list">
            <li><a href="/nb_list.board?cpage=1" id="notice">NOTICE</a></li>
            <li><a href="/artexDesc/artex_desc.jsp">Artex Vision</a></li>
            <li><a href="/exhibition/main_ex/now_main_ex.jsp">전시</a></li>
            <li><a href="/event/now_event/now_event.jsp" id="event">이벤트</a></li>
          </ul>
        </div>
      </div>
    </div>
    <div class="carousel_timeline">
      <div class="carousel">
        <img src="../img/artex_main_img.png" class="carousel_img">
      </div>
    </div>
    <div class="main">
      <div class="sidebar">
        <h2 class="list_title">전시</h2>
        <ul class="sidebar_item_list">
          <li class="sidebar_item"><a href="/exhibition/main_ex/now_main_ex.jsp">현재 전시</a></li>
          <li class="sidebar_item"><a href="/exhibition/main_ex/future_main_ex.jsp">예정된 전시</a></li>
          <li class="sidebar_item"><a href="/exhibition/main_ex/end_main_ex.jsp">마감된 전시</a></li>
        </ul>
      </div>

      <div class="contents">
        <div class="contents_wrap1">
          <div class="contents_sub1">
            <img src="../img/josun.png" width="200px" height="240px">
          </div>
          <div class="contents_sub2">
            <div id="title">오시는 길</div>
            <div id="map"></div>
          </div>
        </div>
        
        <form action="/priceToss.book" method="post" id="frmPrice">
        <div class="contents_wrap2">
          <div class="ex_title" style="margin-bottom: 20px; padding-left: 90px;">
            <input type=text name ="ex_title" style="font-weight: bolder; font-size: x-large; text-align:center; border:0px;" value="조선의 승려 장인">
          </div>
          <hr style="background-color: #9d2622; width: 400px; margin-top: 30px; margin-bottom: 30px; ">
          <div class="ex_name">
            <div>장소 </div>
            <div>국립 중앙 박물관</div>
          </div>
          <div class="ex_date">
           	<div>전시 기간</div>
            <div>2021-12-07 ~ 2022-03-06</div>
          </div>
          <div class="ex_price">
            <div>가격</div>
            <div id="price">5000</div>
          </div>
          <div class="ex_person" >
            <div>인원</div>
            <div>
            <select name="person" style="width:120px; height:40px;" id="person">
              <option >인원 선택</option>
              <option value=1 >1</option>
              <option value=2 >2</option>
              <option value=3 >3</option>
              <option value=4 >4</option>
              <option value=5 >5</option>
              <option value=6 >6</option>
            </select></div>
          </div>
          <div class="ex_date">
	          <div>날짜 선택</div>
              <input type="text" id="choiceDate" autocomplete="off" name="bookDate">
          </div>
          <div class="ex_buy">
            <div>결제가격</div>
            <div><input type=text id="realprice" name="realprice" style="border:0px;"></div>
          </div>
          <div class="buy" style="height: 30%; text-align: center;  padding-top: 30px; padding-left: 30px;">
            <button id="buy_btn" type="button" >예매하기</button>
          </div>
        </div>
        </form>
        
        <div class="contents_wrap3">
          <div class="menu_top">
            <div id="desc">상세정보</div>
            <div id="review">리뷰 남기기</div>
            <div id="expect">부가 정보</div>
          </div>
          <hr>
          <div class="menu_content1">
            &nbsp&nbsp어깨에 해진 바랑을 짊어지고 온 나라를 걷던 이들이 있습니다. 
            인연 닿는 곳을 마다하지 않는 사이 안개비가 내리고, 봄꽃이 폈다 지고, 가을 달이 찼다 기울었습니다. 
            조선시대에는 불상을 만들고 불화를 그리던 승려 장인이 있었습니다. 오랫동안 불리지 않던 그 이름을 떠올려 봅니다.
			그들은 혼자 하려면 막막한 일들을 함께하기 위해 때로는 천 리 길을 마다하지 않고 모였습니다. 뛰어난 능력이 없어도, 
			느리고 부족해도 각자에게 맞는 역할로 참여할 수 있었습니다. 자신의 공을 드러내지 않고, 단지 함께 이룬 공덕이 모든 이에게 닿기를 기원했습니다. 
			누군가는 화가를, 누군가는 조각가를 꿈꾸었던 이들은 마음이 머물고 싶은 곳, 소중하게 생각하는 가치를 손끝으로 펼쳐낸 또 다른 예술가였습니다.
			낯선 곳에서 밀려오는 해 질 녘 쓸쓸함을 떨쳐내고 늘 떠나던 발자국을 따라가 봅니다. 그들이 남긴 상과 그림 앞에서 따뜻함과 평온함을 느껴 보시기 바랍니다.
          </div>
          <div class="menu_content2">
             <div class="wrap">
        		<form name="reviewform" class="reviewform" method="post" action="/writeRv.rvboard" id="frmRv">
            		<input type="hidden" name="rate" id="rate" value="0"/>
            		<!-- <p class="title_star">별점과 리뷰를 남겨주세요.</p> -->
     
            		<div class="review_rating">
                		<div class="warning_msg">별점을 선택해 주세요.</div>
                		<div class="rating">
                    			<!-- 해당 별점을 클릭하면 해당 별과 그 왼쪽의 모든 별의 체크박스에 checked 적용 -->
                    		<input type="checkbox" name="rating" id="rating1" value="1" class="rate_radio" title="1점">
                    		<label for="rating1"></label>
                   		 	<input type="checkbox" name="rating" id="rating2" value="2" class="rate_radio" title="2점">
                  	  		<label for="rating2"></label>
                    		<input type="checkbox" name="rating" id="rating3" value="3" class="rate_radio" title="3점" >
                    		<label for="rating3"></label>
                    		<input type="checkbox" name="rating" id="rating4" value="4" class="rate_radio" title="4점">
                    		<label for="rating4"></label>
                    		<input type="checkbox" name="rating" id="rating5" value="5" class="rate_radio" title="5점">
                    		<label for="rating5"></label>
                		</div>
           		 	</div>
            		<div class="review_contents">
                		<div class="warning_msg">5자 이상으로 작성해 주세요.</div>
                		<textarea rows="10" class="review_textarea" name="re_contents"></textarea>
            		</div>   
            		<div class="cmd">
            			<button name="save" id="save" type="button">등록</button>
                		<!-- <input type="button" name="save" id="save" value="등록"> -->
            		</div>
        		</form>
    		</div>
          </div>
          <div class="menu_content3">
             <p><h3>기획사 정보</h3>
			 	주최: 국립중앙박물관<br>
			 	주관: 국립박물관문화재단<br>
				문의: 1688-0361</p>
			 	<br>
			 <p><h3>공연시간 정보</h3>
			 	예매가능시간: 관람 10분 전까지<br>
			 	월,화,목,금,일 10:00~18:00 (마지막 회차 17:00, 발권 및 입장 마감 17:30)<br>
				수,토 10:00~21:00 (마지막 회차 20:00, 발권 및 입장 마감 20:30)</p>
          </div>
        </div>
      </div>
    </div>

    <div class="footer"> </div>
  </div>
      <!-- 예매하기 버튼 클릭 시  -->
  <script>
  $("#buy_btn").on("click",function(){
	  
      if(!($('#person > option:selected').val())) {
    	    alert("인원을 선택하세요.");
    	    return false;
    	}
      
      if(!$("#realprice").val()) {
    	    alert("인원을 선택하세요");
    	    return false;
    	}
      
      if(!$("#choiceDate").val()) {
  	    alert("날짜를 선택하세요");
  	    return false;
  		}
    
      /* 로그아웃 상태 일 때 */
      let uid = '<%=(String)session.getAttribute("loginId")%>';
       
      if(uid=="null"){ 
    	  alert("로그인 후 이용가능합니다.");
    	  location.replace("/login.jsp");
    	  return false;
      }
          
      let price = $("#realprice").val(); 
      
	  let result = confirm(price+"원 결제하시겠습니까?");
	  
	  if(result){
		  $("#frmPrice").submit();
	  }
  })
  </script>
  
  <!-- 리뷰남기기 -->
  <script>
  	/* 버튼 클릭시 */
  	 $("#save").on("click",function(){
  		 
  		 //별점 선택 안했으면 메시지 표시
         if(rating.rate == 0){
             rating.showMessage('rate');
             return false;
         }
         //리뷰 5자 미만이면 메시지 표시
         if(document.querySelector('.review_textarea').value.length < 5){
             rating.showMessage('review');
             return false;
         }
         
         
  		/* 로그아웃 상태 일 때 */
  	      let uid = '<%=(String)session.getAttribute("loginId")%>';
  	       
  	      if(uid=="null"){ 
  	    	  alert("로그인 후 이용가능합니다.");
  	    	  location.replace("/login.jsp");
  	    	  return false;
  	      }else{
  	    	alert("현재 기능은 구현 중에 있습니다.");
  	      }
  	      
  		
         
  		

  	 });
  </script>
  
  
  
 <script>
//별점 마킹 모듈 프로토타입으로 생성
function Rating(){};
Rating.prototype.rate = 0;
Rating.prototype.setRate = function(newrate){
    //별점 마킹 - 클릭한 별 이하 모든 별 체크 처리
    this.rate = newrate;
    let items = document.querySelectorAll('.rate_radio');
    items.forEach(function(item, idx){
        if(idx < newrate){
            item.checked = true;
        }else{
            item.checked = false;
        }
    });
}

let rating = new Rating();//별점 인스턴스 생성

document.addEventListener('DOMContentLoaded', function(){
    //별점선택 이벤트 리스너
    document.querySelector('.rating').addEventListener('click',function(e){
        let elem = e.target;
        if(elem.classList.contains('rate_radio')){
            rating.setRate(parseInt(elem.value));
        }
    })
});

  //상품평 작성 글자수 초과 체크 이벤트 리스너
  document.querySelector('.review_textarea').addEventListener('keydown',function(){
        //리뷰 400자 초과 안되게 자동 자름
        let review = document.querySelector('.review_textarea');
        let lengthCheckEx = /^.{400,}$/;
        if(lengthCheckEx.test(review.value)){
            //400자 초과 컷
            review.value = review.value.substr(0,400);
        }
    });


    Rating.prototype.showMessage = function(type){//경고메시지 표시
    switch(type){
        case 'rate':
            //안내메시지 표시
            document.querySelector('.review_rating .warning_msg').style.display = 'block';
            //지정된 시간 후 안내 메시지 감춤
            setTimeout(function(){
                document.querySelector('.review_rating .warning_msg').style.display = 'none';
            },1000);            
            break;
        case 'review':
            //안내메시지 표시
            document.querySelector('.review_contents .warning_msg').style.display = 'block';
            //지정된 시간 후 안내 메시지 감춤
            setTimeout(function(){
                document.querySelector('.review_contents .warning_msg').style.display = 'none';
            },1000);    
            break;
    }
}
    </script>
    
  <!-- 인원수 선택시 -->
  <script>
  $("#person").change(function(){
	  /* location.href="/buy.exbuy"; */
 	  let price = parseInt($("#price").text()); 
	  let person = parseInt($("#person option:selected").val()); 
  	  let realpriceInt = price*person; 
	  let realprice = realpriceInt.toString();  
	  $("#realprice").val(realprice);
  });
  
  </script>
  
  <!-- 상세설명, 리뷰, q&a 클릭에 따른 div 보여주기 코드  -->
  <script type="text/javascript">
  /*  상세 정보 클릭 시  */
  $("#desc").on("click", function(){

		$(".menu_content2").css("display", "none");
		$(".menu_content3").css("display", "none");
		$(".menu_content1").css("display", "inline");
		
	})
	
	/*  리뷰 클릭 시  */
  $("#review").on("click", function(){

		$(".menu_content2").css("display", "inline");
		$(".menu_content3").css("display", "none");
		$(".menu_content1").css("display", "none");
		
	})
	
	/*  qna 클릭 시  */
  $("#expect").on("click", function(){

		$(".menu_content2").css("display", "none");
		$(".menu_content3").css("display", "inline");
		$(".menu_content1").css("display", "none");
		
	})
	
	$("#logout").on("click",function(){
		if(!confirm("로그아웃 하시겠습니까?")){
			return false;
		}
	})
	
	$("#basket").on("click",function(){
		alert("현재 기능은 구현중에 있습니다.");
		return false;
	})

  </script>
  
  
  
  <!-- 날짜  -->
<script type="text/javascript">
    $(document).ready(function () {
            $.datepicker.setDefaults($.datepicker.regional['ko']); 
            $( "#choiceDate" ).datepicker({
                 changeMonth: true, 
                 changeYear: true,
                 nextText: '다음 달',
                 prevText: '이전 달', 
                 dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
                 dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], 
                 monthNamesShort: ['01','02','03','04','05','06','07','08','09','10','11','12'],
                 monthNames: ['01','02','03','04','05','06','07','08','09','10','11','12'],
                 dateFormat: "yy-MM-dd",
                 minDate: 0,// 선택할수있는 최소날짜, ( 0 : 오늘 이후 날짜 선택 불가)
                 maxDate: new Date('2022-03-06')  
 
            });  
    });
</script>


	<!--  지도 api -->
	<script>
	var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
	var options = { //지도를 생성할 때 필요한 기본 옵션
		center: new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
		level: 3 //지도의 레벨(확대, 축소 정도)
	};

	var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
	
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(37.524037778312945, 126.9804916560033), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

	// 마커가 표시될 위치입니다 
	var markerPosition  = new kakao.maps.LatLng(37.524037778312945, 126.9804916560033); 

	// 마커를 생성합니다
	var marker = new kakao.maps.Marker({
    	position: markerPosition
	});

	// 마커가 지도 위에 표시되도록 설정합니다
	marker.setMap(map);

	</script>
</body>

</html>