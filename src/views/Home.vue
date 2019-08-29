<template>
  <div class="home">
	  <mt-tab-container v-model='active'>
		  <mt-tab-container-item id='tab1'>
			  <div style="width:100%;height: 180px;">
				  <mt-swipe :auto='4000'>
					  <mt-swipe-item><img src="../../public/img/lun1.png" style='width:100%'></mt-swipe-item>
					  <mt-swipe-item><img src="../../public/img/lun2.png" style='width:100%'></mt-swipe-item>
					  <mt-swipe-item><img src="../../public/img/lun3.png" style='width:100%'></mt-swipe-item>
					  <mt-swipe-item><img src="../../public/img/lun4.png" style='width:100%'></mt-swipe-item>
					  <mt-swipe-item><img src="../../public/img/lun5.png" style='width:100%'></mt-swipe-item>
					  <mt-swipe-item><img src="../../public/img/lun6.png" style='width:100%'></mt-swipe-item>
					  <mt-swipe-item><img src="../../public/img/lun7.jpg" style='width:100%'></mt-swipe-item>
					  <mt-swipe-item><img src="../../public/img/lun8.jpg" style='width:100%'></mt-swipe-item>
				  </mt-swipe>
			  </div>
			  <nava></nava>
			  <day-recommend></day-recommend>
		  </mt-tab-container-item>
		  <mt-tab-container-item id='tab2'>
			  <cart></cart>
		  </mt-tab-container-item>
		  <mt-tab-container-item id='tab3'>
			  <uc></uc>
			  <order v-for="(task,i) of 4" :key='i'></order>
		  </mt-tab-container-item>
	  </mt-tab-container>
	  <mt-tabbar fiexd v-model='active'>
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
			  :focused='currentIndex[2].isselect'></tabbaricon>
			  我的
			  </mt-tab-item>
	  </mt-tabbar>
  </div>
</template>

<script>
import tabbaricon from '../components/tabbaricon.vue'
import cart from '../components/cart.vue'
import nava from '../components/nav.vue'
import uc from '../components/uc.vue'
import order from '../components/order.vue'
import goback from '../components/goback.vue'
import dayrecommend from '../components/dayrecommend.vue'
export default {
	data(){
		return{ 
			active:'tab1',
			currentIndex:[
				{isselect:true},
				{isselect:false},
				{isselect:false}
			]
		}
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
	  'tabbaricon':tabbaricon,
	  'cart':cart,
	  'nava':nava,
	  'uc':uc,
	  'order':order,
	  'goback':goback,
	  'dayRecommend':dayrecommend
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