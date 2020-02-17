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
    console.log("Loading start...");
};

const loadingStop = function () {
    $body = $("body").removeClass("loading");
    console.log("Loading stop...")
};

//Start Loaing
loadingStart();

//Set User Information 
if (!(typeof GlobalUser === 'undefined')) {
    if (GlobalUser != null) {
        $("#UserName").text(GlobalUser.Body.Name);
    }
}