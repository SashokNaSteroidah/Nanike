document.querySelector('.back').onclick = () => {
    $('.napishiMneSMS1').fadeOut(200);
    $('.back').fadeOut(200);
    document.querySelector('html').style.overflow = 'auto'
}

document.querySelector('.profile').onclick = () => {
    $('.back').fadeIn(200);
    $('.napishiMneSMS1').fadeIn(200);
    document.querySelector('html').style.overflow = 'hidden'
}

function noDigits(event) {
    if ("1234567890".indexOf(event.key) != -1)
        event.preventDefault();
}



$(function () {
    $(".numTC7").mask("+7 (999) 999-9999"); // Делает маску для номера
});
$(function () {
    $(".num").mask("+7 (999) 999-9999"); // Делает маску для номера
});
$(function () {
    $(".date").mask("99.99.9999", { placeholder: "дд.мм.гггг" });
});



function cislo() {
    if (event.keyCode != 43 && event.keyCode < 48 || event.keyCode > 57)
        event.preventDefault();
}




document.querySelector(".pass1").onkeyup = () => {
    let pass = document.querySelector(".pass").value
    let pass1 = document.querySelector(".pass1").value
    if (pass == pass1) {
        $('.passCheck').fadeOut(200);
    }
    else {
        $('.passCheck').fadeIn(200);
    }
}
document.querySelector(".pass").onkeyup = () => {
    // Validate lowercase letters
    let pass = document.querySelector(".pass").value
    let pass1 = document.querySelector(".pass1").value
    if (pass == pass1) {
        $('.passCheck').fadeOut(200);
    }
    else {
        $('.passCheck').fadeIn(200);
    }
    let lowerCaseLetters = /[!@#$&*%)(;'?.,]/g;
    if (document.querySelector(".pass").value.match(lowerCaseLetters)) {
        document.querySelector(".passCheck3").style.color = 'red';
    } else {
        document.querySelector(".passCheck3").style.color = 'green'
    }
    let numbers = /[0-9]/g;
    let spec = /[!@#$&*%]/g;
    if (document.querySelector(".pass").value.match(numbers)) {
        document.querySelector(".passCheck2").style.color = 'green';
    } else {
        document.querySelector(".passCheck2").style.color = 'red'
    }
    if (document.querySelector(".pass").value.length >= 8) {
        document.querySelector(".passCheck1").style.color = 'green';
    } else {
        document.querySelector(".passCheck1").style.color = 'red'
    }
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
document.querySelector(".surname").onkeyup = () => {
    if (document.querySelector(".surname").value == 0) {
        document.querySelector(".surname").style.border = 'red 1px solid'
    }
    else {
        document.querySelector(".surname").style.border = 'green 1px solid'
    }
}
document.querySelector(".name").onkeyup = () => {
    if (document.querySelector(".name").value == 0) {
        document.querySelector(".name").style.border = 'red 1px solid'
    }
    else {
        document.querySelector(".name").style.border = 'green 1px solid'
    }
}
document.querySelector(".father").onkeyup = () => {
    if (document.querySelector(".father").value == 0) {
        document.querySelector(".father").style.border = 'red 1px solid'
    }
    else {
        document.querySelector(".father").style.border = 'green 1px solid'
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
    var form = document.querySelector('#reg-form');
    let pass = document.querySelector(".pass").value
    let pass1 = document.querySelector(".pass1").value
    let myPhone = document.querySelector('.num').value;
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
        form.submit()
    }
    else {
        $('.wrong').fadeIn(200);
    }
}

