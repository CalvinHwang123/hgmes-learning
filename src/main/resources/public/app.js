window.eruptSiteConfig = {
  //erupt接口地址，在前后端分离时指定
  domain: "",
  //附件地址，一般情况下不需要指定，如果自定义对象存储空间，则需在此指定附件资源访问地址
  fileDomain: "",
  //标题
  title: "XIANLU MES",
  //描述
  desc: "制造执行系统",
  //高德地图api key,使用地图组件须指定此属性，amapKey获取地址：https://lbs.amap.com
  amapKey: "6ba79a8dxxxxxxx",
  //logo路径
  logoPath: "favicon.ico",
  //logo文字
  logoText: "闲鹿MES",
  //自定义导航栏按钮，配置后将会出现在页面右上角
  r_tools: [{
    text: "自定义功能按钮",
    icon: "fa-eercast",
    mobileHidden: true,
    click: function (event) {
      alert("自定义按钮");
    }
  }]
};

//路由回调函数
window.eruptRouterEvent = {
  //key表示要监听的路由切换地址，为url hash地址最后一段
  //例如：http://www.erupt.xyz:9999/#/build/table/demo中demo为回调key
  demo: {
    //路由载入事件
    load: function (e) {

    },
    //路由退出事件
    unload: function (e) {

    }
  },
  //$ 为全路径通配符，在任何路由切换时都会执行load与unload事件
  $: {
    load: function (e) {

    },
    unload: function (e) {
    }
  }
};

//erupt生命周期函数
window.eruptEvent = {
  //页面加载完成后回调
  startup: function () {

  }
};

function openProcessRouteModal() {
  console.log('nice day');
}
