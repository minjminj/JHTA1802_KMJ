<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div id='ALL'>ALL
		<div id='Board'>
			<fieldset>
				<legend>Board</legend>
				<ul>
					<li onclick='loadPage("./board/list.jsp")'>게ㅅ쉬판 보러갈뤠?</li>
				</ul>
			</fieldset>
		</div>	
		<div id='Core'>
			<fieldset>
				<legend>Core</legend>
				<ul>
					<li onclick='loadPage("./core/get.jsp")'>Get</li>
					<li onclick='loadPage("./core/each.jsp")'>Each</li>
					<li onclick='loadPage("./core/attribute.jsp")'>Attribute</li>
				</ul>
			</fieldset>
		</div>	
		<div id='Selector'>
			<fieldset>
				<legend>Selector</legend>
				<ul>
					<li onclick='loadPage("./selector/attribute.jsp")'>Attribute</li>
					<li onclick='loadPage("./selector/dom.jsp")'>Dom</li>
				</ul>
			</fieldset>
		</div>
		<div id='Filter'>
			<fieldset>
				<legend>Filter</legend>
				<ul>
					<li onclick='loadPage("./filter/filter.jsp")'>Filter</li>
				</ul>
			</fieldset>
		</div>
		<div id='Traverse'>
			<fieldset>
				<legend>Traverse</legend>
				<ul>
					<li onclick='loadPage("./traverse/traverse.jsp")'>Traverse</li>
				</ul>
			</fieldset>
		</div>
		<div id='Manipulation'>
			<fieldset>
				<legend>Manipulation</legend>
				<ul>
					<li onclick='loadPage("./manipulation/manipulation.jsp")'>Manipulation</li>
				</ul>
			</fieldset>
		</div>
		<div id='Event'>
			<fieldset>
				<legend>Event</legend>
				<ul>
					<li onclick='loadPage("./event/key.jsp")'>Key</li>
					<li onclick='loadPage("./event/one.jsp")'>One</li>
					<li onclick='loadPage("./event/toggle.jsp")'>Toggle</li>
					<li onclick='loadPage("./event/trigger.jsp")'>Trigger</li>
				</ul>
			</fieldset>
		</div>
		<div id='Effect'>
			<fieldset>
				<legend>Effect</legend>
				<ul>
					<li onclick='loadPage("./effect/screenSliding.jsp")'>Screen Sliding</li>
					<li onclick='loadPage("./effect/win8style.jsp")'>win8style</li>
					<li onclick='loadPage("./effect/popupSubMenu.jsp")'>Pop-up Menu</li>
				</ul>
			</fieldset>
		</div>
		<div id='Interaction'>
			<fieldset>
				<legend>Interaction</legend>
				<ul>
					<li onclick='loadPage("./widget/tab.jsp")'>Tabs</li>
					<li onclick='loadPage("./widget/accordion.jsp")'>Accordion</li>
					<li onclick='loadPage("./widget/menu.jsp")'>Menu</li>
					<li onclick='loadPage("./widget/autocomplete.jsp")'>AutoComplete</li>
				</ul>
			</fieldset>
		</div>
		<div id='Widget'>
			<fieldset>
				<legend>Widget</legend>
				<ul>
					<li onclick='loadPage("./widget/tab.jsp")'>Tabs</li>
					<li onclick='loadPage("./widget/accordion.jsp")'>Accordion</li>
					<li onclick='loadPage("./widget/menu.jsp")'>Menu</li>
					<li onclick='loadPage("./widget/autocomplete.jsp")'>AutoComplete</li>
				</ul>
			</fieldset>
		</div>
		<div id='Ajax'>
			<fieldset>
				<legend>Ajax</legend>
				<ul>
					<li onclick='loadPage("./ajax/loadHTML.jsp")'>LoadHTML</li>
					<li onclick='loadPage("./ajax/loadJSON.jsp")'>LoadJSON</li>
					<li onclick='loadPage("./ajax/loadXML.jsp")'>LoadXML</li>
				</ul>
			</fieldset>
		</div>
		<div id='Parsing'>
			<fieldset>
				<legend>Parsing</legend>
				<ul>
					<li>Parsing 1</li>
					<li>Parsing 2</li>
					<li>Parsing 3</li>
				</ul>
			</fieldset>
		</div>
	</div>

</body>
</html>