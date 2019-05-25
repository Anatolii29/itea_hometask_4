//
//  filterViewController.swift
//  itea_hometask_4
//
//  Created by Anatolii on 5/23/19.
//  Copyright © 2019 Anatolii. All rights reserved.
//

import UIKit

class filterViewController: UIViewController {
    
    @IBOutlet weak var productCollectionView: UICollectionView!
    @IBOutlet weak var filterButton: UIButton!
    
    var productArray: [FilterProduct] = []
    var sortingIndex:Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isHidden = true
        productCollectionView.delegate = self
        productCollectionView.dataSource = self
        
        filterButton.layer.cornerRadius = 8
        
        fillData()
    }
    
    func fillData() {
        
        let desc1 = """
Травянистое растение, достигающее в высоту более 1 метра.

Стебель голый, ребристый. Часть стебля, погружённая в почву, выпускает длинные побеги (длиной 15—20, у некоторых сортов 40—50 см).

Лист картофеля тёмно-зелёный, прерывисто-непарноперисторассечённый, состоит из конечной доли, нескольких пар (3—7) боковых долей, размещённых одна против другой, и промежуточных долек между ними. Непарная доля называется конечной, парные доли имеют порядковые названия — первая пара, вторая пара и т. д. (счёт ведётся от конечной доли). Доли и дольки сидят на стерженьках, прикреплённых к стержню, нижняя часть которого переходит в черешок. Около долей пар размещаются ещё более мелкие дольки.

Цветки белые, розовые и фиолетовые, собраны щитком на верхушке стебля, чашечка и венчик пятираздельные[6].

Из пазух зачаточных листьев в подземной части стебля отрастают подземные побеги — столоны, которые, утолщаясь на вершинах, дают начало новым клубням (видоизменённым побегам). На концах столонов развиваются клубни, которые, в сущности, не что иное, как вздувшиеся почки, вся масса которых состоит из тонкостенных гранёных клеток, наполненных крахмалом, а наружная часть состоит из тонкослойной пробковой ткани. Клубни созревают в августе — сентябре.

Плод — многосемянная, тёмно-зелёная, ядовитая ягода диаметром 2 см, по форме напоминающая маленький помидор.

В зелёных вегетативных частях растения содержится алкалоид соланин, который служит для защиты растения от поражения бактериями и некоторыми видами насекомых. В связи с этим позеленевшие клубни картофеля несъедобны, хотя удаление поверхности на значительную глубину (более 1 см) и более длительная термообработка сохраняют его съедобность.
"""
        
        let desc2 = """
Исторические сведения

Разноцветная морковь
Культивируется на протяжении четырёх тысяч лет[2], в настоящее время выведено множество разновидностей и культиваров (сортов) этого вида.

Предположительно, морковь впервые начали выращивать в Афганистане, где до сих пор произрастает больше всего различных видов моркови. Ближайшим диким видом является дикая морковь: культурные сорта были выведены из неё путём селекции. Из сброшенных семян садовой моркови обычно получаются растения со съедобным ветвистым корнем, отличающимся горьким, деревянистым привкусом.

Первоначально морковь выращивали не ради корнеплода, а ради ароматных листьев и семян. Первое упоминание об употреблении корня моркови в пищу встречается в античных источниках в I веке н. э. Современная морковь была завезена в Европу в X—XIII веках; Ибн-аль-Авам из Андалусии описывал красные и жёлтые сорта моркови. Византийский врач Симеон Сит (XI век) упоминает те же самые цвета. Морковь описывается и в «Домострое», памятнике русской назидательной литературы XVI века. Оранжевая морковь была выведена голландскими селекционерами в XVII веке[3]. Ранее культивируемую морковь нередко рассматривали как отдельный вид Daucus sativus (Hoffm.) Röhl. (морковь культурная, или морковь посевная), в русскоязычной литературе такой подход преобладает до настоящего времени[4]. В современной англоязычной литературе и международных базах данных культивируемую морковь обычно рассматривают как подвид моркови дикой: Daucus carota subsp. sativus (Hoffm.) Arcang.[5][6]
"""
        let desc3 = """
Как правило, капусту выращивают рассадным способом, в особенности ранние сорта. Так, в восточной части Европы семена для рассады капусты начинают высевать уже с конца января. Готовую рассаду высаживают в открытый грунт одновременно с севом ранних зерновых (для ранних сортов капусты) со второй половины марта до начала апреля. Урожай капусты собирают избирательно, то есть если головки растений становятся твёрдыми и достигают спелого нормального размера (около 1 кг). При оптимальных условиях окружающей среды и наличии необходимых удобрений (аммиачной селитры и других) можно получить дополнительный, второй урожай капусты. Чтобы добиться этого, нужно сразу после уборки первого урожая вносить азотные удобрения из расчёта 25 г аммиачной селитры на 15 растений. В пучках листьев следует оставить по несколько проросших почек, а остальные удалить.

Поздние сорта огородной капусты можно выращивать безрассадным способом, при этом, чтобы получить хорошие и выровненные всходы, гнёзда с семенами необходимо мульчировать перегноем, закрывать полиэтиленовой плёнкой и т. д. Если этого не сделать, то даже при кратковременной засухе ростки могут не взойти.

Для уборки капусты применяют капустоуборочные комбайны, например, в СССР применялся комбайн МСК-1.
"""
        let desc4 = """
Зелёный лук или салатный лук — торговое и кулинарное наименование некоторых видов рода Allium, у которых в пищу употребляется надземная (травянистая), а не подземная (луковица) часть. Зёленый лук имеет более мягкий вкус по сравнению с луковицей. Под этим названием обычно известны черемша, лук-шалот, лук-порей, скорода и китайский лук.

Хотя луковицы многих видов Allium используются в качестве пищи, для «зелёного лука» характерно отсутствие полностью развитой луковицы. Для этих видов характерно наличие полых, трубчатых зелёных листьев, растущие прямо из луковицы. Эти листья используются в качестве овоща; их едят в сыром (целом или нарезанном для салата или в виде приправы) или приготовленном виде.[1]
"""
        let desc5 = """
Родина — Индия, Китай и тихоокеанские тропические острова. В дикорастущем состоянии неизвестен, вероятнее всего — это гибрид, спонтанно возникший в природе и долгое время развивавшийся как отдельный вид. Широко культивируется во многих странах с субтропическим климатом. В СНГ культивируется в Закавказье (Азербайджан, выращивают в стелющейся культуре) и Средней Азии (Узбекистан, Таджикистан), где он растёт в траншейной культуре.

Введен в культуру, по-видимому, в Юго-Восточной или Южной Азии, впервые упоминается в XII веке для территории Индии и Пакистана. Отсюда в XII веке лимон был завезён арабами на Ближний Восток, в Северную Африку, Испанию и Италию[4].

Ежегодно в мире собирают около 14 млн тонн лимонов. Лидерами являются Индия и Мексика (примерно 16 % мирового урожая каждая).

В конце 1970-х годов в Италии ежегодно собирали около 730 тыс. тонн плодов, на втором и третьем местах стояли США (около 550 тыс. тонн) и Индия (около 450 тыс. тонн), а всего в мире собирали ежегодно около 4 млн тонн плодов[4].

На Черноморском побережье Кавказа выращивался, по-видимому, с XVIII века, но производственного значения не имел. В России разводили лимон и в комнатной культуре. В XX веке в отдельные годы на Черноморском побережье Кавказа площади под лимоном достигали 8 тыс. гектаров, однако сейчас они сильно сократились[4].

В конце 1970-х годов урожайность взрослого дерева в открытом грунте составляла в среднем 200—350 плодов, рекордная — 2500; в траншейной культуре в среднем получали 300—350 плодов с дерева и до 280 тыс. плодов с одного гектара. Годовой урожай лимонов в Таджикистане достигал 8 млн плодов[5].
"""
        
        let product1 = FilterProduct(name: "Potato", price: 20, image: "pot", desc: desc1)
        let product2 = FilterProduct(name: "Carrot", price: 100, image: "mork", desc: desc2)
        let product3 = FilterProduct(name: "Lettuce", price: 15, image: "kap", desc: desc3)
        let product4 = FilterProduct(name: "Onion", price: 45, image: "onion", desc: desc4)
        let product5 = FilterProduct(name: "Lemon", price: 150, image: "lemon", desc: desc5)
        productArray.append(product1)
        productArray.append(product2)
        productArray.append(product3)
        productArray.append(product4)
        productArray.append(product5)
    }
    
    func sort() {
        switch sortingIndex {
        case 0:
            let sortedArray = productArray.sorted(by: {$0.name < $1.name})
            productArray = sortedArray
        case 1:
            let sortedArray = productArray.sorted(by: {$0.price < $1.price})
            productArray = sortedArray
        default:
            let sortedArray: [Product] = []
        }
        productCollectionView.reloadData()
    }
    
    @IBAction func filterButtonPressed(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "FilterChooseViewController") as! FilterChooseViewController
        vc.index = sortingIndex ?? 4
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension filterViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return productArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = collectionView.dequeueReusableCell(withReuseIdentifier: "filterCollectionViewCell", for: indexPath) as! filterCollectionViewCell
        item.layer.borderWidth = 1
        item.update(currProduct: productArray[indexPath.row])
        return item
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "FilterDetailViewController") as! FilterDetailViewController
        vc.update(currProduct: productArray[indexPath.row])
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
