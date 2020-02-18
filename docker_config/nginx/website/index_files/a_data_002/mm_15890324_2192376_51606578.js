(function(doc, w) {
    var pid = "mm_15890324_2192376_51606578"
    var saxlist = {
        "mm_15890324_2192376_51606578": "http://sax.sina.com.cn/view?type=nonstd&t=REowMDAxMDc1Mw%3D%3D"
    }

    var currentScript = doc.currentScript;
    if(!doc.getElementById('tanx-a-'+pid)){
        doc.body.appendChild((function(){
            var o = doc.createElement("a");
            o.style.display = "none";
            o.id = "tanx-a-"+pid;
            return o;
        })())
    }

    function ali(k, p) {
        var M = Math;
        var cache = M.floor(268435456 * M.random()).toString(16),
            url = "//log.mmstat.com/tanx." + k + "?cache=" + cache + "&gmkey=&gokey=" + p + "&cna=&isbeta=3&spm-cnt=&logtype=2",
            a = new Image(),
            n = "_img_" + M.random();
        w[n] = a;
        a.onload = a.onerror = function() {
            w[n] = null
        };
        a.src = url;
    }

    function sax(url) {
        if (!url) return;
        var img = new Image();
        w[Math.random().toString(16).substring(2)] = img;
        img.src = url;
    };

    if (!currentScript) {
        var scripts = doc.getElementsByTagName('script');
        currentScript = scripts[scripts.length - 1];
        for (var i = scripts.length - 1; i >= 0; i--) {
            var script = scripts[i];
            if (script.readyState === 'interactive') {
                currentScript = script;
            }
        }
    }
    var uuid = currentScript.src.match(/[?&]uuid=([^&]*)/i)[1];
    var p = encodeURIComponent("aa=&bb=" + pid + "&cc=" + uuid);
    // document.write('<a  style="display:none!important"  id="tanx-a-'+pid+'"></a>');
    var tanx_s = doc.createElement("script");
    tanx_s.type = "text/javascript";
    tanx_s.charset = "gbk";
    tanx_s.id = "tanx-s-" + pid;
    tanx_s.async = true;
    tanx_s.src = "http://p.tanx.com/ex?i=" + pid;
    var tanx_h = doc.getElementsByTagName("head")[0];
    if (tanx_h) tanx_h.insertBefore(tanx_s, tanx_h.firstChild);
    ali('709', p);
    sax(saxlist[pid]);
})(document, window);
