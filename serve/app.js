// 加载第三方模块
const express=require('express')
const mysql=require('mysql')
const cors=require('cors')
const session=require('express-session')

// 配置数据库连接池:提高数据效率
var pool=mysql.createPool({
	host:'127.0.0.1',
	user:'root',
	password:'',
	port:3306,
	database:'af',
	connectionLimit:15
})
var server=express();
// 配置跨域模块
server.use(cors({
	origin:['http://127.0.0.1:8080','http://localhost:8080'],
	credentials:true	//请求验证
}))
// 配置session模块
server.use(session({
	secret:'128位字符串',
	resave:true,
	saveUninitialized:true
}))

// 配置项目静态目录
server.use(express.static('public'));
// 启动监听3000
server.listen(3000);

server.get('/reg',(req,res)=>{
	let uname=req.query.uname;
	let uphone=req.query.uphone;
	let upwd=req.query.upwd;
	let sql='select uid from user where uphone=?'
	pool.query(sql,[uphone],(err,result)=>{
		if(err) throw err;
		// console.log(result);
		if(result.length==0){
			let mysql='insert into user value(null,?,?,?)';
				pool.query(mysql,[uname,upwd,uphone],(err,result)=>{
					if(err) throw err;
					res.send({code:1,msg:'添加成功'})
				})
		}else{
			res.send({code:-1,msg:'添加失败'})
		}
	})
})


// 登录页面的验证
server.get('/login',(req,res)=>{
	var uphone=req.query.uphone;
	var upwd=req.query.upwd;
	// console.log(req.query);
	var sql='select uid,uname from user where uphone=? and upwd=?';
	pool.query(sql,[uphone,upwd],(err,result)=>{
		if(err) throw err;
		if(result.length==0){
			res.send({code:-1,msg:'用户名或者密码有误'})
		}else{
			req.session.arr=result[0];
			// console.log(req.session);
			res.send({code:1,msg:'登录成功',data:req.session.arr.uid})
		}
	})
})


// 登录后获取用户信息
server.get('/use',(req,res)=>{
	var sql='select * from user where uid=?';
	var uid=req.query.uid;
	// console.log(uid);
	// 4:获取返回结果并且发送客户端
	pool.query(sql,[uid],(err,result)=>{
		if(err) throw err;
		// console.log(result);
		res.send({code:1,msg:'查询成功',data:result})
	})
})

// 商品图片
server.get('/pshow_img',(req,res)=>{
	var sql='select * from pshow_img';
	pool.query(sql,(err,result)=>{
		if(err) throw err;
		res.send({data:result})
	})
})

// 商品信息
server.get('/products',(req,res)=>{
	var sql='select* from products';
	pool.query(sql,(err,result)=>{
		if(err) throw err;
		res.send({data:result})
	})
})

// 获取购物车信息
server.get('/cart',(req,res)=>{
	if(!req.session.arr){
		res.send({code:-1,msg:'请登录'});
		return;
	}else{
		var uid=req.session.arr.uid;
		var sql='select * from cart where uid=?';
		pool.query(sql,[uid],(err,result)=>{
			if(err) throw err;
			res.send({data:result})
		})		
	}
	// console.log(req.session.arr.uid);
})

// server.get('/asc',(req,res)=>{
// 	var uid=req.session.arr.uid;
// 	if(!uid){
// 		res.send({code:-1,msg:'请登录'});
// 		return;
// 	}
// 	// console.log(req.session.arr.uid);
// 	var sql='SELECT * FROM products ORDER BY price ASC';
// 	pool.query(sql,(err,result)=>{
// 		if(err) throw err;
// 		res.send({data:result})
// 	})
// })

// server.get('/desc',(req,res)=>{
// 	var uid=req.session.arr.uid;
// 	if(!uid){
// 		res.send({code:-1,msg:'请登录'});
// 		return;
// 	}
// 	// console.log(req.session.arr.uid);
// 	var sql='SELECT * FROM products ORDER BY price DESC';
// 	pool.query(sql,(err,result)=>{
// 		if(err) throw err;
// 		res.send({data:result})
// 	})
// })



//http://127.0.0.1:3000/login?uphone=111&upwd=111
// 添加购物车
server.get('/addcart',(req,res)=>{
	// var uid=req.session.arr.uid;
	let uid=req.session.arr.uid;
	let pid=req.query.pid;
	let lname=req.query.lname;
	let img=req.query.img;
	let color=req.query.color;
	let price=req.query.price;
	let version=req.query.version;
	let sql='select* from cart where pid=? and uid=?';
	pool.query(sql,[pid,uid],(err,result)=>{
		if(err) throw err;
		// console.log(result);
		let sql='';
		if(result.length==0){
			sql=`insert into cart values(null,${pid},${uid},1,'${lname}',${price},'${img}','${version}','${color}')`;
		}else{
			sql=`update cart set count=count+1 where uid=${uid} and pid=${pid}`;
		}
		pool.query(sql,(err,result)=>{
			if(err) throw err;
			if(result.affectedRows>0){
				res.send({code:1,msg:'添加成功'})
			}else{
				res.send({code:-1,msg:'添加失败'})
				
			}
		})
	})
})


server.get('/chang',(req,res)=>{
	// console.log(req.query);
	let id=req.query.id;
	let count=req.query.count;
	let sql=`update cart set count=${count} where id=${id}`;
	pool.query(sql,[id,count],(err,result)=>{
		if(err) throw err;
		// console.log(result);
		if(result.affectedRows>0){
			res.send({code:1,msg:'减少成功'})
		}else{
			res.send({code:-1,msg:'减少失败'})
		}
	})
})

// server.get('/add',(req,res)=>{
// 	let id=req.query.id;
// 	let sql=`update cart set count=count+1 where id=${id}`;
// 	pool.query(sql,[id],(err,result)=>{
// 		if(err) throw err;
// 		if(result.affectedRows>0){
// 			res.send({code:1,msg:'添加成功'})
// 		}else{
// 			res.send({code:-1,msg:'添加失败'})
// 		}
// 	})
// })
// 
// 
// 
// server.get('/reduce',(req,res)=>{
// 	let id=req.query.id;
// 	let sql=`update cart set count=count-1 where id=${id}`;
// 	pool.query(sql,[id],(err,result)=>{
// 		if(err) throw err;
// 		if(result.affectedRows>0){
// 			res.send({code:1,msg:'减少成功'})
// 		}else{
// 			res.send({code:-1,msg:'减少失败'})
// 		}
// 	})
// })



server.get('/del',(req,res)=>{
	let id=req.query.id;
	// console.log(id);
	let sql='delete from cart where id=?';
	pool.query(sql,[id],(err,result)=>{
		if(err) throw err;
		// console.log(result);
		if(result.affectedRows>0){
			res.send({code:1,msg:'删除成功'})
		}else{
			res.send({code:-1,msg:'删除失败'})
		}
	})
})

server.get('/select',(req,res)=>{
	let brand=req.query.brand;
	// console.log(req.query);
	let sql='select * from products where brand=?';
	pool.query(sql,[brand],(err,result)=>{
		if(err) throw err;
		// console.log(result);
		res.send({data:result});
	})
})