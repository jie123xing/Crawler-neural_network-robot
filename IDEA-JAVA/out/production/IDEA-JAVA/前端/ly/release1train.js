$(document).ready(function(){
    $("#release2-kind1 li").click(function(){
        $("#release2-kind2").show();
    });
    $("#release2-kind2 li").click(function(){
        $("#release2-kind3").show();
    });
    $("#release2-kind1 li").each(function(){
        $(this).click(function(){
        $("#release2-kind3").hide();
        });
    });
});