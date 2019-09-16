<template>
  <div class="home">
	  <mt-tab-container v-model='active'>
		  <mt-tab-container-item id='tab1'>
			  <index></index>
		  </mt-tab-container-item>
		  <mt-tab-container-item id='tab2'>
			  <cart></cart>
		  </mt-tab-container-item>
		  <mt-tab-container-item id='tab3'>
			  <my></my>
		  </mt-tab-container-item>
	  </mt-tab-container>
	  <mt-tabbar fixed v-model='active'>
			<mt-tab-item id='tab1' @click.native='changState(0)'>
			  <tabbaricon 
			  :normal="require('../assets/index.png')"
			  :select="require('../assets/index_active.png')"
			  :focused='currentIndex[0].isselect'></tabbaricon>
			  首页
			</mt-tab-item>
			<mt-tab-item id='tab2' @click.native='changState(1)'>
			  <tabbaricon
			  :normal="require('../assets/shopping.png')"
			  :select="require('../assets/shopping_active.png')"
			  :focused='currentIndex[1].isselect'></tabbaricon>
			  购物车
			</mt-tab-item>
			<mt-tab-item id='tab3' @click.native='changState(2)'>
				<tabbaricon
				:normal="require('../assets/my.png')"
				:select="require('../assets/my_active.png')"
				:focused='currentIndex[2].isselect'>
				</tabbaricon>
			  我的
			</mt-tab-item>
	  </mt-tabbar>
  </div>
</template>

<script>
import index from './index.vue'
import tabbaricon from '../components/tabbaricon.vue'
import cart from './cart.vue'
import my from './my.vue'

export default {
	data(){
		return{ 
			active:'tab2',
			currentIndex:[
				{isselect:false},
				{isselect:true},
				{isselect:false}
			]
		}
	},
	created() {
		
	},
	methods:{
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
  components: {
	  'index':index,
	  'tabbaricon':tabbaricon,
	  'cart':cart,
	  'my':my
  }
}
</script>
<style scoped>
	.mint-tabbar > .mint-tab-item{
		color: #2c2c2c;
	}
	.mint-tabbar > .mint-tab-item.is-selected{
		color: #23a96f;
	}
	
</style>