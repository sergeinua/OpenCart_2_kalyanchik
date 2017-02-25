var elements = [{
	brandItems: {
		name: "Кальяны",
		image: "http://kalyanchik.com.ua/catalog/view/theme/default/image/brandItems.jpg",
		items: [
			'Amir\'s |', 'AMY |',  'Brodator |', 'EGS |', 'Embery |',
			'Eukapis |', 'Hi-Tech |', 'Hookah Machine |', 'Kaya |', 'KHALIL MAMOON |', 'Layalina |',
			'Marie Est |', 'Mitsuba |', 'Oduman |', 'Paradise |', 'Red Scorpion |',
            'Scorpion |', 'SD Hookah |', 'Temple |', 'YAHYA'
		],
		links: [
            'http://kalyanchik.com.ua/kaljany/proizvoditel:amirs/', 'http://kalyanchik.com.ua/kaljany/proizvoditel:amy/', 'http://kalyanchik.com.ua/kaljany/proizvoditel:brodator/', 'http://kalyanchik.com.ua/kaljany/proizvoditel:egs/', 'http://kalyanchik.com.ua/kaljany/proizvoditel:embery/', 'http://kalyanchik.com.ua/kaljany/proizvoditel:eukapis/', 'http://kalyanchik.com.ua/kaljany/proizvoditel:hi-tech/', 'http://kalyanchik.com.ua/kaljany/proizvoditel:hookah-machine/', 'http://kalyanchik.com.ua/kaljany/proizvoditel:kaya/', 'http://kalyanchik.com.ua/kaljany/proizvoditel:khalil-mamoon/', 'http://kalyanchik.com.ua/kaljany/proizvoditel:layalina/', 'http://kalyanchik.com.ua/kaljany/proizvoditel:marie-est/', 'http://kalyanchik.com.ua/kaljany/proizvoditel:mitsuba/', 'http://kalyanchik.com.ua/kaljany/proizvoditel:oduman/', 'http://kalyanchik.com.ua/kaljany/proizvoditel:paradise/', 'http://kalyanchik.com.ua/kaljany/proizvoditel:30/', '"http://kalyanchik.com.ua/kaljany/proizvoditel:scorpion/', 'http://kalyanchik.com.ua/kaljany/proizvoditel:20/', 'http://kalyanchik.com.ua/kaljany/proizvoditel:temple/', 'http://kalyanchik.com.ua/kaljany/proizvoditel:25/'
		]
	},
	accessories: {
		name: "Комплектующие",
		image: "http://kalyanchik.com.ua/catalog/view/theme/default/image/accessories.jpg",
		items: [
			'Шахты', 'Колбы', 'Шланги (трубки)', 'Чаши', 'Мундштуки', 'Уплотнители', 'Другие комплектующие'
		],
		links: [
			'accessories/shaxty-dlja-kaljanov/', 'accessories/kolby-dlja-kaljana/', 'accessories/shlangi-dlja-kaljana/', 'chashi-dlja-kaljana/', 'accessories/komplektujuschie-dlja-shlanga/', 'accessories/uplotniteli/', 'accessories/drugie-komplektujuschie/'
		]
	},
	propertie: {
		name: 'Аксессуары',
		image: 'http://kalyanchik.com.ua/catalog/view/theme/default/image/propertie.jpg',
		items: [
			'Регуляторы жара (Калауд)', 'Заменители фольги', 'Подвески для кальянов', 'Корзина для угля',
			'Сумки для кальянов', 'Другие аксессуары'
		],
		links: [
			'component/kaloud-lotus-kalaud-lotus/', 'component/ugol-dlja-kaljanov/', 'component/podsvetki-dlja-kaljanov/', 'component/korziny-dlja-uglja/', 'component/kejsy-sumki-dlja-kaljanov/', 'component/drugie-aksessuary/'
		]
	},
	consumables: {
		name: 'Расходники',
		image: 'http://kalyanchik.com.ua/catalog/view/theme/default/image/consumables.jpg',
		items: [
			'Уголь', 'Фольга', 'Мундштуки одноразовые', 'Табак для кальяна'
		],
		links: [
			'rashodniki/ugol/', 'rashodniki/folga/', 'rashodniki/mundshtuki-odnorazovye/', 'rashodniki/tabak-dlya-kalyana/'
		]
	},
	bongs: {
		name: 'Бонги и аксессуары',
		image: 'http://kalyanchik.com.ua/catalog/view/theme/default/image/bongs.jpg',
		items: [
			"Аксессуары для бонга", "Бонги"
		],
		links: [
			'bongi-i-aksessuary/aksessuary-dlya-bonga/', 'bongi-i-aksessuary/bongi/'
		]
	},
	vapes: {
		name: 'vape',
		image: 'http://kalyanchik.com.ua/catalog/view/theme/default/image/vapes.jpg',
		items: [
			'Бокс - моды', 'Элекстронные сигареты', 'Электронные кальяны', 'Клиромайзеры', 'Атомайзеры', 'Испарители',
            'Жидкости', 'Сделай сам', 'Разное'
		],
		links: [
			'vape/boks-mody/', 'vape/elektronnye-sigareta/', 'vape/elektronnye-kalyany-2/', 'vape/kliromayzery/', 'vape/atomayzery/', 'vape/ispariteli/', 'vape/jidkosti/', 'vape/sdelaj-sam/', 'vape/raznoe/'
		]
	}
}];

$('.visible-lg, #sub-menu, .title').remove();
$('.product-layout, .product-layout .module-good.product-thumb.transition').remove();

parse(elements);

function parse(elements) {
	for(var element in elements) {
		var newElement = elements[element];

		for(var item in newElement) {
			var newItem = newElement[item];

			view(newItem)
		}
	}
}

function getNodeElements(data) {
	var node = '<div class="product-layout col-md-6 col-xs-12">';
		node += '<div class="row"><div class="new-node-elements col-sm-6 col-xs-12">';
			node += '<figure><img src="' + data.image + '" alt=""><figcaption>' + data.name +'</figcaption></figure>';
		node += '</div>';
		node += '<div class="items col-sm-6 col-xs-12" id="items-parce">';
			node += '<div class="link-container">';

				$.each(data.links, function(key, value) {
					node += '<a href="' + value + '"> ' + data.items[key] + '</a>';
				});

			node += '</div></div>';
	node += '</div></div>';

	return node;
}

$(document).ready(function() {
    var link = document.querySelector('.link-container');
    link.style.width = '80%';
    link.style.display = 'block';
    link.style.marginLeft = '-30px';
});

function view(element) {
	$('.append-v2-here').append(getNodeElements(element));
}

function print(arg) {
	console.log(arg)
}