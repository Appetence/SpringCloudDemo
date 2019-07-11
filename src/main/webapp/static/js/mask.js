function aa(){
var doc = document.documentElement;
relHeight = (doc.clientHeight > doc.scrollHeight) ? doc.clientHeight : doc.scrollHeight;
document.getElementById('mask').style.height = relHeight+'px';
}
setTimeout(aa,3000);

