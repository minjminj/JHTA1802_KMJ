<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Example-by-min</title>
<link href="https://fonts.googleapis.com/css?family=Jua|Paytone+One" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Cabin+Sketch|Jua|Paytone+One" rel="stylesheet">

<style>
/* 초기화 */
	* {margin:0; padding:0;}
	body {font-family: fantasy; width: 960px; margin: 0 auto;}
	li {list-style: none;}
	a {text-decoration:none;}
	img {border:0;}
	
/* 헤더 */
	#header {
		/*중앙 정렬*/
		width: 960px; margin: 0 auto; 
		/*절대 좌표*/
		height: 160px; position: relative;		/*자손의 position에 absolute 적용하면 부모의 position은 relative!!*/
	}
	
/* 타이틀 */	
	#header > #title{
		position: absolute;
		left: 20px; top:20px;
		font-family: 'Paytone One', sans-serif;
		text-shadow: 5px 5px 5px #aaaaaa;
	}
	
/* 메뉴1	 */
	#header > #gnb{
		position: absolute;	
		right:0; top:7px;
		font-family: 'Jua', sans-serif;
		color: black;
	}
	#header > #gnb > ul {overflow: hidden;}
	#header > #gnb > ul > li {float: left;}
	#header > #gnb > ul > li > a {
		display: block;
		padding: 2px 10px;
		border: 1.25px solid black;
	}
	#header > #gnb > ul > li > a:hover {
		background:black; color: white;
	}
	#header > #gnb > ul > li:first-child > a {border-radius: 3px 0 0 3px;}
	#header > #gnb > ul > li:last-child > a {border-radius: 0 3px 3px 0; margin-right:7px;}
	
/* 메뉴2 */
	#header > #lnb{
		position: absolute;	
		right:0; top:57px;
		font-family: 'Jua', sans-serif;
		color: black;
	}
	#header > #lnb > ul {overflow: hidden;}
	#header > #lnb > ul > li {float: left;}
	#header > #lnb > ul > li > a {
		display: block;
		padding: 2px 10px;
		border: 1.25px solid black;	
	}
	#header > #lnb > ul > li > a:hover {
		background:black; color: white;
	}
	#header > #lnb > ul > li:first-child > a {border-radius: 3px 0 0 3px;}
	#header > #lnb > ul > li:last-child > a {border-radius: 0 3px 3px 0; margin-right:7px;}

/* 콘텐츠 */
	#content {
		/*중앙 정렬*/
		width: 960px; margin: 0 auto; 
		/*수평 레이아웃 구성*/
		overflow: hidden;
		
		font-family: 'Jua', sans-serif;
	}
	
/* 본문 */
	#content > #section {
		width: 750px; float: left; 
	}
	#content > #section > article.article {
		margin-bottom: 10px;
		padding: 20px;
		border: 1.5px solid black;
		border-shadow: 2px 2px 2px #aaaaaa;
	}

/* 사이드 */
	#content > #aside {
		width: 200px; float: right; 
	}
	
/* 첫번째 탭 */
	input:nth-of-type(1) {display: none;}
	input:nth-of-type(1) ~ div:nth-of-type(1) {display: none;}
	input:nth-of-type(1):checked ~ div:nth-of-type(1) {display: block;}
	input:nth-of-type(1):checked ~ section.buttons > label:nth-of-type(1){
		background: white;
		color: black;
	}

/* 두번째 탭 */
	input:nth-of-type(2) {display: none;}
	input:nth-of-type(2) ~ div:nth-of-type(2) {display: none;}
	input:nth-of-type(2):checked ~ div:nth-of-type(2) {display: block;}
	input:nth-of-type(2):checked ~ section.buttons > label:nth-of-type(2){
		background: white;
		color: black;
	}
	
/* 탭 모양 구성 */
	section.buttons {overflow: hidden;}
	section.buttons > label {
		/*수평 정렬*/
		display: block; float: left;
		
		/*크기 및 글자 위치 지정*/
		width: 100px; height: 30px;
		line-height: 30px;
		text-align: center;
		
		/*테두리 지정*/
		box-sizing: border-box;
		border: 1.5px solid black;
		border-shadow: 2px 2px 2px #aaaaaa;
		
		/*색상 지정*/
		background: black;
		color:white;
	}
	
/* 목록 */
	.item {
		overflow: hidden;
		padding: 10px;
		border: 1.5px solid black;
		border-shadow: 2px 2px 2px #aaaaaa;
		border-top: none;
	}
	.thumnail {
		float: left;
	}
	.description {
		float: left;
		margin-left: 10px;
	}
	.description > strong {
		display: block;
		width: 120px;
		white-space: nowrap;
		overflow: hidden;
		text-overflow: ellipsis;
	}

/* 푸터 */
	#footer {
		/*중앙 정렬*/
		width: 750px; float: left;
		margin-bottom: 10px;
		/*테두리*/
		box-sizing: border-box;
		padding: 10px;
		border: 1.5px solid black;
		border-shadow: 2px 2px 2px #aaaaaa;
		
		/*글자 정렬*/
		text-align: center;
		font-family: 'Cabin Sketch', cursive;
	}
	
	h1 {border-shadow: 2px 2px 2px #aaaaaa;}
</style>
</head>
<body>
	<header id='header'>
		<div id='title'>
			<h1>Rint Development</h1>
			<h2>HTML5 + CSS3 Basic</h2>
		</div>
		
		<navi id='gnb'>
			<ul>
				<li><a href='#'>Web</a></li>
				<li><a href='#'>Mobile</a></li>
				<li><a href='#'>Game</a></li>
				<li><a href='#'>Simulation</a></li>
				<li><a href='#'>Data</a></li>
			</ul>
		</navi>
		
		<navi id='lnb'>
			<ul>
				<li><a href='#'>HTML5</a></li>
				<li><a href='#'>CSS3</a></li>
				<li><a href='#'>JavaScript</a></li>
				<li><a href='#'>jQuery</a></li>
				<li><a href='#'>Node.js</a></li>
			</ul>
		</navi>
	</header>
		
	<div id='content'>
		<section id='section'>
			<article class='article'>
				<h1>Section</h1>
				<p>저번주랑 이번주는 수요일날 쉬었다. 아주 좋은 2주간이었다. 앞으로도 매주 수요일이 휴일이면 좋겠다. 광복절 전까지 평일에 쉴 수 있는 날이 없다는게 너무 슬프다. 어서 광복절이 오기를... 대한민국 만세 ㅎㅎㅎ
					저번주랑 이번주는 수요일날 쉬었다. 아주 좋은 2주간이었다. 앞으로도 매주 수요일이 휴일이면 좋겠다. 광복절 전까지 평일에 쉴 수 있는 날이 없다는게 너무 슬프다. 어서 광복절이 오기를... 대한민국 만세 ㅋㅋㅋ
					저번주랑 이번주는 수요일날 쉬었다. 아주 좋은 2주간이었다. 앞으로도 매주 수요일이 휴일이면 좋겠다. 광복절 전까지 평일에 쉴 수 있는 날이 없다는게 너무 슬프다. 어서 광복절이 오기를... 대한민국 만세 히히히
					저번주랑 이번주는 수요일날 쉬었다. 아주 좋은 2주간이었다. 앞으로도 매주 수요일이 휴일이면 좋겠다. 광복절 전까지 평일에 쉴 수 있는 날이 없다는게 너무 슬프다. 어서 광복절이 오기를... 대한민국 만세 키키키</p>
			</article>
			<article class='article'>
				<h1>Article</h1>
				<p>저번주랑 이번주는 수요일날 쉬었다. 아주 좋은 2주간이었다. 앞으로도 매주 수요일이 휴일이면 좋겠다. 광복절 전까지 평일에 쉴 수 있는 날이 없다는게 너무 슬프다. 어서 광복절이 오기를... 대한민국 만세 ㅎㅎㅎ
					저번주랑 이번주는 수요일날 쉬었다. 아주 좋은 2주간이었다. 앞으로도 매주 수요일이 휴일이면 좋겠다. 광복절 전까지 평일에 쉴 수 있는 날이 없다는게 너무 슬프다. 어서 광복절이 오기를... 대한민국 만세 ㅋㅋㅋ
					저번주랑 이번주는 수요일날 쉬었다. 아주 좋은 2주간이었다. 앞으로도 매주 수요일이 휴일이면 좋겠다. 광복절 전까지 평일에 쉴 수 있는 날이 없다는게 너무 슬프다. 어서 광복절이 오기를... 대한민국 만세 히히히
					저번주랑 이번주는 수요일날 쉬었다. 아주 좋은 2주간이었다. 앞으로도 매주 수요일이 휴일이면 좋겠다. 광복절 전까지 평일에 쉴 수 있는 날이 없다는게 너무 슬프다. 어서 광복절이 오기를... 대한민국 만세 키키키</p>
			</article>
			<article class='article'>
				<h1>Article</h1>
				<p>저번주랑 이번주는 수요일날 쉬었다. 아주 좋은 2주간이었다. 앞으로도 매주 수요일이 휴일이면 좋겠다. 광복절 전까지 평일에 쉴 수 있는 날이 없다는게 너무 슬프다. 어서 광복절이 오기를... 대한민국 만세 ㅎㅎㅎ
					저번주랑 이번주는 수요일날 쉬었다. 아주 좋은 2주간이었다. 앞으로도 매주 수요일이 휴일이면 좋겠다. 광복절 전까지 평일에 쉴 수 있는 날이 없다는게 너무 슬프다. 어서 광복절이 오기를... 대한민국 만세 ㅋㅋㅋ
					저번주랑 이번주는 수요일날 쉬었다. 아주 좋은 2주간이었다. 앞으로도 매주 수요일이 휴일이면 좋겠다. 광복절 전까지 평일에 쉴 수 있는 날이 없다는게 너무 슬프다. 어서 광복절이 오기를... 대한민국 만세 히히히
					저번주랑 이번주는 수요일날 쉬었다. 아주 좋은 2주간이었다. 앞으로도 매주 수요일이 휴일이면 좋겠다. 광복절 전까지 평일에 쉴 수 있는 날이 없다는게 너무 슬프다. 어서 광복절이 오기를... 대한민국 만세 키키키</p>
			</article>
		</section>
		<aside id='aside'>
			<input id='first' type='radio' name='tab' checked='checked'/>
			<input id='second' type='radio' name='tab'/>
			<section class='buttons'>
				<label for='first'>First</label>
				<label for='second'>Second</label>
			</section>
			<div class='tab_item'>
				<ul>
					<li class='item'>
						<a href='#'>
							<div class='thumnail'>
								<img src='http://placehold.it/45x45'/>
							</div>
							<div class='description'>
								<strong>HTML5 Canvas</strong>
								<p>2018-06-14</p>
							</div>
						</a>
					</li>
					<li class='item'>
						<a href='#'>
							<div class='thumnail'>
								<img src='http://placehold.it/45x45'/>
							</div>
							<div class='description'>
								<strong>HTML5 Audio</strong>
								<p>2018-06-14</p>
							</div>
						</a>
					</li>
					<li class='item'>
						<a href='#'>
							<div class='thumnail'>
								<img src='http://placehold.it/45x45'/>
							</div>
							<div class='description'>
								<strong>HTML5 Video</strong>
								<p>2018-06-14</p>
							</div>
						</a>
					</li>
					<li class='item'>
						<a href='#'>
							<div class='thumnail'>
								<img src='http://placehold.it/45x45'/>
							</div>
							<div class='description'>
								<strong>HTML5 Semantic Web</strong>
								<p>2018-06-14</p>
							</div>
						</a>
					</li>
				</ul>
			</div>
			<div class='tab_item'>
				<ul>
					<li class='item'>
						<a href='#'>
							<div class='thumnail'>
								<img src='http://placehold.it/45x45'/>
							</div>
							<div class='description'>
								<strong>CSS3 Transition</strong>
								<p>2018-06-14</p>
							</div>
						</a>
					</li>
					<li class='item'>
						<a href='#'>
							<div class='thumnail'>
								<img src='http://placehold.it/45x45'/>
							</div>
							<div class='description'>
								<strong>CSS3 Animation</strong>
								<p>2018-06-14</p>
							</div>
						</a>
					</li>
					<li class='item'>
						<a href='#'>
							<div class='thumnail'>
								<img src='http://placehold.it/45x45'/>
							</div>
							<div class='description'>
								<strong>CSS3 Border</strong>
								<p>2018-06-14</p>
							</div>
						</a>
					</li>
					<li class='item'>
						<a href='#'>
							<div class='thumnail'>
								<img src='http://placehold.it/45x45'/>
							</div>
							<div class='description'>
								<strong>CSS3 Box</strong>
								<p>2018-06-14</p>
							</div>
						</a>
					</li>
				</ul>
			</div>
		</aside>
	</div>
	
	<footer id='footer'>
		<h3>HTML5 + CSS3 Basic</h3>
		<address>Website Layout Basic</address>
	</footer>
</body>
</html>