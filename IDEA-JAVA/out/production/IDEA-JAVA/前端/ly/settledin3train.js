$(document).ready(function(){
    $(".labelConfirm input[type=button]").click(function(){
        $(".labelConfirm input[type=button]").hide(),
        $(".settle3-content2").show();
    });
    $(".settle3-content2 input").click(function(){
        $(".slip-box1").show();
    });
});