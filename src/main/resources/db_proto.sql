/*
SQLyog Community v13.2.0 (64 bit)
MySQL - 10.4.28-MariaDB : Database - proto
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`proto` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `proto`;

/*Table structure for table `answer` */

DROP TABLE IF EXISTS `answer`;

CREATE TABLE `answer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question_id` int(11) DEFAULT NULL,
  `author_id` bigint(20) DEFAULT NULL,
  `create_date` datetime(6) DEFAULT NULL,
  `modify_date` datetime(6) DEFAULT NULL,
  `content` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1bs3s37kp8qthx9vwrphr0epu` (`author_id`),
  KEY `FK8frr4bcabmmeyyu60qt7iiblo` (`question_id`),
  CONSTRAINT `FK1bs3s37kp8qthx9vwrphr0epu` FOREIGN KEY (`author_id`) REFERENCES `site_user` (`id`),
  CONSTRAINT `FK8frr4bcabmmeyyu60qt7iiblo` FOREIGN KEY (`question_id`) REFERENCES `question` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `answer` */

/*Table structure for table `answer_voter` */

DROP TABLE IF EXISTS `answer_voter`;

CREATE TABLE `answer_voter` (
  `answer_id` int(11) NOT NULL,
  `voter_id` bigint(20) NOT NULL,
  PRIMARY KEY (`answer_id`,`voter_id`),
  KEY `FKl11k2qjfyl8hrvh5am4obsolt` (`voter_id`),
  CONSTRAINT `FKba6wmkj74k29bxm7877w4u6g5` FOREIGN KEY (`answer_id`) REFERENCES `answer` (`id`),
  CONSTRAINT `FKl11k2qjfyl8hrvh5am4obsolt` FOREIGN KEY (`voter_id`) REFERENCES `site_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `answer_voter` */

/*Table structure for table `festival` */

DROP TABLE IF EXISTS `festival`;

CREATE TABLE `festival` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(100) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `classification` varchar(255) DEFAULT NULL,
  `event_period` varchar(255) DEFAULT NULL,
  `inquiry_call` varchar(255) DEFAULT NULL,
  `picture` varchar(255) DEFAULT NULL,
  `region` varchar(255) DEFAULT NULL,
  `site_link` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `festival` */

insert  into `festival`(`id`,`address`,`title`,`classification`,`event_period`,`inquiry_call`,`picture`,`region`,`site_link`) values 
(1,'난지한강공원','서울뮤직페스티벌','문화예술','10.20~10.22','02-2133-2570','https://news.seoul.go.kr/culture/files/2023/08/64eecc9b29aa33.08231620.gif','서울','https://www.seoulmusicfestival.co.kr/kor/index.php'),
(2,'한강 수상 및 11개 한강공원 일대','2023 한강페스티벌','문화예술','봄(5.12.~5.14.),여름(7.28.~8.13.),가을(10.14.~10.21.),겨울(12.1.~12.25.)','02-3780-0718','https://festival.seoul.go.kr/wp-content/themes/festival/page-templates/project/2023/assets/images/fb-pic1.jpg','서울','https://festival.seoul.go.kr/hangang'),
(3,'석촌호수','2023 석촌호수의 가을과 겨울, 그리고 루미나리에','문화예술','10.27.~12.31.(예정)','02-2147-2111','https://korean.visitkorea.or.kr/kfes/upload/contents/db/1852e51d-5c6b-465b-ad7f-bcb72ad556a6_1.jpg','서울','https://www.songpa.go.kr/culture/detailInfo.do?key=3796&resrceCd=CT0155-1030773&'),
(4,'잠실 롯데월드타워 잔디광장','2023 커피 페스티벌','문화예술','10.7.~10.8.(예정)','02-2147-2116','https://cdn.imweb.me/thumbnail/20230905/caa625ed35863.jpg','서울','https://youthcoffee.co.kr/'),
(5,'열린송현녹지광장, 서울도시건축전시관, 서울시청(시민청)','제4회 2023서울도시건축비엔날레','문화예술','09.01.~10.29.','02-2133-7616','https://www.masilwide.com/wp-content/uploads/05d10b961f2e4d37b0fc15a3e5c160ef-scaled.jpg','서울','https://www.seoulbiennale.org/2023/overview'),
(6,'서울도시건축전시관 등','2023 제15회 서울건축문화제','문화예술','09.01.~09.30.(예정)','02-2133-7622','https://static.wixstatic.com/media/e03900_eb6f66fc44274f649bce190af7b9d098~mv2.jpg/v1/fill/w_640,h_906,al_c,q_85,usm_0.66_1.00_0.01,enc_auto/e03900_eb6f66fc44274f649bce190af7b9d098~mv2.jpg','서울','http://saf.kr/'),
(7,'광화문광장','종로한복축제','전통역사','09.22.~09.23.','02-2148-1803','https://jongnohanbok.kr/site/main/file/image/3756','서울','https://jongnohanbok.kr/site/main/home'),
(8,'자문밖 일대','자문밖 문화축제','문화예술','09.09.~09.11.','02-2148-1804','http://jmbforum.org/wp-content/uploads/2023/06/%ED%91%9C%EC%A7%80.png','서울','http://jmbforum.org/%EC%9E%90%EB%AC%B8%EB%B0%96%EB%AC%B8%ED%99%94%EC%B6%95%EC%A0%9C/'),
(9,'인사동 일대','인사동 엔틱 & 아트페어','전통역사','08.~10.','02-2148-1805','https://cdn.visitkorea.or.kr/img/call?cmd=VIEW&id=ed7a8bbd-d851-43ae-8d20-69b39d1c2db6','서울','https://korean.visitkorea.or.kr/detail/fes_detail.do?cotid=63248583-4f3b-4578-929c-1630cbe416a0'),
(10,'광안리해수욕장 일원','부산불꽃축제','문화예술','10월중','051-888-5222','http://www.bfo.or.kr/SE/upload/%EC%9D%BC%EA%B4%84%ED%8E%B8%EC%A7%91_%EC%98%88%EC%8A%A424%EC%83%81%EC%84%B8%ED%8E%98%EC%9D%B4%EC%A7%80(0907).png','부산','http://www.bfo.or.kr/festival/info/03.asp?MENUDIV=3'),
(11,'중구 용두산공원','시민의 종 타종식','문화예술','12.31.','051-888-5224','https://i.ytimg.com/vi/JQLCqK4DCvE/maxresdefault.jpg','부산','http://www.bfo.or.kr/festival_sun/info/01.asp?MENUDIV=1'),
(12,'해운대해수욕장','해운대북극곰축제','생태자연','12월중','051-888-5221','http://img.raceplan.co.kr/data/202211/29/73594ca04e35981130bf4da06f4980301891.jpg','부산','http://bear.busan.com/'),
(13,'자갈치시장 일원 등','부산자갈치축제','지역특산물','10.14.~10.17.','051-600-4085','https://localsegye.co.kr/news/data/20160922/p1065604835471901_994_thum.JPG','부산','http://www.ejagalchi.com/'),
(14,'송도해수욕장','부산고등어축제','지역특산물','10.27.~10.29.','051-240-4062','https://korean.visitkorea.or.kr/kfes/upload/contents/db/400_7dc66e92-681b-4795-a2bb-a8fe0ff5e346_2.jpg','부산','https://www.busangde.co.kr/'),
(15,'초량동 차이나타운 일대','차이나타운특구축제','문화예술','10월중','051-440-4062','http://www.bsdonggu.go.kr/upload_data/board_data/BBS_0000214/167212620632253.jpg','부산','http://www.bsdonggu.go.kr/tour/index.donggu?menuCd=DOM_000000304009002002'),
(16,'아미르공원','영도다리축제','문화예술','10.13.~10.15.','051-419-4064','https://korean.visitkorea.or.kr/kfes/upload/contents/db/7f12d188-43f3-4b96-b9cc-0c1be65ebf18_1.jpg','부산','https://www.yeongdo.go.kr/ydfestival.web'),
(17,'아미르공원','영도 커피페스티벌','문화예술','11.3.~11.5.','051-419-6332','https://korean.visitkorea.or.kr/kfes/upload/contents/db/7c1728ce-e80a-4c10-809d-6212a0e38bff_1.jpg','부산','https://www.yeongdo.go.kr/yd_coffee_festival.web'),
(18,'전포카페거리 일원','전포커피축제 (구. 전포카페거리축제)','기타','10월중','051-605-4524','https://www.busanjin.go.kr/images/Culture_/content/jeonpo03.jpg','부산','https://www.busanjin.go.kr/index.busanjin?menuCd=DOM_000001003003006000'),
(19,'코오롱야외음악당','대구포크페스티벌','문화예술','10.6.~10.7.','053-803-3746','https://news.imaeil.com/photos/2018/08/02/2018080215304624631_l.jpg','대구','http://www.dgff.kr/'),
(20,'대구오페라하우스 및 대구일원','대구국제오페라축제','문화예술','10.6.~11.11.','053-803-3792','https://www.daeguoperahouse.org/upload/program/koweb_apply/2.%202023%20%EC%98%A4%ED%8E%98%EB%9D%BC%20%EA%B0%88%EB%9D%BC%EC%BD%98%EC%84%9C%ED%8A%B8%2050%20%EC%8A%A4%ED%83%80%EC%A6%88%20copy.jpg','대구','https://www.daeguoperahouse.org/contents/01_performance/page.html?mid=026027239&mode=view&no=1912'),
(21,'엑스코','대구콘텐츠페어','기타(산업육성)','10.7.~10.8.','053-803-3802','https://www.all-con.co.kr/data/poster/2308/501965.jpg?v=1690936056','대구','https://www.dccf.co.kr/kor/'),
(22,'동화사','팔공산 산중전통장터 승시 축제','전통역사','10월중','053-803-6513','https://www.womennews.co.kr/news/photo/202210/228813_374783_3234.jpg','대구','http://daegudonggu.grandculture.net/daegudonggu/dir/GC40201010?category=%ED%91%9C%EC%A0%9C%EC%96%B4&depth=3&name=%ED%8C%8C&type=titleKor&search=%ED%8C%8C'),
(23,'대구패션주얼리특구 일원','제18회 대구패션주얼리위크','특산물','9월 중','053-661-2647','https://www.fnnews.com/resource/media/image/2023/09/11/202309111405539700_l.jpg','대구','http://www.dgj.kr/~xhome'),
(24,'향촌동 수제화골목','제10회 빨간구두이야기 (수제화축제)','문화예술','10월 중','053-661-2464','https://cdn.kbmaeil.com/news/photo/201810/456769_831103_1357.jpg','대구','http://www.grandculture.net/daegu/toc/GC40004908'),
(25,'서문시장일대','서문시장글로벌대축제','전통역사','10월 중','053-661-2675','https://ilyo.co.kr/contents/article/images/2018/1001/1538379877340440.jpg','대구','http://www.grandculture.net/daegu/donggu/toc/GC40004918'),
(26,'교동시장일대','교동시장한마음축제','전통역사','10월 중','053-661-2675','https://www.kyongbuk.co.kr/news/photo/202210/2114645_551566_5615.jpg','대구','http://www.bbsj.kr/festival/festival_detail.php?fst_idx=86'),
(27,'용유일원','용유 바다축제','지역 전통문화','23년 7.~8월','032-453-7872','https://ijcf.or.kr/_data/bd_board_file/2307241805181.jpg','인천','https://ijcf.or.kr/load.asp?subPage=410.View&category=1&idx=87'),
(28,'인천아트플랫폼','제3회 인천도시재생축제','기타','09.22.~09.23.','032-260-5372','https://cdn.naewoeilbo.com/news/thumbnail/202309/796396_595308_223_v150.jpg','인천','https://festival.iurc.or.kr/default.aspx'),
(29,'인천 개항장 일대','2023 인천개항장문화재야행','문화관광','6월, 10월','032-899-7422','https://www.newsfreezone.com/news/photo/202307/436091_464207_1689643539.jpg','인천','https://www.culturenight.co.kr/'),
(30,'인천문학경기장','제14회 INK콘서트','문화관광','9. 9.','032-899-7425','https://www.focusincheon.com/news/photo/202307/3430_4455_2513.png','인천','https://inkconcert.com/'),
(31,'미정','푸드페스타','문화예술','10월중','062-613-3635','https://tour.gwangju.go.kr/uploads/tour/info/culture/202307110952214730.JPG','광주','https://tour.gwangju.go.kr/home/tour/info/culture/200.cs?act=view&infoId=1386&category=200&searchCondition=&searchKeyword=&pageIndex=1&m=230'),
(32,'미정','2023 광주청년주간','청년축제','9월중','062-613-2721','http://sisatotalnews.com/view_img.php?gimg=202309/12_258161.jpg','광주','http://gjyouthfesta.com/'),
(33,'518민주광장 일원','광주미디어아트페스티벌','문화예술','10.04.~10.09.','062-613-3672','https://gmaf2023.com/img/index/main_sum01.png','광주','https://gmaf2023.com/'),
(34,'5·18민주광장 등 광주시일원','광주프린지페스티벌','문화예술','5~10월','062-613-3182','https://playgwangju.co.kr/data/file/festival/989889322_fscb8vQx_1f0bfa405060c4c24e63a818ee3e4f43b08313be.jpg','광주','http://fringefestival.kr/'),
(35,'중외공원 일대','아트피크닉','문화예술','4~10월','062-613-3433','https://playgwangju.co.kr/data/file/festival/thumb-989889322_2tbKaSOR_00ab31bd6275a5ddf40c5bf55d1e925cc90881d8_445x0.jpg','광주','https://playgwangju.co.kr/bbs/board.php?bo_table=festival&wr_id=553'),
(36,'대인예술시장 일원','대인예술시장','문화예술','3~11월','062-613-3432','http://www.newsggam.com/news/photo/202309/114849_74717_5551.jpg','광주','https://daeinya.imweb.me/'),
(37,'광주광역시일원','제30회 광주세계김치축제','문화예술','11월중','062-613-3992','https://kimchi.gwangju.go.kr/home/www/images/layout/main_visual2023_02.jpg','광주','https://kimchi.gwangju.go.kr/'),
(38,'5․18민주광장, 충장로 등','제20회 광주 추억의 충장축제','문화예술','10.05.~10.09.','062-608-4672','https://korean.visitkorea.or.kr/kfes/upload/contents/db/7d2cf1b1-9e46-470d-bfa9-4e2b8272802b_4.jpg','광주','https://korean.visitkorea.or.kr/kfes/detail/fstvlDetail.do?fstvlCntntsId=7d2cf1b1-9e46-470d-bfa9-4e2b8272802b'),
(39,'5․18민주광장, 충장로 등','2023 광주 버스커즈 월드페스티벌','문화예술','10.01.~10.09.','062-608-4682','https://overseas.mofa.go.kr/upload/se2/cdb6a5b1-8859-4202-9ea0-8471acbf6fc9.jpg','광주','https://www.buskingworldcup.com/kor/'),
(40,'엑스포시민남문광장, DCC, 원도심 일원 등','2023 대전사이언스페스티벌','문화예술','10.19~10.22.','042-270-0312','https://daejeontour.co.kr/upload/atch/festival/20220128105417183.jpg','대전','https://djsf.kr/'),
(41,'샘머리공원 및 보라매공원 일원','2023 대전 서구힐링 아트페스티벌','문화예술','10월','042-288-2742','https://www.seogu.go.kr/thumbnail/crosseditor/images/000005/11111.jpg','대전','https://www.seogu.go.kr/prog/fstvl/tour/sub04_02/14/view.do'),
(42,'뿌리공원 및 원도심 일원','제14회 대전효문화뿌리축제','전통역사','9월~10월 중 (3일간)','042-606-6292','https://cdn.dtnews24.com/news/photo/202309/753783_365616_282.jpg','대전','https://www.djjunggu.go.kr/hyo-ppuri/index.do'),
(43,'온천로일원','2023 유성크리스마스축제','문화예술','12.2.~12.3.','042-611-2080','https://korean.visitkorea.or.kr/kfes/upload/contents/db/400_eaa0bbc4-9ee9-4d02-aa97-47cf64b4d923_2.jpg','대전','http://ysfesta.com/#;'),
(44,'문화예술회관','아시아 퍼시픽 뮤직 페스티벌','문화예술','9월 중','052-229-3753','https://www.ujeil.com/news/photo/201808/212750_73048_442.jpg','울산','http://www.event.re.kr/?p=18249'),
(45,'중구원도심','외솔한글한마당','문화예술','10월 중','052-229-3753','https://cdn.ulsanpress.net/news/photo/202010/362417_149611_1936.jpg','울산','http://www.oesolhangeul.com/'),
(46,'UECO','119안전문화축제','대규모행사','10월 중','052-229-5331','https://fire.ulsan.go.kr/images/contents/festival_220914.jpg','울산','https://fire.ulsan.go.kr/page/festival/schedule.do'),
(47,'태화강 북구 억새군락지','제1회 태화강 억새정원 나들이','생태자연','10월중 (3일간)','052-229-8523','https://i.ytimg.com/vi/EvmjaxLzpgE/maxresdefault.jpg','울산','http://www.ulsan.go.kr/s/garden/main.ulsan'),
(48,'태화강 국가정원','태화강 국가정원 가을축제','문화예술','10.20.~10.22.','052-229-7562','https://cdn.ulsanpress.net/news/photo/202210/407391_187690_5512.jpg','울산','http://www.ulsan.go.kr/s/garden/main.ulsan'),
(49,'중구 원도심 일원','눈꽃축제','주민화합','12월중','052-290-3324','http://www.junggu.ulsan.kr/upload_data/board_data/FESTIVAL/148489915834860.png','울산','http://www.junggu.ulsan.kr/tour/board/view.ulsan;jsessionid=wc3axStIaQLbES9GUqCV7MDbwza9QLf91Q6Gfj0mczS11260n9EjfetBJYihzS4F.web_servlet_engine1?boardId=FESTIVAL&dataSid=512667&menuCd=DOM_000000105002000000&contentsSid=70&cpath=%2Ftour'),
(50,'태화강둔치','태화강 빛 축제','문화예술','10월 중','052-226-5412','https://newsimg-hams.hankookilbo.com/2022/09/19/0fd48c8c-4a9e-445a-806c-9f8e3203a80a.png','울산','http://2023.ulsan-namgu.com/%ED%83%9C%ED%99%94%EA%B0%95-%EB%B9%9B-%EC%B6%95%EC%A0%9C-%EC%95%88%EB%82%B4/'),
(51,'세종호수공원, 중앙공원, 금강보행교','세종축제','기타(문화관광)','10.7.~10.9.','044-300-3442','https://www.sejong.go.kr/images/tour/sub02/sub02_0101_img02.jpg','세종','http://sjfestival.kr/'),
(52,'수원화성','제60회 수원화성문화제','문화예술, 전통역사','10.7.(토)~10.9.(월)','031-228-3068','https://www.swcf.or.kr/inc/img/sub/page86_visual01_2022.jpg','경기','https://www.swcf.or.kr/hlfl/'),
(53,'수원화성','정조대왕 능행차 공동재현','문화예술, 전통역사','10.8.(일)~10.9.(월)','031-228-2367','https://www.swcf.or.kr/hlfl/resources/images/page_56_img01.jpg','경기','https://kingjeongjo-parade.co.kr/'),
(54,'수원화성','세계유산축전 수원화성','문화예술, 전통역사','9.23.(토)~10.14.(토)','031-228-2454','https://www.swcf.or.kr/hlfl/resources/images/page_25_img01.jpg','경기','https://www.swcf.or.kr/hlfl/?p=25'),
(55,'수원화성','수원화성 미디어아트쇼','문화예술, 전통역사','9.16.(토)~10.15.(일)','031-228-3084','https://www.swcf.or.kr/hlfl/resources/images/page_09_img01.jpg','경기','https://www.swcf.or.kr/hlfl/?p=9'),
(56,'미정','성남 e스포츠(SeN) 페스티벌','문화예술','9.9.~9.10.','031-782-3096','https://file.sportsseoul.com/news/legacy/2019/08/25/news/2019082501001745200121871.jpg','경기','https://gxg.world/'),
(57,'일산호수공원 일원','고양호수예술축제','문화예술','10.06~10.09','031-960-9680','http://www.gylaf.kr/theme/basic/img/sub/poster2023.jpg','경기','http://www.gylaf.kr/'),
(58,'봉의산순의비, 공지천 야외무대','소양강문화제','문화예술','9월 중','033-250-3061','http://tourdb.gwd.go.kr/img/1024/additional/2016/01/11/DC0002_I_02.JPG','강원','http://tour.chuncheon.go.kr/contents.do?cid=11c74a6d47754a2cbb8a31329aca644f&categoryId=506&sdbSeq=154&obn=MAIN_TITLE&obt=desc&searchKeyword=&id=0578d3e6f40b4665ad6251d1cdce8c8a'),
(59,'종합운동장 일원','원주삼토페스티벌','전통역사','09.14.~09.17.','033-737-4155','http://www.3to.kr/upload/2023%ED%8F%AC%EC%8A%A4%ED%84%B0.jpg','강원','http://www.3to.kr/'),
(60,'댄싱공연장 일원','2023 원주다이내믹댄싱카니발','문화예술','09.22.~09.24.','033-737-5122','http://www.ddcwj.com/theme/pulgrim/img/poster/2023.jpg','강원','http://www.ddcwj.com/'),
(61,'원주문화원 일원','원주 평생학습 축제','기타(주민화합)','10.06.~10.07.','033-737-3808','https://www.wonju.go.kr/DATA/bbs/5/202308301802059543G1BB11B102122D2.jpg','강원','https://www.wonju.go.kr/www/selectBbsNttView.do?bbsNo=5&key=211&nttNo=423374'),
(62,'강릉시 일원','제15회 강릉 커피축제','문화예술','10.06.~10.09.','033-640-5112','https://coffeefestival.net/images/contents/2023_poster.jpg','강원','https://coffeefestival.net/'),
(63,'중앙공원 및 성안동 일원','청주읍성축제','전통역사','09.08.~09.10.','043-201-2014','http://청주읍성큰잔치.kr/img/intro01.jpg','충북','http://xn--oj4bt5iegj5c8wilzcf9e.kr/'),
(64,'오창읍 미래지농촌테마공원','청원생명축제','특산물','10.06.~10.15','043-201-2132','https://cdn.imweb.me/thumbnail/20230912/19f048c5bef94.jpg','충북','http://cw-life-festival.co.kr/'),
(65,'초정문화공원, 초정행궁 일원','세종대왕과 초정약수축제','전통역사','10.20.~10.22.','043-201-1793','https://korean.visitkorea.or.kr/kfes/upload/contents/db/d86c5d13-6e48-42d9-bb10-68cda235473b_4.JPG','충북','https://korean.visitkorea.or.kr/kfes/detail/fstvlDetail.do?fstvlCntntsId=d86c5d13-6e48-42d9-bb10-68cda235473b'),
(66,'뱃들공원 일원','2023 보은대추축제','특산물','10.13.~10.22.','043-540-3392','http://www.boeunpeople.com/news/photo/202308/64727_66482_2710.jpg','충북','https://boeunjujube.com/'),
(67,'천안종합운동장일원','천안흥타령춤축제 2023','문화관광','10.05.~10.09.','041-521-5173','https://cheonanfestival.com/ko/setting/image/sub/post_2023_2.jpg','충남','https://cheonanfestival.com/ko/index.php'),
(68,'금강신관공원 일원','2023 대백제전','전통역사','09.23.~10.09.','041-840-8112','https://www.baekje.org/kor/img/sub01/story1.png','충남','https://www.baekje.org/kor/html/sub01/010101.html'),
(69,'구룡사 일원','구절산 구절초 축제','생태자연','10.14.~10.15.','041-840-8093','https://cdn.beopbo.com/news/photo/201910/207529_44708_3257.jpg','충남','https://hanok.gongju.go.kr/prog/tursmCn/tour/sub03_01_11/view.do?cntno=133'),
(70,'무창포해수욕장','무창포 대하전어축제','특산물','9월중','041-930-6562','http://moochangpo.com/data/editor/1703/195e18d239e5defbecb6ceca417c60e8_1489319850_6635.jpg','충남','https://www.brcn.go.kr/prog/attraction/tour/sub01_07/view.do?attractionCode=15'),
(71,'보령문화의전당','보령예술제','문화예술','9월중','041-930-3412','https://www.brcn.go.kr/cmm/fms/FILE_000000000130020/getImage.do?atchFileId=FILE_000000000130020&fileSn=0','충남','https://www.brcn.go.kr/prog/cardnews/kor/sub04_13/152/list.do'),
(72,'한국소리문화전당','전주세계소리축제','문화예술','9월 중','063280-3312','https://www.sorifestival.com/2023html/rep_korean/d/images/poster00.jpg','전북','https://www.sorifestival.com/'),
(73,'내항 및 째보선창 일원','군산 수제맥주 & 블루스 페스티벌','문화예술, 특산물','6~9월 중','063-454-5252','https://static.wixstatic.com/media/cfd8e3_fa66d5e09ac64406a2eaa99a531ce249~mv2.png/v1/fill/w_600,h_848,al_c,lg_1,q_90/cfd8e3_fa66d5e09ac64406a2eaa99a531ce249~mv2.png','전북','http://gunsanbnbfesta.co.kr/'),
(74,'예술의전당 등','제55회 진포예술제','문화예술','10.01~10.05','063-454-3282','https://uprbank.gunsan.go.kr/photo/201310/result_20130900110924253_23.jpg','전북','https://www.gunsan.go.kr/tour/m2101/view/306503?#next'),
(75,'시간여행마을권역 구시청광장','제11회 군산시간여행축제','전통역사, 문화예술','10월 중','063-454-3304','https://festival.gunsan.go.kr/upload/imageDir/230621027303.jpg','전북','https://festival.gunsan.go.kr/'),
(76,'금마면 서동공원','2023 익산서동축제','문화예술','10월 중','063-859-5826','https://seodong.iksan.go.kr/main/img/sub/23A1000_01.jpg','전북','https://seodong.iksan.go.kr/main/inner.php?sMenu=main&pre_url=https%3A%2F%2Fwww.google.com%2F'),
(77,'중앙체육공원','제20회 익산 천만송이 국화축제','생태자연','10월 중','063-859-4977','https://www.iksan.go.kr/upload_data/board_data/BBS_0000111/169164908515453.jpg','전북','https://www.iksan.go.kr/gukhwa/index.iksan'),
(78,'진도~해남 울돌목일원','2023 명량대첩축제','전통역사','09.08.~09.10.','061-286-5261','http://www.mldc.kr/web/theme/2018/img/sub011_2023b.png','전남','http://www.mldc.kr/web/'),
(79,'여수세계박람회장','2023 국제남도음식문화큰잔치','특산물','10.06.~10.8.','061-286-5771','https://www.namdofood.or.kr/img_up/shop_pds/appkorea135/build/option/chuk-je-gae-yo_-po-seu-teo1692339138.jpg','전남','https://www.namdofood.or.kr/'),
(80,'소라면 장척마을 일원','여수여자만갯벌노을체험행사','생태자연','9월 중','061-659-4744','https://www.contestkorea.com/admincenter/files/meet/202309071115431767821.jpg','전남','https://www.yeosu.go.kr/tour/culture_festa/yeojaman'),
(81,'제주시 일원','2023 제주레저힐링축제','문화예술','9월 말~10월 중','064-728-2757','https://www.jejusi.go.kr/storage/files/event/20230810/1691648893353_e876b76ae02f47648431826bac8fa141.png','제주','https://xn--om2bo5au00afdd45kr1q7xu.kr/'),
(82,'중문천제연 폭포 주차장','2023 중문칠선녀축제','기타(주민화합 등)','11월 중(2일)','064-760-4824','https://www.gjcnews.com/imgdata/gjfnews_org/201810/2018102203266507.jpg','제주','https://www.seogwipo.go.kr/festivals/sevenbeauty/index.htm'),
(83,'애월읍 새별오름','2023년 애월읍 농수축박람회','기타(주민화합 등)','11월 중','064-728-8817','https://i.ytimg.com/vi/B-V6he_BaOQ/maxresdefault.jpg','제주','https://www.jejusi.go.kr/town/aewol/farmFair/intro.do'),
(84,'산지천 일대','제13회 산지천 축제','문화예술','9월 중','064-728-4655','https://www.jejusi.go.kr/storage/preview/board/202309/413bfb4904514cf094b1f02637a5bbdd.files/BIN0001.jpg','제주','https://www.jejusi.go.kr/news/notice/culture.do?mode=detail&festival_id=758&currentPageNo=1'),
(85,'추자항 일원','제15회 추자도 참굴비 대축제','특산물','9월 중(예정)','064-710-3297','https://www.jejusi.go.kr/storage/files/event/20230816/1692172018572_d3f479beab8d4181885c66bb56b7a271.png','제주','https://www.jejusi.go.kr/news/areaNews.do?mode=detail&notice_id=d219e18ced6d482d88ee9e6f46d87cfb&currentPageNo=1'),
(86,'제주해녀박물관 등 도 일원','제16회 제주해녀축제','문화예술','9.22.~9.24','064-710-3982','https://api.cdn.visitjeju.net/photomng/imgpath/202207/19/bba7334f-78c9-4870-b6ff-6437ed42bcd1.png','제주','https://www.visitjeju.net/kr/detail/view?contentsid=CNTS_000000000022292'),
(87,'서귀포시 일원','제29회 서귀포칠십리축제','문화예술','10.13.~10.15.(예정)','064-760-3942','https://api.cdn.visitjeju.net/photomng/imgpath/201807/04/a607ca07-8ec5-4fff-8559-24f006a363a4.jpg','제주','https://www.visitjeju.net/kr/detail/view?contentsid=CNTS_000000000019645');

/*Table structure for table `question` */

DROP TABLE IF EXISTS `question`;

CREATE TABLE `question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author_id` bigint(20) DEFAULT NULL,
  `create_date` datetime(6) DEFAULT NULL,
  `modify_date` datetime(6) DEFAULT NULL,
  `subject` varchar(200) DEFAULT NULL,
  `content` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKol558tt304fpmksa6mgxrkyg3` (`author_id`),
  CONSTRAINT `FKol558tt304fpmksa6mgxrkyg3` FOREIGN KEY (`author_id`) REFERENCES `site_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `question` */

/*Table structure for table `question_voter` */

DROP TABLE IF EXISTS `question_voter`;

CREATE TABLE `question_voter` (
  `question_id` int(11) NOT NULL,
  `voter_id` bigint(20) NOT NULL,
  PRIMARY KEY (`question_id`,`voter_id`),
  KEY `FK34r3f5alcto5kqkb271n680wj` (`voter_id`),
  CONSTRAINT `FK15y97p03ye4pku04x3nlvush2` FOREIGN KEY (`question_id`) REFERENCES `question` (`id`),
  CONSTRAINT `FK34r3f5alcto5kqkb271n680wj` FOREIGN KEY (`voter_id`) REFERENCES `site_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `question_voter` */

/*Table structure for table `site_user` */

DROP TABLE IF EXISTS `site_user`;

CREATE TABLE `site_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `birthdate` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `nickname` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `telecom` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_8vlkw482t3gpnebxcm03ywk9p` (`email`),
  UNIQUE KEY `UK_8907494besqu376vcikc4w9kf` (`nickname`),
  UNIQUE KEY `UK_p7krqvqpd4eah3fo9ofxo0mwf` (`phone`),
  UNIQUE KEY `UK_jerlw3g2urnh55wcrm2b5kqnj` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `site_user` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
