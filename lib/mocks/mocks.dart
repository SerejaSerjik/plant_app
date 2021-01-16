class Mocks {
  static final Mocks _singleton = Mocks._internal();

  factory Mocks() {
    return _singleton;
  }

  Mocks._internal();

  static const Map<String, dynamic> profile = {
    "username": "react-ui-kit",
    "location": "Europe",
    "email": "contact@react-ui-kit.com",
    "avatar": "assets/images/avatar.png",
    "budget": 1000,
    "monthly_cap": 5000,
    "notifications": true,
    "newsletter": false
  };

  static const List<Map<String, dynamic>> categories = [
    {
      "id": "plants",
      "name": "Plants",
      "tags": ["products", "inspirations"],
      "count": 147,
      "image": "assets/icons/plants.png"
    },
    {
      "id": "seeds",
      "name": "Seeds",
      "tags": ["products", "shop"],
      "count": 16,
      "image": "assets/icons/seeds.png"
    },
    {
      "id": "flowers",
      "name": "Flowers",
      "tags": ["products", "inspirations"],
      "count": 68,
      "image": "assets/icons/flowers.png"
    },
    {
      "id": "sprayers",
      "name": "Sprayers",
      "tags": ["products", "shop"],
      "count": 17,
      "image": "assets/icons/sprayers.png"
    },
    {
      "id": "pots",
      "name": "Pots",
      "tags": ["products", "shop"],
      "count": 47,
      "image": "assets/icons/pots.png"
    },
    {
      "id": "fertilizers",
      "name": "fertilizers",
      "tags": ["products", "shop"],
      "count": 47,
      "image": "assets/icons/fertilizers.png"
    },
  ];

  static const List<String> explore = [
    // images
    "assets/images/explore_1.png",
    "assets/images/explore_2.png",
    "assets/images/explore_3.png",
    "assets/images/explore_4.png",
    "assets/images/explore_5.png",
    "assets/images/explore_6.png",
  ];

  static const List<Map<String, dynamic>> products = [
    {
      "id": 1,
      "name": "16 Best Plants That Thrive In Your Bedroom",
      "description":
          "Bedrooms deserve to be decorated with lush greenery just like every other room in the house – but it can be tricky to find a plant that thrives here. Low light, high humidity and warm temperatures mean only certain houseplants will flourish.",
      "tags": ["Interior", "27 m²", "Ideas"],
      "images": [
        "assets/images/plants_1.png",
        "assets/images/plants_2.png",
        "assets/images/plants_3.png",
        // showing only 3 images, show +6 for the rest
        "assets/images/plants_1.png",
        "assets/images/plants_2.png",
        "assets/images/plants_3.png",
        "assets/images/plants_1.png",
        "assets/images/plants_2.png",
        "assets/images/plants_3.png",
      ]
    }
  ];
}
