<style>
    h2 {
        color: rgb(255, 200, 0);
    }

    #subntn {
        background-color: rgb(255, 200, 0);
    }
</style>
<div class="container-fluid">

    <div class="form-group">
        <h2>Payment Details</h2>
        <form class="payment-form" action="process_payment.php" method="post"
            onsubmit="event.preventDefault(); submitForm();">
            <input name="package_id" type="hidden" value="<?php echo $_GET['package_id'] ?>">
            Username:
            <input name="username" type="text" placeholder="Enter your username" required><br><br>

            Cardholder Name
            <input type="text" id="name" name="name" placeholder="Enter cardholder name" required><br><br>

            Card Number
            <input type="text" id="card-number" name="card_number" placeholder="Enter card number" required>
                <span id="error-message" style="color: red;"></span><br><br>

                Expiry Date
                <input type="text" id="expiry-date" name="expiry_date" placeholder="Enter expiry date (MM/YYYY)"
                    required>
                <span id="expiry-error-message" style="color: red;"></span><br><br>

                CVV
                <input type="number" id="cvv" name="cvv" placeholder="Enter CVV" required><br>
                <span id="cvv-error-message" style="color: red;"></span><br><br>

                <button type="submit" id="subbtn"
                    style="background-color: rgb(255,200,0); border-radius:20%; border-color:white;"
                    onclick="enableForm2()">Submit</button><br><br>
        </form>
        <form action="" id="book-form" style="display: none;">
            <h2> Book Your Trip</h2>
            <input name="package_id" type="hidden" value="<?php echo $_GET['package_id'] ?>">
            Select the Date of Travel:<br>
            <input type="date" class="form form-control" required name="schedule" min="<?php echo date('Y-m-d'); ?>" max="" >

        </form>
    </div>

</div>
<script>

    function validateCardNumber() {
        var cardNumber = document.getElementById('card-number').value;
        // Remove all non-digit characters from the input
        var digitsOnly = cardNumber
        // Check if the remaining string has exactly 16 digits
        if (digitsOnly.length !== 16) {
            // Show the error message
            document.getElementById('error-message').textContent = "Card number must contain exactly 16 digits.";
            // Set focus back to the text field
            document.getElementById('card-number').focus();
        } else {
            // Clear the error message if the input is valid
            document.getElementById('error-message').textContent = "";
        }
    }

    // Add event listener for the text field's blur event (when it loses focus)
    document.getElementById('card-number').addEventListener('blur', validateCardNumber)

    function validateCVV() {
        var cvv = document.getElementById('cvv').value;
        // Check if the CVV has exactly 3 digits
        if (cvv.length !== 3) {
            // Show the error message
            document.getElementById('cvv-error-message').textContent = "CVV must contain exactly 3 digits.";
            // Set focus back to the text field
            document.getElementById('cvv').focus();
        } else {
            // Clear the error message if the input is valid
            document.getElementById('cvv-error-message').textContent = "";
        }
    }

    // Add event listener for the CVV input's blur event (when it loses focus)
    document.getElementById('cvv').addEventListener('blur', validateCVV);

    function validateExpiryDate() {
        var expiryDate = document.getElementById('expiry-date').value;
        // Regular expression to check the format MM/YYYY
        var regex = /^(0[1-9]|1[0-2])\/(20)\d{2}$/;
        if (!expiryDate.match(regex)) {
            // Show the error message
            document.getElementById('expiry-error-message').textContent = "Expiry date must be in MM/YYYY format.";
            // Set focus back to the text field
            document.getElementById('expiry-date').focus();
        } else {
            // Clear the error message if the input is valid
            document.getElementById('expiry-error-message').textContent = "";
        }
    }

    // Add event listener for the expiry date input's blur event (when it loses focus)
    document.getElementById('expiry-date').addEventListener('blur', validateExpiryDate);


    var currentDate = new Date();

// Calculate the date 6 months from now
var maxDate = new Date();
maxDate.setMonth(currentDate.getMonth() + 6);

// Format the date as 'YYYY-MM-DD' (required format for the input field)
var formattedMaxDate = maxDate.toISOString().slice(0, 10);

// Set the calculated maximum date to the input field
document.querySelector('input[name="schedule"]').setAttribute("max", formattedMaxDate);

    $(function () {

        $('#book-form').submit(function (e) {
            e.preventDefault();
            start_loader()
            $.ajax({
                url: _base_url_ + "classes/Master.php?f=book_tour",
                method: "POST",
                data: $(this).serialize(),
                dataType: "json",
                error: err => {
                    console.log(err)
                    alert_toast("an error occured", 'error')
                    end_loader()
                },
                success: function (resp) {
                    if (typeof resp == 'object' && resp.status == 'success') {
                        alert_toast("Book Request Successfully sent.")
                        $('.modal').modal('hide')
                    } else {
                        console.log(resp)
                        alert_toast("an error occured", 'error')
                    }
                    end_loader()
                }
            })
        })
    })


    function submitForm() {
        var form = $('.payment-form');
        var formData = form.serialize(); // Get the form data

        $.ajax({
            url: form.attr('action'),
            method: form.attr('method'),
            data: formData,
            dataType: 'json',
            success: function (response) {
                // Handle the response from the server
                if (response.status === 'success') {
                    // Payment was successful
                    alert_toast('Payment successful!');
                    document.getElementById("subbtn").style.display = "none";
                    document.getElementById("book-form").style.display = "block";
                    document.getElementById("cancel").style.display = "none";
                    
                    // Do any additional actions or display a success message
                } else {
                    // Payment failed or error occurred
                    alert_toast('Payment failed. Please try again.');
                    // Do any additional error handling or display an error message
                }
            },
            error: function () {
                // Handle the AJAX request error
                alert_toast('An error occurred during the payment process. Please try again later.');
                document.getElementById("subbtn").style.display = "none";
                document.getElementById("book-form").style.display = "none";
                // Do any additional error handling or display an error message
            }
        });
    }

</script>