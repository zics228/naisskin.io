<html lang="en"><head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Поддержка - X2DROP.COM</title>
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
        textarea{
            margin-bottom: 5px;
        }
        .panel-body .alert:last-child{
            margin-bottom: 0px;
        }
        .bubble{
            margin-bottom: 5px !important;
        }
		
		</style>
		<script type="text/javascript">
            var reload = true;
            $(document).ready(function(){
                $(".support_button").on("click",function(){
                    var tid = $(this).data("x");
                    var title = $("#ticketTitle").val();
                    var cat = $("#ticketCat").val();
                    var body = $("#text"+tid).val();
                    var close = $("#check"+tid).is(":checked")?1:0;
                    var flag = $("#flag"+tid).is(":checked")?1:0;
                    var lmao = $("#lmao"+tid).is(":checked")?1:0;
                    var conf = "Are you sure you wish to submit this reply?";
                    if(tid==0){
                        if(title.length==0){
                            bootbox.alert("Title cannot be left blank.");
                            return;
                        }else if(cat==0){
                            bootbox.alert("Department cannot be left blank.");
                            return;
                        }else if(body.length==0){
                            bootbox.alert("Description cannot be left blank.");
                            return;
                        }
                        conf = "Are you sure you wish to submit this ticket?<br><br><b style='color:red'>WARNING: Misuse of this system will result in a 1 week ban.</b>";
                    }                        
                    bootbox.confirm(conf,function(result){
                        if(result){
                            $.ajax({
                                url:"/support_new",
                                type:"POST",
                                data:{"tid":tid,"title":title,"reply":body,"close":close,"cat":cat,"flag":flag,"lmao":lmao},
                                success:function(data){
                                    try{
                                        data = JSON.parse(data);
                                        if(data.success){
                                            bootbox.alert(data.msg,function(){
                                                if(reload){
                                                   location.reload(); 
                                               }                                                
                                            });                     
                                        }else{
                                            bootbox.alert(data.error);
                                        }
                                    }catch(err){
                                        bootbox.alert("Javascript error: "+err);
                                    }
                                },
                                error:function(err){
                                    bootbox.alert("AJAX error: "+err.statusText);
                                }
                            });
                        }
                    });                                        
                    return false;
                });             
            });			
		</script>	
	</head>
	<body style="margin-bottom: 62px;">
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
						<!-- <li><a href="bets.php"><i class="fa fa-line-chart fa-fw"></i> Bet History</a></li> -->
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
</script>		<div class="container" style="margin-bottom:20%">
<div class="alert alert-warning">У вас есть <a href="?open"><?=$open?> открытых вопросов</a> и <a href="?closed"><?=$closed?> закрытых вопросов.</a>.</div>
<? if(isset($_GET['new'])) { ?>
<div class="panel panel-info text-left">
<div class="panel-heading">
<input id="ticketTitle" type="text" class="form-control" placeholder="Тема..." maxlength="100">
</div>
<div class="panel-body">
<select class="form-control" id="ticketCat">
    <option value="0">Отдел...</option>
    <option value="1">Пополнение/Вывод</option>
    <option value="2">Ставки</option>
    <option value="3">Реклама</option>
    <option value="4">Other</option>
</select>
<br>
<textarea id="text0" class="form-control" rows="10" placeholder="Описание...."></textarea><br>
<button data-x="0" type="button" class="btn btn-danger btn-block support_button">Подать заявку</button>
</div>
</div>
<? } elseif(isset($_GET['closed'])) { ?>
<? foreach ($tickets as $key => $value) { ?>
<div class="panel panel-info text-left"><div class="panel-heading"><h4><?=$value['title']?></h4></div><div class="panel-body">
<? foreach ($value['messages'] as $key2 => $value2) { ?>
<div class="alert alert-<?=($user['steamid']==$value2['user'])?'info':'warning'?> bubble"><?=$value2['message']?></div>
<? } ?>
</div></div>
<? } ?>
<? } elseif(isset($_GET['open'])) { ?>
<div class="panel panel-info text-left"><div class="panel-heading"><h4><?=$ticket['title']?></h4></div><div class="panel-body">
<? foreach($ticket['messages'] as $key => $value): ?>
<div class="alert alert-<?=($user['steamid']==$value['user'])?'info':'warning'?> bubble"><?=$value['message']?></div>
<? endforeach; ?>
<div class="alert alert-info"><textarea id="text<?=$ticket['id']?>" class="form-control" rows="3" placeholder="Reply..."></textarea><label><input id="check<?=$ticket['id']?>" type="checkbox"> Close Ticket</label><button data-x="<?=$ticket['id']?>" type="button" class="btn btn-success btn-block support_button">Reply</button></div></div></div>
<? } else { ?>
	
<div class="panel panel-info">
  <div class="panel-heading"><h4>Как отправлять монеты другим людям?</h4></div>
  <div class="panel-body">
    <p>Чтобы отправить монеты, используйте команду в чате: "/send [steam64id] [сумма]".</p>

    <p>Например, чтобы отправить 100 монет пользователю с steam64id 76561198160884702 Вы должны написать команду в чат: "/send 76561198160884702 100".</p>

    <p>Также Вы можете найти в чате нужного вам человека, нажать на его аватарку правой кнопкой мыши, выбрать пункт "Передать монеты".</p>

    <p>Узнать свой steam64id вы можете с помощью сайта <a target="_blank" href="https://steamid.io/lookup">steamid.io</a></p>

  </div>
</div>
<div class="panel panel-info">
  <div class="panel-heading"><h4>Как получить больше монет? Могу я получить их бесплатно?</h4></div>
  <div class="panel-body">
    <p>Монеты можно получить путем внесения на сайт CS:GO скинов. Если Вы уже активировали бесплатные 100 монет, единственный способ получить больше монет - сделать депозит.</p>

    <b>НЕ ОБРАЩАЙТЕСЬ в службу поддержки с просьбой дать вам монеты!</b>
  </div>
</div>
<div class="panel panel-info">
  <div class="panel-heading"><h4>Как мне создать код реферала?</h4></div>
  <div class="panel-body">
    <p>Чтобы создать Ваш собственный реферальный код, перейдите на эту <a target="_blank" href="/affiliates">страницу</a>.</p>
  </div>
</div>
<div class="panel panel-info">
  <div class="panel-heading"><h4>Я принял предложение обмена, но не получил монеты!?</h4></div>
  <div class="panel-body">
    После того, как Вы приняли предложение обмена подождите 5 минут и Вы получите монеты.
	Если Вы не получили своих монет, то подождите еще несколько минут.
	Напишите в поддержку, только если Вы не получили монеты в течении 2 часов.
  </div>
</div>
<div class="panel panel-info">
  <div class="panel-heading"><h4>Ошибка при отправке обмена. Мобильный аутентификатор или проблемы с Steam-платформой.</h4></div>
  <div class="panel-body">
	<b>Возможные способы решения:</b>
	<br>
	- C момента включения функции мобильного подтверждения прошло менее 7 дней.
	<br>
	- Ваш профиль Steam скрыт.
	<br>
	- Указана неправильная ссылка на обмен.
	<br>
	- Проверьте, что платформа Steam не испытавает трудностей с инвентарями (Delayed). Steam Status
	<br>
	Если Вы уверены, что ни одной из этих проблем нет, то пробуйте позднее еще раз.
  </div>
</div>
<div class="panel panel-info">
  <div class="panel-heading"><h4>Я получаю сообщение "соединение потеряно..."!</h4></div>
  <div class="panel-body">
        <b>Пожалуйста, выполните данные пункты и затем попробуйте подключиться:</b>
	<br>
	- Используйте различные браузеры.
	<br>
	- Очистите куки и кэш в Вашем браузере.
	<br>
	- Перезагрузите свой роутер.
	<br>
	Затем начните обновлять страницу с сайтом до момента, пока не удастся подключитьс
  </div>
</div>
<a class="btn btn-danger btn-lg btn-block" href="?new">Все еще нужна помощь? Пожалуйста, напишите Вашу проблему в поддержку, наши сотрудники ответят Вам!</a>
 <? } ?>
		</div>
		<footer class="well footer">
	<div class="">
		<div class="pull-left" style="overflow:hidden">
		<!--	<a href="https://www.facebook.com/CSGO.mkdotcom" target="_blank"><img class="rounded" src="/template/img/social/facebook_icon.png"></a>  -->
		<!--	<a href="https://twitter.com/CSGO.mk" target="_blank"><img class="rounded" src="/template/img/social/twitter_icon.png"></a>  -->
			<!-- <a href="#" target="_blank"><img class="rounded" src="/template/img/social/youtube icon.png"></a> -->
			<!-- <a href="#" target="_blank"><img class="rounded" src="/template/img/social/reddit icon.png"></a> -->
			<!-- <a href="#" target="_blank"><img class="rounded" src="/template/img/social/twitch icon.png"></a> -->
			<a href="http://steamcommunity.com/groups/CSGOBananas_com" target="_blank"><img class="rounded" src="/template/img/social/steam_icon.png"></a>
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
	
</body></html>