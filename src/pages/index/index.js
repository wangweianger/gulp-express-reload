var express = require('express');
var router = express.Router();
var indexModel=require('../../model/indexModel.js'); 

var demoData = {
  title: '首页商品',  
  time: (new Date).toString(),
  list: [],
}; 
 
/* GET home page. */
router.get('/', function(req, res, next) {
  
  // 查询数据列表
  indexModel.getIndexDatas(function(data){
    demoData.list=data
    res.render('index', demoData);
  });

});

module.exports = router;
