module.exports = {
    title : 'CSAPP',
    author : 'Modnar Shen',
    lang : 'zh-cn',
    description : '深入理解计算机系统',
    plugins :
            [
                '-lunr', '-search', '-sharing', '-fontsettings', 'search-pro', 'code', 'back-to-top-button',
                'cuav-chapters', 'theme-canyon', 'katex', 'flexible-alerts'
            ],
    pluginsConfig : {
        'theme-canyon' : {
            "logo" : "./assets/logo.png",
            'search-placeholder' : '🔍  输入搜索内容…' // 搜索框提示信息
        }
    }
};
