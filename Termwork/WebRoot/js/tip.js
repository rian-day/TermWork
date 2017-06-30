    $(document).ready(function() {
    	$("body").append('  <div id="tip-box">  </div>');
    });
    function tip(message){
    	$("#tip-box").append('  <div id="tip">    <div id="closed" onclick="closed(this)">+</div>    <span>'+message+'</span>  </div>');
    	setTimeout(function(){
    		$("#tip-box").children('#tip').first().attr('id', 'tip-out').fadeOut(5000);
    	},100);
    }
    function closed(el){
    	$(el).parent('#tip').css('display', 'none');
    }