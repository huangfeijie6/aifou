import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import MintUI from 'mint-ui'
import bus from './bus'

Vue.prototype.bus=bus;
Vue.use(MintUI);
import 'mint-ui/lib/style.css'
import ElementUI from 'element-ui'
import 'element-ui/lib/theme-chalk/index.css';
Vue.use(ElementUI)

import axios from 'axios'
axios.defaults.baseURL='http://127.0.0.1:3000/'

// 保存session所需信息
axios.defaults.withCredentials=true
Vue.prototype.axios=axios;
Vue.config.productionTip = false

import vuex from 'vuex'
// var store=new Vue.store({
	// state:{}
// })

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
