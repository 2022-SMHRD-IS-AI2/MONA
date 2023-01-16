const a=document.querySelectorAll(".shipping-a");
const shippings =document.querySelector(".shipping.c");
const firstTop =shippings.offsetTop;
const feedback =document.querySelector(".feedback");
const secondTop=feedback.offsetTop;
const comment =document.querySelector(".comment1");
const thirdTop=comment.offsetTop;


a[0].onclick = function(){
    console.log('눌럿다')
    window.scroll({top:firstTop, behavior:"smooth"});
}
a[1].onclick = function(){
    window.scroll({top:secondTop,behavior:"smooth"})
}
a[2].onclick = function (){
    window.scroll({top:thirdTop,behavior:"smooth"})
    
}
