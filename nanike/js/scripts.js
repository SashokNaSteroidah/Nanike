
document.querySelector('.back').onclick = () => {
    $('.napishiMneSMS1').fadeOut(200);
    $('.back').fadeOut(200);
    document.querySelector('html').style.overflow = 'auto'
}
$(function () {
    $(".numTC7").mask("+7 (999) 999-9999"); // Делает маску для номера
});


document.querySelector('.scroll1').onclick = () => {
    $('html, body').animate({ scrollTop: 950 }, 500);
}
document.querySelector('.scroll2').onclick = () => {
    $('html, body').animate({ scrollTop: 1650 }, 500);
}


// document.querySelector('.changeParam').onclick = () => {
//     document.getElementById("numTC").removeAttribute("readonly");
// };
// $(document).ready(function () {

//     $('.changeParam').click(function () {

//         var rBtnVal = $(this).val();

//         if (rBtnVal == "yes") {
//             $("#numTC").attr("readonly", false);
//         }
//         else {
//             $("#numTC").attr("readonly", true);
//         }
//     });
// });

document.querySelector('.profile').onclick = () => {
    $('.back').fadeIn(200);
    $('.napishiMneSMS1').fadeIn(200);
    document.querySelector('html').style.overflow = 'hidden'
}
