<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="collapse navbar-collapse">
	<ul class="nav navbar-nav navbar-right">
		<li>
			<a href="javascript:void(0)" class="dropdown-toggle" data-toggle="dropdown">
				<i class="ti-panel"></i>
				<p>Stats</p>
			</a>
		</li>
		<li class="dropdown">
			<a href="javascript:void(0)" class="dropdown-toggle" data-toggle="dropdown">
				<i class="ti-bell"></i>
				<p class="notification">5</p>
				<p>Notifications</p>
				<b class="caret"></b>
			</a>
			<ul class="dropdown-menu">
				<li><a href="javascript:void(0)">Notification 1</a></li>
				<li><a href="javascript:void(0)">Notification 2</a></li>
				<li><a href="javascript:void(0)">Notification 3</a></li>
				<li><a href="javascript:void(0)">Notification 4</a></li>
				<li><a href="javascript:void(0)">Another notification</a></li>
			</ul>
		</li>
		<li class="dropdown">
			<a href="javascript:void(0)" class="dropdown-toggle" data-toggle="dropdown">
				<i class="ti-settings"></i>
				<p>Settings</p>
				</a>
			<ul class="dropdown-menu">
				<li><a href="/user/logout.do">로그아웃</a></li>
			</ul>
		</li>
	</ul>
</div>