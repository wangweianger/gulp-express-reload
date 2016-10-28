module.exports = function (app) {

	// 获得所有数据
	app.all('/order/getAllDatas', function (req, res, next) {
		require('../mysql.js')('select * from goods',function(data){
		  	res.send({
		  		code:1000,
		  		data:data
		  	});
		});
	});	
	
	// 增加点击量
	app.all('/order/addClickCount', function (req, res, next) {
		var num=parseInt(req.body.num)+1;
		console.log(num);
		require('../mysql.js')('update goods set click_count='+num+' where goods_id='+req.body.goodsId,function(data){
		  	res.send({
		  		code:1000,
		  		data:true
		  	});
		});
	});	




	
};
