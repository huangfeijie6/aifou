import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
	active:'tab2',
	currentIndex:[
		{isselect:false},
		{isselect:true},
		{isselect:false}
	]
  },
  mutations: {
		changState(idx){
			for(let i=0;i<this.currentIndex.length;i++){
				if(idx==i){
					this.currentIndex[i].isselect=true;
				}else{
					this.currentIndex[i].isselect=false;
				}
			}
		}
  },
  getters:{
	  
  },
  
  actions: {

  }
})
