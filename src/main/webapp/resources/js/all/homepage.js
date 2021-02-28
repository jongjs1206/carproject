 function page1() { 
    var tl = new TimelineMax()
    
    .from(".bluecar",1,{right:"-70%",width:"0%",ease: Power2.easeOut},1,'open') 


}
$(function() {
	page1();
})