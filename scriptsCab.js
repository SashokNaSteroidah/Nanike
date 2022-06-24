$(function () {
    $(".num").mask("+7 (999) 999-9999"); // Делает маску для номера
});
$(function () {
    $(".date").mask("99.99.9999", { placeholder: "дд.мм.гггг" });
});
document.querySelector('.profile1').onclick = () => {
    $('.back').fadeIn(200);
    $('.napishiMneSMS1').fadeIn(200);
    document.querySelector('html').style.overflow = 'hidden'
}

document.querySelector('.back').onclick = () => {
    $('.back').fadeOut(200);
    $('.napishiMneSMS').fadeOut(200);
    $('.napishiMneSMS1').fadeOut(200);
    $('.congrat').fadeOut(200);
    document.querySelector('html').style.overflow = 'auto'
}
$(function () {
    $(".numTC7").mask("+7 (999) 999-9999"); // Делает маску для номера
});

$('.change').click(function () {
    $(".numTCSur").removeAttr("readonly");
    $(".numTCName").removeAttr("readonly");
    $(".numTCFat").removeAttr("readonly");
    $(".date").removeAttr("readonly");
    $(".numTC1").removeAttr("readonly");
    $(".passserial").removeAttr("readonly");
    $(".passNum").removeAttr("readonly");
    $(".rights").removeAttr("readonly");
    $(".num").removeAttr("readonly");
});

document.querySelector('.sendback').onclick = () => {
    $('.napishiMneSMS').fadeIn(200);
    $('.back').fadeIn(200);
    document.querySelector('html').style.overflow = 'hidden'
}

document.querySelector('.sendSMS').onclick = () => {
    $('.congrat').fadeIn(200);
    $('.napishiMneSMS').fadeOut(200);
    $(".congrat").delay(700).fadeOut(300);
    $(".back").delay(700).fadeOut(300);
    document.querySelector('html').style.overflow = 'auto'
}


function noDigits(event) {
    if ("1234567890".indexOf(event.key) != -1)
        event.preventDefault();
}


function cislo() {
    if (event.keyCode != 43 && event.keyCode < 48 || event.keyCode > 57)
        event.preventDefault();
}








let validEmail
let EMAIL_REGEXP = /^(([^<>()[\].,;:\s@"]+(\.[^<>()[\].,;:\s@"]+)*)|(".+"))@(([^<>()[\].,;:\s@"]+\.)+[^<>()[\].,;:\s@"]{2,})$/iu;
let input = document.querySelector('.numTC1');
input.addEventListener('input', onInput);
function isEmailValid(value) {
    return EMAIL_REGEXP.test(value);
}
function onInput() {
    if (isEmailValid(input.value)) {
        input.style.border = 'green 1px solid';
        validEmail = 1
    } else {
        input.style.border = 'red 1px solid';
        validEmail = 0
    }
}
document.querySelector(".numTCSur").onkeyup = () => {
    if (document.querySelector(".numTCSur").value == 0) {
        document.querySelector(".numTCSur").style.border = 'red 1px solid'
    }
    else {
        document.querySelector(".numTCSur").style.border = 'green 1px solid'
    }
}
document.querySelector(".numTCName").onkeyup = () => {
    if (document.querySelector(".numTCName").value == 0) {
        document.querySelector(".numTCName").style.border = 'red 1px solid'
    }
    else {
        document.querySelector(".numTCName").style.border = 'green 1px solid'
    }
}
document.querySelector(".numTCFat").onkeyup = () => {
    if (document.querySelector(".numTCFat").value == 0) {
        document.querySelector(".numTCFat").style.border = 'red 1px solid'
    }
    else {
        document.querySelector(".numTCFat").style.border = 'green 1px solid'
    }
}
document.querySelector(".passserial").onkeyup = () => {
    if (document.querySelector(".passserial").value.length <= 3) {
        document.querySelector(".passserial").style.border = 'red 1px solid'
    }
    else {
        document.querySelector(".passserial").style.border = 'green 1px solid'
    }
}
document.querySelector(".date").onkeyup = () => {
    if (document.querySelector(".date").value.length <= 9) {
        document.querySelector(".date").style.border = 'red 1px solid'
    }
    else {
        document.querySelector(".date").style.border = 'green 1px solid'
    }
}
document.querySelector(".passNum").onkeyup = () => {
    if (document.querySelector(".passNum").value.length <= 5) {
        document.querySelector(".passNum").style.border = 'red 1px solid'
    }
    else {
        document.querySelector(".passNum").style.border = 'green 1px solid'
    }
}
document.querySelector(".rights").onkeyup = () => {
    if (document.querySelector(".rights").value.length <= 9) {
        document.querySelector(".rights").style.border = 'red 1px solid'
    }
    else {
        document.querySelector(".rights").style.border = 'green 1px solid'
    }
}





document.querySelector(".save").onclick = () => {
    let pass = document.querySelector(".pass").value
    let pass1 = document.querySelector(".pass1").value
    let myPhone = document.querySelector('.numTC5').value;
    let passw = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,16}$/;
    let valid = myPhone.replace(/\s/g, ''); // Уберает пробелы
    valid = valid.replace(/[{()}]/g, ''); // Уберает скобки
    valid = valid.replace(/-/g, ''); // Уберает диффисы
    valid = valid.replace("+7", "8") // Заменяет +7 на 8 первые
    if ((document.querySelector('.surname').value.length >= 1)
        && (document.querySelector('.name').value.length >= 1)
        && (document.querySelector('.father').value.length >= 1)
        && (document.querySelector('.date').value.length == 10)
        && (document.querySelector('.numTC1').value.length >= 5)
        && (document.querySelector('.num').value.length >= 5)
        && (document.querySelector('.passserial').value.length == 4)
        && (document.querySelector('.passNum').value.length == 6)
        && (document.querySelector('.pass').value.match(passw))
        && (pass == pass1)) {
        $('.wrong').fadeOut(200);
    }
    else {
        $('.wrong').fadeIn(200);
    }
}

    