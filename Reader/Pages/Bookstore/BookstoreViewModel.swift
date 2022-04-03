//
//  BookstoreViewModel.swift
//  reader
//
//  Created by Jayden Liu on 2022/3/29.
//

import Foundation

class BookstoreViewModel {
    let type: BookstoreListType
    var model: Bookstore?
    
    init(type: BookstoreListType) {
        self.type = type
        
        fetchData()
    }
    
    func fetchData() {
        model = Bookstore(id: type.rawValue, menus: [
            Menu(title: "分类", imageName: "menu_category"),
            Menu(title: "榜单", imageName: "menu_rank"),
            Menu(title: "会员", imageName: "menu_vip"),
            Menu(title: "完结", imageName: "menu_complete"),
            Menu(title: "出版", imageName: "menu_publish"),
        ], cards: [
            BookCard(title: "精品汇聚", style: .grid, books: [
                Book(id: 1, name: "都市兵锋", imgUrl: "http://img-tailor.11222.cn/bcv/big/201807191525202253.jpg", author: "青锋刀客"),
                Book(id: 2, name: "魔幻奇团兵锋", imgUrl: "http://img-tailor.11222.cn/bcv/big/201611291354524698.jpg", author: "青锋妙小萌客"),
                Book(id: 3, name: "菜鸟道士俏猫妖", imgUrl: "http://img-tailor.11222.cn/bcv/big/201612061159041286.jpg", author: "heromx"),
                Book(id: 4, name: "吸血鬼女王传奇", imgUrl: "http://img-tailor.11222.cn/bcv/big/201707251340061013.jpg", author: "AlienShooter"),
                Book(id: 5, name: "夫人太刁蛮", imgUrl: "http://img-tailor.11222.cn/bcv/big/201701090003304709.jpg", author: "昭昭"),
                Book(id: 6, name: "农女的商业帝国", imgUrl: "http://img-tailor.11222.cn/bcv/big/201808011042075954.jpg", author: "左小眸"),
                Book(id: 7, name: "天才神医混都市", imgUrl: "http://img-tailor.11222.cn/bcv/big/201809261704256357.jpg", author: "香酥鸡块"),
                Book(id: 8, name: "篮球之心", imgUrl: "http://img-tailor.11222.cn/bcv/big/201704261100168171.jpg", author: "天狗望月"),
            ]),
            BookCard(title: "精品专场", style: .hybird, books: [
                Book(id: 9, name: "完美至尊", imgUrl: "http://img-tailor.11222.cn/bcv/big/201608311048233790.jpg", author: "观鱼", recommendCount: 7548),
                Book(id: 10, name: "武将宠妻手簿", imgUrl: "http://img-tailor.11222.cn/bcv/big/201706081007487582.jpg", author: "子醉今迷", recommendCount: 345756),
                Book(id: 11, name: "极品农女要翻天", imgUrl: "http://img-tailor.11222.cn/bcv/big/201706211058345237.jpg", author: "北舒", recommendCount: 54375),
                Book(id: 12, name: "都市逍遥医圣", imgUrl: "http://img-tailor.11222.cn/bcv/big/201802071018183467.jpg", author: "疯狂小牛", recommendCount: 456782),
                Book(id: 13, name: "女总裁的贴身兵王", imgUrl: "http://img-tailor.11222.cn/bcv/big/201603231614178701.jpg", author: "黑夜不寂寞", recommendCount: 654783),
                Book(id: 14, name: "宠妃撩人：摄政王爷欺上门", imgUrl: "http://img-tailor.11222.cn/bcv/big/201706081356274426.jpg", author: "沐小楼", recommendCount: 152342),
                Book(id: 15, name: "修罗武神", imgUrl: "http://img-tailor.11222.cn/bcv/big/201604081509001009.jpg", author: "善良的蜜蜂", recommendCount: 26341),
                Book(id: 16, name: "天才萌宝毒医娘亲", imgUrl: "http://img-tailor.11222.cn/bcv/big/201603141418553001.jpg", author: "天边一抹白", recommendCount: 152342),
            ]),
            BookCard(title: "包月专区场", style: .cell, books: [
                Book(id: 17, name: "绝世神侯", imgUrl: "http://img-tailor.11222.cn/bcv/big/201703091404448716.jpg", author: "姜公封相", introduction: "天地四方为宇，古往今来为宙。洪荒大陆，万朝并立，大魏皇室败落子弟杨争，偶得远古洪荒古卷传承，参破未来绝境，横贯古今，开启一段杀戮征途，崛起于腥风血雨之中。"),
                Book(id: 18, name: "九墓奇棺", imgUrl: "http://img-tailor.11222.cn/bcv/big/201702211138538656.jpg", author: "么么尸", introduction: "风水世家，因世代承受诅咒而短命。古怪而无人识得的文字符号；诡异而规模庞大的古墓；古老的蜡尸炮制之法；凶残而野蛮的守墓者；令人难以置信的万人殉葬坑……古墓的背后究竟隐藏着什么秘密？让我们拭目以待！"),
                Book(id: 19, name: "冒牌狂少", imgUrl: "http://img-tailor.11222.cn/bcv/big/201608041501078058.jpg", author: "辰", introduction: "作为国际佣兵界的至强王者，李云霄在法国干过黑手组，在荷兰灭过军火商，在泰国拿过金拳套冠军，还在美国开过经济学讲座。当然，他也很会说谎，化身冒牌狂少，成为各路美女突袭的目标，被校花强吻，被萝莉逆推，被呆萌女贼劫色，被豪门千金逼婚，更加没有天理的是被黑道女王掳去当压寨夫婿……"),
                Book(id: 20, name: "重活之官路", imgUrl: "http://img-tailor.11222.cn/bcv/big/201605271830192210.jpg", author: "赵子铭",introduction: "秦扬在一场大梦中预见了自己凄惨的人生，也不论这梦究竟是反意还是预言，秦扬都暗暗下定决心，穷则独善己身，达则兼济天下……可是这天下最为难混之官场，是否能令秦扬如愿？当那荣誉、美女、财富等种种诱惑来临之际，秦扬是否还能保住那颗雄心壮志？"),
            ]),
        ])
    }
}

struct Bookstore {
    let id: Int
    let menus: [Menu]
    var cards: [BookCard]
    
    
//    late String id;
//    late String name;
//    late int style;
//    late List content;
//
//    List<CarouselInfo>? carousels;
//    List<MenuInfo>? menus;
//    List<Novel>? books;
    
}

enum BookstoreListType: Int {
    case excellent
    case male
    case female
    case cartoon
    
    func title() -> String {
        switch self {
        case .excellent:
            return "精选"
        case .male:
            return "男生"
        case .female:
            return "女生"
        case .cartoon:
            return "漫画"
        }
    }
}


struct Book: Identifiable {
    let id: Int
    let name: String
    let imgUrl: String
    let author: String
    var recommendCount: Int = 0
    var introduction: String?
    
//    late String id;
//    late String name;
//    late String imgUrl;
//    late String firstChapter;
//    late Chapter lastChapter;
//    late String author;
//    late double price;
//    late double score;
//    late String type;
//    late String introduction;
//    late int chapterCount;
//    late int recommendCount;
//    late int commentCount;
//    late int firstArticleId;
//
//    late List<String> roles;
//    late String status;
//    late double wordCount;
//    late List<String> tags;
//    late bool isLimitedFree;
}

struct Menu {
    let title: String
    let imageName: String
}

enum BookCardStyle {
    case grid
    case hybird
    case cell
}

struct BookCard {
    let title: String
    let style: BookCardStyle
    let books: [Book]
}

extension Int {
    public var countDescription: String {
        self > 10000 ? String(format: "%.2f万", Double(self) / 10000.0) : "\(self)"
    }
}
