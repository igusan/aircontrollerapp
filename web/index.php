<?php 

$type = $_GET["type"];
if (empty($type)) {
	echo json_encode(array("status"=>200,"text"=>"ステータスが不明です"));
}

if ($type === "on") {
	exec("irsend SEND_ONCE aircon on");
	echo json_encode(array("status"=>200,"text"=>"ONにしました！"));
	exit();
}else if ($type === "off") {
	exec("irsend SEND_ONCE aircon off");
	echo json_encode(array("status"=>200,"text"=>"OFFにしました！"));
	exit();
}