
    $(document).ready(function () {
        $.ajax({
            type: "GET",
            url: "/home/aswin90/experiments/jQuery/resources/books.xml",
            dataType: "xml",
            success: function (xml) {
                $(xml).find('book').each(function () {
                    var Title = $(this).find('title').text();
                    var Author = $(this).find('author').text();
                    var Price = $(this).find('price').text();
                    $('<tr></tr>').html('<td>' + Title + '</td><td>' + Author + '</td><td>' + Price + '</td>').appendTo('#chart');
                });
            }
        });
    });
