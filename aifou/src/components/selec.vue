<!-- template组件模板：保存标签 -->
<template>
	<!-- 模板要求：必须有一个根标签 -->
	<div style="background: #FFFFFF;">
		<div class="heade">
			<div @click="pic" :class="{or_bottom}">当前价格
				<div :class="{icon1,icon1_active1,icon1_active2}"></div>
			</div>
			<div @click="icon2=!icon2">筛选<div :class="{icon2:true,icon2_active:icon2}"></div></div>
		</div>
		<div class="panel" :style="icon2?'top:0px;':'top: -100%;'">
			<classify :brands='brands'  :stats='stats'   @brea='brea' ></classify>
			<div class="button">
				<div class="left" @click="reset" >重置</div>
				<div class="right" @click="complete">完成</div>
			</div>
		</div>
	</div>
</template>
<script>
	import classify from './classify.vue'
	export default {
		data(){
			return{
				i:0,
				or_bottom:false,
				icon1:true,
				icon1_active1:false,
				icon1_active2:false,
				icon2:false,
				brand:'',
				list:[],
				stats:[],
				brands:[]
			}
		},
		props:['lists'],
		methods:{
			crea(){
				this.stats=[];
				let len=this.lists.length;
				
				for(let i=0;i<len;i++){
					this.brands.push(this.lists[i].brand)
				}
				this.brands=[...new Set(this.brands)];
				for(let j=0;j<this.brands.length;j++){
					this.stats.push({isselect:false});
				}
			},
			// 当前价格 按钮（作用就是价格排序）
			pic(){
				let i=this.i++;
				this.i%2==0?(this.icon1_active1=false,this.icon1_active2=true):(this.icon1_active1=true,this.icon1_active2=false);
				this.or_bottom=true;
				this.icon1=false;
				var resultData=this.lists;
				function compare(price) { //按照数组中的对象属性进行排序
					return function (a, b) {
					  var value1 = a[price];
					  var value2 = b[price];
						if(i%2==0){
							// 从小到大
							return value2 - value1;
						}else{
							// 从大到小
							return value1 - value2;
						}
					}
				}
				this.list=this.lists=resultData.sort(compare('price'));
				this.$emit('asc',this.list)
			},
			brea(brand){
				this.brand=brand;
			},
			complete(){
				if(!this.brand){
					let url='products';
					this.axios.get(url).then(res=>{
						let list=res.data.data;
						this.$emit('asc',list);
					})
				}else{
					let url='select';
					let obj={brand:this.brand};
					this.axios.get(url,{params:obj}).then(res=>{
						let list=res.data.data;
						this.$emit('asc',list);
					})
				}
				this.icon2=false;
			},
			reset(){
				this.brand=null;
				this.crea();
			}
		},
		created() {
			setTimeout(()=>{
				// console.log(this.lists) // √--> 'lesser','..一段长文..'
				this.crea();
			},1000)
		},
		components:{
			'classify':classify
		}
	}
</script>

<style scoped>
	/* 当前组件专有样式内容 */
	.heade{
		position: fixed;
		width: 100%;
		background: #fff;
		display: flex;
		justify-content: space-around;
		align-items: center;
		height: 10vh;
		top: 0;
		font-size: 14px;
		border-bottom: 1px solid #eee;
		z-index: 2;
	}
	.heade>div{
		display: flex;
		justify-content: center;
		align-items: center;
		width: 50%;
		height: 10vh;
	}
	.heade>div:first-child{
		border-right: 1px solid #E0E0E0;
	}
	.or_bottom{
		color: orange;
	}
	.icon1{
		width: 25px;
		height: 25px;
		background:url('../assets/icon.png') no-repeat -141px -391px;
		background-size: 550px 600px;
	}
	.icon1_active1{
		width: 25px;
		height: 25px;
		background:url('../assets/icon.png') no-repeat -41px -391px;
		background-size: 550px 600px;
	}
	.icon1_active2{
		width: 25px;
		height: 25px;
		background:url('../assets/icon.png') no-repeat -91px -391px;
		background-size: 550px 600px;
	}
	.icon2{
		width: 25px;
		height: 25px;
		background:url('../assets/icon.png') no-repeat -292px -341px;
		background-size: 550px 600px;
	}
	.icon2_active{
		background:url('../assets/icon.png') no-repeat -342px -341px;
		background-size: 550px 600px;
	}
	.panel{
		position: fixed;
		width: 100%;
		height: 100vh;
		padding-top: 10vh;
		box-sizing: border-box;
		z-index: 0;
		background: #fff;
		transition: 1s;
	}
	.button{
		position: absolute;
		width: 100%;
		bottom: 0;
		display: flex;
		justify-content: space-between;
		align-items: center;
		color: #fff;
		height: 50px;
	}
	.right{
		display: flex;
		justify-content: center;
		align-content: center;
		background: seagreen;
		width: 100%;
		line-height: 50px;
	}
	.left{
		display: flex;
		justify-content: center;
		align-content: center;
		background: orange;
		width: 100%;
		line-height: 50px;
	}
</style>