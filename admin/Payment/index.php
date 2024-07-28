<?php if ($_settings->chk_flashdata('success')): ?>
    <script>
        alert_toast("<?php echo $_settings->flashdata('success') ?>", 'success')
    </script>
<?php endif; ?><div class="card card-outline card-primary">
    <div class="card-header">
        <h3 class="card-title">List of Feedbacks</h3>
        <!-- <div class="card-tools">
            <a href="?page=packages/manage" class="btn btn-flat btn-primary"><span class="fas fa-plus"></span>  Create New</a>
        </div> -->
    </div>
    <div class="card-body">
        <div class="container-fluid">
            <table class="table table-stripped text-dark">
                <colgroup>
                    <col width="10%">
                    <col width="10%">
                    <col width="25%">
                    <col width="15%">
                    <col width="30%">
                    <col width="10%">
                </colgroup>
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Package_id</th>
                        <th>Name</th>
                        <th>Card Number</th>
                        <th>Expiry_data</th>
                        <th>Cvv</th>

                    </tr>
                </thead>
                <tbody>
                <?php $qry = $conn->query("SELECT * FROM payment_details");
                    while ($row = $qry->fetch_assoc()):
                        ?> 
                        <tr>
                            <td><?php echo $row['id']; ?></td>
                            <td><?php echo $row['package_id']; ?></td>
                            <td><?php echo $row['name']; ?></td>
                            <td><?php echo $row['card_number']; ?></td>
                            <td><?php echo $row['expiry_date']; ?></td>
                            <td><?php echo $row['cvv']; ?></td>
                            <td><?php echo $row['created_at']; ?></td>
                        </tr>

                        <?php endwhile; ?>
                </tbody>
            </table>
            <button onclick="printPage()"
                style="background-color:rgb(0,123,255); border:none; color:white; padding:10px">Print</button>

            <!-- <button onclick="printTable()"
                style="background-color:rgb(0,123,255); border:none;color:white; padding:10px">Print Only
                Data</button> -->
        </div>
    </div>
</div>

<style>
    @media print {

        /* Add custom print styles */
        table {
            border-collapse: collapse;
        }

        th,
        td {
            border: 1px solid black;
            padding: 8px;
        }

        /* Add any additional print styles as needed */
    }
</style>
<script>
    $(document).ready(function () {
        $('.delete_data').click(function () {
            _conf("Are you sure to delete this feedback permanently?", "delete_review", [$(this).attr('data-id')])
        })

        $('.table').dataTable();
    })
    function delete_review($id) {
        start_loader();
        $.ajax({
            url: _base_url_ + "classes/Master.php?f=delete_review",
            method: "POST",
            data: { id: $id },
            dataType: "json",
            error: err => {
                console.log(err)
                alert_toast("An error occured.", 'error');
                end_loader();
            },
            success: function (resp) {
                if (typeof resp == 'object' && resp.status == 'success') {
                    location.reload();
                } else {
                    alert_toast("An error occured.", 'error');
                    end_loader();
                }
            }
        })
    }
    function printPage() {
        window.print();
    }
    function printTable() {
        var table = document.getElementById("myTable");
        var printWindow = window.open('', '_blank');
        printWindow.document.write('<html><head><title>Print Table</title>');
        printWindow.document.write('<style>');
        printWindow.document.write('table { width: 100%; border-collapse: collapse; }');
        printWindow.document.write('th, td { border: 1px solid #000; padding: 8px; }');
        printWindow.document.write('th { background-color: #f2f2f2; }');
        printWindow.document.write('td { text-align: center; }');
        printWindow.document.write('@media print {');
        printWindow.document.write('  table { page-break-inside: avoid; }');
        printWindow.document.write('}');
        printWindow.document.write('</style>');
        printWindow.document.write('</head><body>');
        printWindow.document.write('<table>' + table.innerHTML + '</table>');
        printWindow.document.write('</body></html>');
        printWindow.document.close();
        printWindow.print();
    }

</script>