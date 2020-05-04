/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function displayRecentlySeen(){
    let productJSON;
    let url = "./recentlySeen";
    let xhttp = new XMLHttpRequest();
    xhttp.open("GET", url, true);
    xhttp.responseType = "json";
    xhttp.onreadystatechange = function () {
        let done = 4;
        let ok = 200;

        if (this.readyState === done && this.status === ok) {
            productJSON = this.response;
            console.log(productJSON);

            document.getElementById("recent").innerHTML = "";
            productJSON.recentProducts.forEach((product) => {
                document.getElementById("recent").innerHTML += `
                    <div class="card col s12 m4 l2">
                        <div class="card-content" id="recent-product-${product.id}">${product.name}</div>
                    </div>`
            });
        }
    };
    xhttp.send();
}

function displayProduct(prodId) {
    console.log("called http for product with id=" + prodId);
    let productJSON;
    let url = "./product?id=" + prodId;
    let xhttp = new XMLHttpRequest();
    xhttp.open("GET", url, true);
    xhttp.responseType = "json";
    xhttp.onreadystatechange = function () {
        let done = 4;
        let ok = 200;

        if (this.readyState === done && this.status === ok) {
            productJSON = this.response;
            console.log(productJSON);
            document.getElementById("main").innerHTML = `
                <!-- Post detailed template -->
                <div class="product-detailed" id="product-${productJSON.id}">
                    <div class="card">
                        <div class="card-content">
                            <span class="card-title">${productJSON.name}</span>                            
                            <p class="grey-text"><i>${productJSON.price}</i></p>
                            <p>${productJSON.description}</p>
                        </div>
                            <div class="card-content">
                            <div class="card-image" style="width:150px"><img src="${productJSON.imgURL}"></div>
                        </div>
                    </div>
                </div>`;
              displayRecentlySeen();
        }
    };
    xhttp.send();
    // When the user clicks on the item, scroll to the top of the document
    document.body.scrollTop = 0; // For Safari
    document.documentElement.scrollTop = 0; // For Chrome, Firefox, IE and Opera
}
