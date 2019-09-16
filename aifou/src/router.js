import Vue from 'vue'
import Router from 'vue-router'
import Home from './views/Home.vue'
import cart from './views/cart1.vue'
import my from './views/my1.vue'
import Pro from './views/pro.vue'
import login from './views/login.vue'
import proitem from './views/proitem.vue'
import reg from './views/reg.vue'

Vue.use(Router)

export default new Router({
  routes: [
    {path:'/',name: 'home',component: Home},
    {path:'/Pro',component:Pro},
	 {path:'/cart',component:cart},
	 {path:'/my',component:my},
	 {path:'/login',component:login},
	 {path:'/proitem/:pid',component:proitem,props:true},
	 {path:'/reg',component:reg}
  ]
})
