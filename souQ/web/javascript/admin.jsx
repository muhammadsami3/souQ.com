var addProduct = document.getElementById("addOpt");
var removeProduct = document.getElementById("removeOpt");
var editProduct = document.getElementById("editOpt");
addProduct.addEventListener('click', ShowDiv("addProduct"));
removeProduct.addEventListener('click', ShowDiv("removeProduct"));
editProduct.addEventListener('click', ShowDiv("editProduct"));

//function  ShowDiv(id){
//    return function () {
//    
//    var mainOption=document.getElementsByClassName("mainOption");
//        for (var i = 0 ;i < mainOption.length; i++) {
//            console.log("dispalynone");
//            mainOption[i].style.display="none";
//            
//        }
//    
//     document.getElementById(id).setAttribute('style',"display:block");
//    };
//}

function validateAdd() {

    var errMsg = document.getElementById("errMsg");
    errMsg.innerHTML = " ";
    var pname = document.getElementById("pname");
    var cost = document.getElementById("cost");
    var amount = document.getElementById("amount");
    var desc = document.getElementById("desc");
    var valid = true;
    if (pname.value === "" || pname.value === null) {
        errMsg.innerHTML = "<li>you must add name to the product</li>";
        pname.style.border = "2px solid red";
        valid = false;
    }else{
                pname.style.border = "2px solid green";

    }
    if (cost.value === "" || cost.value === null) {
        errMsg.innerHTML += "<li>you must add cost</li>";
        cost.style.border = "2px solid red";
        valid = false;
    }else{
                cost.style.border = "2px solid green";

    }
    if (amount.value === "" || amount.value === null) {
        valid = false;
        amount.style.border = "2px solid red";
        errMsg.innerHTML += "<li>how many items available in the store</li>";
    }else{
                amount.style.border = "2px solid green";

    }
    if (desc.value === "" || desc.value === null) {
        valid = false;
        desc.style.border = "2px solid red";

        errMsg.innerHTML += "<li>add any description</li>";
    }else{
                desc.style.border = "2px solid green";

    }
    if (valid) {

        document.forms[0].submit();
    }



}


