    $(document).ready(function() {
    	$("body").append('  <div id="tip-box">  </div>');
    });
    function tip(message){
    	$("#tip-box").append('  <div id="tip">    <div id="closed" onclick="closed(this)">+</div>    <span>'+message+'</span>  </div>');
    	$("#tip-box").children('#tip').fadeOut(3000);
    }
    function closed(el){
    	$(el).parent('#tip').css('display', 'none');
    }