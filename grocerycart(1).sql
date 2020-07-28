-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 28, 2020 at 12:36 PM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `grocerycart`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `cartid` int(11) NOT NULL,
  `customerId` int(11) NOT NULL,
  `pid` int(15) NOT NULL,
  `cid` int(15) NOT NULL,
  `quantity` int(20) NOT NULL,
  `price` int(20) NOT NULL,
  `count` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`cartid`, `customerId`, `pid`, `cid`, `quantity`, `price`, `count`) VALUES
(74, 1, 3, 1, 3, 600, 0),
(75, 1, 2, 1, 6, 492, 0),
(79, 1, 4, 1, 4, 1520, 0),
(80, 1, 9, 1, 4, 280, 0),
(81, 1, 8, 1, 4, 720, 0),
(82, 1, 12, 2, 2, 190, 0),
(83, 1, 15, 2, 3, 1125, 0),
(84, 1, 17, 2, 2, 358, 0);

-- --------------------------------------------------------

--
-- Table structure for table `categorymst`
--

CREATE TABLE `categorymst` (
  `categoryid` int(11) NOT NULL,
  `categoryname` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categorymst`
--

INSERT INTO `categorymst` (`categoryid`, `categoryname`) VALUES
(1, 'Household'),
(2, 'HomeandKitchen'),
(3, 'ReadytoEat'),
(4, 'Beverages'),
(5, 'Dairyproducts'),
(6, 'Healthcare'),
(7, 'Personalcare'),
(8, 'BabyandKids'),
(9, 'Petcare');

-- --------------------------------------------------------

--
-- Table structure for table `customermst`
--

CREATE TABLE `customermst` (
  `cid` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(35) NOT NULL,
  `contact` varchar(15) NOT NULL,
  `address1` varchar(255) NOT NULL,
  `address2` varchar(255) NOT NULL,
  `fname` varchar(255) NOT NULL,
  `lname` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customermst`
--

INSERT INTO `customermst` (`cid`, `email`, `password`, `contact`, `address1`, `address2`, `fname`, `lname`) VALUES
(1, 'abc@abc.abc', 'hello@1998', '9638480518', 'Patan', '', 'Deep', 'Patel'),
(2, 'shizjo67@gmail.com', 'shivam@1234', '9265962599', 'morbi', '', 'shivam', 'joshi');

-- --------------------------------------------------------

--
-- Table structure for table `deliveryperson`
--

CREATE TABLE `deliveryperson` (
  `dpid` int(11) NOT NULL,
  `dpname` varchar(255) NOT NULL,
  `dpaddress` varchar(255) NOT NULL,
  `dpphone` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `deliveryperson`
--

INSERT INTO `deliveryperson` (`dpid`, `dpname`, `dpaddress`, `dpphone`) VALUES
(1, 'XYZ', 'this is for testing purpose.', '1239784560');

-- --------------------------------------------------------

--
-- Table structure for table `offers`
--

CREATE TABLE `offers` (
  `offerid` int(11) NOT NULL,
  `productid` int(11) NOT NULL,
  `discount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `offers`
--

INSERT INTO `offers` (`offerid`, `productid`, `discount`) VALUES
(1, 2, 5),
(2, 11, 10),
(3, 28, 8),
(4, 34, 10),
(5, 39, 5),
(6, 44, 8),
(7, 51, 5),
(8, 58, 8),
(9, 61, 10),
(10, 48, 5);

-- --------------------------------------------------------

--
-- Table structure for table `orderdetails`
--

CREATE TABLE `orderdetails` (
  `orderdetailid` int(11) NOT NULL,
  `productid` int(11) NOT NULL,
  `qtyordered` int(11) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orderdetails`
--

INSERT INTO `orderdetails` (`orderdetailid`, `productid`, `qtyordered`, `price`) VALUES
(1, 31, 4, 1200),
(1, 32, 13, 260),
(1, 33, 4, 672),
(1, 42, 5, 605),
(1, 43, 5, 400),
(2, 1, 1, 420),
(2, 2, 1, 82),
(2, 3, 1, 200);

-- --------------------------------------------------------

--
-- Table structure for table `ordermst`
--

CREATE TABLE `ordermst` (
  `ordernumber` int(11) NOT NULL,
  `orderdetails_ID` int(11) NOT NULL,
  `cid` int(11) NOT NULL,
  `orderdate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ordermst`
--

INSERT INTO `ordermst` (`ordernumber`, `orderdetails_ID`, `cid`, `orderdate`) VALUES
(1, 1, 1, '2020-03-25'),
(2, 2, 2, '2020-03-27');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `paymentid` int(11) NOT NULL,
  `totalamount` int(11) NOT NULL,
  `orderdetailid` int(11) NOT NULL,
  `cid` int(11) NOT NULL,
  `paymentmode` int(11) NOT NULL,
  `dateofpayment` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `productmst`
--

CREATE TABLE `productmst` (
  `productid` int(11) NOT NULL,
  `categoryid` int(11) NOT NULL,
  `productname` varchar(255) NOT NULL,
  `qty` varchar(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `imgname` varchar(255) NOT NULL,
  `imgfile` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `productmst`
--

INSERT INTO `productmst` (`productid`, `categoryid`, `productname`, `qty`, `description`, `price`, `imgname`, `imgfile`) VALUES
(1, 1, 'ariel-detergent-washing-powder-matic-front-load', '2Kg', 'New & Improved Ariel Matic gives you tough stain removal in just 1 wash. Especially designed to be used in top loading machines, Ariel Matic Top Load offers brilliant stain removal for full loads. It also provides deep down cleaning and long-lasting fresh', 420, 'ariel-detergent-washing-powder-matic-front-load', 'ariel-detergent-washing-powder-matic-front-load.jfif'),
(2, 1, 'vim-dishwash-gel-lemon', '750ml', 'Vim is a quality product from Hindustan Unilever Limited. Launched in 1993, Vim is the original hand dishwashing brand which created the whole category. Vim continues to lead the market and is the biggest player in the category. Vim was the first brand to', 82, 'vim-dishwash-gel-lemon', 'vim-dishwash-gel-lemon.jfif'),
(3, 1, 'harpic-disinfectant-toilet-cleaner-original-power-', '3x200ml', 'Harpic is Indias No.1 Toilet Cleaning Brand which is highly recommended by the Indian Medical Association. Harpic guarantees to kill 99.99% of disease-causing bacteria as well as germs and viruses while leaving your toilets and bathrooms smelling fragrant', 200, 'harpic-disinfectant-toilet-cleaner-original-power-', 'harpic-disinfectant-toilet-cleaner-original-power-plus.jfif'),
(4, 1, 'surf-excel-matic-front-load-detergent-powder', '2kg', 'Presenting, Surf excel matic front load the machine specialist laundry detergent from the Surf excel matic family that gives you 100% Tough Stain Removal in Machines. Surf excel matic front load is specially designed to work in high water level environmen', 380, 'surf-excel-matic-front-load-detergent-powder', 'surf-excel-matic-front-load-detergent-powder.jfif'),
(5, 1, 'lizol-disinfectant-surface-cleaner-citrus', '2x975ml', 'Lizol is Indias No.1 floor cleaning brand and recommended by the Indian Medical Association. Keep your home fresh and germ-free with Lizols comprehensive 3 in 1 home-care solution. Lizol Disinfectant Surface Cleaner contains a distinctive formulation that', 283, 'lizol-disinfectant-surface-cleaner-citrus', 'lizol-disinfectant-surface-cleaner-citrus.jfif'),
(6, 1, 'vim-dishwash-bar', '3x200', 'With the Power of 100 lemons, vim bar removes the toughest grease stains the fastets and gives you a pleasant cleaning experience with its refreshing lemon fragrance. \r\nIt has a unique patented plastic coating at the bottom of the bar which helps prevent ', 43, 'vim-dishwash-bar', 'vim-dishwash-bar.jfif'),
(7, 1, 'vim-dishwash-bar ', '300g', '\r\n• With the Power of 100 lemons, vim bar removes the toughest grease stains the fastest and gives you a pleasant cleaning experience with its refreshing lemon fragrance.\r\n• It has a unique patented plastic coating at the bottom of the bar which helps pre', 20, 'vim-dishwash-bar ', 'vim-dishwash-bar (2).jfif'),
(8, 1, 'surf-excel-liquid-detergent-matic-top-load', '1l', 'Presenting new Surf Excel Matic Top Load Liquid - a revolutionary liquid detergent for top load washing machines. Surf Excel Matic Liquid is effective in high water level environment (40 liters) of top load washing machines and dissolves completely ensuri', 180, 'surf-excel-liquid-detergent-matic-top-load', 'surf-excel-liquid-detergent-matic-top-load.jfif'),
(9, 1, 'surf-excel-easy-wash-detergent-powder', '200+200ml', 'Harpic is Indias No.1 Toilet Cleaning Brand which is highly recommended by the Indian Medical Association. Harpic guarantees to kill 99.99% of disease-causing bacteria as well as germs and viruses while leaving your toilets and bathrooms smelling fragrant', 70, 'surf-excel-easy-wash-detergent-powder', 'surf-excel-easy-wash-detergent-powder.jfif'),
(10, 1, 'bb-combo-harpic-toilet-cleaner-original-power-plus', '1l+200ml', 'Harpic is Indias No.1 Toilet Cleaning Brand which is highly recommended by the Indian Medical Association. Harpic guarantees to kill 99.99% of disease-causing bacteria as well as germs and viruses while leaving your toilets and bathrooms smelling fragrant', 176, 'bb-combo-harpic-toilet-cleaner-original-power-plus', 'bb-combo-lizol-surface-cleaner-citrus-500mlharpic-bathroom-cleaning-liquid-lemon-500ml.jfif'),
(11, 2, 'Royal Mesh Strainer', '1pc', 'Anjali royal mesh strainer is made of high quality stainless steel jali with a plastic handle and is the perfect kitchen companion at a budget friendly price. They are available in different sizes and are in sync with the latest trends.', 69, '40114224_2-anjali-royal-mesh-strainer', '40114224_2-anjali-royal-mesh-strainer.jfif'),
(12, 2, 'potato masher', '1pc', 'Anjali Potato masher is made of high quality stainless steel and can also be used as a manual grinder in the kitchen.', 95, '40114230_2-anjali-potato-masher-round', '40114230_2-anjali-potato-masher-round.jfif'),
(13, 2, 'lemon sqeezer stainless steel', '1pc', '\r\nThis lemon squeezer is made of plastic and comes in two attractive colours, green & red and it comes along with a box pack.', 149, '40114242_1-anjali-lemon-squeezer-stainless-steel', '40114230_2-anjali-potato-masher-round.jfif'),
(14, 2, 'Scotch brite Bottle Cleaner Brush', '1pc', 'Do you face difficulties while cleaning your bottles because the plastic brushes do not reach every nook and corner and in turn, you end up scratching your bottle? Do you always have the fear that your regular plastic brushes can induce bacteria growth in', 150, '40129728_1-scotch-brite-bottle-cleaner-brush-with-anti-bacterial-sponge-non-scratch-cleaning', '40129728_1-scotch-brite-bottle-cleaner-brush-with-anti-bacterial-sponge-non-scratch-cleaning.jfif'),
(15, 2, 'BB Home Chopping-Cutting Board', '1pc', 'Make chopping vegetables and fruits easy and fun with this wooden chopping board. The chopping board is made using the high quality wood making it extremely lightweight yet durable. The size of the board is ideal for chopping veggies and slicing fruits. I', 375, '40133717_2-bb-home-chopping-cutting-board-bamboo-wood-steel-handle-bh-042', '40133717_2-bb-home-chopping-cutting-board-bamboo-wood-steel-handle-bh-042.jfif'),
(16, 2, 'Elephant Stainless Steel Colander/Basket/Strainer', '1pc', 'Straining is an everyday task in most kitchens, for which a tough, durable, easy-to-clean and maintain strainer is a necessity. Crafted from high grade and food grade stainless steel, it can be used for strain soup, juice, milk, tea, and other liquids. St', 219, '40163243_3-elephant-stainless-steel-colanderbasketstrainer-20-cm', '40163243_3-elephant-stainless-steel-colanderbasketstrainer-20-cm.jfif'),
(17, 2, 'Bamboooz Bamboo Wood Kitchen Tools Set - Spatula, Ladle & Turner', '3pc', 'This is a set of 3 wooden cooking tools which includes a spatula, a ladle and a turner. No chemicals are used for smoothening these kitchen tools for its looks enhancement. It is made with high-quality material, making it durable for daily use.', 179, 'Straining is an everyday task in most kitchens, for which a tough, durable, easy-to-clean and maintain strainer is a necessity. Crafted from high grade and food grade stainless steel, it can be used for strain soup, juice, milk, tea, and other liquids. St', '40164969_1-bamboooz-bamboo-wood-kitchen-tools-set-spatula-ladle-turner.jfif'),
(18, 2, 'Bamboooz Bamboo Wood Chakla/Rolling Board - 10 Inch, 1 pc  \r\n\r\n\r\nBamboooz\r\nBamboooz Bamboo Wood Chakla/Rolling Board ', '', 'This rolling board is natural and very durable with an anti-skid heavy base. It is easy to maintain/clean, dishwasher safe and won\'t absorb food odours or stains. It is useful and handy for kitchen use purpose. It is a Bamboo Wood Chakla to make roti, par', 349, '40164970_1-bamboooz-bamboo-wood-chaklarolling-board-10-inch', '40164970_1-bamboooz-bamboo-wood-chaklarolling-board-10-inch.jfif'),
(19, 2, 'Anjali Vegetable-Fruit Easy Chopper With Lassi Blade', '1pc', 'Cut and slice the following vegetables in minutes with this Anjali Easy Choppy. Now complete your kitchen preparations in a fast and easy way.   This Sharp stainless steel blades & anti-skid base: designed for fast and perfect chopping, safe, healthy an', 249, '40165488_2-wonderchef-vegetable-fruit-string-chopper-classic', '40164970_1-bamboooz-bamboo-wood-chaklarolling-board-10-inch.jfif'),
(20, 2, 'Pigeon Mini Chopper Fruits & Vegetable With 3 Blades', '1pc', '\r\nThis compact kitchen appliance is designed to help cut down your kitchen chores. A simple pull of the rope in this Pigeon Handy vegetable and fruit chopper cuts food items down into small pieces. The chopper’s tough body can withstand being put into the', 299, '40165656_1-pigeon-mini-chopper-fruits-vegetable-with-3-blades-plastic-green', '40165656_1-pigeon-mini-chopper-fruits-vegetable-with-3-blades-plastic-green.jfif'),
(21, 3, 'Britannia Nutri Choice Hi Fibre Digestive Biscuits', '1pc', '\r\nFibre is the name of the game. Britannias digestive biscuit is packed with multi-grain goodness that also provides your body with essential dietary fibres. This soft and flaky biscuit is one of the products from the house of Britannia which is globally ', 52, '263597_7-britannia-nutri-choice-hi-fibre-digestive-biscuits', '263597_7-britannia-nutri-choice-hi-fibre-digestive-biscuits.jfif'),
(22, 3, 'Haldirams Namkeen - Khatta Meetha', '3pc', 'Haldirams Khatta Meetha is usual namkeen. These are deep fried. It has syrupy accents with golden raisins, salty chickpea flour strings and a bitter interest flavoring. Take happiness in with cold drinks or hot tea.\r\n\r\nIngredients:\r\nRice Flakes (22%), Edi', 160, '1201903_1-haldirams-namkeen-khatta-meetha', '1201903_1-haldirams-namkeen-khatta-meetha.jfif'),
(23, 3, 'Combo Haldirams Namkeen - Mini Bhakarwadi 200 gm + Coca Cola Soft Drink', '200 gm + Co', 'A bite sized treat that originally came from Maharashtra, this snack is a popular one. In the Haldirams culinary studio, it has evolved and taken on a form that appeals to a variety of palates even as it keeps its tangy, spicy and sweet character alive. T', 0, '1201936_1-bb-combo-haldirams-namkeen-mini-bhakarwadi-200-gm-coca-cola-soft-drink-750-ml', '1201936_1-bb-combo-haldirams-namkeen-mini-bhakarwadi-200-gm-coca-cola-soft-drink-750-ml.jfif'),
(24, 3, 'Lays Potato Chips - American Style Cream & Onion Flavour, ', '2x167g', 'Relish the delectable combination of sour and cream perfectly blended with herb and onion flavor.Delicious Party Size bag- perfect for sharing at home, at parties and picnics. About the brand-Lays, the worlds largest and favourite snack food brand, has st', 98, '1203941_3-lays-potato-chips-american-style-cream-onion-flavour', '1203941_3-lays-potato-chips-american-style-cream-onion-flavour.jfif'),
(25, 3, 'Lays Potato Chips - Indias Magic Masala', ' 2x90 g ', 'Taste the unbeatable blend of delectable Indian spices with best quality potatoes. From the everyday snack to the impromptu get-togethers, LAYS chips are the perfect addition to any occasion. Whether its party time or family time, everyone loves gathering', 63, '1203960_3-lays-potato-chips-indias-magic-masala-party-pack', '1203960_3-lays-potato-chips-indias-magic-masala-party-pack.jfif'),
(26, 3, 'Lays Potato Chips - Flirty Tomato Tango, ', '30 g', 'romae your taste buds with the tangy flavour of tomatoes and savoury spices. Delicious individual bags: perfect for snacking at work, home or school. \r\n\r\nLays, the worlds largest and favourite snack food brand, has steadily established itself as an indisp', 10, '1208146_5-lays-potato-chips-spanish-tomato-tango', '1208146_5-lays-potato-chips-spanish-tomato-tango.jfif'),
(27, 3, 'Lays\r\nLays Maxx - Macho Chilli ', '57 g', 'Made with the epic combination of maxx flavours, maxx ridges and maxx crunch, Lays Maxx is the perfect way to maxx any evening with your buddies!From the makers of Indias favourite potato chips, comes Lays Maxx! Right from the first bite till the last, Ma', 35, '40021142_2-lays-maxx-sizzling-barbeque', '40021142_2-lays-maxx-sizzling-barbeque.jfif'),
(28, 3, 'Mcvities Digestive Biscuits, ', '200 g ', '\r\nTreat yourself to a pack of McVities Digestive biscuits. Besides maida, it has the goodness of wholewheat wrapped in great taste.\r\nIngredients\r\nWheat Flour (43.3%), Edible Vegetable Oil(Palm Oil), Whole Wheat Flour (15.3%), Sugar, Wheat Bran (2.5%), Inv', 139, '40056215_2-mcvities-digestive-biscuits', '40021142_2-lays-maxx-sizzling-barbeque.jfif'),
(29, 3, 'Parle Hide & Seek Choco Rolls', '75 g\r\n', 'Parle Hide & Seek fab orange choco rolls cookies come with a mouth-watering taste that makes your tea time more special than ever. Go tempting with every single bite you grab on the luscious parle hide & seek choco rolls. Get to have fun with the hide and', 0, '40057895_5-parle-hide-seek-choco-rolls', '40057895_5-parle-hide-seek-choco-rolls.jfif'),
(30, 3, 'Nestle Munch Nuts - Chocolate Coated Crunchy Wafer, Share Pack', '222 g (20 B', '\r\nNestle Munch brings to you a wafer-based crunchilicious bar resulting in an explosive multi-sensorial crunch. MUNCH chocolate lets you discover something new with every bite. The chocolaty crunch gives MUNCH a sweet and delicious taste, so you can savou', 100, '40122231_6-kitkat-share-bag-chocolate-covered-wafer', '40122233_2-nestle-munch-nuts-chocolate-coated-crunchy-wafer-home-pack.jfif'),
(31, 4, 'Horlicks Health & Nutrition - Classic Malt ', '1kg', '\r\nHealth Drink that has nutrients to support immunity. Horlicks is clinically proven to improve 5 signs of growth. It is clinically proven to make kids taller, stronger and sharper. It is scientifically proven to improve the power of milk.\r\n\r\nThis Women\'s', 300, '119387_10-horlicks-health-nutrition-drink-classic-malt', '119387_10-horlicks-health-nutrition-drink-classic-malt.jpg'),
(32, 4, 'Frooti Drink - Fresh \'N\' Juicy Mango', '160ml', 'Frooti is a name that we all associate with the juicy flavour of mango. This brand has long been known for the mark it has made in the Indian food industry, thanks to its signature drink – the fresh and juicy Mango Frooti. It is also sold in other countri', 20, '274035_3-frooti-drink-fresh-n-juicy-mango', '274035_3-frooti-drink-fresh-n-juicy-mango.jpg'),
(33, 4, 'Bru Filter Coffee - Green Label', '500g', 'Loved by consumers since 1962, Bru Green Label Coffee is Indias first packaged filter coffee with a perfect mix of 53% coffee and 47% chicory. Its lightly roasted ground coffee beans give out a perfect decoction for a rich & smooth flavourful cup that hel', 168, '262799_24-bru-filter-coffee-green-label', '262799_24-bru-filter-coffee-green-label.jpg'),
(34, 4, 'Red Label Tea - Natural Care', '1kg', 'Red Label Natural Care Tea contains the goodness of 5 natural ingredients - Cardamom, Ginger, Tulsi, Mulethi & Ashwagandha, all of which are extremely beneficial for your body as they enhance immunity while giving the tea a unique and rich flavour. Red La', 858, '274791_9-red-label-tea-natural-care', '274791_9-red-label-tea-natural-care.jpg'),
(35, 4, 'KINley Club Soda, 2x750 ml Multipack \r\n', ' 2x750 ml M', 'Since its launch in 2002, Kinley Club Soda neutral-flavoured soda which blends well with all kinds of drinks has been quite favourite among people who want to experiment with their drinks. This is one of the indispensable elements in any cocktails. In som', 36, '288068_6-kinley-sparkling-water-club-soda', '288068_6-kinley-sparkling-water-club-soda.jpg'),
(36, 4, 'Coca Cola Soft Drink - Coke Zero, ', '6x300 ml Mu', 'Coca-Cola Zero is one of The Coca-Cola Companys most successful and significant innovations. It offers the same Great Coke Taste, with Zero Sugar. Launched in 2005 in America, Coca-Cola Zero is now available in 150 countries including India. Coca-Cola Zer', 192, '1200127_4-coca-cola-soft-drink-coke-zero', '1200127_4-coca-cola-soft-drink-coke-zero.jpg'),
(37, 4, '\r\n\r\nPepsi\r\nPepsi Soft Drink - Diet  Value Pack', '6x250 ml', 'A can that goes well with your diet plan. Pepsi is the pop that shakes things up! Pepsi is ubiquitous on just about every social occasion.\r\nIngredients\r\nWhile Diet Pepsi is pretty much made up of the same elements as its older sibling, the original Pepsi,', 150, '1200615_1-pepsi-soft-drink-black-slim', '1200127_4-coca-cola-soft-drink-coke-zero.jpg'),
(38, 4, 'Pediasure Complete & Balanced - Premium Chocolate ', '2x400 g', 'Pediasure Premium Chocolate Is A Most Important Moms Care Product And A Complete And Balanced Nutrition Diet For Your Small Choosy Eater. It Is A Strong Blend Of Prebiotics And Probiotics That Make Stronger Your Childs Immunity. It Is A Systematically Pla', 1040, '1202319_1-pediasure-complete-balanced-premium-chocolate', '1202319_1-pediasure-complete-balanced-premium-chocolate.jpg'),
(39, 4, 'Tata Tea Premium Leaf Tea, ', '1 kg', '\r\nIndias No.1 tea brand', 400, '1204483_1-tata-tea-gold-leaf-tea', '1204483_1-tata-tea-gold-leaf-tea.jpg'),
(40, 4, 'Taj Mahal\r\nTaj Mahal Tea', '2x250 g Mul', '', 296, '1204491_1-taj-mahal-tea', '1204491_1-taj-mahal-tea.jpg'),
(41, 5, 'Amul Processed Cheese', '200g', 'Amul Processed Cheese is especially wholesome and wealthy in milk protein. It is healthy cheese that is a good supply of Calcium and milk Proteins, and a trendy cheese for snacking on its own as chiplets and slices. It adds savor in melted dishes such as ', 105, '104609_2-amul-processed-cheese', '104609_2-amul-processed-cheese.jpg'),
(42, 5, 'Amul Cheese Slices', '200g', '\r\nAmul Pasteurised Processed Cheddar Cheese is made from Cheese: Sodium Citrate: Common Salt: Citric Acid: permitted natural color - Annatto. Emulsifier and Class II preservatives. It is made from graded cow/buffalo milk using microbial rennet.\r\nWholesome', 121, '104759_8-amul-cheese-slices', '104609_2-amul-processed-cheese.jpg'),
(43, 5, 'Amul Cheese Spread - Yummy Plain', '200g', '\r\nAmul Cheese Spread - Yummy Plain is a good supply of calcium and milk proteins. It is finished from soft cheese, cheddar cheese and common salt. It is especially easy to use and simple to spread. It is light, low-calorie, low-fat & low-cholesterol bread', 80, '104823_3-amul-cheese-spread-yummy-plain', '104823_3-amul-cheese-spread-yummy-plain.jpg'),
(44, 5, '\r\nAmul Malai Paneer - Cubes', '1kg', 'Amul Malai Paneer is a pack of cottage cheese cubes which are known to be quite popular among vegetarians. Any vegetarian North Indian dish like malai paneer, paneer butter masala or panermakhani will be incomplete without these cottage cheese cubes. As t', 340, '279587_1-amul-malai-paneer-cubes', '279587_1-amul-malai-paneer-cubes.jpg'),
(45, 5, 'Amul Masti Buttermilk - Spice', '6*1l', '\r\nAmul Masti Buttermilk is a refreshing milk based natural drink. It is easy to use a low-calorie drink that refreshes you immediately with the goodness of nature. \r\n\r\nTo be taken directly on move (small pack) or at home, parties, picnics etc. (family pac', 269, '1200002_8-amul-masti-buttermilk-spice', '1200002_8-amul-masti-buttermilk-spice.jpg'),
(46, 6, '\r\n\r\nSavlon\r\nSavlon Savlon Antiseptic - Disinfectant Liquid ', ' 2x200 ml M', '\r\nSavlon presents Antiseptic Disinfectant for first aid, medical and personal hygiene. Savlon Antiseptic liquid smoothly cleanses and helps avoid infection aiding the natural healing of minor skin injuries including Insect bites & stings, cuts & grazes, m', 119, '208013_2-savlon-antiseptic-disinfectant-liquid', '208013_2-savlon-antiseptic-disinfectant-liquid.jpg'),
(47, 6, 'Bella Cotton Pads, 80 pcs (Get 30% Free) \r\n\r\n', '80 pcs', 'These are soft, gentle and highly absorbent pads that are imported from Europe. The premium quality Bella Cotton Pads are made of 100% clean, soft and natural cotton fibres that are delicate for all skin types. It is a two-sided cotton pad. It has a plain', 129, '209583_8-bella-cotton-pads', '209583_8-bella-cotton-pads.jpg'),
(48, 6, 'vicks_vaporoub', '25g', 'Vicks\r\nVaporub 25 gm pack', 75, '263696_3-vicks-vaporub', '263696_3-vicks-vaporub.jpg'),
(49, 6, 'ENo fruit salts lemon flavour', ' 5 g', 'ENO gets to work in 6 seconds to neutralize acid in your stomach, on contact. ENO Powder gets to work faster than liquid and tablet antacids, so that you get fast relief when you need it most. India\'s No 1 Antacid brand. ', 48, '263907_8-eno-fruit-salt-lemon-flavor', '263907_8-eno-fruit-salt-lemon-flavor.jpg'),
(50, 6, 'Johnson & Johnson Buds, 30 stems/60 swabs', '', 'Johnson and Johnson Ear Buds are arranged from 100 percent pure cotton so they are obviously absorbent and calm on ears. They softly clean and dried out your ears. It can also be used to apply cream to blemishes. ', 45, '264003_12-johnson-johnson-buds', '264003_12-johnson-johnson-buds.jpg'),
(51, 7, 'Head & shoulders Shampoo -Anti hairfall', '650ml', 'Rescue hair from damage, dullness, and hairfall. Helps repair damaged hair to create smoothness, and reduces breakage for up to 10X stronger hair (strength against damage vs. non-conditioning shampoo). Gentle enough for everyday use, even for color or che', 380, '202239_10-head-shoulder-anti-dandruff-shampoo-anti-hairfall', '202239_10-head-shoulder-anti-dandruff-shampoo-anti-hairfall.jpg'),
(52, 7, 'dabur badam tail', '50 ml', '100% pure Dabur Badam Oil is extracted from best quality almonds and application on the scalp makes hair strong & healthy. It is also used for application on body and baby massage. Consumption with milk helps relieve constipation.\r\nThis Refreshing body sp', 197, '267759_8-dabur-badam-tail-100-pure-almond-oil', '267759_8-dabur-badam-tail-100-pure-almond-oil.jpg'),
(53, 7, 'Yardley London English Rose Deodorant - For Women', '150ml', 'This Refreshing body spray is packed with elegance and beauty with an ever-lasting fragrance. Enjoy the rich and the authentic fragrances from the house of Yardley, which will keep you energizing and rejuvenating.', 171, '272266_3-yardley-london-english-rose-deodorant-for-women', '272266_3-yardley-london-english-rose-deodorant-for-women.jpg'),
(54, 7, 'Dove hairfall shampoo', '650ml', 'We love the feeling of beautiful hair -but daily damage can leave your hair prone to breakage. Let hair fall be an issue of the past! Use the Hair Fall Rescue Shampoo from Dove regularly to get thick and luscious hair as the shampoo works to reduce hair f', 360, '295801_9-dove-hair-fall-rescue-shampoo', '295801_9-dove-hair-fall-rescue-shampoo.jpg'),
(55, 7, 'Engage Bodylicious Deodorant Spray - Blush (For Women)', '3x150ml', 'Engage Blush bodylicious deo spray which creates heady & refreshing aroma and prevents from bad odour. It supplies 24 hour brightness and has been crafted to improve their special grooming and assurance.', 380, '1206761_2-engage-bodylicious-deodorant-spray-spell-for-women', '295801_9-dove-hair-fall-rescue-shampoo.jpg'),
(56, 8, 'Nestle Cerelac Fortified Baby Cereal With Milk, Multigrain Dal Veg - From 12 Months\r\n', '300g', 'Nestle Cerelac Fortified Baby Cereal with Milk, Multigrain Dal Veg is a complementary food for babies from 12 months onwards. While infants and children have higher requirements of nutrients than adults, 2 serves of Cerelac Multigrain Dal Veg Cereal provi', 252, '240149_9-nestle-cerelac-fortified-baby-cereal-with-milk-multigrain-dal-veg-from-12-months', '240149_9-nestle-cerelac-fortified-baby-cereal-with-milk-multigrain-dal-veg-from-12-months.jpg'),
(57, 8, 'Johnson\'s Baby Shampoo', '500ml', 'Johnsons Baby Shampoo helps wash your little ones mane. It is calm on your babys scalp and rinses speedily. The No More Tears baby shampoo does not aggravate the eyes and it is well-known to be largely hypo-allergenic, as claimed with the label. Further, ', 283, '262921_17-johnson-johnson-baby-shampoo', '262921_17-johnson-johnson-baby-shampoo.jpg'),
(58, 8, 'Johnson\'s Baby Soap', '150g', 'Johnsons Baby Soap is cleanse your babys face and body with this form-fitting, grippable bar for easy bathing.', 82, '\r\n299670_16-johnson-johnson-baby-soap', '299670_16-johnson-johnson-baby-soap.jpg'),
(59, 8, 'Johnson\'s Baby Lotion', '500ml', '\r\nJohnsons is the 1 choice of hospitals and with the wonderful baby fresh scent, it could just be your best friend to help protect your babys skin from dryness. This baby lotion softens and nourishes, for baby softness. Its Fast-absorbing formula with ric', 275, '280965_16-johnson-johnson-baby-lotion', '299670_16-johnson-johnson-baby-soap.jpg'),
(60, 8, 'Nestle Nestle Nan Pro 3 Follow-Up Formula Powder - After 12 months, Stage 3', '400g', 'Nestle Nan Pro 3 is a spray dried Follow-up formula for older infants after 12 months when they are not breastfed. Babies that receive the right nutrition in the first 2 years of life are much more likely to benefit from good health throughout childhood a', 1250, '1201646_3-nestle-nestle-nan-pro-3-follow-up-formula-powder-after-12-months-stage-3', '1201646_3-nestle-nestle-nan-pro-3-follow-up-formula-powder-after-12-months-stage-3.jpg'),
(61, 9, 'Pedigree Dry Dog Food - Chicken & Vegetables, For Adult Dogs', '3kg', 'Pedigree is a complete and balanced food for dogs. Prepared with high-quality ingredients, Pedigree is rich in proteins and nutrition. Pedigree pet food provides dogs with the 5 Signs of Good Health - healthy skin and coat, strong bones and teeth, digesti', 540, '130331_16-pedigree-dry-dog-food-chicken-vegetables-for-adult-dogs', '130331_16-pedigree-dry-dog-food-chicken-vegetables-for-adult-dogs.jpg'),
(62, 9, 'Pedigree Dry Dog Food - Meat & Rice, For Adult Dogs', '10kg', 'Pedigree is a complete and balanced food for dogs. Prepared with high quality ingredients, Pedigree is rich in proteins and nutrition. Pedigree pet food provides dogs the 5 Signs of Good Health - healthy skin and coat, strong bones and teeth, digestive he', 1600, '182218_15-pedigree-dry-dog-food-meat-rice-for-adult-dogs', '182218_15-pedigree-dry-dog-food-meat-rice-for-adult-dogs.jpg'),
(63, 9, 'Pedigree Dry Meat & Rice 3kg+Wet Chicken & Liver Chunks in Gravy 80g 15 Packs (For Adult)', '3kg+80g', 'Pedigree is a complete and balanced food for dogs. Prepared with high-quality ingredients, Pedigree is rich in proteins and nutrition. Pedigree pet food provides dogs with the 5 Signs of Good Health, healthy skin and coat, strong bones and teeth, digestiv', 965, '1208365_3-pedigree-dry-meat-rice-3kgwet-chicken-liver-chunks-in-gravy-80g-15-packs-for-adult', '1208365_3-pedigree-dry-meat-rice-3kgwet-chicken-liver-chunks-in-gravy-80g-15-packs-for-adult.jpg'),
(64, 9, 'Pedigree Dry Veggie 3kg+Wet Chicken & Liver Chunks in Gravy 80g 15 Packs (For Adult Dogs)', '3kg+80g', 'Pedigree is a complete and balanced food for your dog. Made with high-quality ingredients, Pedigree provides dogs with the 5 Signs of Good Health, healthy skin and coat, strong bones and teeth, healthy digestive system, strong muscles and a stronger immun', 1000, '1208367_3-pedigree-dry-veggie-3kgwet-chicken-liver-chunks-in-gravy-80g-15-packs-for-adult-dogs', '1208367_3-pedigree-dry-veggie-3kgwet-chicken-liver-chunks-in-gravy-80g-15-packs-for-adult-dogs.jpg'),
(65, 9, 'Pedigree Wet Dog Food - Chicken & Liver Chunks In Gravy, For Adult Dogs (Pack of 15)', '4x80g', 'Pedigree Gravy is a nutritious and balanced food for your pet dog. Made with high-quality ingredients, Pedigree provides dogs with the 5 Signs of Good Health - healthy skin and coat, strong bones and teeth, healthy digestive system, strong muscles and a s', 1700, '1208878_1-pedigree-wet-dog-food-chicken-liver-chunks-in-gravy-for-adult-dogs-pack-of-15', '1208878_1-pedigree-wet-dog-food-chicken-liver-chunks-in-gravy-for-adult-dogs-pack-of-15.jpg'),
(71, 9, 'Testing', '2', 'This is for testing.', 200, '2OrderConfirm', '2OrderConfirm.jpg'),
(72, 9, 'Testing Testing', '2 kg', 'This is for checking.', 200, '6OrderConfirm', '6OrderConfirm.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `shopkeepermst`
--

CREATE TABLE `shopkeepermst` (
  `skid` int(11) NOT NULL,
  `skname` varchar(255) NOT NULL,
  `skphone` varchar(15) NOT NULL,
  `skaddress` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `shopkeepermst`
--

INSERT INTO `shopkeepermst` (`skid`, `skname`, `skphone`, `skaddress`) VALUES
(1, 'Patel', '1234657980', 'This is for testing');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cartid`);

--
-- Indexes for table `categorymst`
--
ALTER TABLE `categorymst`
  ADD PRIMARY KEY (`categoryid`);

--
-- Indexes for table `customermst`
--
ALTER TABLE `customermst`
  ADD PRIMARY KEY (`cid`);

--
-- Indexes for table `deliveryperson`
--
ALTER TABLE `deliveryperson`
  ADD PRIMARY KEY (`dpid`);

--
-- Indexes for table `offers`
--
ALTER TABLE `offers`
  ADD PRIMARY KEY (`offerid`),
  ADD KEY `productid` (`productid`);

--
-- Indexes for table `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD PRIMARY KEY (`orderdetailid`,`productid`) USING BTREE,
  ADD KEY `productid_fk` (`productid`) USING BTREE;

--
-- Indexes for table `ordermst`
--
ALTER TABLE `ordermst`
  ADD PRIMARY KEY (`ordernumber`),
  ADD KEY `cid` (`cid`),
  ADD KEY `orderdetails_ID_FK` (`orderdetails_ID`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`paymentid`),
  ADD KEY `orderdetailid` (`orderdetailid`),
  ADD KEY `cid` (`cid`);

--
-- Indexes for table `productmst`
--
ALTER TABLE `productmst`
  ADD PRIMARY KEY (`productid`),
  ADD KEY `categoryid` (`categoryid`);

--
-- Indexes for table `shopkeepermst`
--
ALTER TABLE `shopkeepermst`
  ADD PRIMARY KEY (`skid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `cartid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT for table `categorymst`
--
ALTER TABLE `categorymst`
  MODIFY `categoryid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `customermst`
--
ALTER TABLE `customermst`
  MODIFY `cid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `deliveryperson`
--
ALTER TABLE `deliveryperson`
  MODIFY `dpid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `offers`
--
ALTER TABLE `offers`
  MODIFY `offerid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `ordermst`
--
ALTER TABLE `ordermst`
  MODIFY `ordernumber` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `paymentid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `productmst`
--
ALTER TABLE `productmst`
  MODIFY `productid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `shopkeepermst`
--
ALTER TABLE `shopkeepermst`
  MODIFY `skid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `offers`
--
ALTER TABLE `offers`
  ADD CONSTRAINT `offers_ibfk_1` FOREIGN KEY (`productid`) REFERENCES `productmst` (`productid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ordermst`
--
ALTER TABLE `ordermst`
  ADD CONSTRAINT `orderdetails_ID_FK` FOREIGN KEY (`orderdetails_ID`) REFERENCES `orderdetails` (`orderdetailid`),
  ADD CONSTRAINT `ordermst_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `customermst` (`cid`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`orderdetailid`) REFERENCES `orderdetails` (`orderdetailid`),
  ADD CONSTRAINT `payment_ibfk_2` FOREIGN KEY (`cid`) REFERENCES `customermst` (`cid`);

--
-- Constraints for table `productmst`
--
ALTER TABLE `productmst`
  ADD CONSTRAINT `productmst_ibfk_1` FOREIGN KEY (`categoryid`) REFERENCES `categorymst` (`categoryid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
