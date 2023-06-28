https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js
        (function () {
            function filePreview(input) {
                if (input.files && input.files[0]) {
                    var reader = new FileReader();
                    reader.onload = function (e) {
                        $('#vista').html("<img src='" + e.target.result + "' height='250' width='250'/>");
                    }
                    reader.readAsDataURL(input.files[0]);
                }
            }
            $('#img').change(function () {
                filePreview(this);
            });
        })();
