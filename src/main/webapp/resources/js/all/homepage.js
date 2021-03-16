 function page1() { 
    var tl = new TimelineMax()
    
    .from(".bluecar",1,{right:"-70%",width:"0%",ease: Power2.easeOut},1,'open') 

	$('.more-btn1').click(function(){
		if($('.login_on').val()==''){
			window.self.location = "../all/login.do";
		}else{
			window.self.location = "../user/sales.do";
		}
	})
}
$(function() {
	page1();
})