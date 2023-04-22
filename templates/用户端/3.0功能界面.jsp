<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>

<html lang="zh">

<head>
	<meta charset="GBK">
	<title>经济预测与政策模拟系统平台</title>
	<link rel="stylesheet" type="text/css" href="../css/3.0_function/3.0_function_ByZhangjiahui.css"/>
	<link rel="stylesheet" href="../css/3.0_function/3.0_function_jquery.treeview.css" type="text/css"/>

	<link rel="stylesheet" type="text/css" href="../css/3.0_function/normalize.css" media="screen">
	<link rel="stylesheet" type="text/css" href="../css/3.0_function/bootstrap.min.css" media="screen">
	<link rel="stylesheet" type="text/css" href="../css/3.0_function/frappe_theme.css" media="screen">
	<link rel="stylesheet" type="text/css" href="../css/3.0_function/index.css" media="screen">
	<link rel="stylesheet" type="text/css" href="../css/3.0_function/default.css" media="screen">

	<script src="../js/3.0_function/highlight.pack.js"></script>
	<script>hljs.initHighlightingOnLoad();</script>
	<script async defer src="../js/3.0_function/buttons.js"></script>

	<script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js" type="text/javascript"></script>
	<script src="../js/3.0_function/jquery.treeview.js" type="text/javascript"></script>
	<script src="../js/3.0_function/jquery.cookie.js"></script>

	<link rel="stylesheet" href="https://static.runoob.com/assets/js/jquery-treeview/jquery.treeview.css"/>

	<script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js" type="text/javascript"></script>

	<script src="https://static.runoob.com/assets/js/jquery-treeview/jquery.treeview.js"
			type="text/javascript"></script>

</head>
<style>
	.pop_win {
		position: fixed;
		opacity: 0;
		top: 7%;
		left: 7%;
		width: 86%;
		height: 86%;
		padding: 10px;
		border: 2px solid rebeccapurple;
		background-color: white;
		z-index: -1;
	}

	.folder:hover {
		color: green;
	}

	.a_style {
		text-decoration: none;
		color: black;
	}

	.a_style:hover {
		color: green;
	}

	.a_style:visited {
		color: black;
	}
</style>

<body style="scrollbar-arrow-color:yellow;scrollbar-base-color:lightsalmon">

<div class="navigation_bars" style="z-index:999">
	<img class="logo0" src="../images/logo0.jpg">
	<img class="logo" src="../images/logo.jpg">
	<div class="navigation_textbox"><!--导航栏-->
		<div class="text_field">
			<span>首页</span>
		</div>
		<div class="text_field">
			<span>关于我们</span>
		</div>
		<div class="text_field">
			<span>团队成员</span>
		</div>
		<div class="text_field">
			<span>解决方案</span>
		</div>
		<div class="text_field">
			<span>产品系列</span>
		</div>
		<div class="text_field">
			<span>人才招聘</span>
		</div>
		<div class="text_field">
			<span>联系我们</span>
		</div>
	</div>
</div>

<div id="log1" class="tab-block">
	<div>
		<a class="tab-button" href="javascript:void(0);" onclick="popLog1()">经济预测</a>
		<a class="tab-button" href="javascript:void(0);" onclick="popLog2()">政策模拟</a>
		<a class="tab-buttons" href="javascript:void(0);" onclick="popLogs(1)">中国</a>
		<a class="tab-buttons" href="javascript:void(0);" onclick="popLogs(2)">地区</a>
		<a class="tab-buttons" href="javascript:void(0);" onclick="popLogs(3)">行业</a>
		<a class="tab-buttons" href="javascript:void(0);" onclick="popLogs(4)">全球</a>
		<br/><br/><br/>
	</div>

	<ul id="browser1" class="filetree treeview-famfamfam">
		<li id="china" style="display: none;"><span>中国预测</span>
			<ul class="filetree treeview-famfamfam">
				<li class="closed"><span class="folder">国民经济核算</span>
					<ul>
						<li class="closed"><span class="folder">国内生产总值（季）</span>
							<ul>
								<li><span class="file">
									<a href="GDP_现价_当季值.html" class="a_style">GDP_现价_当季值</a>
								</span></li>
								<li><span class="file">
							<form action="HelloForm" method="GET">
								<input type="hidden" value="GDP_现价_第一产业_当季值" name="name">
								<input type="submit" value="GDP_现价_第一产业_当季值" class="a_style"/>
							</form>
						</span></li>

								<li><span class="file">
							<form action="HelloForm" method="GET">
								<input type="hidden" value="GDP_现价_第二产业_当季值" name="name">
								<input type="submit" value="GDP_现价_第二产业_当季值" class="a_style"/>
							</form>
						</span></li>


								<li><span class="file">
							<form action="HelloForm" method="GET">
								<input type="hidden" value="GDP_现价_第三产业_当季值" name="name">
								<input type="submit" value="GDP_现价_第三产业_当季值" class="a_style"/>
							</form>
						</span></li>
								<li><span class="file">
							<form action="HelloForm" method="GET">
								<input type="hidden" value="GDP_现价_农林牧渔业_当季值" name="name">
								<input type="submit" value="GDP_现价_农林牧渔业_当季值" class="a_style"/>
							</form>
						</span></li>
								<li><span class="file">
							<form action="HelloForm" method="GET">
								<input type="hidden" value="GDP_现价_工业_当季值" name="name">
								<input type="submit" value="GDP_现价_工业_当季值" class="a_style"/>
							</form>
						</span></li>
								<li><span class="file">
							<form action="HelloForm" method="GET">
								<input type="hidden" value="GDP_现价_建筑业_当季值" name="name">
								<input type="submit" value="GDP_现价_建筑业_当季值" class="a_style"/>
							</form>
						</span></li>
								<li><span class="file">
							<form action="HelloForm" method="GET">
								<input type="hidden" value="GDP_现价_批发和零售业_当季值" name="name">
								<input type="submit" value="GDP_现价_批发和零售业_当季值" class="a_style"/>
							</form>
						</span></li>
								<li><span class="file">
							<form action="HelloForm" method="GET">
								<input type="hidden" value="GDP_现价_交通运输、仓储和邮政业_当季值" name="name">
								<input type="submit" value="GDP_现价_交通运输、仓储和邮政业_当季值" class="a_style"/>
							</form>
						</span></li>
								<li><span class="file">
							<form action="HelloForm" method="GET">
								<input type="hidden" value="GDP_现价_住宿和餐饮业_当季值" name="name">
								<input type="submit" value="GDP_现价_住宿和餐饮业_当季值" class="a_style"/>
							</form>
						</span></li>
								<li><span class="file">
							<form action="HelloForm" method="GET">
								<input type="hidden" value="GDP_现价_金融业_当季值" name="name">
								<input type="submit" value="GDP_现价_金融业_当季值" class="a_style"/>
							</form>
						</span></li>
								<li><span class="file">
							<form action="HelloForm" method="GET">
								<input type="hidden" value="GDP_现价_房地产业_当季值" name="name">
								<input type="submit" value="GDP_现价_房地产业_当季值" class="a_style"/>
							</form>
						</span></li>
								<li><span class="file">
							<form action="HelloForm" method="GET">
								<input type="hidden" value="GDP_现价_其他行业_当季值" name="name">
								<input type="submit" value="GDP_现价_其他行业_当季值" class="a_style"/>
							</form>
						</span></li>
							</ul>
						</li>
						<li class="closed"><span class="folder">国内生产总值（年）</span>
							<ul>
								<li>
									<span class="file">
										<a href="GDP_现价.html" class="a_style">GDP_现价</a>
									</span>
								</li>
								</span></li>
								<li><span class="file">
							<form action="HelloForm" method="GET">
								<input type="hidden" value="GDP_现价_第一产业" name="name">
								<input type="submit" value="GDP_现价_第一产业" class="a_style"/>
							</form>
						</span></li>
								<li class="closed"><span class="folder">GDP_现价_第二产业</span>
									<ul>
										<li><span class="file">
									<form action="HelloForm" method="GET">
										<input type="hidden" value="GDP_现价_第二产业" name="name">
										<input type="submit" value="GDP_现价_第二产业" class="a_style"/>
							</form>
						</span></li>
										<li><span class="file">
									<form action="HelloForm" method="GET">
										<input type="hidden" value="GDP_现价_第二产业_工业" name="name">
										<input type="submit" value="GDP_现价_第二产业_工业" class="a_style"/>
							</form>
						</span></li>
										<li><span class="file">
									<form action="HelloForm" method="GET">
										<input type="hidden" value="GDP_现价_第二产业_工业_制造业" name="name">
										<input type="submit" value="GDP_现价_第二产业_工业_制造业" class="a_style"/>
							</form>
						</span></li>
										<li><span class="file">
									<form action="HelloForm" method="GET">
										<input type="hidden" value="GDP_现价_第二产业_建筑业" name="name">
										<input type="submit" value="GDP_现价_第二产业_建筑业" class="a_style"/>
							</form>
						</span></li>
									</ul>
								</li>
								<li class="closed"><span class="folder">GDP_现价_第三产业</span>
									<ul>
										<li><span class="file">
									<form action="HelloForm" method="GET">
										<input type="hidden" value="GDP_现价_第三产业" name="name">
										<input type="submit" value="GDP_现价_第三产业" class="a_style"/>
							</form>
						</span></li>
										<li><span class="file">
									<form action="HelloForm" method="GET">
										<input type="hidden" value="GDP_现价_第三产业_批发和零售业" name="name">
										<input type="submit" value="GDP_现价_第三产业_批发和零售业" class="a_style"/>
							</form>
						</span></li>
										<li><span class="file">
									<form action="HelloForm" method="GET">
										<input type="hidden" value="GDP_现价_第三产业_交通运输、仓储及邮政业" name="name">
										<input type="submit" value="GDP_现价_第三产业_交通运输、仓储及邮政业" class="a_style"/>
							</form>
						</span></li>
										<li><span class="file">
									<form action="HelloForm" method="GET">
										<input type="hidden" value="GDP_现价_第三产业_住宿和餐饮业" name="name">
										<input type="submit" value="GDP_现价_第三产业_住宿和餐饮业" class="a_style"/>
							</form>
						</span></li>
										<li><span class="file">
									<form action="HelloForm" method="GET">
										<input type="hidden" value="GDP_现价_第三产业_金融业" name="name">
										<input type="submit" value="GDP_现价_第三产业_金融业" class="a_style"/>
							</form>
						</span></li>
										<li><span class="file">
									<form action="HelloForm" method="GET">
										<input type="hidden" value="GDP_现价_第三产业_房地产业" name="name">
										<input type="submit" value="GDP_现价_第三产业_房地产业" class="a_style"/>
							</form>
						</span></li>
										<li><span class="file">
									<form action="HelloForm" method="GET">
										<input type="hidden" value="GDP_现价_第三产业_信息传输、软件和信息技术服务业" name="name">
										<input type="submit" value="GDP_现价_第三产业_信息传输、软件和信息技术服务业"
											   class="a_style"/>
							</form>
						</span></li>
										<li><span class="file">
									<form action="HelloForm" method="GET">
										<input type="hidden" value="GDP_现价_第三产业_租赁和商务服务业" name="name">
										<input type="submit" value="GDP_现价_第三产业_租赁和商务服务业" class="a_style"/>
							</form>
						</span></li>
										<li><span class="file">
									<form action="HelloForm" method="GET">
										<input type="hidden" value="GDP_现价_第三产业_其他" name="name">
										<input type="submit" value="GDP_现价_第三产业_其他" class="a_style"/>
							</form>
						</span></li>

									</ul>
								</li>
								<li><span class="file">GDP_人均GDP</span></li>
								<li><span class="file">GDP指数</span></li>
								<li class="closed"><span class="folder">GDP指数_第一产业</span>
									<ul>
										<li><span class="file">
									<form action="HelloForm" method="GET">
										<input type="hidden" value="GDP指数_第一产业" name="name">
										<input type="submit" value="GDP指数_第一产业" class="a_style"/>
							</form>
						</span></li>
										<li><span class="file">
									<form action="HelloForm" method="GET">
										<input type="hidden" value="GDP指数_第一产业_农林牧渔业" name="name">
										<input type="submit" value="GDP指数_第一产业_农林牧渔业" class="a_style"/>
							</form>
						</span></li>

									</ul>
								</li>
								<li class="closed"><span class="folder">GDP指数_第二产业</span>
									<ul>
										<li><span class="file">
									<form action="HelloForm" method="GET">
										<input type="hidden" value="GDP指数_第二产业" name="name">
										<input type="submit" value="GDP指数_第二产业" class="a_style"/>
							</form>
						</span></li>
										<li><span class="file">
									<form action="HelloForm" method="GET">
										<input type="hidden" value="GDP指数_第二产业_工业" name="name">
										<input type="submit" value="GDP指数_第二产业_工业" class="a_style"/>
							</form>
						</span></li>
										<li><span class="file">
									<form action="HelloForm" method="GET">
										<input type="hidden" value="GDP指数_第二产业_建筑业" name="name">
										<input type="submit" value="GDP指数_第二产业_建筑业" class="a_style"/>
							</form>
						</span></li>

									</ul>
								</li>
								<li class="closed"><span class="folder">GDP指数_第三产业</span>
									<ul>
										<li><span class="file">
									<form action="HelloForm" method="GET">
										<input type="hidden" value="GDP指数_第三产业" name="name">
										<input type="submit" value="GDP指数_第三产业" class="a_style"/>
							</form>
						</span></li>
										<li><span class="file">
									<form action="HelloForm" method="GET">
										<input type="hidden" value="GDP指数_第三产业_交通运输、仓储及邮电通信业" name="name">
										<input type="submit" value="GDP指数_第三产业_交通运输、仓储及邮电通信业" class="a_style"/>
							</form>
						</span></li>

									</ul>
								</li>
								<li><span class="file">GDP指数_人均GDP</span></li>
							</ul>
						</li>
					</ul>
				</li>
				<li class="closed"><span class="folder">价格指数</span>
					<ul>
						<li class="closed"><span class="folder">居民消费价格指数（CPI）</span>
							<ul>
								<li><span class="file">
							<form action="HelloForm" method="GET">
								<input type="hidden" value="CPI_当月同比" name="name">
								<input type="submit" value="CPI_当月同比" class="a_style"/>
							</form>
						</span></li>
								<li><span class="file">
							<form action="HelloForm" method="GET">
								<input type="hidden" value="CPI_食品_当月同比" name="name">
								<input type="submit" value="CPI_食品_当月同比" class="a_style"/>
							</form>
						</span></li>
								<li><span class="file">
							<form action="HelloForm" method="GET">
								<input type="hidden" value="CPI_衣着_当月同比" name="name">
								<input type="submit" value="CPI_衣着_当月同比" class="a_style"/>
							</form>
						</span></li>
								<li><span class="file">
							<form action="HelloForm" method="GET">
								<input type="hidden" value="CPI_居住_当月同比" name="name">
								<input type="submit" value="CPI_居住_当月同比" class="a_style"/>
							</form>
						</span></li>
								<li><span class="file">
							<form action="HelloForm" method="GET">
								<input type="hidden" value="CPI_生活用品及服务_当月同比" name="name">
								<input type="submit" value="CPI_生活用品及服务_当月同比" class="a_style"/>
							</form>
						</span></li>
								<li><span class="file">
							<form action="HelloForm" method="GET">
								<input type="hidden" value="CPI_交通和通信_当月同比" name="name">
								<input type="submit" value="CPI_交通和通信_当月同比" class="a_style"/>
							</form>
						</span></li>
								<li><span class="file">
							<form action="HelloForm" method="GET">
								<input type="hidden" value="CPI_教育文化和娱乐_当月同比" name="name">
								<input type="submit" value="CPI_教育文化和娱乐_当月同比" class="a_style"/>
							</form>
						</span></li>
								<li><span class="file">
							<form action="HelloForm" method="GET">
								<input type="hidden" value="CPI_医疗保健_当月同比" name="name">
								<input type="submit" value="CPI_医疗保健_当月同比" class="a_style"/>
							</form>
						</span></li>
							</ul>
						</li>
						<li class="closed"><span class="folder">商品零售价格指数（RPI）</span>
							<ul>
								<li><span class="file">RPI_当月同比</span></li>
							</ul>
						</li>
						<li class="closed"><span class="folder">工业生产者出厂价格指数（PPI）</span>
							<ul>
								<li><span class="file">
							<form action="HelloForm" method="GET">
								<input type="hidden" value="PPI_全部工业品_当月同比" name="name">
								<input type="submit" value="PPI_全部工业品_当月同比" class="a_style"/>
							</form>
						</span></li>
								<li><span class="file">
							<form action="HelloForm" method="GET">
								<input type="hidden" value="PPI_生产资料_当月同比" name="name">
								<input type="submit" value="PPI_生产资料_当月同比" class="a_style"/>
							</form>
						</span></li>
								<li><span class="file">
							<form action="HelloForm" method="GET">
								<input type="hidden" value="PPI_生活资料_当月同比" name="name">
								<input type="submit" value="PPI_生活资料_当月同比" class="a_style"/>
							</form>
						</span></li>
							</ul>
						</li>
					</ul>

				</li>
				<li class="closed"><span class="folder">对外贸易</span>
					<ul>
						<li><span class="file">
					<form action="HelloForm" method="GET">
						<input type="hidden" value="进出口金额_当月值" name="name">
						<input type="submit" value="进出口金额_当月值" class="a_style"/>
							</form>
						</span></li>
						<li><span class="file">
					<form action="HelloForm" method="GET">
						<input type="hidden" value="出口金额_当月值" name="name">
						<input type="submit" value="出口金额_当月值" class="a_style"/>
							</form>
						</span></li>
						<li><span class="file">
					<form action="HelloForm" method="GET">
						<input type="hidden" value="进口金额_当月值" name="name">
						<input type="submit" value="进口金额_当月值" class="a_style"/>
							</form>
						</span></li>
						<li><span class="file">
					<form action="HelloForm" method="GET">
						<input type="hidden" value="贸易差额_当月值" name="name">
						<input type="submit" value="贸易差额_当月值" class="a_style"/>
							</form>
						</span></li>
						<li><span class="file">
					<form action="HelloForm" method="GET">
						<input type="hidden" value="进出口金额_当月同比" name="name">
						<input type="submit" value="进出口金额_当月同比" class="a_style"/>
							</form>
						</span></li>
						<li><span class="file">
					<form action="HelloForm" method="GET">
						<input type="hidden" value="出口金额_当月同比" name="name">
						<input type="submit" value="出口金额_当月同比" class="a_style"/>
							</form>
						</span></li>
						<li><span class="file">
					<form action="HelloForm" method="GET">
						<input type="hidden" value="进口金额_当月同比" name="name">
						<input type="submit" value="进口金额_当月同比" class="a_style"/>
							</form>
						</span></li>

					</ul>

				</li>
				<li class="closed"><span class="folder">固定资产投资</span>
					<ul>
						<li class="closed"><span class="folder">固定资产投资（年）</span>
							<ul>
								<li><span class="file">
							<form action="HelloForm" method="GET">
								<input type="hidden" value="固定资产投资价格指数" name="name">
								<input type="submit" value="固定资产投资价格指数" class="a_style"/>
							</form>
						</span></li>
								<li><span class="file">
							<form action="HelloForm" method="GET">
								<input type="hidden" value="固定资产投资价格指数_建筑安装工程" name="name">
								<input type="submit" value="固定资产投资价格指数_建筑安装工程" class="a_style"/>
							</form>
						</span></li>
								<li><span class="file">
							<form action="HelloForm" method="GET">
								<input type="hidden" value="固定资产投资价格指数_设备工器具购置" name="name">
								<input type="submit" value="固定资产投资价格指数_设备工器具购置" class="a_style"/>
							</form>
						</span></li>
								<li><span class="file">
							<form action="HelloForm" method="GET">
								<input type="hidden" value="固定资产投资价格指数_其他费用" name="name">
								<input type="submit" value="固定资产投资价格指数_其他费用" class="a_style"/>
							</form>
						</span></li>
								<li><span class="file">
							<form action="HelloForm" method="GET">
								<input type="hidden" value="实际利用外资额_外商直接投资" name="name">
								<input type="submit" value="实际利用外资额_外商直接投资" class="a_style"/>
							</form>
						</span></li>
							</ul>
						</li>
						<li class="closed"><span class="folder">固定资产投资（季）</span>
							<ul>
								<li><span class="file">
							<form action="HelloForm" method="GET">
								<input type="hidden" value="固定资产投资价格指数_当季同比" name="name">
								<input type="submit" value="固定资产投资价格指数_当季同比" class="a_style"/>
							</form>
						</span></li>
								<li><span class="file">
							<form action="HelloForm" method="GET">
								<input type="hidden" value="固定资产投资价格指数_设备、工器具购置_当季同比" name="name">
								<input type="submit" value="固定资产投资价格指数_设备、工器具购置_当季同比" class="a_style"/>
							</form>
						</span></li>
								<li><span class="file">
							<form action="HelloForm" method="GET">
								<input type="hidden" value="固定资产投资价格指数_建筑安装工程_当季同比" name="name">
								<input type="submit" value="固定资产投资价格指数_建筑安装工程_当季同比" class="a_style"/>
							</form>
						</span></li>
								<li><span class="file">
							<form action="HelloForm" method="GET">
								<input type="hidden" value="固定资产投资价格指数_其他费用_当季同比" name="name">
								<input type="submit" value="固定资产投资价格指数_其他费用_当季同比" class="a_style"/>
							</form>
						</span></li>
							</ul>
						</li>
						<li class="closed"><span class="folder">固定资产投资（月）</span>
							<ul>
								<li><span class="file">
							<form action="HelloForm" method="GET">
								<input type="hidden" value="实际使用外资金额_合计_累计值" name="name">
								<input type="submit" value="实际使用外资金额_合计_累计值" class="a_style"/>
							</form>
						</span></li>
								<li><span class="file">
							<form action="HelloForm" method="GET">
								<input type="hidden" value="固定资产投资完成额_累计值" name="name">
								<input type="submit" value="固定资产投资完成额_累计值" class="a_style"/>
							</form>
						</span></li>
								<li><span class="file">
							<form action="HelloForm" method="GET">
								<input type="hidden" value="房地产开发投资完成额_累计值" name="name">
								<input type="submit" value="房地产开发投资完成额_累计值" class="a_style"/>
							</form>
						</span></li>
								<li><span class="file">
							<form action="HelloForm" method="GET">
								<input type="hidden" value="固定资产投资完成额_累计同比" name="name">
								<input type="submit" value="固定资产投资完成额_累计同比" class="a_style"/>
							</form>
						</span></li>
								<li><span class="file">
							<form action="HelloForm" method="GET">
								<input type="hidden" value="房地产开发投资完成额_累计同比" name="name">
								<input type="submit" value="房地产开发投资完成额_累计同比" class="a_style"/>
							</form>
						</span></li>
								<li><span class="file">
							<form action="HelloForm" method="GET">
								<input type="hidden" value="固定资产投资完成额_制造业_累计同比" name="name">
								<input type="submit" value="固定资产投资完成额_制造业_累计同比" class="a_style"/>
							</form>
						</span></li>
								<li><span class="file">
							<form action="HelloForm" method="GET">
								<input type="hidden" value="固定资产投资完成额_房地产业_累计同比" name="name">
								<input type="submit" value="固定资产投资完成额_房地产业_累计同比" class="a_style"/>
							</form>
						</span></li>
								<li><span class="file">
							<form action="HelloForm" method="GET">
								<input type="hidden" value="固定资产投资完成额_基础设施建设投资_累计同比" name="name">
								<input type="submit" value="固定资产投资完成额_基础设施建设投资_累计同比" class="a_style"/>
							</form>
						</span></li>
								<li><span class="file">
							<form action="HelloForm" method="GET">
								<input type="hidden" value="民间固定资产投资完成额_累计值" name="name">
								<input type="submit" value="民间固定资产投资完成额_累计值" class="a_style"/>
							</form>
						</span></li>
								<li><span class="file">
							<form action="HelloForm" method="GET">
								<input type="hidden" value="民间固定资产投资完成额_累计同比" name="name">
								<input type="submit" value="民间固定资产投资完成额_累计同比" class="a_style"/>
							</form>
						</span></li>
							</ul>
						</li>


					</ul>

				</li>
				<li class="closed"><span class="folder">消费</span>
					<ul>

						<li><span class="file">
					<form action="HelloForm" method="GET">
						<input type="hidden" value="社会消费品零售总额_当月值" name="name">
						<input type="submit" value="社会消费品零售总额_当月值" class="a_style"/>
							</form>
						</span></li>
						<li><span class="file">
					<form action="HelloForm" method="GET">
						<input type="hidden" value="社会消费品零售总额_城镇_当月值" name="name">
						<input type="submit" value="社会消费品零售总额_城镇_当月值" class="a_style"/>
							</form>
						</span></li>
						<li><span class="file">
					<form action="HelloForm" method="GET">
						<input type="hidden" value="社会消费品零售总额_乡村_当月值" name="name">
						<input type="submit" value="社会消费品零售总额_乡村_当月值" class="a_style"/>
							</form>
						</span></li>
						<li><span class="file">
					<form action="HelloForm" method="GET">
						<input type="hidden" value="社会消费品零售总额_当月同比" name="name">
						<input type="submit" value="社会消费品零售总额_当月同比" class="a_style"/>
							</form>
						</span></li>
						<li><span class="file">
					<form action="HelloForm" method="GET">
						<input type="hidden" value="社会消费品零售总额_城镇_当月同比" name="name">
						<input type="submit" value="社会消费品零售总额_城镇_当月同比" class="a_style"/>
							</form>
						</span></li>
						<li><span class="file">
					<form action="HelloForm" method="GET">
						<input type="hidden" value="社会消费品零售总额_乡村_当月同比" name="name">
						<input type="submit" value="社会消费品零售总额_乡村_当月同比" class="a_style"/>
							</form>
						</span></li>

					</ul>

				</li>
				<li class="closed"><span class="folder">金融</span>
					<ul>

						<li><span class="file">
					<form action="HelloForm" method="GET">
						<input type="hidden" value="M0" name="name">
						<input type="submit" value="M0" class="a_style"/>
							</form>
						</span></li>
						<li><span class="file">
					<form action="HelloForm" method="GET">
						<input type="hidden" value="M0_同比" name="name">
						<input type="submit" value="M0_同比" class="a_style"/>
							</form>
						</span></li>
						<li><span class="file">
					<form action="HelloForm" method="GET">
						<input type="hidden" value="M1" name="name">
						<input type="submit" value="M1" class="a_style"/>
							</form>
						</span></li>
						<li><span class="file">
					<form action="HelloForm" method="GET">
						<input type="hidden" value="M1_同比" name="name">
						<input type="submit" value="M1_同比" class="a_style"/>
							</form>
						</span></li>
						<li><span class="file">
					<form action="HelloForm" method="GET">
						<input type="hidden" value="M2" name="name">
						<input type="submit" value="M2" class="a_style"/>
							</form>
						</span></li>
						<li><span class="file">
					<form action="HelloForm" method="GET">
						<input type="hidden" value="M2_同比" name="name">
						<input type="submit" value="M2_同比" class="a_style"/>
							</form>
						</span></li>

					</ul>

				</li>
				<li class="closed"><span class="folder">财政</span>
					<ul>
						<li class="closed"><span class="folder">全国公共财政收入（年）</span>
							<ul>
								<li><span class="file">
							<form action="HelloForm" method="GET">
								<input type="hidden" value="全国公共财政收入" name="name">
								<input type="submit" value="全国公共财政收入" class="a_style"/>
							</form>
						</span></li>
								<li><span class="file">
							<form action="HelloForm" method="GET">
								<input type="hidden" value="全国公共财政收入_同比" name="name">
								<input type="submit" value="全国公共财政收入_同比" class="a_style"/>
							</form>
						</span></li>
								<li><span class="file">
							<form action="HelloForm" method="GET">
								<input type="hidden" value="全国公共财政收支差额" name="name">
								<input type="submit" value="全国公共财政收支差额" class="a_style"/>
							</form>
						</span></li>
								<li><span class="file">
							<form action="HelloForm" method="GET">
								<input type="hidden" value="全国公共财政收入_税收收入_合计" name="name">
								<input type="submit" value="全国公共财政收入_税收收入_合计" class="a_style"/>
							</form>
						</span></li>
								<li><span class="file">
							<form action="HelloForm" method="GET">
								<input type="hidden" value="全国公共财政收入_税收收入_国内消费税" name="name">
								<input type="submit" value="全国公共财政收入_税收收入_国内消费税" class="a_style"/>
							</form>
						</span></li>
								<li><span class="file">
							<form action="HelloForm" method="GET">
								<input type="hidden" value="全国公共财政收入_税收收入_国内增值税" name="name">
								<input type="submit" value="全国公共财政收入_税收收入_国内增值税" class="a_style"/>
							</form>
						</span></li>
								<li><span class="file">
							<form action="HelloForm" method="GET">
								<input type="hidden" value="全国公共财政收入_税收收入_进口货物消费税、增值税" name="name">
								<input type="submit" value="全国公共财政收入_税收收入_进口货物消费税、增值税" class="a_style"/>
							</form>
						</span></li>
								<li><span class="file">
							<form action="HelloForm" method="GET">
								<input type="hidden" value="全国公共财政收入_税收收入_资源税" name="name">
								<input type="submit" value="全国公共财政收入_税收收入_资源税" class="a_style"/>
							</form>
						</span></li>
								<li><span class="file">
							<form action="HelloForm" method="GET">
								<input type="hidden" value="全国公共财政收入_税收收入_城市维护建设税" name="name">
								<input type="submit" value="全国公共财政收入_税收收入_城市维护建设税" class="a_style"/>
							</form>
						</span></li>
								<li><span class="file">
							<form action="HelloForm" method="GET">
								<input type="hidden" value="全国公共财政收入_税收收入_房产税" name="name">
								<input type="submit" value="全国公共财政收入_税收收入_房产税" class="a_style"/>
							</form>
						</span></li>
								<li><span class="file">
							<form action="HelloForm" method="GET">
								<input type="hidden" value="全国公共财政收入_税收收入_印花税" name="name">
								<input type="submit" value="全国公共财政收入_税收收入_印花税" class="a_style"/>
							</form>
						</span></li>
								<li><span class="file">
							<form action="HelloForm" method="GET">
								<input type="hidden" value="全国公共财政收入_税收收入_企业所得税" name="name">
								<input type="submit" value="全国公共财政收入_税收收入_企业所得税" class="a_style"/>
							</form>
						</span></li>
								<li><span class="file">
							<form action="HelloForm" method="GET">
								<input type="hidden" value="全国公共财政收入_税收收入_个人所得税" name="name">
								<input type="submit" value="全国公共财政收入_税收收入_个人所得税" class="a_style"/>
							</form>
						</span></li>
								<li><span class="file">
							<form action="HelloForm" method="GET">
								<input type="hidden" value="全国公共财政收入_税收收入_城镇土地使用税" name="name">
								<input type="submit" value="全国公共财政收入_税收收入_城镇土地使用税" class="a_style"/>
							</form>
						</span></li>
								<li><span class="file">
							<form action="HelloForm" method="GET">
								<input type="hidden" value="全国公共财政收入_税收收入_土地增值税" name="name">
								<input type="submit" value="全国公共财政收入_税收收入_土地增值税" class="a_style"/>
							</form>
						</span></li>
								<li><span class="file">
							<form action="HelloForm" method="GET">
								<input type="hidden" value="全国公共财政收入_税收收入_车船税" name="name">
								<input type="submit" value="全国公共财政收入_税收收入_车船税" class="a_style"/>
							</form>
						</span></li>
								<li><span class="file">
							<form action="HelloForm" method="GET">
								<input type="hidden" value="全国公共财政收入_税收收入_其他税收" name="name">
								<input type="submit" value="全国公共财政收入_税收收入_其他税收" class="a_style"/>
							</form>
						</span></li>
								<li><span class="file">
							<form action="HelloForm" method="GET">
								<input type="hidden" value="全国公共财政收入_税收收入_关税" name="name">
								<input type="submit" value="全国公共财政收入_税收收入_关税" class="a_style"/>
							</form>
						</span></li>

								<li><span class="file">
							<form action="HelloForm" method="GET">
								<input type="hidden" value="全国公共财政收入_税收收入_船舶吨税" name="name">
								<input type="submit" value="全国公共财政收入_税收收入_船舶吨税" class="a_style"/>
							</form>
						</span></li>
								<li><span class="file">
							<form action="HelloForm" method="GET">
								<input type="hidden" value="全国公共财政收入_税收收入_契税" name="name">
								<input type="submit" value="全国公共财政收入_税收收入_契税" class="a_style"/>
							</form>
						</span></li>
								<li><span class="file">
							<form action="HelloForm" method="GET">
								<input type="hidden" value="全国公共财政收入_税收收入_烟叶税" name="name">
								<input type="submit" value="全国公共财政收入_税收收入_烟叶税" class="a_style"/>
							</form>
						</span></li>
								<li><span class="file">
							<form action="HelloForm" method="GET">
								<input type="hidden" value="全国公共财政收入_税收收入_耕地占用税" name="name">
								<input type="submit" value="全国公共财政收入_税收收入_耕地占用税" class="a_style"/>
							</form>
						</span></li>
								<li><span class="file">
							<form action="HelloForm" method="GET">
								<input type="hidden" value="全国公共财政收入_税收收入_出口货物退增值税、消费税" name="name">
								<input type="submit" value="全国公共财政收入_税收收入_出口货物退增值税、消费税" class="a_style"/>
							</form>
						</span></li>
								<li><span class="file">
							<form action="HelloForm" method="GET">
								<input type="hidden" value="全国公共财政收入_税收收入_印花税_证券交易印花税" name="name">
								<input type="submit" value="全国公共财政收入_税收收入_印花税_证券交易印花税" class="a_style"/>
							</form>
						</span></li>
								<li><span class="file">
							<form action="HelloForm" method="GET">
								<input type="hidden" value="全国公共财政收入_税收收入_车辆购置税" name="name">
								<input type="submit" value="全国公共财政收入_税收收入_车辆购置税" class="a_style"/>
							</form>
						</span></li>
								<li><span class="file">
							<form action="HelloForm" method="GET">
								<input type="hidden" value="全国公共财政收入_非税收收入_合计" name="name">
								<input type="submit" value="全国公共财政收入_非税收收入_合计" class="a_style"/>
							</form>
						</span></li>
								<li><span class="file">
							<form action="HelloForm" method="GET">
								<input type="hidden" value="全国公共财政收入_非税收收入_专项收入" name="name">
								<input type="submit" value="全国公共财政收入_非税收收入_专项收入" class="a_style"/>
							</form>
						</span></li>
								<li><span class="file">
							<form action="HelloForm" method="GET">
								<input type="hidden" value="全国公共财政收入_非税收收入_行政事业性收费" name="name">
								<input type="submit" value="全国公共财政收入_非税收收入_行政事业性收费" class="a_style"/>
							</form>
						</span></li>
								<li><span class="file">
							<form action="HelloForm" method="GET">
								<input type="hidden" value="全国公共财政收入_非税收收入_罚没收入" name="name">
								<input type="submit" value="全国公共财政收入_非税收收入_罚没收入" class="a_style"/>
							</form>
						</span></li>
								<li><span class="file">
							<form action="HelloForm" method="GET">
								<input type="hidden" value="全国公共财政收入_非税收收入_其他收入" name="name">
								<input type="submit" value="全国公共财政收入_非税收收入_其他收入" class="a_style"/>
							</form>
						</span></li>


							</ul>
						</li>

						<li class="closed"><span class="folder">公共财政收入（月）</span>
							<ul>
								<li><span class="file">
							<form action="HelloForm" method="GET">
								<input type="hidden" value="公共财政收入_当月值" name="name">
								<input type="submit" value="公共财政收入_当月值" class="a_style"/>
							</form>
						</span></li>
								<li><span class="file">
							<form action="HelloForm" method="GET">
								<input type="hidden" value="税收收入_当月值" name="name">
								<input type="submit" value="税收收入_当月值" class="a_style"/>
							</form>
						</span></li>
								<li><span class="file">
							<form action="HelloForm" method="GET">
								<input type="hidden" value="税收收入_国内增值税_当月值" name="name">
								<input type="submit" value="税收收入_国内增值税_当月值" class="a_style"/>
							</form>
						</span></li>
								<li><span class="file">
							<form action="HelloForm" method="GET">
								<input type="hidden" value="税收收入_企业所得税_当月值" name="name">
								<input type="submit" value="税收收入_企业所得税_当月值" class="a_style"/>
							</form>
						</span></li>
								<li><span class="file">
							<form action="HelloForm" method="GET">
								<input type="hidden" value="税收收入_个人所得税_当月值" name="name">
								<input type="submit" value="税收收入_个人所得税_当月值" class="a_style"/>
							</form>
						</span></li>
								<li><span class="file">
							<form action="HelloForm" method="GET">
								<input type="hidden" value="税收收入_国内消费税_当月值" name="name">
								<input type="submit" value="税收收入_国内消费税_当月值" class="a_style"/>
							</form>
						</span></li>
							</ul>
						</li>
						<li class="closed"><span class="folder">公共财政支出（月）</span>
							<ul>
								<li><span class="file">
							<form action="HelloForm" method="GET">
								<input type="hidden" value="公共财政收入_当月值" name="name">
								<input type="submit" value="公共财政收入_当月值" class="a_style"/>
							</form>
						</span></li>
								<li><span class="file">
							<form action="HelloForm" method="GET">
								<input type="hidden" value="公共财政支出_当月同比" name="name">
								<input type="submit" value="公共财政支出_当月同比" class="a_style"/>
							</form>
						</span></li>
							</ul>
						</li>


					</ul>

				</li>
				<li class="closed"><span class="folder">人民生活</span>
					<ul>
						<li><span class="file">
					<form action="HelloForm" method="GET">
						<input type="hidden" value="城镇居民人均可支配收入_累计值" name="name">
						<input type="submit" value="城镇居民人均可支配收入_累计值" class="a_style"/>
							</form>
						</span></li>
						<li><span class="file">
					<form action="HelloForm" method="GET">
						<input type="hidden" value="城镇居民人均可支配收入_累计同比" name="name">
						<input type="submit" value="城镇居民人均可支配收入_累计同比" class="a_style"/>
							</form>
						</span></li>
						<li><span class="file">
					<form action="HelloForm" method="GET">
						<input type="hidden" value="城镇居民人均可支配收入_实际累计同比" name="name">
						<input type="submit" value="城镇居民人均可支配收入_实际累计同比" class="a_style"/>
							</form>
						</span></li>
						<li><span class="file">
					<form action="HelloForm" method="GET">
						<input type="hidden" value="城镇居民人均消费性支出_累计值" name="name">
						<input type="submit" value="城镇居民人均消费性支出_累计值" class="a_style"/>
							</form>
						</span></li>
						<li><span class="file">
					<form action="HelloForm" method="GET">
						<input type="hidden" value="城镇居民人均消费性支出_累计同比" name="name">
						<input type="submit" value="城镇居民人均消费性支出_累计同比" class="a_style"/>
							</form>
						</span></li>
						<li><span class="file">
					<form action="HelloForm" method="GET">
						<input type="hidden" value="城镇居民人均消费性支出_实际累计同比" name="name">
						<input type="submit" value="城镇居民人均消费性支出_实际累计同比" class="a_style"/>
							</form>
						</span></li>

					</ul>
				</li>
				<li><span class="file">
				<button onclick="window.location.href='mybprotocol://E:\\Demo\\reg\\ChinaE.reg'">中国宏观经济预测模型</button>
			 </span></li>
			</ul>
		</li>
		<li id="area" style="display: none;"><span>地区预测</span>
			<ul class="filetree treeview-famfamfam">
				<li class="closed"><span class="folder">北京</span>
					<ul>
						<li class="closed"><span class="folder">国民经济核算</span>
							<ul>
								<li class="closed"><span class="folder">国内生产总值（年）</span>
									<ul>
										<li><span class="file">
									<form action="HelloForm" method="GET">
										<input type="hidden" value="北京_GDP" name="name">
										<input type="submit" value="北京_GDP" class="a_style"/>
							</form>
						</span></li>
										<li><span class="file">
									<form action="HelloForm" method="GET">
										<input type="hidden" value="北京_GDP_第一产业" name="name">
										<input type="submit" value="北京_GDP_第一产业" class="a_style"/>
							</form>
						</span></li>
										<li><span class="file">
									<form action="HelloForm" method="GET">
										<input type="hidden" value="北京_GDP_第二产业" name="name">
										<input type="submit" value="北京_GDP_第二产业" class="a_style"/>
							</form>
						</span></li>
										<li><span class="file">
									<form action="HelloForm" method="GET">
										<input type="hidden" value="北京_GDP_第三产业" name="name">
										<input type="submit" value="北京_GDP_第三产业" class="a_style"/>
							</form>
						</span></li>
										<li><span class="file">
									<form action="HelloForm" method="GET">
										<input type="hidden" value="北京_GDP_同比" name="name">
										<input type="submit" value="北京_GDP_同比" class="a_style"/>
							</form>
						</span></li>
										<li><span class="file">
									<form action="HelloForm" method="GET">
										<input type="hidden" value="北京_GDP_第一产业_同比" name="name">
										<input type="submit" value="北京_GDP_第一产业_同比" class="a_style"/>
							</form>
						</span></li>
										<li><span class="file">
									<form action="HelloForm" method="GET">
										<input type="hidden" value="北京_GDP_第二产业_同比" name="name">
										<input type="submit" value="北京_GDP_第二产业_同比" class="a_style"/>
							</form>
						</span></li>
										<li><span class="file">
									<form action="HelloForm" method="GET">
										<input type="hidden" value="北京_GDP_第三产业_同比" name="name">
										<input type="submit" value="北京_GDP_第三产业_同比" class="a_style"/>
							</form>
						</span></li>

									</ul>
								</li>
							</ul>
						</li>
						<li class="closed"><span class="folder">价格指数</span>
						</li>
						<li class="closed"><span class="folder">对外贸易</span>
						</li>
						<li class="closed"><span class="folder">固定资产投资</span>
							<ul>
								<li class="closed"><span class="folder">固定资产投资（月）</span>
									<ul>
										<li><span class="file">
									<form action="HelloForm" method="GET">
										<input type="hidden" value="北京_固定资产投资完成额_累计同比" name="name">
										<input type="submit" value="北京_固定资产投资完成额_累计同比" class="a_style"/>
							</form>
						</span></li>
										<li><span class="file">
									<form action="HelloForm" method="GET">
										<input type="hidden" value="北京_房地产开发投资完成额_累计值" name="name">
										<input type="submit" value="北京_房地产开发投资完成额_累计值" class="a_style"/>
							</form>
						</span></li>
										<li><span class="file">
									<form action="HelloForm" method="GET">
										<input type="hidden" value="北京_房地产开发投资完成额_累计同比" name="name">
										<input type="submit" value="北京_房地产开发投资完成额_累计同比" class="a_style"/>
							</form>
						</span></li>


									</ul>
								</li>
							</ul>
						</li>
						<li class="closed"><span class="folder">消费</span>
						</li>
						<li class="closed"><span class="folder">金融</span>
						</li>
						<li class="closed"><span class="folder">财政</span>
							<ul>
								<li class="closed"><span class="folder">地方公共财政（年）</span>
									<ul>
										<li><span class="file">
									<form action="HelloForm" method="GET">
										<input type="hidden" value="北京_地方公共财政收入_合计" name="name">
										<input type="submit" value="北京_地方公共财政收入_合计" class="a_style"/>
							</form>
						</span></li>
										<li><span class="file">
									<form action="HelloForm" method="GET">
										<input type="hidden" value="北京_地方公共财政收入_税收收入_合计" name="name">
										<input type="submit" value="北京_地方公共财政收入_税收收入_合计" class="a_style"/>
							</form>
						</span></li>
										<li><span class="file">
									<form action="HelloForm" method="GET">
										<input type="hidden" value="北京_地方公共财政收入_税收收入_国内增值税" name="name">
										<input type="submit" value="北京_地方公共财政收入_税收收入_国内增值税" class="a_style"/>
							</form>
						</span></li>
										<li><span class="file">
									<form action="HelloForm" method="GET">
										<input type="hidden" value="北京_地方公共财政收入_税收收入_企业所得税" name="name">
										<input type="submit" value="北京_地方公共财政收入_税收收入_企业所得税" class="a_style"/>
							</form>
						</span></li>
										<li><span class="file">
									<form action="HelloForm" method="GET">
										<input type="hidden" value="北京_地方公共财政收入_税收收入_个人所得税" name="name">
										<input type="submit" value="北京_地方公共财政收入_税收收入_个人所得税" class="a_style"/>
							</form>
						</span></li>
										<li><span class="file">
									<form action="HelloForm" method="GET">
										<input type="hidden" value="北京_地方公共财政收入_税收收入_资源税" name="name">
										<input type="submit" value="北京_地方公共财政收入_税收收入_资源税" class="a_style"/>
							</form>
						</span></li>
										<li><span class="file">
									<form action="HelloForm" method="GET">
										<input type="hidden" value="北京_地方公共财政收入_税收收入_城市维护建设税" name="name">
										<input type="submit" value="北京_地方公共财政收入_税收收入_城市维护建设税" class="a_style"/>
							</form>
						</span></li>
										<li><span class="file">
									<form action="HelloForm" method="GET">
										<input type="hidden" value="北京_地方公共财政收入_税收收入_房产税" name="name">
										<input type="submit" value="北京_地方公共财政收入_税收收入_房产税" class="a_style"/>
							</form>
						</span></li>
										<li><span class="file">
									<form action="HelloForm" method="GET">
										<input type="hidden" value="北京_地方公共财政收入_税收收入_印花税" name="name">
										<input type="submit" value="北京_地方公共财政收入_税收收入_印花税" class="a_style"/>
							</form>
						</span></li>
										<li><span class="file">
									<form action="HelloForm" method="GET">
										<input type="hidden" value="北京_地方公共财政收入_税收收入_城镇土地使用税" name="name">
										<input type="submit" value="北京_地方公共财政收入_税收收入_城镇土地使用税" class="a_style"/>
							</form>
						</span></li>
										<li><span class="file">
									<form action="HelloForm" method="GET">
										<input type="hidden" value="北京_地方公共财政收入_税收收入_土地增值税" name="name">
										<input type="submit" value="北京_地方公共财政收入_税收收入_土地增值税" class="a_style"/>
							</form>
						</span></li>
										<li><span class="file">
									<form action="HelloForm" method="GET">
										<input type="hidden" value="北京_地方公共财政收入_税收收入_车船税" name="name">
										<input type="submit" value="北京_地方公共财政收入_税收收入_车船税" class="a_style"/>
							</form>
						</span></li>
										<li><span class="file">
									<form action="HelloForm" method="GET">
										<input type="hidden" value="北京_地方公共财政收入_税收收入_耕地占用税" name="name">
										<input type="submit" value="北京_地方公共财政收入_税收收入_耕地占用税" class="a_style"/>
							</form>
						</span></li>
										<li><span class="file">
									<form action="HelloForm" method="GET">
										<input type="hidden" value="北京_地方公共财政收入_税收收入_契税" name="name">
										<input type="submit" value="北京_地方公共财政收入_税收收入_契税" class="a_style"/>
							</form>
						</span></li>
										<li><span class="file">
									<form action="HelloForm" method="GET">
										<input type="hidden" value="北京_地方公共财政支出_合计" name="name">
										<input type="submit" value="北京_地方公共财政支出_合计" class="a_style"/>
							</form>
						</span></li>


									</ul>
								</li>
							</ul>
						</li>
						<li class="closed"><span class="folder">人民生活</span>
						</li>


					</ul>
				</li>
				<li class="closed"><span class="folder">广西</span>
					<ul>
						<li class="closed"><span class="folder">国民经济核算</span>
							<ul>
								<li class="closed"><span class="folder">国内生产总值（年）</span>
									<ul>
										<li><span class="file">
									<form action="HelloForm" method="GET">
										<input type="hidden" value="广西_GDP" name="name">
										<input type="submit" value="广西_GDP" class="a_style"/>
							</form>
						</span></li>
										<li><span class="file">
									<form action="HelloForm" method="GET">
										<input type="hidden" value="广西_GDP_第一产业" name="name">
										<input type="submit" value="广西_GDP_第一产业" class="a_style"/>
							</form>
						</span></li>
										<li><span class="file">
									<form action="HelloForm" method="GET">
										<input type="hidden" value="广西_GDP_第二产业" name="name">
										<input type="submit" value="广西_GDP_第二产业" class="a_style"/>
							</form>
						</span></li>
										<li><span class="file">
									<form action="HelloForm" method="GET">
										<input type="hidden" value="广西_GDP_第三产业" name="name">
										<input type="submit" value="广西_GDP_第三产业" class="a_style"/>
							</form>
						</span></li>
										<li><span class="file">
									<form action="HelloForm" method="GET">
										<input type="hidden" value="广西_GDP_同比" name="name">
										<input type="submit" value="广西_GDP_同比" class="a_style"/>
							</form>
						</span></li>
										<li><span class="file">
									<form action="HelloForm" method="GET">
										<input type="hidden" value="广西_GDP_第一产业_同比" name="name">
										<input type="submit" value="广西_GDP_第一产业_同比" class="a_style"/>
							</form>
						</span></li>
										<li><span class="file">
									<form action="HelloForm" method="GET">
										<input type="hidden" value="广西_GDP_第二产业_同比" name="name">
										<input type="submit" value="广西_GDP_第二产业_同比" class="a_style"/>
							</form>
						</span></li>
										<li><span class="file">
									<form action="HelloForm" method="GET">
										<input type="hidden" value="广西_GDP_第三产业_同比" name="name">
										<input type="submit" value="广西_GDP_第三产业_同比" class="a_style"/>
							</form>
						</span></li>

									</ul>
								</li>
							</ul>
						</li>
						<li class="closed"><span class="folder">价格指数</span>
						</li>
						<li class="closed"><span class="folder">对外贸易</span>
						</li>
						<li class="closed"><span class="folder">固定资产投资</span>
							<ul>
								<li class="closed"><span class="folder">固定资产投资（月）</span>
									<ul>
										<li><span class="file">
									<form action="HelloForm" method="GET">
										<input type="hidden" value="广西_固定资产投资完成额_累计同比" name="name">
										<input type="submit" value="广西_固定资产投资完成额_累计同比" class="a_style"/>
							</form>
						</span></li>
										<li><span class="file">
									<form action="HelloForm" method="GET">
										<input type="hidden" value="广西_房地产开发投资完成额_累计值" name="name">
										<input type="submit" value="广西_房地产开发投资完成额_累计值" class="a_style"/>
							</form>
						</span></li>
										<li><span class="file">
									<form action="HelloForm" method="GET">
										<input type="hidden" value="广西_房地产开发投资完成额_累计同比" name="name">
										<input type="submit" value="广西_房地产开发投资完成额_累计同比" class="a_style"/>
							</form>
						</span></li>


									</ul>
								</li>
							</ul>
						</li>
						<li class="closed"><span class="folder">消费</span>
							<ul>

								<li><span class="file">
							<form action="HelloForm" method="GET">
								<input type="hidden" value="广西_社会消费品零售总额" name="name">
								<input type="submit" value="广西_社会消费品零售总额" class="a_style"/>
							</form>
						</span></li>
								<li><span class="file">
							<form action="HelloForm" method="GET">
								<input type="hidden" value="广西_社会消费品零售总额_同比" name="name">
								<input type="submit" value="广西_社会消费品零售总额_同比" class="a_style"/>
							</form>
						</span></li>


							</ul>
						</li>
						<li class="closed"><span class="folder">金融</span>
						</li>
						<li class="closed"><span class="folder">财政</span>
							<ul>
								<li class="closed"><span class="folder">地方公共财政（年）</span>
									<ul>
										<li><span class="file">
									<form action="HelloForm" method="GET">
										<input type="hidden" value="广西_地方公共财政收入_合计" name="name">
										<input type="submit" value="广西_地方公共财政收入_合计" class="a_style"/>
							</form>
						</span></li>
										<li><span class="file">
									<form action="HelloForm" method="GET">
										<input type="hidden" value="广西_地方公共财政收入_税收收入_合计" name="name">
										<input type="submit" value="广西_地方公共财政收入_税收收入_合计" class="a_style"/>
							</form>
						</span></li>
										<li><span class="file">
									<form action="HelloForm" method="GET">
										<input type="hidden" value="广西_地方公共财政收入_税收收入_国内增值税" name="name">
										<input type="submit" value="广西_地方公共财政收入_税收收入_国内增值税" class="a_style"/>
							</form>
						</span></li>
										<li><span class="file">
									<form action="HelloForm" method="GET">
										<input type="hidden" value="广西_地方公共财政收入_税收收入_营业税" name="name">
										<input type="submit" value="广西_地方公共财政收入_税收收入_营业税" class="a_style"/>
							</form>
						</span></li>
										<li><span class="file">
									<form action="HelloForm" method="GET">
										<input type="hidden" value="广西_地方公共财政收入_税收收入_企业所得税" name="name">
										<input type="submit" value="广西_地方公共财政收入_税收收入_企业所得税" class="a_style"/>
							</form>
						</span></li>
										<li><span class="file">
									<form action="HelloForm" method="GET">
										<input type="hidden" value="广西_地方公共财政收入_税收收入_个人所得税" name="name">
										<input type="submit" value="广西_地方公共财政收入_税收收入_个人所得税" class="a_style"/>
							</form>
						</span></li>
										<li><span class="file">
									<form action="HelloForm" method="GET">
										<input type="hidden" value="广西_地方公共财政收入_税收收入_城市维护建设税" name="name">
										<input type="submit" value="广西_地方公共财政收入_税收收入_城市维护建设税" class="a_style"/>
							</form>
						</span></li>
										<li><span class="file">
									<form action="HelloForm" method="GET">
										<input type="hidden" value="广西_地方公共财政收入_非税收收入_合计" name="name">
										<input type="submit" value="广西_地方公共财政收入_非税收收入_合计" class="a_style"/>
							</form>
						</span></li>
										<li><span class="file">
									<form action="HelloForm" method="GET">
										<input type="hidden" value="广西_地方公共财政收入_非税收收入_国有资产经营收入" name="name">
										<input type="submit" value="广西_地方公共财政收入_非税收收入_国有资产经营收入"
											   class="a_style"/>
							</form>
						</span></li>
										<li><span class="file">
									<form action="HelloForm" method="GET">
										<input type="hidden" value="广西_地方公共财政收入_非税收收入_行政事业性收费" name="name">
										<input type="submit" value="广西_地方公共财政收入_非税收收入_行政事业性收费" class="a_style"/>
							</form>
						</span></li>
										<li><span class="file">
									<form action="HelloForm" method="GET">
										<input type="hidden" value="广西_地方公共财政收入_非税收收入_罚没收入" name="name">
										<input type="submit" value="广西_地方公共财政收入_非税收收入_罚没收入" class="a_style"/>
							</form>
						</span></li>
										<li><span class="file">
									<form action="HelloForm" method="GET">
										<input type="hidden" value="广西_地方公共财政收入_非税收收入_专项收入" name="name">
										<input type="submit" value="广西_地方公共财政收入_非税收收入_专项收入" class="a_style"/>
							</form>
						</span></li>
										<li><span class="file">
									<form action="HelloForm" method="GET">
										<input type="hidden" value="广西_地方公共财政收入_非税收收入_其他收入" name="name">
										<input type="submit" value="广西_地方公共财政收入_非税收收入_其他收入" class="a_style"/>
							</form>
						</span></li>
										<li><span class="file">
									<form action="HelloForm" method="GET">
										<input type="hidden" value="广西_地方公共财政收入_下级财政调入资金" name="name">
										<input type="submit" value="广西_地方公共财政收入_下级财政调入资金" class="a_style"/>
							</form>
						</span></li>
										<li><span class="file">
									<form action="HelloForm" method="GET">
										<input type="hidden" value="广西_地方公共财政支出_合计" name="name">
										<input type="submit" value="广西_地方公共财政支出_合计" class="a_style"/>
							</form>
						</span></li>


									</ul>
								</li>
							</ul>
						</li>
						<li class="closed"><span class="folder">人民生活</span>
						</li>
						<li><span class="file">
						<button onclick="window.location.href='mybprotocol://E:\\Demo\\reg\\GuangxiE.reg'">广西区域宏观经济预测模型</button>
					 </span></li>


					</ul>
				</li>
				<li class="closed"><span class="folder">广东</span>
					<ul>
						<li class="closed"><span class="folder">国民经济核算</span>
							<ul>
								<li class="closed"><span class="folder">国内生产总值（年）</span>
									<ul>
										<li><span class="file">
									<form action="HelloForm" method="GET">
										<input type="hidden" value="广东_GDP" name="name">
										<input type="submit" value="广东_GDP" class="a_style"/>
							</form>
						</span></li>
										<li><span class="file">
									<form action="HelloForm" method="GET">
										<input type="hidden" value="广东_GDP_第一产业" name="name">
										<input type="submit" value="广东_GDP_第一产业" class="a_style"/>
							</form>
						</span></li>
										<li><span class="file">
									<form action="HelloForm" method="GET">
										<input type="hidden" value="广东_GDP_第二产业" name="name">
										<input type="submit" value="广东_GDP_第二产业" class="a_style"/>
							</form>
						</span></li>
										<li><span class="file">
									<form action="HelloForm" method="GET">
										<input type="hidden" value="广东_GDP_第三产业" name="name">
										<input type="submit" value="广东_GDP_第三产业" class="a_style"/>
							</form>
						</span></li>
										<li><span class="file">
									<form action="HelloForm" method="GET">
										<input type="hidden" value="广东_GDP_同比" name="name">
										<input type="submit" value="广东_GDP_同比" class="a_style"/>
							</form>
						</span></li>
										<li><span class="file">
									<form action="HelloForm" method="GET">
										<input type="hidden" value="广东_GDP_第一产业_同比" name="name">
										<input type="submit" value="广东_GDP_第一产业_同比" class="a_style"/>
							</form>
						</span></li>
										<li><span class="file">
									<form action="HelloForm" method="GET">
										<input type="hidden" value="广东_GDP_第二产业_同比" name="name">
										<input type="submit" value="广东_GDP_第二产业_同比" class="a_style"/>
							</form>
						</span></li>
										<li><span class="file">
									<form action="HelloForm" method="GET">
										<input type="hidden" value="广东_GDP_第三产业_同比" name="name">
										<input type="submit" value="广东_GDP_第三产业_同比" class="a_style"/>
							</form>
						</span></li>

									</ul>
								</li>
							</ul>
						</li>
						<li class="closed"><span class="folder">价格指数</span>
						</li>
						<li class="closed"><span class="folder">对外贸易</span>
						</li>
						<li class="closed"><span class="folder">固定资产投资</span>
							<ul>
								<li class="closed"><span class="folder">固定资产投资（月）</span>
									<ul>
										<li><span class="file">
									<form action="HelloForm" method="GET">
										<input type="hidden" value="广东_固定资产投资完成额_累计同比" name="name">
										<input type="submit" value="广东_固定资产投资完成额_累计同比" class="a_style"/>
							</form>
						</span></li>
										<li><span class="file">
									<form action="HelloForm" method="GET">
										<input type="hidden" value="广东_房地产开发投资完成额_累计值" name="name">
										<input type="submit" value="广东_房地产开发投资完成额_累计值" class="a_style"/>
							</form>
						</span></li>
										<li><span class="file">
									<form action="HelloForm" method="GET">
										<input type="hidden" value="广东_房地产开发投资完成额_累计同比" name="name">
										<input type="submit" value="广东_房地产开发投资完成额_累计同比" class="a_style"/>
							</form>
						</span></li>


									</ul>
								</li>
							</ul>
						</li>
						<li class="closed"><span class="folder">消费</span>
							<ul>

								<li><span class="file">
							<form action="HelloForm" method="GET">
								<input type="hidden" value="广东_社会消费品零售总额" name="name">
								<input type="submit" value="广东_社会消费品零售总额" class="a_style"/>
							</form>
						</span></li>
								<li><span class="file">
							<form action="HelloForm" method="GET">
								<input type="hidden" value="广东_社会消费品零售总额_同比" name="name">
								<input type="submit" value="广东_社会消费品零售总额_同比" class="a_style"/>
							</form>
						</span></li>


							</ul>
						</li>
						<li class="closed"><span class="folder">金融</span>
						</li>
						<li class="closed"><span class="folder">财政</span>


						</li>
						<li class="closed"><span class="folder">人民生活</span>
						</li>


					</ul>
				</li>
				<li class="closed"><span class="folder">天津</span></li>
				<li class="closed"><span class="folder">河北</span></li>
				<li class="closed"><span class="folder">山西</span></li>
				<li class="closed"><span class="folder">内蒙古</span></li>
				<li class="closed"><span class="folder">辽宁</span></li>
				<li class="closed"><span class="folder">吉林</span></li>
				<li class="closed"><span class="folder">黑龙江</span></li>
				<li class="closed"><span class="folder">上海</span></li>
				<li class="closed"><span class="folder">江苏</span></li>
				<li class="closed"><span class="folder">浙江</span></li>
				<li class="closed"><span class="folder">安徽</span></li>
				<li class="closed"><span class="folder">福建</span></li>
				<li class="closed"><span class="folder">江西</span></li>
				<li class="closed"><span class="folder">山东</span></li>
				<li class="closed"><span class="folder">河南</span></li>
				<li class="closed"><span class="folder">湖北</span></li>
				<li class="closed"><span class="folder">湖南</span></li>
				<li class="closed"><span class="folder">广西</span></li>
				<li class="closed"><span class="folder">海南</span></li>
				<li class="closed"><span class="folder">重庆</span></li>
				<li class="closed"><span class="folder">四川</span></li>
				<li class="closed"><span class="folder">贵州</span></li>
				<li class="closed"><span class="folder">云南</span></li>
				<li class="closed"><span class="folder">西藏</span></li>
				<li class="closed"><span class="folder">陕西</span></li>
				<li class="closed"><span class="folder">甘肃</span></li>
				<li class="closed"><span class="folder">青海</span></li>
				<li class="closed"><span class="folder">宁夏</span></li>
			</ul>
		</li>
		<li id="global" style="display: none;"><span>全球预测</span>
			<ul class="filetree treeview-famfamfam">
				<li class="closed"><span class="folder">美国</span>
					<ul>
						<li><span class="file">
					<form action="HelloForm" method="GET">
						<input type="hidden" value="美国_固定资产投资_总计（年）" name="name">
						<input type="submit" value="美国_固定资产投资_总计（年）" class="a_style"/>
							</form>
						</span></li>
						<li><span class="file">
					<form action="HelloForm" method="GET">
						<input type="hidden" value="美国_GDP_不变价_折年数_季调" name="name">
						<input type="submit" value="美国_GDP_不变价_折年数_季调" class="a_style"/>
							</form>
						</span></li>
						<li><span class="file">
					<form action="HelloForm" method="GET">
						<input type="hidden" value="美国_现价_折年数_人均GDP_季调" name="name">
						<input type="submit" value="美国_现价_折年数_人均GDP_季调" class="a_style"/>
							</form>
						</span></li>
						<li><span class="file">
					<form action="HelloForm" method="GET">
						<input type="hidden" value="美国_CPI_当月同比" name="name">
						<input type="submit" value="美国_CPI_当月同比" class="a_style"/>
							</form>
						</span></li>
						<li><span class="file">
					<form action="HelloForm" method="GET">
						<input type="hidden" value="美国_出口金额_季调_同比" name="name">
						<input type="submit" value="美国_出口金额_季调_同比" class="a_style"/>
							</form>
						</span></li>
						<li><span class="file">
					<form action="HelloForm" method="GET">
						<input type="hidden" value="美国_进口金额_季调_同比" name="name">
						<input type="submit" value="美国_进口金额_季调_同比" class="a_style"/>
							</form>
						</span></li>
						<li><span class="file">
					<form action="HelloForm" method="GET">
						<input type="hidden" value="美国_M1_季调_环比" name="name">
						<input type="submit" value="美国_M1_季调_环比" class="a_style"/>
							</form>
						</span></li>
						<li><span class="file">
					<form action="HelloForm" method="GET">
						<input type="hidden" value="美国_M2_季调_环比" name="name">
						<input type="submit" value="美国_M2_季调_环比" class="a_style"/>
							</form>
						</span></li>
						<li><span class="file">
					<form action="HelloForm" method="GET">
						<input type="hidden" value="美国_供应管理协会(ISM)_制造业PMI" name="name">
						<input type="submit" value="美国_供应管理协会(ISM)_制造业PMI" class="a_style"/>
							</form>
						</span></li>
						<li><span class="file">
					<form action="HelloForm" method="GET">
						<input type="hidden" value="美国_零售和食品服务销售额_总计_同比" name="name">
						<input type="submit" value="美国_零售和食品服务销售额_总计_同比" class="a_style"/>
							</form>
						</span></li>
					</ul>
				</li>
				<li class="closed"><span class="folder">日本</span></li>
				<li class="closed"><span class="folder">欧盟</span></li>
				<li class="closed"><span class="folder">韩国</span></li>
				<li class="closed"><span class="folder">印度尼西亚</span></li>
				<li class="closed"><span class="folder">泰国</span></li>
				<li class="closed"><span class="folder">马来西亚</span></li>
				<li class="closed"><span class="folder">新加坡</span></li>
				<li class="closed"><span class="folder">菲律宾</span></li>
				<li class="closed"><span class="folder">越南</span></li>
				<li class="closed"><span class="folder">文莱</span></li>
				<li class="closed"><span class="folder">老挝</span></li>
				<li class="closed"><span class="folder">缅甸</span></li>
				<li class="closed"><span class="folder">柬埔寨</span></li>
				<li class="closed"><span class="folder">印度</span></li>
				<li class="closed"><span class="folder">澳大利亚</span></li>
				<li class="closed"><span class="folder">英国</span></li>
				<li class="closed"><span class="folder">法国</span></li>
				<li class="closed"><span class="folder">德国</span></li>
				<li class="closed"><span class="folder">俄罗斯</span></li>
				<li class="closed"><span class="folder">南非</span></li>
				<li class="closed"><span class="folder">加拿大</span></li>
				<li class="closed"><span class="folder">墨西哥</span></li>
				<li class="closed"><span class="folder">巴西</span></li>
			</ul>
		</li>
		<li id="industry" style="display: none;"><span>行业预测</span>
			<ul class="filetree treeview-famfamfam">
				<li class="closed"><span class="folder">农林牧渔</span>
					<ul>
						<li><span class="file">
							<form action="HelloForm" method="GET">
								<input type="hidden" value="产量_猪肉_累计同比(季)" name="name">
								<input type="submit" value="产量_猪肉_累计同比(季)" class="a_style"/>
							</form>
								</span>
					</ul>
				</li>
				<li class="closed"><span class="folder">能源</span>
					<ul>
						<li><span class="file">
							<form action="HelloForm" method="GET">
								<input type="hidden" value="原煤价格指数_当月同比" name="name">
								<input type="submit" value="原煤价格指数_当月同比" class="a_style"/>
									</form>
								</span></li>
						<li><span class="file">
							<form action="HelloForm" method="GET">
								<input type="hidden" value="石油现货价平均价格指数" name="name">
								<input type="submit" value="石油现货价平均价格指数" class="a_style"/>
									</form>
								</span></li>
						<li><span class="file">
							<form action="HelloForm" method="GET">
								<input type="hidden" value="产量_乙烯_当月同比" name="name">
								<input type="submit" value="产量_乙烯_当月同比" class="a_style"/>
									</form>
								</span></li>
					</ul>
				</li>
				<li class="closed"><span class="folder">纺织服装</span>
					<ul>
						<li>
					<span class="file">
						<a href="产量_布_当月同比.html" class="a_style">产量_布_当月同比</a>
					</span>
						</li>
						<li><span class="file">
					<a href="产量_纱_当月同比.html" class="a_style">产量_纱_当月同比</a>
				</span></li>
					</ul>
				</li>
				<li class="closed"><span class="folder">化工</span>

				</li>
				<li class="closed"><span class="folder">钢铁</span>
					<ul>
						<li><span class="file">
							<form action="HelloForm" method="GET">
								<input type="hidden" value="钢材综合价格指数" name="name">
								<input type="submit" value="钢材综合价格指数" class="a_style"/>
									</form>
								</span></li>
					</ul>
				</li>
				<li class="closed"><span class="folder">交通运输</span>
					<ul>
						<li><span class="file">
							<form action="HelloForm" method="GET">
								<input type="hidden" value="货运量总计_当月同比" name="name">
								<input type="submit" value="货运量总计_当月同比" class="a_style"/>
									</form>
								</span></li>
					</ul>
				</li>
			</ul>
		</li>
	</ul>
</div>

<div id="log2" class="tab-block" style="z-index: -1;opacity: 0;">
	<div>
		<a class="tab-button" href="javascript:void(0);" onclick="popLog1()">经济预测</a>
		<a class="tab-button" href="javascript:void(0);" onclick="popLog2()">政策模拟</a>
		<br/><br/>
	</div>
	<ul class="filetree treeview-famfamfam">
		<li><span class="file">
				  <button onclick="window.location.href='myfprotocol://E:\\Demo\\reg\\Guangxi.reg'">广西区域3E-CGE政策模拟系统</button>
			   </span></li>
		<li><span class="file">
				  <button onclick="window.location.href='myaprotocol://E:\\Demo\\reg\\China.reg'">中国3E-CGE政策模拟系统</button>
			   </span></li>
		<li><span class="file">
				  <button onclick="window.location.href='myprotocol://E:\\Demo\\reg\\ASEAN10.reg'">东盟十国政策模拟系统 </button>
			   </span></li>
		<li><span class="file">
				  <button onclick="window.location.href='myprotocol://E:\\Demo\\reg\\ASEAN16.reg'">东盟扩大区域（RCEP）政策模拟系统</button>
			   </span></li>
		<li><span class="file">
				  <button onclick="window.location.href='myprotocol://E:\\Demo\\reg\\OneBeltOneRoad.reg'">一路一带沿线国家政策模拟系统</button>
			   </span></li>
		<li><span class="file">
				  <button onclick="window.location.href='mycprotocol://E:\\Demo\\reg\\CUS.reg'">中美贸易战政策模拟系统</button>
			   </span></li>
	</ul>
</div>

<div class="right">
	<div class="row hero" style="padding-top: 30px; padding-bottom: 0px; width:100%">
		<div class="group later">
			<div class="row section">
				<h2>欢迎进入经济预测与政策模拟系统平台</h2>
				<div class="col-sm-10 push-sm-1" style="width: 42%">
					<div class="dashboard-section">
						<h6 class="margin-vertical-rem">原始数据</h6>
						<div id="chart-trends" class="border"></div>
						<br/>
						<div class="btn-group chart-plot-buttons mt-1 mx-auto" role="group">
							<button type="button" class="btn btn-sm btn-secondary" data-type1="hideDots">折线图</button>
							<button type="button" class="btn btn-sm btn-secondary" data-type1="hideLine">散点图</button>
							<button type="button" class="btn btn-sm btn-secondary active" data-type1="heatline">热度折线图</button>
							<button type="button" class="btn btn-sm btn-secondary" data-type1="regionFill">Region</button>
							<br/>
							<button type="button" class="btn btn-sm btn-secondary" onclick="popWin('win1');">&nbsp;放大查看&nbsp;</button>
							<button type="button" class="btn btn-sm btn-secondary" onclick="popWin('win5');">&nbsp;查看统计数据&nbsp;</button>
							<a href="2.0用户登录和注册入口.html" >
								<button type="button" class="btn btn-sm btn-secondary">&nbsp;下载数据&nbsp;</button>
							</a>
						</div>

					</div>
				</div>

				<div class="col-sm-10 push-sm-1" style="width: 42%">
					<div class="dashboard-section">

						<h6 class="margin-vertical-rem">对比数据</h6>

						<div id="chart-trends2" class="border"></div>
						<div class="btn-group chart-plot-buttons mt-1 mx-auto" role="group">
							<button type="button" class="btn btn-sm btn-secondary" data-type2="hideDots">折线图</button>
							<button type="button" class="btn btn-sm btn-secondary" data-type2="hideLine">散点图</button>
							<button type="button" class="btn btn-sm btn-secondary active" data-type2="heatline">热度折线图</button>
							<button type="button" class="btn btn-sm btn-secondary" data-type2="regionFill">Region</button>
							<br/>
							<button type="button" class="btn btn-sm btn-secondary" onclick="popWin('win2');">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;放大查看&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button>
							<a href="./2.0用户登陆和注册入口.html">
								<button type="button" class="btn btn-sm btn-secondary">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;下载数据&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button>
							</a>
						</div>
					</div>
				</div>

				<div class="col-sm-10 push-sm-1" style="width: 42%">
					<div class="dashboard-section">

						<h6 class="margin-vertical-rem">先行数据</h6>

						<div id="chart-trends3" class="border"></div>
						<div class="btn-group chart-plot-buttons mt-1 mx-auto" role="group">
							<button type="button" class="btn btn-sm btn-secondary" data-type3="hideDots">折线图</button>
							<button type="button" class="btn btn-sm btn-secondary" data-type3="hideLine">散点图</button>
							<button type="button" class="btn btn-sm btn-secondary active" data-type3="heatline">热度折线图
							</button>
							<button type="button" class="btn btn-sm btn-secondary" data-type3="regionFill">Region
							</button>
							<br/>
							<button type="button" class="btn btn-sm btn-secondary" onclick="popWin('win2');">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;放大查看&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button>
							<a href="./2.0用户登陆和注册入口.html">
								<button type="button" class="btn btn-sm btn-secondary">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;下载数据&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button>
							</a>
						</div>
					</div>
				</div>

				<div class="col-sm-10 push-sm-1" style="width:42%">
					<div class="dashboard-section">
						<h6 class="margin-vertical-rem">预警数据</h6>
						<div id="chart-trends4" class="border"></div>
						<div class="btn-group chart-plot-buttons mt-1 mx-auto" role="group">
							<button type="button" class="btn btn-sm btn-secondary" data-type4="hideDots">折线图</button>
							<button type="button" class="btn btn-sm btn-secondary" data-type4="hideLine">散点图</button>
							<button type="button" class="btn btn-sm btn-secondary active" data-type4="heatline">热度折线图
							</button>
							<button type="button" class="btn btn-sm btn-secondary" data-type4="regionFill">Region
							</button>
							<br/>
							<button type="button" class="btn btn-sm btn-secondary" onclick="popWin('win2');">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;放大查看&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button>
							<a href="./2.0用户登陆和注册入口.html">
								<button type="button" class="btn btn-sm btn-secondary">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;下载数据&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button>
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>


<div>
	<div id="win1" class="pop_win">
		<a href="javascript:void(0)" onclick="closeWin('win1');" style="float: right;">关闭</a>
		<h6 class="margin-vertical-rem">原始数据</h6>
		<div id="chart-trends1_1" class="border"></div>
		<div class="btn-group chart-plot-buttons mt-1 mx-auto" role="group">
			<button type="button" class="btn btn-sm btn-secondary" data-type1="hideDots">折线图</button>
			<button type="button" class="btn btn-sm btn-secondary" data-type1="hideLine">散点图</button>
			<button type="button" class="btn btn-sm btn-secondary active" data-type1="heatline">热度折线图</button>
			<button type="button" class="btn btn-sm btn-secondary" data-type1="regionFill">Region</button>
		</div>
	</div>

	<div id="win2" class="pop_win">
		<a href="javascript:void(0)" onclick="closeWin('win2');" style="float: right;">关闭</a>
		<h6 class="margin-vertical-rem">原始数据</h6>
		<div id="chart-trends2_1" class="border"></div>
		<div class="btn-group chart-plot-buttons mt-1 mx-auto" role="group">
			<button type="button" class="btn btn-sm btn-secondary" data-type2="hideDots">折线图</button>
			<button type="button" class="btn btn-sm btn-secondary" data-type2="hideLine">散点图</button>
			<button type="button" class="btn btn-sm btn-secondary active" data-type2="heatline">热度折线图</button>
			<button type="button" class="btn btn-sm btn-secondary" data-type2="regionFill">Region</button>
		</div>
	</div>

	<div id="win3" class="pop_win">
		<a href="javascript:void(0)" onclick="closeWin('win3');" style="float: right;">关闭</a>
		<h6 class="margin-vertical-rem">原始数据</h6>
		<div id="chart-trends3_1" class="border"></div>
		<div class="btn-group chart-plot-buttons mt-1 mx-auto" role="group">
			<button type="button" class="btn btn-sm btn-secondary" data-type3="hideDots">折线图</button>
			<button type="button" class="btn btn-sm btn-secondary" data-type3="hideLine">散点图</button>
			<button type="button" class="btn btn-sm btn-secondary active" data-type3="heatline">热度折线图</button>
			<button type="button" class="btn btn-sm btn-secondary" data-type3="regionFill">Region</button>
		</div>
	</div>

	<div id="win4" class="pop_win">
		<a href="javascript:void(0)" onclick="closeWin('win4');" style="float: right;">关闭</a>
		<h6 class="margin-vertical-rem">原始数据</h6>
		<div id="chart-trends4_1" class="border"></div>
		<div class="btn-group chart-plot-buttons mt-1 mx-auto" role="group">
			<button type="button" class="btn btn-sm btn-secondary" data-type4="hideDots">折线图</button>
			<button type="button" class="btn btn-sm btn-secondary" data-type4="hideLine">散点图</button>
			<button type="button" class="btn btn-sm btn-secondary active" data-type4="heatline">热度折线图</button>
			<button type="button" class="btn btn-sm btn-secondary" data-type4="regionFill">Region</button>
		</div>
	</div>

	<div id="win5" class="pop_win">
		<a href="javascript:void(0)" onclick="closeWin('win5');" style="float: right;">关闭</a>
		<br/><br/>
		<h3 class="margin-vertical-rem">数据</h3>
	</div>
</div>


<script src="../js/3.0_function/frappe-charts.min.js"></script>

<script>


	// Trends Chart
	// ================================================================================
	//图一
	let trends_data = {
		labels: [${chart1_time}],
		datasets: [
			{
				name: "原始数据",
				values: [${chart1_original_data}],
			},
		]
	};

	let plotChartArgs = {
		data: trends_data,
		type: 'line',
		height: 250,
		colors: ['#238e38'],
		lineOptions: {
			hideDots: 1,
			heatline: 1,
		},
		axisOptions: {
			xAxisMode: 'tick',
			yAxisMode: 'span',
			xIsSeries: 1
		}
	};

	new Chart("#chart-trends", plotChartArgs);

	Array.prototype.slice.call(
			document.querySelectorAll('.chart-plot-buttons button')
	).map(el => {
		el.addEventListener('click', (e) => {
			let btn = e.target;
	let type = btn.getAttribute('data-type1');
	let config = {};
	config[type] = 1;

	if (['regionFill', 'heatline'].includes(type)) {
		config.hideDots = 1;
	}

	// plotChartArgs.init = false;
	plotChartArgs.lineOptions = config;

	new Chart("#chart-trends", plotChartArgs);

	Array.prototype.slice.call(
			btn.parentNode.querySelectorAll('button')).map(el => {
		el.classList.remove('active');
	});
	btn.classList.add('active');
	});
	});


	//图2
	let trends_data2 = {
		labels: [${chart2_time}],
		datasets: [
			{
				name: "原始数据",
				values: [${chart2_original_data}],

			},
			{
				name: 1,
				values: [${chart2_comparison1}],
			},
			{
				name: 2,
				values: [${chart2_comparison2}],
			},
			{
				name: 3,
				values: [${chart2_comparison3}],
			}
		]
	};

	let plotChartArgs2 = {
		data: trends_data2,
		type: 'line',
		height: 250,
		colors: ['#238e38'],
		lineOptions: {
			hideDots: 1,
			heatline: 1,
		},
		axisOptions: {
			xAxisMode: 'tick',
			yAxisMode: 'span',
			xIsSeries: 1
		}
	};

	new Chart("#chart-trends2", plotChartArgs2);

	Array.prototype.slice.call(
			document.querySelectorAll('.chart-plot-buttons button')
	).map(el => {
		el.addEventListener('click', (e) => {
			let btn = e.target;
	let type = btn.getAttribute('data-type2');
	let config = {};
	config[type] = 1;

	if (['regionFill', 'heatline'].includes(type)) {
		config.hideDots = 1;
	}

	// plotChartArgs.init = false;
	plotChartArgs2.lineOptions = config;

	new Chart("#chart-trends2", plotChartArgs2);

	Array.prototype.slice.call(
			btn.parentNode.querySelectorAll('button')).map(el => {
		el.classList.remove('active');
	});
	btn.classList.add('active');
	});
	});


	//图3
	let trends_data3 = {
		labels:[${chart3_time}],
			datasets: [
		{
			name:"先行一期",
			values: [${chart3_leading_1}],
		},
		{
			name:"先行二期",
			values: [${chart3_leading_2}],
		},
		{
			name:"先行三期",
			values: [${chart3_leading_3}],
		},
		{
			name:"先行四期",
			values:[${chart3_leading_4}],
		}
	]
	};


	let plotChartArgs3 = {
		data: trends_data3,
		type: 'line',
		height: 250,
		colors: ['#238e38'],
		lineOptions: {
			hideDots: 1,
			heatline: 1,
		},
		axisOptions: {
			xAxisMode: 'tick',
			yAxisMode: 'span',
			xIsSeries: 1
		}
	};

	new Chart("#chart-trends3", plotChartArgs3);

	Array.prototype.slice.call(
			document.querySelectorAll('.chart-plot-buttons button')
	).map(el => {
		el.addEventListener('click', (e) => {
			let btn = e.target;
	let type = btn.getAttribute('data-type3');
	let config = {};
	config[type] = 1;

	if (['regionFill', 'heatline'].includes(type)) {
		config.hideDots = 1;
	}

	// plotChartArgs.init = false;
	plotChartArgs3.lineOptions = config;

	new Chart("#chart-trends3", plotChartArgs3);

	Array.prototype.slice.call(
			btn.parentNode.querySelectorAll('button')).map(el => {
		el.classList.remove('active');
	});
	btn.classList.add('active');
	});
	});


	//图4
	let trends_data4 = {
		labels: [${chart4_time}],
		datasets: [
			{
				name: "滤波后数据",
				values: [${chart4_filtering}],

			},
			{
				name: "预警最低值",
				values: [${chart4_lowest}],
			},
			{
				name: "预警较低值",
				values: [${chart4_lower}],
			},
			{
				name: "预警较高值",
				values: [${chart4_higher}],
			},
			{
				name: "预警最高值",
				values: [${chart4_highest}],
			}
		]
	};

	let plotChartArgs4 = {
		data: trends_data4,
		type: 'line',
		height: 250,
		colors: ['#238e38'],
		lineOptions: {
			hideDots: 1,
			heatline: 1,
		},
		axisOptions: {
			xAxisMode: 'tick',
			yAxisMode: 'span',
			xIsSeries: 1
		}
	};

	new Chart("#chart-trends4", plotChartArgs4);

	Array.prototype.slice.call(
			document.querySelectorAll('.chart-plot-buttons button')
	).map(el => {
		el.addEventListener('click', (e) => {
			let btn = e.target;
	let type = btn.getAttribute('data-type4');
	let config = {};
	config[type] = 1;

	if (['regionFill', 'heatline'].includes(type)) {
		config.hideDots = 1;
	}

	plotChartArgs4.lineOptions = config;

	new Chart("#chart-trends4", plotChartArgs4);

	Array.prototype.slice.call(
			btn.parentNode.querySelectorAll('button')).map(el => {
		el.classList.remove('active');
	});
	btn.classList.add('active');
	});
	});


	//图一放大
	new Chart("#chart-trends1_1", plotChartArgs);

	Array.prototype.slice.call(
			document.querySelectorAll('.chart-plot-buttons button')
	).map(el => {
		el.addEventListener('click', (e) => {
			let btn = e.target;
	let type = btn.getAttribute('data-type1');
	let config = {};
	config[type] = 1;

	if (['regionFill', 'heatline'].includes(type)) {
		config.hideDots = 1;
	}

	// plotChartArgs.init = false;
	plotChartArgs.lineOptions = config;

	new Chart("#chart-trends1_1", plotChartArgs);

	Array.prototype.slice.call(
			btn.parentNode.querySelectorAll('button')).map(el => {
		el.classList.remove('active');
	});
	btn.classList.add('active');
	});
	});


	//图2
	new Chart("#chart-trends2_1", plotChartArgs2);

	Array.prototype.slice.call(
			document.querySelectorAll('.chart-plot-buttons button')
	).map(el => {
		el.addEventListener('click', (e) => {
			let btn = e.target;
	let type = btn.getAttribute('data-type2');
	let config = {};
	config[type] = 1;

	if (['regionFill', 'heatline'].includes(type)) {
		config.hideDots = 1;
	}

	// plotChartArgs.init = false;
	plotChartArgs2.lineOptions = config;

	new Chart("#chart-trends2_1", plotChartArgs2);

	Array.prototype.slice.call(
			btn.parentNode.querySelectorAll('button')).map(el => {
		el.classList.remove('active');
	});
	btn.classList.add('active');
	});
	});

	//
	//图3
	new Chart("#chart-trends3_1", plotChartArgs3);

	Array.prototype.slice.call(
			document.querySelectorAll('.chart-plot-buttons button')
	).map(el => {
		el.addEventListener('click', (e) => {
			let btn = e.target;
	let type = btn.getAttribute('data-type3');
	let config = {};
	config[type] = 1;

	if (['regionFill', 'heatline'].includes(type)) {
		config.hideDots = 1;
	}

	// plotChartArgs.init = false;
	plotChartArgs3.lineOptions = config;

	new Chart("#chart-trends3_1", plotChartArgs3);

	Array.prototype.slice.call(
			btn.parentNode.querySelectorAll('button')).map(el => {
		el.classList.remove('active');
	});
	btn.classList.add('active');
	});
	});


	// //图4

	new Chart("#chart-trends4_1", plotChartArgs4);

	Array.prototype.slice.call(
			document.querySelectorAll('.chart-plot-buttons button')
	).map(el => {
		el.addEventListener('click', (e) => {
			let btn = e.target;
	let type = btn.getAttribute('data-type4');
	let config = {};
	config[type] = 1;

	if (['regionFill', 'heatline'].includes(type)) {
		config.hideDots = 1;
	}

	plotChartArgs4.lineOptions = config;

	new Chart("#chart-trends4_1", plotChartArgs4);

	Array.prototype.slice.call(
			btn.parentNode.querySelectorAll('button')).map(el => {
		el.classList.remove('active');
	});
	btn.classList.add('active');
	});
	});
</script>

<div style="text-align:center;clear:both;">
	<script src="/gg_bd_ad_720x90.js" type="text/javascript"></script>
	<script src="/follow.js" type="text/javascript"></script>
</div>

<script type="text/javascript">
	$(document).ready(function () {
		$("#browser1").treeview({
			toggle: function () {
				console.log("%s was toggled.", $(this).find(">span").text());
			}
		});
		$("#add").click(function () {
			var branches = $("<li ><span class='folder'>New Sublist</span><ul>" +
					"<li><span class='file'>Item1</span></li>" +
					"<li><span class='file'>Item2</span></li></ul></li>").appendTo("#browser1");

		});
	});
	$(document).ready(function () {
		$("#browser2").treeview({
			toggle: function () {
				console.log("%s was toggled.", $(this).find(">span").text());
			}
		});
		$("#add").click(function () {
			var branches = $("<li ><span class='folder'>New Sublist</span><ul>" +
					"<li><span class='file'>Item1</span></li>" +
					"<li><span class='file'>Item2</span></li></ul></li>").appendTo("#browser2");

		});
	});


	$(document).ready(function () {
		$("#browser1").treeview({
			toggle: function () {
				console.log("%s was toggled.", $(this).find(">span").text());
			}
		});

		$("#add").click(function () {
			var branches = $("<li ><span class='folder'>New Sublist</span><ul>" +
					"<li><span class='file'>Item1</span></li>" +
					"<li><span class='file'>Item2</span></li></ul></li>").appendTo("#browser1");

		});
	});

	$(document).ready(function () {
		$("#browser2").treeview({
			toggle: function () {
				console.log("%s was toggled.", $(this).find(">span").text());
			}
		});

		$("#add").click(function () {
			var branches = $("<li ><span class='folder'>New Sublist</span><ul>" +
					"<li><span class='file'>Item1</span></li>" +
					"<li><span class='file'>Item2</span></li></ul></li>").appendTo("#browser2");

		});
	});
</script>

<script type="text/javascript">
	function popLogs(n) {
		switch (n) {
			case 1:{
				document.getElementById('china').style.display='block';
				document.getElementById('area').style.display='none';
				document.getElementById('industry').style.display='none';
				document.getElementById('global').style.display='none';
				break;
			}
			case 2:{
				document.getElementById('area').style.display='block';
				document.getElementById('china').style.display='none';
				document.getElementById('industry').style.display='none';
				document.getElementById('global').style.display='none';
				break;
			}
			case 3:{
				document.getElementById('industry').style.display='block';
				document.getElementById('area').style.display='none';
				document.getElementById('china').style.display='none';
				document.getElementById('global').style.display='none';
				break;
			}
			case 4:{
				document.getElementById('global').style.display='block';
				document.getElementById('area').style.display='none';
				document.getElementById('industry').style.display='none';
				document.getElementById('china').style.display='none';
				break;
			}
		}

	}
	function popLog1() {
		document.getElementById('log1').style.opacity = '1';
		document.getElementById('log1').style.zIndex = '999';
		document.getElementById('log2').style.opacity = '0';
		document.getElementById('log2').style.zIndex = '-1';
	}

	function popLog2() {
		document.getElementById('log2').style.opacity = '1';
		document.getElementById('log2').style.zIndex = '999';
		document.getElementById('log1').style.opacity = '0';
		document.getElementById('log1').style.zIndex = '-1';
	}

	function popWin(id) {
		document.getElementById(id).style.opacity = '1';
		document.getElementById(id).style.zIndex = '9999';
	}

	function closeWin(id) {
		document.getElementById(id).style.opacity = '0';
		document.getElementById(id).style.zIndex = '-1';
	}

</script>

</body>

</html>

