import Vue from 'vue'
import Router from 'vue-router'
import Home from './views/Home.vue'
import Pro from './views/pro.vue'
import login from './views/login.vue'
import proitem from './views/proitem.vue'

Vue.use(Router)

export default new Router({
  routes: [
    {path:'/',name: 'home',component: Home},
    {path:'/Pro',component:Pro},
	 {path:'/login',component:login},
	 {path:'/proitem/:pid',component:proitem,props:true}
  ]
})
