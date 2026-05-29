import 'package:luxora_ai/models/attraction_detail.dart';

/// Curated signature / highlight menus for catalog restaurants, keyed by
/// place id. These are representative selections to convey each venue's style —
/// not the complete live menu. Prices are approximate and can change at the
/// venue. Dish names stay in their original language.
const restaurantMenus = <String, List<MenuItem>>{
  'dining-victoria-and-alberts': [
    MenuItem(
      course: 'Tasting Menu',
      name: 'Chef’s Multi-Course Tasting',
      description:
          'A nightly-changing degustation of seasonal luxury ingredients, plated tableside.',
      price: '\$295',
    ),
    MenuItem(
      course: 'Tasting Menu',
      name: 'Queen Victoria Room Experience',
      description:
          'Extended 10-course tasting in the intimate private room — the pinnacle seating.',
      price: '\$425',
    ),
    MenuItem(
      course: 'Signatures',
      name: 'Russian Osetra Caviar',
      description: 'Classic service with traditional accompaniments.',
      price: 'Market',
    ),
    MenuItem(
      course: 'Signatures',
      name: 'Miyazaki Wagyu A5',
      description: 'Seared Japanese beef, seasonal garnish, aged jus.',
      price: 'Supplement',
    ),
    MenuItem(
      course: 'Pairings',
      name: 'Sommelier Wine Pairing',
      description: 'Curated by-the-glass pairing across the tasting progression.',
      price: '\$150',
    ),
  ],
  'dining-the-boathouse': [
    MenuItem(
      course: 'Starters',
      name: 'Lump Crab Cake',
      description: 'Jumbo lump crab, whole-grain mustard, lemon.',
      price: '\$24',
    ),
    MenuItem(
      course: 'Starters',
      name: 'Filet Mignon Sliders',
      description: 'Three petite filet sliders, caramelized onion, garlic aioli.',
      price: '\$26',
    ),
    MenuItem(
      course: 'Mains',
      name: 'Filet Mignon (8 oz)',
      description: 'Center-cut filet, choice of sauce and side.',
      price: '\$58',
    ),
    MenuItem(
      course: 'Mains',
      name: 'Whole Maine Lobster',
      description: 'Steamed or grilled, drawn butter, lemon.',
      price: 'Market',
    ),
    MenuItem(
      course: 'Mains',
      name: 'Cedar-Plank Salmon',
      description: 'Roasted on cedar, seasonal vegetables.',
      price: '\$34',
    ),
    MenuItem(
      course: 'Desserts',
      name: 'The S’mores',
      description: 'Toasted-tableside chocolate and graham, house marshmallow.',
      price: '\$14',
    ),
  ],
  'dining-morimoto-asia': [
    MenuItem(
      course: 'Dim Sum',
      name: 'Peking Duck',
      description: 'Carved tableside, steamed buns, hoisin, scallion.',
      price: '\$48',
    ),
    MenuItem(
      course: 'Dim Sum',
      name: 'Spare Ribs',
      description: 'Morimoto-style glazed ribs, sesame.',
      price: '\$18',
    ),
    MenuItem(
      course: 'Sushi & Rolls',
      name: 'Morimoto Sashimi Selection',
      description: 'Chef’s daily cut of premium fish.',
      price: '\$34',
    ),
    MenuItem(
      course: 'Mains',
      name: 'Tonkotsu Ramen',
      description: 'Rich pork broth, chashu, soft egg, scallion.',
      price: '\$22',
    ),
    MenuItem(
      course: 'Mains',
      name: 'Orange Chicken',
      description: 'Crispy chicken, bright citrus glaze.',
      price: '\$26',
    ),
    MenuItem(
      course: 'Desserts',
      name: 'Tempura Cheesecake',
      description: 'Warm fried cheesecake, seasonal fruit.',
      price: '\$12',
    ),
  ],
  'dining-capa-four-seasons': [
    MenuItem(
      course: 'Tapas',
      name: 'Jamón Ibérico de Bellota',
      description: 'Acorn-fed Spanish ham, hand-carved.',
      price: '\$32',
    ),
    MenuItem(
      course: 'Tapas',
      name: 'Patatas Bravas',
      description: 'Crispy potatoes, spicy tomato, garlic aioli.',
      price: '\$14',
    ),
    MenuItem(
      course: 'From the Grill',
      name: 'Bone-In Ribeye (22 oz)',
      description: 'Wood-grilled, finished with sea salt.',
      price: '\$78',
    ),
    MenuItem(
      course: 'From the Grill',
      name: 'Spanish Octopus',
      description: 'Charred octopus, smoked paprika, citrus.',
      price: '\$36',
    ),
    MenuItem(
      course: 'Sides',
      name: 'Truffle Fries',
      description: 'Hand-cut, parmesan, truffle.',
      price: '\$13',
    ),
    MenuItem(
      course: 'Desserts',
      name: 'Basque Cheesecake',
      description: 'Burnt-top cheesecake, seasonal compote.',
      price: '\$15',
    ),
  ],
  'dining-toothsome-chocolate': [
    MenuItem(
      course: 'Brunch',
      name: 'Toothsome Breakfast Stack',
      description: 'Pancakes, eggs, and bacon — playful steampunk plating.',
      price: '\$19',
    ),
    MenuItem(
      course: 'Mains',
      name: 'Prime Burger',
      description: 'House blend, brioche, hand-cut fries.',
      price: '\$21',
    ),
    MenuItem(
      course: 'Mains',
      name: 'Chicken & Waffles',
      description: 'Crispy chicken, cheddar-chive waffle, maple.',
      price: '\$23',
    ),
    MenuItem(
      course: 'Milkshakes',
      name: 'The Worth-It Shake',
      description: 'Over-the-top topped shake — the signature photo moment.',
      price: '\$18',
    ),
    MenuItem(
      course: 'Desserts',
      name: 'Brownie Sundae',
      description: 'Warm brownie, house ice cream, chocolate.',
      price: '\$14',
    ),
  ],
  'dining-the-ravenous-pig': [
    MenuItem(
      course: 'Starters',
      name: 'House Charcuterie Board',
      description: 'Rotating in-house cured meats, pickles, mustard.',
      price: '\$24',
    ),
    MenuItem(
      course: 'Starters',
      name: 'Pub Burger',
      description: 'House blend, brioche, fries — the local legend.',
      price: '\$20',
    ),
    MenuItem(
      course: 'Mains',
      name: 'Shrimp & Grits',
      description: 'Gulf shrimp, smoked gouda grits, andouille.',
      price: '\$29',
    ),
    MenuItem(
      course: 'Mains',
      name: 'Seasonal Fish',
      description: 'Daily catch, market vegetables, bright sauce.',
      price: '\$34',
    ),
    MenuItem(
      course: 'Drinks',
      name: 'Cask & Larder Brews',
      description: 'Rotating house-brewed beer selection.',
      price: '\$8',
    ),
  ],
  'dining-prato': [
    MenuItem(
      course: 'Antipasti',
      name: 'Burrata',
      description: 'Creamy burrata, seasonal accompaniment, grilled bread.',
      price: '\$17',
    ),
    MenuItem(
      course: 'Pizza',
      name: 'Margherita',
      description: 'San Marzano, mozzarella, basil — wood-fired.',
      price: '\$18',
    ),
    MenuItem(
      course: 'Pizza',
      name: 'Soppressata Piccante',
      description: 'Spicy salami, chili, mozzarella.',
      price: '\$21',
    ),
    MenuItem(
      course: 'Pasta',
      name: 'House Tagliatelle',
      description: 'Hand-cut pasta, seasonal ragù.',
      price: '\$26',
    ),
    MenuItem(
      course: 'Dolci',
      name: 'Tiramisù',
      description: 'Espresso-soaked ladyfingers, mascarpone.',
      price: '\$12',
    ),
  ],
  'dining-hawkers-mills-50': [
    MenuItem(
      course: 'Street Plates',
      name: 'Roti Canai',
      description: 'Flaky flatbread, curry dipping sauce — the must-order.',
      price: '\$7',
    ),
    MenuItem(
      course: 'Street Plates',
      name: 'Char Kway Teow',
      description: 'Wok-fried flat rice noodles, egg, bean sprouts.',
      price: '\$13',
    ),
    MenuItem(
      course: 'Buns & Bao',
      name: 'Pork Belly Bao',
      description: 'Steamed bun, braised pork belly, pickles.',
      price: '\$9',
    ),
    MenuItem(
      course: 'Noodles & Rice',
      name: 'Singapore Curry Noodles',
      description: 'Rice vermicelli, curry, shrimp, char siu.',
      price: '\$14',
    ),
    MenuItem(
      course: 'Drinks',
      name: 'Thai Iced Tea',
      description: 'Sweet spiced tea, condensed milk.',
      price: '\$5',
    ),
  ],
  'dining-se7en-bites': [
    MenuItem(
      course: 'Breakfast',
      name: 'The Big Texan',
      description: 'Biscuit, fried chicken, egg, and gravy — the cult plate.',
      price: '\$15',
    ),
    MenuItem(
      course: 'Breakfast',
      name: 'Loaded Biscuit',
      description: 'Buttermilk biscuit, eggs, cheese, choice of meat.',
      price: '\$11',
    ),
    MenuItem(
      course: 'Lunch',
      name: 'Hot Mess Sandwich',
      description: 'Slow-braised meat, slaw, on house bread.',
      price: '\$14',
    ),
    MenuItem(
      course: 'Bakery',
      name: 'Pie of the Day',
      description: 'Rotating scratch-made Southern pie by the slice.',
      price: '\$7',
    ),
    MenuItem(
      course: 'Bakery',
      name: 'Cinnamon Roll',
      description: 'Oversized, gooey, cream-cheese glaze.',
      price: '\$6',
    ),
  ],
  'dining-black-rooster-taqueria': [
    MenuItem(
      course: 'Tacos',
      name: 'Carne Asada Taco',
      description: 'Grilled steak, onion, cilantro, salsa.',
      price: '\$5',
    ),
    MenuItem(
      course: 'Tacos',
      name: 'Al Pastor Taco',
      description: 'Marinated pork, pineapple, onion, cilantro.',
      price: '\$5',
    ),
    MenuItem(
      course: 'Tacos',
      name: 'Roasted Cauliflower Taco',
      description: 'Charred cauliflower, crema, pepitas.',
      price: '\$5',
    ),
    MenuItem(
      course: 'Sides',
      name: 'Chips & Guacamole',
      description: 'House-made guac, warm tortilla chips.',
      price: '\$8',
    ),
    MenuItem(
      course: 'Drinks',
      name: 'House Margarita',
      description: 'Tequila, lime, agave — fresh-shaken.',
      price: '\$11',
    ),
  ],
  'dining-normans': [
    MenuItem(
      course: 'Tasting',
      name: 'New World Tasting Menu',
      description: 'Multi-course chef’s progression of Van Aken’s signature cuisine.',
      price: '\$135',
    ),
    MenuItem(
      course: 'Signatures',
      name: 'Mongstad Pork Havana',
      description: 'Rum-and-pepper-painted pork with a 21-year-old rum glaze.',
      price: '\$52',
    ),
    MenuItem(
      course: 'Starters',
      name: 'Yuca-Stuffed Crispy Shrimp',
      description: 'Sour-orange mojo, a Norman’s classic.',
      price: '\$26',
    ),
    MenuItem(
      course: 'Pairings',
      name: 'Wine Pairing',
      description: 'Sommelier flight across the tasting menu.',
      price: '\$85',
    ),
  ],
  'dining-california-grill': [
    MenuItem(
      course: 'Sushi',
      name: 'Signature Sushi Roll Sampler',
      description: 'Chef’s selection of specialty rolls.',
      price: '\$32',
    ),
    MenuItem(
      course: 'Mains',
      name: 'Oak-Fired Filet of Beef',
      description: 'Mashed potatoes, seasonal vegetables, red-wine reduction.',
      price: '\$62',
    ),
    MenuItem(
      course: 'Mains',
      name: 'Pork Two Ways',
      description: 'Tenderloin and belly, polenta, mustard jus.',
      price: '\$49',
    ),
    MenuItem(
      course: 'Desserts',
      name: 'Warm Chocolate Cake',
      description: 'The fireworks-night classic.',
      price: '\$15',
    ),
  ],
  'dining-homecomin': [
    MenuItem(
      course: 'Starters',
      name: 'Fried Green Tomatoes',
      description: 'Cornmeal-crusted, herb buttermilk.',
      price: '\$14',
    ),
    MenuItem(
      course: 'Mains',
      name: "Art's Famous Fried Chicken",
      description: 'Buttermilk-brined, cheddar-drop biscuit, choice of sides.',
      price: '\$27',
    ),
    MenuItem(
      course: 'Mains',
      name: 'Shrimp & Grits',
      description: 'Gulf shrimp, smoked-cheddar grits, andouille.',
      price: '\$29',
    ),
    MenuItem(
      course: 'Cocktails',
      name: 'Shine Punch',
      description: 'Moonshine, citrus, the signature sip.',
      price: '\$15',
    ),
  ],
  'dining-luma-on-park': [
    MenuItem(
      course: 'Starters',
      name: 'Seasonal Crudo',
      description: 'Daily fish, citrus, chili oil.',
      price: '\$21',
    ),
    MenuItem(
      course: 'Pasta',
      name: 'House Tagliatelle',
      description: 'Hand-cut pasta, market ragù.',
      price: '\$28',
    ),
    MenuItem(
      course: 'Mains',
      name: 'Wood-Grilled Fish',
      description: 'Seasonal catch, vegetables, bright sauce.',
      price: '\$38',
    ),
    MenuItem(
      course: 'Drinks',
      name: 'By-the-Glass Flight',
      description: 'Rotating sommelier selection.',
      price: '\$24',
    ),
  ],
  'dining-domu': [
    MenuItem(
      course: 'Ramen',
      name: 'Richie Rich',
      description: 'Tonkotsu broth, pork chashu, soft egg, garlic oil.',
      price: '\$19',
    ),
    MenuItem(
      course: 'Ramen',
      name: 'The Veggie',
      description: 'Mushroom broth, seasonal vegetables, tofu.',
      price: '\$17',
    ),
    MenuItem(
      course: 'Starters',
      name: 'Crispy Chicken Bao',
      description: 'Steamed bun, fried chicken, pickles.',
      price: '\$9',
    ),
    MenuItem(
      course: 'Drinks',
      name: 'Japanese Whisky Highball',
      description: 'Crisp, bracing, easy with ramen.',
      price: '\$12',
    ),
  ],
  'dining-jaleo': [
    MenuItem(
      course: 'Tapas',
      name: 'Gambas al Ajillo',
      description: 'Shrimp sautéed with garlic and chili.',
      price: '\$17',
    ),
    MenuItem(
      course: 'Tapas',
      name: 'Pan de Cristal con Tomate',
      description: 'Crystal bread brushed with fresh tomato.',
      price: '\$9',
    ),
    MenuItem(
      course: 'Paella',
      name: 'Paella de Marisco',
      description: 'Seafood paella cooked over wood fire.',
      price: '\$34',
    ),
    MenuItem(
      course: 'Desserts',
      name: 'Flan al Estilo Tradicional',
      description: 'Classic Spanish custard.',
      price: '\$11',
    ),
  ],
  'dining-bosphorous': [
    MenuItem(
      course: 'Starters',
      name: 'Lavash & Hummus',
      description: 'Table-stretching puffed bread, house hummus.',
      price: '\$10',
    ),
    MenuItem(
      course: 'Mains',
      name: 'Mixed Grill (Izgara)',
      description: 'Lamb, chicken, and köfte over rice.',
      price: '\$34',
    ),
    MenuItem(
      course: 'Mains',
      name: 'Iskender Kebab',
      description: 'Sliced döner, tomato sauce, yogurt, browned butter.',
      price: '\$24',
    ),
    MenuItem(
      course: 'Desserts',
      name: 'Baklava',
      description: 'Layered phyllo, pistachio, honey.',
      price: '\$8',
    ),
  ],
};
