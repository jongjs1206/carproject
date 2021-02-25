function page1() { 
    var tl = new TimelineMax()
    
    .from(".bluecar",1,{right:"-70%",width:"0%",ease: Power2.easeOut},1,'open') 


}
$(function() {
	page1();
	
	$('.visual').slick({
		slidesToShow: 3,
		slidesToScroll: 1,
		autoplay : true,
		autoplaySpeed : 3000
	});
	

})