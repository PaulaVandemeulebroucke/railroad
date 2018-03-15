
import Typed from 'typed.js';

function loadDynamicBannerText() {

 if (document.querySelector("#banner-typed-text")) {
   new Typed('#banner-typed-text', {
     strings: ["TROUVE TA VOIE", "<strong>avec nous si possible...</strong>"],
     typeSpeed: 50,
     loop: true
   });
 }

}

export { loadDynamicBannerText };
import swal from 'sweetalert';

function bindSweetAlertButtonDemo() {
 document.getElementById('sweet-alert-demo').addEventListener('click', () => {
   swal({
     title: "A nice alert",
     text: "This is a great alert, isn’t it?",
     icon: "success"
   })
 });
}

export { bindSweetAlertButtonDemo };
