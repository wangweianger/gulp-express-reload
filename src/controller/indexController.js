
var indexModel=require('../model/indexModel.js'); 

module.exports = function (app) {

	// 增加点击量
	app.all('/order/addClickCount', function (req, res, next) {
		var num=parseInt(req.body.num)+1;
		indexModel.addClickCount(num,req.body.goodsId,function(data){
			res.send({
		  		code:1000,
		  		data:data
		  	});
		});
	});	




	
};
