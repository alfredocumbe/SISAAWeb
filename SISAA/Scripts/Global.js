//Global Initialization
const Toast = Swal.mixin({
    toast: true,
    position: 'top-end',
    showConfirmButton: false,
    timer: 3000
});

//Loading variables
const loadingStart = function () {
    $body = $("body").addClass("loading");
};

const loadingStop = function () {
    $body = $("body").removeClass("loading");
};

//Start Loaing
loadingStart();

//Set User Information 
if (!(typeof GlobalUser === 'undefined')) {
    if (GlobalUser != null){
     console.log(GlobalUser.Body.Name);
        $("#UserName").text(GlobalUser.Body.Name);
    }
}



