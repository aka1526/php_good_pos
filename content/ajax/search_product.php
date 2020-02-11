<?php
	require_once '../class/wp-db.php';
	require_once '../class/Product.php';
	header('content-type:application/json');
	$product_db = new Product();
	$product_barcode = $_POST['product_barcode'];
	$product = $product_db->get_product_by_barcode($product_barcode);
	
	$json = array(
		'found' => false,
		'product' => NULL,
		'selling_price' => 0
		
	);
	if($product){
		$json['found'] = true;
		$json['product'] = $product;
		
	}

	echo  json_encode($json);
?>