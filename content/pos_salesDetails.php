<?php require_once 'layouts/sale_header.php'; ?>
<?php
    require_once 'class/Functions.php';
    require_once 'class/Session.php';
    require_once 'class/Sales.php';
    require_once 'class/Product.php';

    $session = new Session();
    $sales_db = new Sales();
    $product_db = new Product();

    if ($_SESSION["pos_user"] === null || $_SESSION["pos_admin"] === true) {
        redirect_to("error.php");
    }

?>
<?php
	$sales_id = _request('sales_id');
	$query = "SELECT * FROM `sales` WHERE `sales_id` = $sales_id";
	$sales = $sales_db->select_row($query);
	$query = "SELECT * FROM `sales_details` WHERE `sales_id` = $sales_id";
	$sales_details = $sales_db->select($query);
	$total_sales = number_format($sales['total_sales'],2,'.',',');
	$amount_paid = number_format($sales['amount_paid'],2,'.',',');
	$change = number_format($sales['amount_change'],2,'.',',');
	$formatted_id = sprintf("%'.05d\n", $sales['sales_id']);

	$output = "
		<table class='table'>
			<tr>
				<th>Sales ID</th>
				<td>{$formatted_id}</td>
				<th>Date</th>
				<td>{$sales['created_on']}</td>
				<th>Total Sales</th>
				<td>&#8369; {$total_sales}</td>
			</tr>
			<tr>
				<th>Amount Paid</th>
				<td>&#8369; {$amount_paid}</td>
				<th>Change</th>
				<td>&#8369; {$change}</td>
				<th></th>
				<td></td>
			</tr>
		</table>
	";

	$sales_details_output = "";

	foreach($sales_details as $row){
		$product = $product_db->get_product($row['product_id']);
		$price = ((double)$row['total'])/((int)$row['quantity']);
		$formatted_price = number_format($price,2,'.',',');
		$formatted_total = number_format($row['total'],2,'.',',');
		$sales_details_output.= "
			<tr>
				<td>{$product['product_name']}</td>
				<td>{$row['quantity']}</td>
				<td>&#8369; {$formatted_price}</td>
				<td>{$formatted_total}</td>
                <td><a href='return_item.php?sales_details_id=".$row['sales_details_id']."&quantity=".$row['quantity']."'>Defective</a></td>
			</tr>
		";
	}

	$output.= "
		<table class='table'>
			<thead>
				<tr>
					<th>Name</th>
					<th>Quantity</th>
					<th>Price</th>
					<th>Total</th>
                    <th>Action</th>
				</tr>
			</thead>
			<tbody>{$sales_details_output}</tbody>
		</table>
	";
?>
    <div id="wrapper">

        <!-- include nav  -->
        <?php require_once 'layouts/pos_navigation.php'; ?>

        <div id="page-wrapper">
            <!-- <p>&nbsp;</p> -->
            <!-- <br> -->
            <span>&nbsp;</span>
            <div class="row">
                <div class="col-lg-12">
                    <?php echo $output; ?>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="vendor/metisMenu/metisMenu.min.js"></script>

    <!-- DataTables JavaScript -->
    <script src="vendor/datatables/js/jquery.dataTables.min.js"></script>
    <script src="vendor/datatables-plugins/dataTables.bootstrap.min.js"></script>
    <script src="vendor/datatables-responsive/dataTables.responsive.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="dist/js/sb-admin-2.js"></script>

    <script src="js/functions.js"></script>
    <script>
        $(document).ready(function() {
            $('#sales_list').DataTable({
                responsive: true,
                "order": [[ 0, "desc" ]]
            });
        });
    </script>
</body>

</html>
