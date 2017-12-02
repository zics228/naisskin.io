
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Честность - X2DROP.COM</title>
		<link href="/template/css/bootstrap.min.new.css" rel="stylesheet">
<link href="/template/css/font-awesome.min.css" rel="stylesheet">
<link href="/template/css/dataTables.bootstrap.min.css" rel="stylesheet">

<link href="/template/css/mineNew.css?v=5" rel="stylesheet">
<link id="style" href="" rel="stylesheet">

<link rel="shortcut icon" href="favicon.ico">

<script src="/template/js/jquery-1.11.1.min.js"></script>
<script src="/template/js/jquery.cookie.js"></script>
<script src="/template/js/bootstrap.min.js"></script>
<script src="/template/js/bootbox.min.js"></script>
<script src="/template/js/jquery.dataTables.min.js"></script>
<script src="/template/js/dataTables.bootstrap.js"></script>
<script src="/template/js/tinysort.js"></script>
<script src="/template/js/expanding.js"></script>
<script src="/template/js/theme.js"></script>
<style>

</style>
<script>
	var SETTINGS = ["confirm","sounds","dongers","hideme"];
	function inlineAlert(x,y){
		$("#inlineAlert").removeClass("alert-success alert-danger alert-warning hidden");
		if(x=="success"){
			$("#inlineAlert").addClass("alert-success").html("<i class='fa fa-check'></i><b> "+y+"</b>");
		}else if(x=="error"){
			$("#inlineAlert").addClass("alert-danger").html("<i class='fa fa-exclamation-triangle'></i> "+y);
		}else if(x=="cross"){
			$("#inlineAlert").addClass("alert-danger").html("<i class='fa fa-times'></i> "+y);
		}else{
			$("#inlineAlert").addClass("alert-warning").html("<b>"+y+" <i class='fa fa-spinner fa-spin'></i></b>");
		}
	}
	function resizeFooter(){
		var f = $('.footer').outerHeight(true);
		var w = $(window).outerHeight(true);
		$('body').css('margin-bottom',f);
	}
	$(window).resize(function(){
		resizeFooter();
	});
	if (!String.prototype.format) {
	  String.prototype.format = function() {
	    var args = arguments;
	    return this.replace(/{(\d+)}/g, function(match, number) { 
	      return typeof args[number] != 'undefined'
	        ? args[number]
	        : match
	      ;
	    });
	  };
	}
	function setCookie(key,value){
		var exp = new Date();
		exp.setTime(exp.getTime()+(365*24*60*60*1000));
		document.cookie = key+"="+value+"; expires="+exp.toUTCString();
	}
	function getCookie(key){
		var patt = new RegExp(key+"=([^;]*)");
		var matches = patt.exec(document.cookie);
		if(matches){
			return matches[1];
		}
		return "";
	}
	function formatNum(x){
		if(Math.abs(x)>=10000){
			return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		}
		return x;
	}
	$(document).ready(function(){
		resizeFooter();
		for(var i=0;i<SETTINGS.length;i++){
			var v = getCookie("settings_"+SETTINGS[i]);
			if(v=="true"){
				$("#settings_"+SETTINGS[i]).prop("checked",true);	
			}else if(v=="false"){
				$("#settings_"+SETTINGS[i]).prop("checked",false);	
			}			
		}
	});
</script>
		<style>
			
		</style>
		<script type="text/javascript">

			
		</script>	
	</head>
	<body>
		<nav class="navbar navbar-default navbar-static-top" role="navigation">
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
				<span class="sr-only">Toggle navigation</span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<!-- <a class="navbar-brand" style="padding-top:0px;padding-bottom:0px;padding-right:0px" href="./"><img alt="X2DROP.COM" height="34" style="margin-top:8px;margin-bottom:8px;margin-right:5px" src="/template/img/just.png"></a> -->
            <a class="navbar-brand" href="/"><div id="logo" class="logo"></div></a>

		</div>
<div id="navbar" class="navbar-collapse collapse">
			<ul class="nav navbar-nav">
				<li class="" style="margin-left:5px"><a href="/">Главная</a></li>
				<li class=""><a href="/deposit">Пополнить</a></li>
				<li class=""><a href="/withdraw">Вывести</a></li>
				<li class=""><a href="/rolls">Честность</a></li>
				<li class=""><a href="/affiliates">Рефералы</a></li>
				<li><a href="#" data-toggle="modal" data-target="#promoModal">Промокод</a></li>
				<li class=""><a href="/support">Поддержка</a></li>
			</ul>
			<? if($user): ?>
				<ul class="nav navbar-nav navbar-right">
						<!-- <li><a href="#"><i class="fa fa-gear fa-fw"></i> Settings</a></li> -->
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false" style="padding-top:0px;padding-bottom:0px;line-height:50px"> <img class="rounded" src="<?=$user['avatar']?>"> <b><?=$user['name']?></b> <span class="caret"></span></a>
					<ul class="dropdown-menu" role="menu">
						<!-- <li><a href="#" data-toggle="modal" data-target="#pointsModal"><i class="fa fa-user fa-fw"></i> Profile</a></li> -->
						<li><a href="#" data-toggle="modal" data-target="#promoModal"><i class="fa fa-ticket fa-fw"></i> Активировать промокод</a></li>
						<!-- <li><a href="bets.php"><i class="fa fa-line-chart fa-fw"></i> История обменов</a></li> -->
						<li><a href="/offers"><i class="fa fa-history fa-fw"></i> История обменов</a></li>
						<li><a href="/transfers"><i class="fa fa-exchange fa-fw"></i> История переводов</a></li>
						<!-- <li><a href="#" data-toggle="modal" data-target="#sendModal"><i class="fa fa-exchange fa-fw"></i> Send Credits</a></li> -->
						<li><a href="#" data-toggle="modal" data-target="#settingsModal"><i class="fa fa-cog fa-fw"></i> Настройки</a></li>

						<li><a href="#" data-toggle="modal" data-target="#my64id"><i class="fa fa-question-circle"></i> Мой Steam64Id</a></li>
						
						
						
                        <li class="divider"></li>
						<li><a href="/exit"><i class="fa fa-power-off fa-fw"></i> Выход</a></li>
					</ul>
				</li>
						</ul>
			<? else: ?>
			<ul class="nav navbar-nav navbar-right">
				<a href="/login"><img style="margin-top:3px;" src="/template/img/green.png"></a>
			</ul>
			<? endif; ?>
		</div>
	</div>
</nav>
<div class="modal fade" id="my64id">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title"><b>Мой Steam64Id</b></h4>
			</div>
			<div class="modal-body">
				<b><?=($user)?$user['steamid']:''?></b>			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-danger" data-dismiss="modal">Закрыть</button>
			</div>
		</div>
	</div>
</div>
<div class="modal fade" id="settingsModal">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title"><b>Изменить настройки</b></h4>
			</div>
			<div class="modal-body">
				<form>	  			        	
								  
				  	<div class="checkbox">
				    	<label>
				      		<input type="checkbox" id="settings_confirm" checked>
				      		<strong>Подтвержать все ставки, сумма которых больше 10,000</strong>
				    	</label>
				  	</div>
				  	<div class="checkbox">
				    	<label>
				      		<input type="checkbox" id="settings_sounds" checked>
				      		<strong>Включить звук</strong>
				    	</label>
				  	</div>
				  	<div class="checkbox">
				    	<label>
				      		<input type="checkbox" id="settings_dongers">
				      		<strong>Отображать баланс в $</strong>
				    	</label>
				  	</div>
				  	<div class="checkbox">
				    	<label>
				      		<input type="checkbox" id="settings_hideme">
				      		<strong>Скрыть мою ссылку на профиль в чате</strong>
				    	</label>
				  	</div>
				  	
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-danger" data-dismiss="modal">Закрыть</button>
				<button type="button" class="btn btn-success" onclick="saveSettings()">Сохранить настройки</button>
			</div>
		</div>
	</div>
</div>
<div class="modal fade" id="promoModal">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title"><b>Активация промокода!</b></h4>
			</div>
			<div class="modal-body">
				
				<div class="form-group">
					<label for="exampleInputEmail1">Введите промокод</label>
					<input type='text' class='form-control' id='promocode' value=''>				</div>				  	
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-danger" data-dismiss="modal">Закрыть</button>
				<button type="button" class="btn btn-success" onclick="redeem()">Активировать</button>
			</div>
		</div>
	</div>
</div>
<div class="modal fade" id="chatRules">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title"><b>Правила чата</b></h4>
			</div>
			<div class="modal-body" style="font-size:24px">				  
				<ol>
					<li>Не спамить</li>
					<li>Не выпрашивать монеты</li>
					<li>Не рекламировать других сайтов</li>
					<li>Не злоупотреблять CAPS LOCK</li>
					<li>Не трейдить, продавать, покупать</li>
					<li>Не писать промо коды</li>
					<li>Не использовать промо коды в имени</li>
					<li>Не продавать, рекламировать "Предсказания"</li>
					<li>Не распространять скрипты</li>
					<li>Использовать язык комнаты</li>
					<li>Одно "Предсказание" за розыгрыш</li>
					</ol>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-success btn-block" data-dismiss="modal">Понял!</button>
			</div>
		</div>
	</div>
</div>
<script>
function saveSettings(){
	for(var i=0;i<SETTINGS.length;i++){
		setCookie("settings_"+SETTINGS[i],$("#settings_"+SETTINGS[i]).is(":checked"));
	}
	$("#settingsModal").modal("hide");
	if($("#settings_dongers").is(":checked")){
		$("#balance").html("please reload");
	}else{
		$("#balance").html("please reload");
	}
}
function redeem(){
	var code = $("#promocode").val();
	$.ajax({
		url:"/redeem?code="+code,
		success:function(data){		
			try{
				data = JSON.parse(data);
				if(data.success){
					bootbox.alert("Success! You've received "+data.credits+" credits.");					
				}else{
					bootbox.alert(data.error);
				}
			}catch(err){
				bootbox.alert("Javascript error: "+err);
			}
		},
		error:function(err){
			bootbox.alert("AJAX error: "+err);
		}
	});
}
</script>		<div class="container">
				<?php if(isset($_GET['id'])) { ?>
				<table class="table table-striped">
					<thead><tr>
					<th>Время</th>
					<th>Раунд</th>
					<th>0</th>
					<th>1</th>
					<th>2</th>
					<th>3</th>
					<th>4</th>
					<th>5</th>
					<th>6</th>
					<th>7</th>
					<th>8</th>
					<th>9</th>
					</tr></thead>
					<tbody>
					<? foreach($rolls as $key => $value) { ?>
					<tr><td><?=$value['time']?></td><td><?=$value['start']?>_</td>
					<?php for($i = 0; $i <= 9; $i++) {
						if($value['rolls'][$i]) {
							$r = $value['rolls'][$i];
							if($r['roll'] == 0) {
								$z = ' class="td-val ball-0" id="'.$r['id'].'"';
							} elseif(($r['roll'] > 0) && ($r['roll'] < 8)) {
								$z = ' class="td-val ball-1" id="'.$r['id'].'"';
							} elseif(($r['roll'] > 7) && ($r['roll'] < 15)) {
								$z = ' class="td-val ball-8" id="'.$r['id'].'"';
							}
							echo '<td'.$z.'>'.$r['roll'].'</td>';
						} else {
							echo '<td></td>';
						}
					} ?>
					<? } ?>
					</tbody></table>
				<?php } else { ?>

					
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title"><b>Provably Fair <i class="fa fa-lock"></i></b></h3>
				</div>
				<div class="panel-body">

					


				<p>	Все числа X2DROP.COM генерируются с использованием доказуемо-справедливой системы. 
					Это означает, что администраторы сайта не смогут изменить исход какого-либо раунда. 
					Игроки могут воспроизвести любой прошедший раунд, используя код:
				</p>

				                    <pre>$server_seed = "ce315577167d1c34bc28ceecfc700197";
$round_id = "1";
$hash = hash("sha256",$server_seed."-".$round_id);
$roll = hexdec(substr($hash,0,8)) % 15;
echo "Round $round_id = $roll";</pre>

				<p>
					
					Вы можете выполнить PHP код прямо из вашего веб-браузера с помощью инструмента такого как <a href="http://www.phptester.net/" target="_blank">PHP Tester</a>. 
					Просто скопируйте и вставьте код в окно, замените server_seed, lotto, и round_id на нужные значения. 
					Выполните код, чтобы убедится в честности рулетки.

				</p>

				<p>
				Для получения дополнительной информации о контроле честности <a href="/faq">посетите FAQ страницу</a>.
				</p>

				</div>
			</div>

						<table class='table table-striped'>
						<thead><tr><th>Date</th><th>Код сервера</th><th>Лотерея</th><th>Раунд</th></tr></thead>
						<tbody>
						<? foreach($rolls as $key => $value): ?>
							<tr><td><?=$value['date']?></td><td><b class='text-<?=($key==0)?'danger':'success'?>'><?=($key==0)?"<i class='fa fa-lock fa-fw'></i>  КОД СЕРВЕРА В ДАННЫЙ МОМЕНТ ИСПОЛЬЗУЕТСЯ</b>":"<i class='fa fa-check-circle fa-fw'></i> ".$value['seed'].""?></td><td><?=$value['time']?></td><td><a href='?id=<?=$value['id']?>'><?=$value['rolls']?></a></td></tr>
						<? endforeach; ?>
						</tbody></table>
						<?php } ?>
						</div>	
		<footer class="well footer">
	<div class="">
		<div class="pull-left" style="overflow:hidden">
			<!-- <a href="#" target="_blank"><img class="rounded" src="/template/img/social/youtube icon.png"></a> -->
			<!-- <a href="#" target="_blank"><img class="rounded" src="/template/img/social/reddit icon.png"></a> -->
			<!-- <a href="#" target="_blank"><img class="rounded" src="/template/img/social/twitch icon.png"></a> -->
		</div>
		<div class="pull-right" style="overflow:hidden;">
			<!-- Prices provided by <a href="http://csgo.steamanalyst.com/" target="_blank">SteamAnalyst</a> -->
			<a href="http://csgo.steamanalyst.com/" target="_blank"><img class="" src="/template/img/social/sa.gif"></a>
		</div>
		<ul class="list-inline" style="display:inline-block;margin-top:10px">
			<li>Copyright © 2016, X2DROP.COM  - All rights reserved.</li>
			<li><a href="/tos">Условия использования</a></li>
			<li><a href="/faq">FAQ</a></li>
			<li><a href="/support?new">Контакты</a></li>
			<li><a href="http://steampowered.com" target="_target">Powered by Steam</a></li>
		</ul>
	</div>	
</footer>			
	</body>
</html>