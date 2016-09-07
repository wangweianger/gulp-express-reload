var express = require('express');
var router = express.Router();


var demoData = {
  title: 'node.js demo',  
  time: (new Date).toString(),
  list: [
    {
      title: '<油价>调整周期缩至10个工作日 无4%幅度限制',
      url: 'http://finance.qq.com/zt2013/2013yj/index.htm'
    },
    {
      title: '明起汽油价格每吨下调310元 单价回归7元时代',
      url: 'http://finance.qq.com/a/20130326/007060.htm'
    },
    {
      title: '广东副县长疑因抛弃情妇遭6女子围殴 纪检调查',
      url: 'http://news.qq.com/a/20130326/001254.htm'
    },
    {
      title: '湖南27岁副县长回应质疑：父亲已不是领导',
      url: 'http://news.qq.com/a/20130326/000959.htm'
    },
    {
      title: '朝军进入战斗工作状态 称随时准备导弹攻击美国',
      url: 'http://news.qq.com/a/20130326/001307.htm'
    }
  ]
};

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', demoData);
});

module.exports = router;
