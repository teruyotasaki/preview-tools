module TreasuredatatagsHelper

  def generaate_tdtag()
    
    action_name = {}
    if params[:tablename] == "log_web_ads" then
      action_name = {
        "ss_brand" => "ss_brand",
        "ss_product" => "ss_product",
        "ss_level" => "ss_level",
        "ss_cluster" => "ss_cluster"
      }
    else
      action_name = {
        "ss_brand" => "ss1_brand",
        "ss_product" => "ss2_product",
        "ss_level" => "ss3_level",
        "ss_cluster" => "ss4_cluster"
      }
    end

    
    
    
    
    if params[:tag] == "pv" then
      result = '<script type="text/javascript">

//canvas finger print
var td_fingerPrint=(function(){var b=function(c){var d,e;d=Array.prototype.forEach;e=Array.prototype.map;this.each=function(m,k,j){if(m===null){return}if(d&&m.forEach===d){m.forEach(k,j)}else{if(m.length===+m.length){for(var h=0,f=m.length;h<f;h++){if(k.call(j,m[h],h,m)==={}){return}}}else{for(var g in m){if(m.hasOwnProperty(g)){if(k.call(j,m[g],g,m)==={}){return}}}}}};this.map=function(i,h,g){var f=[];if(i==null){return f}if(e&&i.map===e){return i.map(h,g)}this.each(i,function(l,j,k){f[f.length]=h.call(g,l,j,k)});return f};if(typeof c=="object"){this.hasher=c.hasher;this.screen_resolution=c.screen_resolution;this.screen_orientation=c.screen_orientation;this.canvas=c.canvas;this.ie_activex=c.ie_activex}else{if(typeof c=="function"){this.hasher=c}}};b.prototype={get:function(){var d=[];d.push(navigator.userAgent);d.push(navigator.language);d.push(screen.colorDepth);if(this.screen_resolution){var c=this.getScreenResolution();if(typeof c!=="undefined"){d.push(this.getScreenResolution().join("x"))}}d.push(new Date().getTimezoneOffset());d.push(this.hasSessionStorage());d.push(this.hasLocalStorage());d.push(!!window.indexedDB);if(document.body){d.push(typeof(document.body.addBehavior))}else{d.push(typeof undefined)}d.push(typeof(window.openDatabase));d.push(navigator.cpuClass);d.push(navigator.platform);d.push(navigator.doNotTrack);d.push(this.getPluginsString());if(this.canvas&&this.isCanvasSupported()){d.push(this.getCanvasFingerprint())}if(this.hasher){return this.hasher(d.join("###"),31)}else{return this.murmurhash3_32_gc(d.join("###"),31)}},murmurhash3_32_gc:function(k,g){var l,m,j,c,f,d,h,e;l=k.length&3;m=k.length-l;j=g;f=3432918353;d=461845907;e=0;while(e<m){h=((k.charCodeAt(e)&255))|((k.charCodeAt(++e)&255)<<8)|((k.charCodeAt(++e)&255)<<16)|((k.charCodeAt(++e)&255)<<24);++e;h=((((h&65535)*f)+((((h>>>16)*f)&65535)<<16)))&4294967295;h=(h<<15)|(h>>>17);h=((((h&65535)*d)+((((h>>>16)*d)&65535)<<16)))&4294967295;j^=h;j=(j<<13)|(j>>>19);c=((((j&65535)*5)+((((j>>>16)*5)&65535)<<16)))&4294967295;j=(((c&65535)+27492)+((((c>>>16)+58964)&65535)<<16))}h=0;switch(l){case 3:h^=(k.charCodeAt(e+2)&255)<<16;case 2:h^=(k.charCodeAt(e+1)&255)<<8;case 1:h^=(k.charCodeAt(e)&255);h=(((h&65535)*f)+((((h>>>16)*f)&65535)<<16))&4294967295;h=(h<<15)|(h>>>17);h=(((h&65535)*d)+((((h>>>16)*d)&65535)<<16))&4294967295;j^=h}j^=k.length;j^=j>>>16;j=(((j&65535)*2246822507)+((((j>>>16)*2246822507)&65535)<<16))&4294967295;j^=j>>>13;j=((((j&65535)*3266489909)+((((j>>>16)*3266489909)&65535)<<16)))&4294967295;j^=j>>>16;return j>>>0},hasLocalStorage:function(){try{return !!window.localStorage}catch(c){return true}},hasSessionStorage:function(){try{return !!window.sessionStorage}catch(c){return true}},isCanvasSupported:function(){var c=document.createElement("canvas");return !!(c.getContext&&c.getContext("2d"))},isIE:function(){if(navigator.appName==="Microsoft Internet Explorer"){return true}else{if(navigator.appName==="Netscape"&&/Trident/.test(navigator.userAgent)){return true}}return false},getPluginsString:function(){if(this.isIE()&&this.ie_activex){return this.getIEPluginsString()}else{return this.getRegularPluginsString()}},getRegularPluginsString:function(){return this.map(navigator.plugins,function(d){var c=this.map(d,function(e){return[e.type,e.suffixes].join("~")}).join(",");return[d.name,d.description,c].join("::")},this).join(";")},getIEPluginsString:function(){if(window.ActiveXObject){var c=["ShockwaveFlash.ShockwaveFlash","AcroPDF.PDF","PDF.PdfCtrl","QuickTime.QuickTime","rmocx.RealPlayer G2 Control","rmocx.RealPlayer G2 Control.1","RealPlayer.RealPlayer(tm) ActiveX Control (32-bit)","RealVideo.RealVideo(tm) ActiveX Control (32-bit)","RealPlayer","SWCtl.SWCtl","WMPlayer.OCX","AgControl.AgControl","Skype.Detection"];return this.map(c,function(d){try{new ActiveXObject(d);return d}catch(f){return null}}).join(";")}else{return""}},getScreenResolution:function(){var c;if(this.screen_orientation){c=(screen.height>screen.width)?[screen.height,screen.width]:[screen.width,screen.height]}else{c=[screen.height,screen.width]}return c},getCanvasFingerprint:function(){var e=document.createElement("canvas");var d=e.getContext("2d");var c="http://valve.github.io";d.textBaseline="top";d.font="14px \'Arial\'";d.textBaseline="alphabetic";d.fillStyle="#f60";d.fillRect(125,1,62,20);d.fillStyle="#069";d.fillText(c,2,15);d.fillStyle="rgba(102, 204, 0, 0.7)";d.fillText(c,4,17);return e.toDataURL()}};var a=new b({canvas:true,screen_resolution:true}).get();return a});


!function(a,b,c,d){if(!b[a]){b[a]=function(){b[a].instances.push(this),this.init&&this.init()},b[a].instances=[];for(var e=0,f=["td_send","td_send_imid"];e<f.length;e++)b[a].prototype[f[e]]=function(a){return function(){this["tmp_"+a]=this["tmp_"+a]||[],this["tmp_"+a].push(Array.prototype.slice.call(arguments))}}(f[e]);var g=c.getElementsByTagName(d)[0],h=c.createElement(d);h.async=!0,h.src="//cf.im-apps.net/sdk/tdim-1.1.0.min.js",g.parentNode.insertBefore(h,g)}}("TDIM",window,document,"script");
var tdimjs = new TDIM();
tdimjs.debug = false;
td_custom_obj = {
  "fp_id" : td_fingerPrint(),
  //put the media name here
  "custom_var" : "Ads",
  // add the keys & values freely
  "' + action_name["ss_brand"] + '" : "' + params[:ss_brand] + '",
  "' + action_name["ss_product"] + '" : "' + params[:ss_product] + '",
  "' + action_name["ss_level"] + '" : "' + params[:ss_level] + '",
  "' + action_name["ss_cluster"] + '" : "' + params[:ss_cluster] + '"
};

tdimjs.td_api_key = "7416/69a4adadea83b808937444d81877d495becfb4ff";
tdimjs.td_db = "log_db";
tdimjs.im_api_token = "RAL5QEkuakUxiIkb8Mzm7Q";
tdimjs.td_send_imid("' + params[:tablename] + '", td_custom_obj);

</script>'
    elsif params[:tag] == "click" then
      result = '<script type="text/javascript">
!function(t,e){if(void 0===e[t]){e[t]=function(){e[t].clients.push(this),this._init=[Array.prototype.slice.call(arguments)]},e[t].clients=[];for(var r=function(t){return function(){return this["_"+t]=this["_"+t]||[],this["_"+t].push(Array.prototype.slice.call(arguments)),this}},n=["addRecord","set","trackEvent","trackPageview","ready"],s=0;s<n.length;s++){var i=n[s];e[t].prototype[i]=r(i)}var a=document.createElement("script");a.type="text/javascript",a.async=!0,a.src=("https:"===document.location.protocol?"https:":"http:")+"//cdn.treasuredata.com/sdk/td-1.5.1.js";var c=document.getElementsByTagName("script")[0];c.parentNode.insertBefore(a,c)}}("Treasure",this);

(function (sendValue) {

  var td = new Treasure({
    host: "in.treasuredata.com",
    writeKey: "7416/69a4adadea83b808937444d81877d495becfb4ff",
    database: "log_db"
  });
  td.trackEvent("' + params[:tablename] + '", sendValue);
})( {' + action_name["ss_brand"] + ': "' + params[:ss_brand] + '", ' + action_name["ss_product"] + ': "' + params[:ss_product] + '", ' + action_name["ss_level"] + ':"' + params[:ss_level] + '", ' + action_name["ss_cluster"] + ': "' + params[:ss_cluster] + '"});

</script>'
    end
      
    return result

  end

end
