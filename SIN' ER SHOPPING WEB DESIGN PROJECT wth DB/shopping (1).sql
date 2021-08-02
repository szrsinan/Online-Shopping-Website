-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 25 May 2021, 12:29:12
-- Sunucu sürümü: 10.4.19-MariaDB
-- PHP Sürümü: 8.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `shopping`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Tablo döküm verisi `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`) VALUES
(1, 'admin', 'e10adc3949ba59abbe56e057f20f883e');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `buy`
--

CREATE TABLE `buy` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` text NOT NULL,
  `email` text NOT NULL,
  `mobile` text NOT NULL,
  `city` text NOT NULL,
  `pincode` int(6) NOT NULL,
  `address` text NOT NULL,
  `booked_time` int(11) NOT NULL,
  `dispatch_time` int(11) NOT NULL,
  `status` text NOT NULL,
  `status_code` int(1) NOT NULL,
  `product_stack` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `active` varchar(1) NOT NULL,
  `buy_id` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Tablo döküm verisi `cart`
--

INSERT INTO `cart` (`id`, `product_id`, `user_id`, `active`, `buy_id`) VALUES
(3, 16, 4, 'n', '1');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `image` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Tablo döküm verisi `category`
--

INSERT INTO `category` (`id`, `name`, `image`) VALUES
(6, 'Technology', 'images/1e42a682b0135d62e4477f6050bb4a57/Ekran Görüntüsü (126).png'),
(15, 'Men s Clothing', 'images/1db175a23bf47f33f23f71a83d5fb2e4/Ekran Görüntüsü (124).png'),
(16, 'Women s Clothing', 'images/aa601bafa39d49b73a311c4875c5a679/Ekran Görüntüsü (125).png');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `offer`
--

CREATE TABLE `offer` (
  `id` int(11) NOT NULL,
  `image` text NOT NULL,
  `link` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Tablo döküm verisi `offer`
--

INSERT INTO `offer` (`id`, `image`, `link`) VALUES
(1, 'images/e4186dc08288e81cb786ff8c04f5fe5a/Ekran Görüntüsü (133).png', 'http://localhost/shopping/category.php?id=6'),
(2, 'images/0565691e3a8f244276c4108bf27a7e8a/bb.jpg', 'http://localhost/shopping/category.php?id=16'),
(3, 'images/9d47134fd1934a1541c391dab1d17b4a/cc.jpg', 'http://localhost/shopping/category.php?id=15');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `name` text NOT NULL,
  `image` text NOT NULL,
  `description` text NOT NULL,
  `mp` varchar(11) NOT NULL,
  `sp` int(11) NOT NULL,
  `off` varchar(255) NOT NULL,
  `shipping` int(11) NOT NULL,
  `tags` text NOT NULL,
  `stock` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Tablo döküm verisi `product`
--

INSERT INTO `product` (`id`, `category_id`, `name`, `image`, `description`, `mp`, `sp`, `off`, `shipping`, `tags`, `stock`) VALUES
(13, 6, 'LENOVO Ideapad 320s-14IKB', 'images/27ac6c4d0df02266f12cf8a65f13a12c/lenova.jpg', 'Top features: \r\n\r\n- Intel&reg; Pentium&trade; processor helps you complete tasks with ease \r\n\r\n- Portable design for easy computing on the move \r\n\r\n- Immersive audio to bring music and videos to life', 'Standart', 250, 'Metallic Gray', 50, 'laptop', 48),
(14, 6, 'ACER Nitro 5 15', 'images/55e0673317b0ab54996d61ecea834471/acer-nitro.jpg', 'Top features: \r\n\r\n- 7th generation processor delivers speed and power \r\n\r\n- Range of ports grant freedom for gaming peripherals \r\n\r\n- NVIDIA GeForce GTX graphics card creates smooth gameplay \r\n\r\n- Dolby Audio Premium adjusts sound for complete immersion \r\n\r\nThe Acer Nitro 5 15.6 Gaming Laptop is part of our Gaming range, which features the most powerful PCs available today. It has superior graphics and processing performance to suit the most demanding gamer.', 'Standard', 400, 'Black-Red', 0, 'laptops', 49),
(15, 6, 'HP Pavilion x360', 'images/d3faa88a0a5d6f43ef9e78215e1860e3/hp.jpg', 'Everyday: All-rounder for work and play\r\nWindows 10\r\nIntel&reg; Pentium&reg; Gold 4415U Processor\r\nRAM: 4 GB / Storage: 128 GB SSD\r\nBattery life: Up to 10.5 hours', 'Standart', 400, '20', 50, 'laptop', 100),
(16, 6, 'DELL Inspiron 5000', 'images/4ce7f644fce06f311960f062eaa6037b/dell.jpg', 'Gaming: Play the latest titles\r\nIntel&reg; Core&trade; i7-7700HQ processor\r\nRAM: 8 GB / Storage: 1 TB HDD, 128 GB SSD\r\nGraphics: NVIDIA GeForce GTX 1050M 4 GB\r\nFull HD display', 'Standard', 500, 'Black', 25, 'laptops', 10),
(25, 6, 'Google Pixel 4a', 'images/aa490b797d2c5678020b9d3e68e80e78/Ekran Görüntüsü (127).png', 'New, unlocked Android phone gives you the flexibility to change carriers and choose your own data plan; works with Verizon, T-Mobile, Sprint, AT&amp;amp;amp;amp;amp;T, and other major carriers.', 'Standart', 350, 'Black', 25, 'Cell phone', 10),
(26, 6, 'Cowin E7 Pro', 'images/0c19cf6030e8cd9a722c7ccb82d312bc/Ekran Görüntüsü (128).png', 'Professional Active Noise Cancelling Technology. Significant noise reduction for travel, work and anywhere in between. Advanced active noise reduction technology quells airplane cabin noise, city traffic or a busy office, makes you focus on what you want to hear, enjoy your music, movies and videos. The noise cancellation function can work well both in wire and wireless mode', 'Standart', 70, 'Black', 10, 'Over ear headphones', 20),
(31, 15, 'Goodthreads Shirt', 'images/daec0e34efb579cd17404fd537ef0e31/Ekran Görüntüsü (129).png', 'Goodthreads men s slim fit short sleeve camp collar Hawaiian shirt. A vibrant print adds tropical appeal to this casual Hawaiian shirt fpr beach our out opf office style. With short sleeves, camp collar, button up front and a straight hem.', 'Meidum', 30, 'Leopard', 5, 'Slim Fit Shirt', 50),
(32, 15, 'Nautica TShirt', 'images/c8c34b46c0966ac4e0ed941fd5e35329/Ekran Görüntüsü (130).png', 'Nautica men s solid crew neck short sleeve pocket tshirt. Casual crew neck styling. One fit. Short sleeves, pocket at chest with Nautica logo', 'Small', 40, 'Noon Blue', 5, 'Crew neck TShirt', 50),
(33, 15, '28 Palms', 'images/b81c33791048ecdb14dc097b8fbbb961/Ekran Görüntüsü (131).png', '28 Plams men s standart fit vintage washed tropical Hawaiian shirt. A vibrant print adds tropical appeal to this standart trim fit aloha sihrt made for beach out of style.', 'Large', 30, 'black tile white', 5, 'Standart Fit Shirt', 75),
(34, 16, 'Dokotoo', 'images/8f9b050d681268d6b5584fed20cfc540/Ekran Görüntüsü (132).png', 'Dokotoo womens spring summer deep v neck ruffle long sleeve floral print mini dress. The ruffles dress is chic and graceful. Showcasing a floral print on a mauve base lightweight fabrication. Designed with a ruffle tiered draped neckline and long baloon sleeves.', 'Medium', 40, 'Sky Blue', 5, 'Deep V Neck Mini Dress', 40);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `fullname` text NOT NULL,
  `email` text NOT NULL,
  `phone` text NOT NULL,
  `password` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Tablo döküm verisi `user`
--

INSERT INTO `user` (`id`, `fullname`, `email`, `phone`, `password`) VALUES
(3, 'Sinan Sezer', 'sinaan.sezer1@gmail.com', '5055528085', 'e10adc3949ba59abbe56e057f20f883e'),
(4, 'erenayan@gmail.com', 'erenayan@gmail.com', '5336169883', 'fcea920f7412b5da7be0cf42b8c93759');

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `buy`
--
ALTER TABLE `buy`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `offer`
--
ALTER TABLE `offer`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Tablo için AUTO_INCREMENT değeri `buy`
--
ALTER TABLE `buy`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Tablo için AUTO_INCREMENT değeri `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Tablo için AUTO_INCREMENT değeri `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Tablo için AUTO_INCREMENT değeri `offer`
--
ALTER TABLE `offer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Tablo için AUTO_INCREMENT değeri `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- Tablo için AUTO_INCREMENT değeri `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
