var config = require("config.js")

var login = {
    login: function(app) {
      wx.showToast({
        title: '操作成功！', // 标题
        icon: 'success',  // 图标类型，默认success
        duration: 1500  // 提示窗停留时间，默认1500ms
      })
        //调用小程序登录接口
        wx.login({
            success: function(res) {
                if (res.code) {
                    // 请求后台登录接口，获取openId
                  wx.showNavigationBarLoading();//显示进度条
                  wx.request({
                    url: config.basePath + "auth/appLogin",
                      data: {
                        'jscode': res.code
                      },
                      method: 'post',
                      header: {
                        'Content-type': 'application/x-www-form-urlencoded'
                      },
                      success: function(res) {
                        var result = res.data;
                        if (result && result.code == '0000') {
                          // 登录成功后保存token
                          wx.setStorageSync('authToken', result.data.authToken) ;
                        } 
                        else if (result && result.code == '90001') {
                          // TODO 提示用户登录
                          console.info("用户未登录：" + result.msg); 
                          
                        } 
                        else {
                          // 弹出错误信息;
                          wx.showToast({ title: result.msg, icon: 'none' });
                          
                        }                            
                      },
                      fail: function (err) {
                        // 弹出错误信息;
                        wx.showToast({ title: '访问出错...', icon: 'none' });
                      },
                      complete: function (res) {
                        wx.hideNavigationBarLoading();//停止进度条
                      },
                  });                    
                }
            }
        });
    },
    
    logout: function() {

    }
}

module.exports = login;