$("#checkAll").change(function () {
    $("input:checkbox").prop('checked', $(this).prop("checked"));
});

function dels() {
    var checkbox = document.getElementsByName("delslist");  //此处通过此种方式才能获得多选框为数组。
    var checked_counts = 0;

    for (var i = 0; i < checkbox.length; i++) {
        if (checkbox[i].checked) {         //被选中的checkbox
            checked_counts++;
        }
    }
    if (checked_counts == 0) {
        alert('未选择任何数据');
        return;
    }
    $("#delsform").submit();
}
