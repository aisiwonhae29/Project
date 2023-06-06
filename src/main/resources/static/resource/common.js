var samgye = "https://blog.kakaocdn.net/dn/F1KyF/btq6pH9KeSW/uTGOVHTrAK7K5v73kpuFvk/img.jpg" ;
var jeyeuk = "https://recipe1.ezmember.co.kr/cache/recipe/2019/10/10/04fb8b97fee9072002a0aa54c266a22e1.jpg";
var hamburger =  "https://newsimg.sedaily.com/2020/11/17/1ZAFYQN80J_1.jpg";
var dakgalbi =  "https://recipe1.ezmember.co.kr/cache/recipe/2019/10/30/33398b219faa7448ed4130b8b70e18c01.jpg";
var jjambbong =  "https://blog.kakaocdn.net/dn/YPxRW/btrzhpNljHH/Zv9tsjGi82dNOjpLdkflh0/img.jpg";
var chicken = "https://pelicana.co.kr/resources/images/menu/original_menu01_200529.png";
var jjajangmyoen = "https://www.newiki.net/w/images/thumb/d/d9/Jjajangmyeon.jpg/450px-Jjajangmyeon.jpg";
var kalkuksu='https://m.cj.co.kr/images/theKitchen/PHON/0000002347/0000009896/0000002347.jpg';
var ssalkuksu='https://baessal.com/wp-content/uploads/2022/01/s-05.jpg';
var ramyeon='https://img.choroc.com/newshop/goods/009179/009179_1.jpg';
var ddukbokki='https://i.namu.wiki/i/A5AIHovo1xwuEjs7V8-aKpZCSWY2gN3mZEPR9fymaez_J7ufmI9B7YyDBu6kZy9TC9VWJatXVJZbDjcYLO2S8Q.webp';
var kkarbonara='https://img-cf.kurly.com/shop/data/goodsview/20220503/gv30000310353_1.jpg';
var kimchijjigae='https://cdn.imweb.me/thumbnail/20220801/67e70f849e80f.jpg';
var doinjangjjigae='https://recipe1.ezmember.co.kr/cache/recipe/2017/04/03/af672abe3054185420dda8c0c0f826561.jpg';
var sundaekuk='https://www.foodyap.co.kr/shopimages/goldplate1/020000000025.jpg?1637111594';
var ghamjatang='https://t1.daumcdn.net/cfile/tistory/99D1E8435D2018C517';

var imageArray=new Map();
imageArray.set('삼계탕',samgye);
imageArray.set('제육볶음', jeyeuk);
imageArray.set('햄버거', hamburger);
imageArray.set('닭갈비', dakgalbi);
imageArray.set('짬뽕', jjambbong);
imageArray.set('치킨', chicken);
imageArray.set('짜장면', jjajangmyoen);
imageArray.set('칼국수',kalkuksu);
imageArray.set('쌀국수',ssalkuksu);
imageArray.set('라면',ramyeon);
imageArray.set('떡볶이',ddukbokki);
imageArray.set('까르보나라',kkarbonara);
imageArray.set('김치찌개',kimchijjigae);
imageArray.set('된장찌개',doinjangjjigae);
imageArray.set('순대국',sundaekuk);
imageArray.set('감자탕',ghamjatang);

function showSubMenu() {
    var subMenu = document.querySelector(".writeBox");
    subMenu.style.display = "block";
}

function hideSubMenu() {
    var subMenu = document.querySelector(".writeBox");
    subMenu.style.display = "none";
}
	