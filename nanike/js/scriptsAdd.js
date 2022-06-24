$(function () {
    $(".numTC5").mask("99.99.9999", { placeholder: "дд.мм.гггг" });
});
document.querySelector('.profile').onclick = () => {
    $('.back').fadeIn(200);
    $('.napishiMneSMS1').fadeIn(200);
    document.querySelector('html').style.overflow = 'hidden'
}

document.querySelector('.back').onclick = () => {
    $('.back').fadeOut(200);
    $('.napishiMneSMS1').fadeOut(200);
    $('.congrat').fadeOut(200);
    document.querySelector('html').style.overflow = 'auto'
}
$(function () {
    $(".numTC7").mask("+7 (999) 999-9999"); // Делает маску для номера
});