//= require rails-ujs
//= require_tree .
console.log('Hello World from Webpacker')
import 'bootstrap';
import { initUpdateNavbarOnScroll } from '../components/navbar';
initUpdateNavbarOnScroll();
import { loadDynamicBannerText } from '../components/banner';
loadDynamicBannerText();
import { bindSweetAlertButtonDemo } from '../components/banner';
bindSweetAlertButtonDemo();
import '../components/select2';
