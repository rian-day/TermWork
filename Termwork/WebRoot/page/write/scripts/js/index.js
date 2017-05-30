    var editor = new Simditor({
      textarea: $('#editor')
    });
    function commit(){
      var eassytitle=$(".eassytitle").val();
      var content=$("textarea").val();
      $.ajax({
        url: 'postEassy.in',
        type: 'POST',
        data: {
          eassytitle: eassytitle,
          content: content
        },
        success: function(message){
        	if(message==1){
        		tip("提交成功");
        	}else tip("提交失败");
        }
      })
      .done(function() {
        console.log("success");
      })
      .fail(function() {
        console.log("error");
      })
      .always(function() {
        console.log("complete");
      });
      
    }
