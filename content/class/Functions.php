<?php
	function redirect_to($page) {
		header("location: " . $page);
	}

	function escape($value) {
		 
		//$escaped_item =$value;// 
	    $escaped_item =addslashes(trim( $value)); //mysqli_real_escape_string($value,"ssql");
		
		return $escaped_item;
	}

	function debug($dump) {
		echo '<pre>' . var_export($dump, true) . '</pre>';
	}

	function _request($index, $default = NULL){
		if(isset($_REQUEST[$index])){
			return $_REQUEST[$index];
		}
		else{
			return $default;
		}
	}
	
	function get_valueFromStringUrl($url , $parameter_name)
	{
	    $parts = parse_url($url);
	    if(isset($parts['query']))
	    {
	        parse_str($parts['query'], $query);
	        if(isset($query[$parameter_name]))
	        {
	            return $query[$parameter_name];
	        }
	        else
	        {
	            return null;
	        }
	    }
	    else
	    {
	        return null;
	    }
	}

	function timeout($time, $page) {
		sleep($time);
		redirect_to($page);
	}
?>