/*
Navicat MySQL Data Transfer

Source Server         : admin
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : cake_db

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2019-11-14 22:33:43
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `address`
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`user_id`  int(11) NULL DEFAULT NULL ,
`receive_name`  varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`pro_id`  int(11) NULL DEFAULT NULL ,
`city_id`  int(11) NULL DEFAULT NULL ,
`home_num`  varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '门牌号' ,
`detail_addr`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详细地址' ,
`phone_num`  varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`email`  varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`best_receive_time`  datetime NULL DEFAULT NULL COMMENT '最佳收货时间' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=4

;

-- ----------------------------
-- Records of address
-- ----------------------------
BEGIN;
INSERT INTO `address` VALUES ('1', '1', 'mz', '3', '6', '117', '南京大学', '15226226624', '233@163.com', null), ('2', '1', '正在', '1', '2', '11', '大学小屋五年内及', '13209656939', 'lisi@163.com', null), ('3', '1', '是否发给那个', '3', '5', 'n12223', '非法干扰你', '11111', '    12', null);
COMMIT;

-- ----------------------------
-- Table structure for `city`
-- ----------------------------
DROP TABLE IF EXISTS `city`;
CREATE TABLE `city` (
`id`  int(11) NOT NULL ,
`pro_id`  int(11) NULL DEFAULT NULL ,
`NAME`  varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_general_ci

;

-- ----------------------------
-- Records of city
-- ----------------------------
BEGIN;
INSERT INTO `city` VALUES ('1', '1', '东城区'), ('2', '1', '西城区'), ('3', '1', '宣武区'), ('4', '1', '崇文区'), ('5', '1', '朝阳区'), ('6', '1', '海淀区'), ('7', '1', '丰台区'), ('8', '1', '石景山区'), ('9', '1', '门头沟区'), ('10', '1', '昌平区'), ('11', '1', '大兴区'), ('12', '1', '怀柔区'), ('13', '1', '密云县'), ('14', '1', '平谷区'), ('15', '1', '顺义区'), ('16', '1', '通州区'), ('17', '1', '延庆县'), ('18', '2', '黄浦区'), ('19', '2', '南市区'), ('20', '2', '卢湾区'), ('21', '2', '徐汇区'), ('22', '2', '长宁区'), ('23', '2', '静安区'), ('24', '2', '普陀区'), ('25', '2', '金山区'), ('26', '2', '闸北区'), ('27', '2', '虹口区'), ('28', '2', '杨浦区'), ('29', '2', '宝山区'), ('30', '2', '闵行区'), ('31', '2', '嘉定区'), ('32', '2', '松江区'), ('33', '2', '浦东新区'), ('34', '2', '青浦县'), ('35', '2', '奉贤县'), ('36', '2', '南汇县'), ('37', '2', '崇明县'), ('38', '3', '和平区'), ('39', '3', '河东区'), ('40', '3', '河西区'), ('41', '3', '河北区'), ('42', '3', '南开区'), ('43', '3', '红桥区'), ('44', '3', '塘沽区'), ('45', '3', '汉沽区'), ('46', '4', '永川市'), ('47', '4', '黔江区'), ('48', '4', '涪陵区'), ('49', '4', '万洲区'), ('50', '5', '哈尔滨'), ('51', '5', '齐齐哈尔'), ('52', '5', '牡丹江'), ('53', '6', '长春'), ('54', '6', '吉林'), ('55', '7', '沈阳'), ('56', '7', '大连'), ('57', '7', '锦州'), ('58', '8', '呼和浩特'), ('59', '8', '包头'), ('60', '9', '银川'), ('61', '10', '乌鲁木齐'), ('62', '11', '西宁'), ('63', '12', '兰州'), ('64', '12', '天水'), ('65', '13', '西安'), ('66', '13', '宝鸡'), ('67', '13', '延安'), ('68', '14', '石家庄'), ('69', '14', '保定'), ('70', '15', '郑州'), ('71', '15', '洛阳'), ('72', '16', '济南'), ('73', '16', '青岛'), ('74', '16', '烟台'), ('75', '17', '太原'), ('76', '17', '大同'), ('77', '18', '武汉'), ('78', '19', '长沙'), ('79', '20', '合肥'), ('80', '20', '芜湖'), ('81', '21', '南京'), ('82', '22', '杭州'), ('83', '23', '南昌'), ('84', '24', '广州'), ('85', '24', '深圳'), ('86', '25', '南宁'), ('87', '26', '福州'), ('88', '26', '厦门'), ('89', '27', '成都'), ('90', '28', '昆明'), ('91', '29', '贵阳'), ('92', '30', '拉萨'), ('93', '31', '海口'), ('94', '31', '三亚'), ('95', '32', '香港'), ('96', '33', '澳门'), ('97', '34', '台北'), ('98', '34', '高雄'), ('99', '34', '台中'), ('100', '34', '台南');
INSERT INTO `city` VALUES ('101', '34', '基隆'), ('102', '34', '新竹'), ('103', '1', '房山区'), ('105', '3', '大港区'), ('106', '3', '东丽区'), ('107', '3', '西青区'), ('108', '3', '津南区'), ('109', '3', '北辰区'), ('110', '3', '武清区'), ('111', '3', '宝坻区'), ('112', '3', '蓟 县'), ('113', '3', '宁河县'), ('114', '3', '静海县'), ('115', '4', '渝中区'), ('116', '4', '大渡口区'), ('117', '4', '江北区'), ('118', '4', '沙坪坝区'), ('119', '4', '九龙坡区'), ('120', '4', '南岸区'), ('121', '4', '北碚区'), ('122', '4', '万盛区'), ('123', '4', '双桥区'), ('124', '4', '渝北区'), ('125', '4', '巴南区'), ('126', '4', '长寿区'), ('127', '5', '鹤岗'), ('128', '5', '双鸭山'), ('129', '5', '鸡西'), ('130', '5', '大庆'), ('131', '5', '伊春'), ('132', '5', '佳木斯'), ('133', '5', '七台河'), ('134', '5', '黑河'), ('135', '5', '绥化'), ('136', '5', '大兴安岭地区'), ('137', '6', '四平'), ('138', '6', '辽源'), ('139', '6', '通化'), ('140', '6', '白山'), ('141', '6', '松原'), ('142', '6', '白城'), ('143', '6', '延边朝鲜族自治州'), ('144', '7', '鞍山'), ('145', '7', '抚顺'), ('146', '7', '本溪'), ('147', '7', '丹东'), ('148', '7', '葫芦岛'), ('149', '7', '营口'), ('150', '7', '盘锦'), ('151', '7', '阜新'), ('152', '7', '辽阳'), ('153', '7', '铁岭'), ('154', '7', '朝阳'), ('155', '8', '乌海'), ('156', '8', '赤峰'), ('157', '8', '通辽'), ('158', '8', '鄂尔多斯'), ('160', '8', '乌兰察布盟'), ('161', '8', '锡林郭勒盟'), ('162', '8', '巴彦淖尔盟'), ('163', '8', '阿拉善盟'), ('164', '8', '兴安盟'), ('165', '9', '石嘴山'), ('166', '9', '吴忠'), ('167', '9', '固原'), ('168', '10', '克拉玛依'), ('169', '10', '吐鲁番地区'), ('170', '10', '哈密地区'), ('171', '10', '和田地区'), ('172', '10', '阿克苏地区'), ('173', '10', '喀什地区'), ('174', '10', '克孜勒苏柯尔克孜自治州'), ('175', '10', '巴音郭楞蒙古自治州'), ('176', '10', '昌吉回族自治州'), ('177', '10', '博尔塔拉蒙古自治州'), ('178', '10', '伊犁哈萨克自治州'), ('179', '11', '海东地区'), ('180', '11', '海北藏族自治州'), ('181', '11', '黄南藏族自治州'), ('182', '11', '海南藏族自治州'), ('183', '11', '果洛藏族自治州'), ('184', '11', '玉树藏族自治州'), ('185', '11', '海西蒙古族藏族自治州'), ('186', '12', '金昌'), ('187', '12', '白银'), ('188', '12', '嘉峪关'), ('189', '12', '武 威 '), ('190', '12', '张掖'), ('191', '12', '平凉'), ('192', '12', '酒泉'), ('193', '12', '庆阳'), ('194', '12', '定西地区'), ('195', '12', '陇南地区'), ('196', '12', '甘南藏族自治州'), ('197', '12', '临夏回族自治州'), ('198', '13', '铜川'), ('199', '13', '咸阳'), ('200', '13', '渭南'), ('201', '13', '汉中'), ('202', '13', '榆林');
INSERT INTO `city` VALUES ('203', '13', '安康'), ('204', '13', '商洛'), ('205', '14', '唐山'), ('206', '14', '秦皇岛'), ('207', '14', '邯郸'), ('208', '14', '邢台'), ('209', '14', '张家口'), ('210', '14', '承德'), ('211', '14', '沧州'), ('212', '14', '廊坊'), ('213', '14', '衡水'), ('214', '15', '开封'), ('215', '15', '平顶山'), ('216', '15', '焦作'), ('217', '15', '鹤壁'), ('218', '15', '新乡'), ('219', '15', '安阳'), ('220', '15', '濮阳'), ('221', '15', '许昌'), ('222', '15', '漯河'), ('223', '15', '三门峡'), ('224', '15', '南阳'), ('225', '15', '商丘'), ('226', '15', '信阳'), ('227', '15', '周口'), ('228', '15', '驻马店'), ('229', '16', '淄博'), ('230', '16', '枣庄'), ('231', '16', '东营'), ('232', '16', '潍坊'), ('233', '16', '威海'), ('234', '16', '济宁'), ('235', '16', '泰安'), ('236', '16', '日照'), ('237', '16', '莱芜'), ('238', '16', '德州'), ('239', '16', '临沂'), ('240', '16', '聊城'), ('241', '16', '滨州'), ('242', '16', '菏泽'), ('243', '17', '朔州'), ('244', '17', '阳泉'), ('245', '17', '长治'), ('246', '17', '晋城'), ('247', '17', '忻州'), ('248', '17', '晋中'), ('249', '17', '临汾'), ('250', '17', '运城'), ('251', '17', '吕梁地区'), ('252', '18', '黄石'), ('253', '18', '襄樊'), ('254', '18', '十堰'), ('255', '18', '荆州'), ('256', '18', '宜昌'), ('257', '18', '荆门'), ('258', '18', '鄂州'), ('259', '18', '孝感'), ('260', '18', '黄冈'), ('261', '18', '咸宁'), ('262', '18', '随州'), ('263', '18', '恩施土家族苗族自治州'), ('264', '19', '株洲'), ('265', '19', '湘潭'), ('266', '19', '衡阳'), ('267', '19', '邵阳'), ('268', '19', '岳阳'), ('269', '19', '常德'), ('270', '19', '张家界'), ('271', '19', '益阳'), ('272', '19', '郴州'), ('273', '19', '永州'), ('274', '19', '怀化'), ('275', '19', '娄底'), ('276', '19', '湘西土家族苗族自治州'), ('277', '20', '蚌埠'), ('278', '20', '淮南'), ('279', '20', '马鞍山'), ('280', '20', '淮北'), ('281', '20', '铜陵'), ('282', '20', '安庆'), ('283', '20', '黄山'), ('284', '20', '滁州'), ('285', '20', '阜阳'), ('286', '20', '宿州'), ('287', '20', '巢湖'), ('288', '20', '六安'), ('289', '20', '亳州'), ('290', '20', '池州'), ('291', '20', '宣城'), ('292', '21', '徐州'), ('293', '21', '连云港'), ('294', '21', '淮安'), ('295', '21', '宿迁'), ('296', '21', '盐城'), ('297', '21', '扬州'), ('298', '21', '泰州'), ('299', '21', '南通'), ('300', '21', '镇江'), ('301', '21', '常州'), ('302', '21', '无锡');
INSERT INTO `city` VALUES ('303', '21', '苏州'), ('304', '22', '宁波'), ('305', '22', '温州'), ('306', '22', '嘉兴'), ('307', '22', '湖州'), ('308', '22', '绍兴'), ('309', '22', '金华'), ('310', '22', '衢州'), ('311', '22', '舟山'), ('312', '22', '台州'), ('313', '22', '丽水'), ('314', '23', '景德镇'), ('315', '23', '萍乡'), ('316', '23', '新余'), ('317', '23', '九江'), ('318', '23', '鹰潭'), ('319', '23', '赣州'), ('320', '23', '吉安'), ('321', '23', '宜春'), ('322', '23', '抚州'), ('323', '23', '上饶'), ('324', '24', '珠海'), ('325', '24', '汕头'), ('326', '24', '韶关'), ('327', '24', '河源'), ('328', '24', '梅州'), ('329', '24', '惠州'), ('330', '24', '汕尾'), ('331', '24', '东莞'), ('332', '24', '中山'), ('333', '24', '江门'), ('334', '24', '佛山'), ('335', '24', '阳江'), ('336', '24', '湛江'), ('337', '24', '茂名'), ('338', '24', '肇庆'), ('339', '24', '清远'), ('340', '24', '潮州'), ('341', '24', '揭阳'), ('342', '24', '云浮'), ('343', '25', '柳州'), ('344', '25', '桂林'), ('345', '25', '梧州'), ('346', '25', '北海'), ('347', '25', '防城港'), ('348', '25', '钦州'), ('349', '25', '贵港'), ('350', '25', '玉林'), ('351', '25', '百色'), ('352', '25', '贺州'), ('353', '25', '河池'), ('354', '25', '来宾'), ('355', '25', '崇左'), ('356', '26', '三明'), ('357', '26', '莆田'), ('358', '26', '泉州'), ('359', '26', '漳州'), ('360', '26', '南平'), ('361', '26', '龙岩'), ('362', '26', '宁德'), ('363', '27', '自贡'), ('364', '27', '攀枝花'), ('365', '27', '泸州'), ('366', '27', '德阳'), ('367', '27', '绵阳'), ('368', '27', '广元'), ('369', '27', '遂宁'), ('370', '27', '内江'), ('371', '27', '乐山'), ('372', '27', '南充'), ('373', '27', '宜宾'), ('374', '27', '广安'), ('375', '27', '达州'), ('376', '27', '巴中'), ('377', '27', '雅安'), ('378', '27', '眉山'), ('379', '27', '资阳'), ('380', '27', '阿坝藏族羌族自治州'), ('381', '27', '甘孜藏族自治州'), ('382', '27', '凉山彝族自治州'), ('383', '28', '曲靖'), ('384', '28', '玉溪'), ('385', '28', '保山'), ('386', '28', '昭通'), ('387', '28', '思茅地区'), ('388', '28', '临沧地区'), ('389', '28', '丽江'), ('390', '28', '文山壮族苗族自治州'), ('391', '28', '红河哈尼族彝族自治州'), ('392', '28', '西双版纳傣族自治州'), ('393', '28', '楚雄彝族自治州'), ('394', '28', '大理白族自治州'), ('395', '28', '德宏傣族景颇族自治州'), ('396', '28', '怒江傈傈族自治州'), ('397', '28', '迪庆藏族自治州'), ('398', '29', '六盘水'), ('399', '29', '遵义'), ('400', '29', '安顺'), ('401', '29', '铜仁地区'), ('402', '29', '毕节地区');
INSERT INTO `city` VALUES ('403', '29', '黔西南布依族苗族自治州'), ('404', '29', '黔东南苗族侗族自治州'), ('405', '29', '黔南布依族苗族自治州'), ('406', '30', '那曲地区'), ('407', '30', '昌都地区'), ('408', '30', '山南地区'), ('409', '30', '日喀则地区'), ('410', '30', '阿里地区'), ('411', '30', '林芝地区'), ('412', '20', '蒙城'), ('413', '20', '宁国'), ('414', '20', '桐城'), ('415', '26', '福清'), ('416', '26', '建瓯'), ('417', '26', '晋江'), ('418', '26', '南安'), ('419', '26', '邵武'), ('420', '26', '石狮'), ('421', '26', '仙游'), ('422', '12', '嘉峪'), ('423', '12', '武威'), ('424', '24', '花都'), ('425', '24', '开平'), ('426', '24', '南海'), ('427', '24', '顺德'), ('428', '24', '台山'), ('429', '24', '增城'), ('431', '24', '市梅'), ('432', '29', '都匀'), ('433', '29', '贵恙'), ('434', '29', '凯里'), ('435', '29', '铜仁'), ('436', '14', '霸州'), ('437', '14', '青县'), ('438', '14', '任丘'), ('439', '14', '涿州'), ('440', '18', '安陆'), ('441', '18', '恩施'), ('442', '18', '汉口'), ('443', '18', '汉阳'), ('444', '18', '潜江'), ('445', '18', '仙桃'), ('446', '18', '株州'), ('447', '19', '株州'), ('448', '19', '邵东'), ('449', '6', '高新'), ('450', '6', '延吉'), ('451', '6', '梅河口'), ('452', '21', '常熟'), ('453', '21', '丹阳'), ('454', '21', '海门'), ('455', '21', '江都'), ('456', '21', '江阴'), ('457', '21', '靖江'), ('458', '21', '昆山'), ('459', '21', '溧阳'), ('460', '21', '太仓'), ('461', '21', '泰州华'), ('462', '21', '吴江'), ('463', '21', '吴县'), ('464', '21', '宜兴'), ('465', '21', '张家港'), ('466', '23', '高安'), ('467', '7', '瓦房店'), ('468', '8', '巴彦淖尔'), ('469', '8', '呼伦贝尔'), ('470', '8', '集宁'), ('471', '8', '乌兰浩特'), ('472', '8', '锡林浩特'), ('473', '11', '格尔木'), ('474', '16', '高密'), ('475', '16', '荷泽'), ('476', '16', '淮坊'), ('477', '16', '即墨'), ('478', '16', '胶南'), ('479', '16', '莱州'), ('480', '16', '林沂'), ('481', '16', '临忻'), ('482', '16', '龙口'), ('483', '16', '蓬莱'), ('484', '16', '青州'), ('485', '16', '乳山'), ('486', '16', '寿光'), ('487', '16', '滕州'), ('488', '16', '文登'), ('489', '16', '招远'), ('491', '17', '河津'), ('492', '17', '侯马'), ('494', '17', '孝义'), ('495', '17', '榆次'), ('496', '13', '韩城'), ('497', '27', '广汉'), ('498', '27', '锦阳'), ('499', '27', '西昌'), ('500', '10', '阿克苏'), ('501', '10', '昌吉'), ('502', '10', '哈密'), ('503', '10', '和田'), ('504', '10', '喀什'), ('505', '10', '克拉马依');
INSERT INTO `city` VALUES ('506', '10', '库尔勒'), ('507', '10', '石河子'), ('508', '10', '吐鲁番'), ('509', '10', '乌市'), ('510', '10', '奎屯'), ('511', '10', '伊犁'), ('512', '10', '伊宁'), ('513', '28', '大理'), ('514', '22', '慈溪'), ('515', '22', '东阳'), ('516', '22', '奉化'), ('517', '22', '乐清'), ('518', '22', '临安'), ('519', '22', '临海'), ('520', '22', '平湖'), ('521', '22', '瑞安'), ('522', '22', '上虞'), ('523', '22', '嵊州'), ('524', '22', '温岭'), ('525', '22', '义乌'), ('526', '22', '永康'), ('527', '22', '余姚'), ('528', '22', '诸暨'), ('529', '22', '新昌');
COMMIT;

-- ----------------------------
-- Table structure for `comment`
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`user_id`  int(11) NULL DEFAULT NULL ,
`product_id`  int(11) NULL DEFAULT NULL ,
`spec_id`  int(11) NULL DEFAULT NULL COMMENT '规格ID' ,
`comment`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评论内容' ,
`comment_date`  datetime NULL DEFAULT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=14

;

-- ----------------------------
-- Records of comment
-- ----------------------------
BEGIN;
INSERT INTO `comment` VALUES ('1', '1', '1', '1', '蛋糕口味不错，还有，IG牛逼', '2018-11-14 15:14:00'), ('2', '2', '1', '1', '蛋糕口味不错，还有，牛逼', '2018-11-06 15:14:04'), ('3', '2', '2', '2', '蛋糕口味不错，还有，EDG牛逼', '2018-11-04 15:14:08'), ('4', '4', '4', '3', '蛋糕口味不错，还有，WE牛逼', '2018-11-02 15:14:12'), ('5', '5', '5', '4', '蛋糕口味不错，还有，QWE牛逼', '2018-11-03 15:14:17'), ('6', '1', '1', '2', '蛋糕口味不错，还有，QWE牛逼', '2018-11-01 17:12:06'), ('7', '1', '1', '1', '蛋糕口味不错，还有，QWE牛逼', '2018-11-19 17:12:38'), ('8', '1', '1', '1', '蛋糕口味不错，还有，QWE牛逼', '2018-11-04 17:12:51'), ('9', '1', '1', '1', '蛋糕口味不错，还有，QWE牛逼', '2018-11-10 17:12:59'), ('10', '1', '1', '1', '蛋糕口味不错，还有，QWE牛逼', '2018-11-17 17:13:07'), ('11', '1', '1', '1', '蛋糕口味不错，还有，QWE牛逼', '2018-11-20 17:13:17'), ('12', '1', '1', '1', '蛋糕口味不错，还有，QWE牛逼', '2018-11-15 17:13:26'), ('13', '1', '1', '1', '蛋糕口味不错，还有，QWE牛逼', '2018-11-08 17:13:36');
COMMIT;

-- ----------------------------
-- Table structure for `express`
-- ----------------------------
DROP TABLE IF EXISTS `express`;
CREATE TABLE `express` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`name`  varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`price`  double(6,2) NULL DEFAULT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=3

;

-- ----------------------------
-- Records of express
-- ----------------------------
BEGIN;
INSERT INTO `express` VALUES ('1', '顺丰', '10.00'), ('2', '急宅送', '13.00');
COMMIT;

-- ----------------------------
-- Table structure for `gift`
-- ----------------------------
DROP TABLE IF EXISTS `gift`;
CREATE TABLE `gift` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`name`  varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`price`  varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`spec`  varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '礼品规格' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of gift
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `order`
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
`id`  int(11) NOT NULL ,
`user_id`  int(11) NULL DEFAULT NULL ,
`addr_id`  int(11) NULL DEFAULT NULL COMMENT '收货地址id' ,
`pay_amount`  decimal(10,2) NULL DEFAULT NULL ,
`pay_channel`  varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付方式' ,
`express_id`  int(11) NULL DEFAULT NULL COMMENT '快递id' ,
`create_time`  datetime NULL DEFAULT NULL ,
`delivery_time`  datetime NULL DEFAULT NULL COMMENT '配送时间' ,
`receipt_information`  varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发票信息' ,
`pay_status`  int(11) NULL DEFAULT 1 COMMENT '支付状态（0:已退款订单,1:待支付订单,2:已支付订单）默认1' ,
`receive_status`  int(11) NULL DEFAULT 1 COMMENT '配送状态(0:取消配送,1:配送中订单,2:已送达) 默认1' ,
`status`  int(11) NULL DEFAULT 1 COMMENT '订单状态(0:失败订单,1:已创建订单,2:已完成订单) 默认1' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Records of order
-- ----------------------------
BEGIN;
INSERT INTO `order` VALUES ('1', '1', '1', '455.55', '支付宝', '1', '2018-11-10 11:42:46', '2018-11-15 11:42:49', '尽快送达', '1', '1', '1');
COMMIT;

-- ----------------------------
-- Table structure for `orderitem`
-- ----------------------------
DROP TABLE IF EXISTS `orderitem`;
CREATE TABLE `orderitem` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`order_id`  int(11) NULL DEFAULT NULL ,
`product_spec_id`  int(11) NULL DEFAULT NULL ,
`product_img`  varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`product_num`  int(11) NULL DEFAULT NULL COMMENT '商品数量' ,
`product_name`  varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`product_id`  int(11) NULL DEFAULT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=3

;

-- ----------------------------
-- Records of orderitem
-- ----------------------------
BEGIN;
INSERT INTO `orderitem` VALUES ('1', null, null, null, '2', null, '1'), ('2', null, null, null, '3', null, '2');
COMMIT;

-- ----------------------------
-- Table structure for `orderzz`
-- ----------------------------
DROP TABLE IF EXISTS `orderzz`;
CREATE TABLE `orderzz` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`user_id`  int(11) NULL DEFAULT NULL ,
`order_item_id`  int(11) NULL DEFAULT NULL ,
`addr_id`  int(11) NULL DEFAULT NULL COMMENT '收货地址id' ,
`pay_amount`  decimal(10,2) NULL DEFAULT NULL ,
`pay_channel`  varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付方式' ,
`express_id`  int(11) NULL DEFAULT NULL COMMENT '快递id' ,
`create_time`  datetime NULL DEFAULT NULL ,
`delivery_time`  datetime NULL DEFAULT NULL COMMENT '配送时间' ,
`receipt_information`  varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发票信息' ,
`integral`  double NULL DEFAULT NULL COMMENT '积分' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=3

;

-- ----------------------------
-- Records of orderzz
-- ----------------------------
BEGIN;
INSERT INTO `orderzz` VALUES ('1', '1', '1', '1', '200.00', '微信', '1', '2018-11-01 16:37:53', '2018-11-03 16:37:57', '123', '200'), ('2', '1', '2', '2', '300.00', '支付宝', '2', '2018-11-08 16:38:30', '2018-11-11 16:38:34', '223', '300');
COMMIT;

-- ----------------------------
-- Table structure for `product`
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
`id`  int(11) NOT NULL AUTO_INCREMENT COMMENT 'id,自增' ,
`name`  varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称' ,
`taste`  varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '口味' ,
`sweet`  int(11) NULL DEFAULT 2 COMMENT '甜度(1,2,3,4) 默认2' ,
`img_url`  varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品显示图片地址' ,
`remark`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注' ,
`default_price`  decimal(8,2) NULL DEFAULT NULL ,
`tage`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`type`  int(11) NULL DEFAULT NULL ,
`com_img_url`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评论图片地址' ,
`ps_id`  int(11) NULL DEFAULT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=44

;

-- ----------------------------
-- Records of product
-- ----------------------------
BEGIN;
INSERT INTO `product` VALUES ('1', '雪域牛乳芝士蛋糕', '雪域口味', '2', 'cakes/list_10800.jpg', '【狂欢派对 甜蜜加倍】2018.11.1-2018.11.25，正价购买蛋糕馆内任意蛋糕，每笔订单赠半价蛋糕券1张（订单配送完成后48小时内到账）。配送时间截至2018.11.26。［闪耀派对 美梦成真］2018.11.1-2018.11.29，购买蛋糕馆内任意蛋糕，每笔订单可9.9元加价购诺心派对礼包（B款）1份，先到先得，不与其他优惠同享。配送时间：2018.11.2-2018.11.30。', '198.00', '人气爆款', '1', '7326931EA586C9165B53A8FEA6E22B53.png', '1'), ('2', '阿尔蒙麦香蛋糕', '慕斯口味', '2', 'cakes/官网原料图-面粉.jpg', null, '198.00', null, '1', '7234271C7C45FCA6B027FFD31D78B853.png', '3'), ('3', '爱·发声蛋糕', '巧克力味蛋糕', '2', 'cakes/list_14905.jpg', null, '258.00', 'HOT', '1', 'aifasheng.png', null), ('4', '草莓拿破仑蛋糕', '鲜果口味', '2', 'cakes/list_10923.jpg', null, '198.00', '+18元升级', '1', 'C289AA2DB3ED585BA4F724FA8C535EAE.png', null), ('5', '草莓千层蛋糕', '奶油口味', '2', 'cakes/list_18735.jpg', null, '218.00', 'NEW', '1', null, null), ('6', '公主蛋糕', '巧克力味蛋糕', '2', 'cakes/list_13664.jpg', null, '218.00', '+18元升级', '1', null, null), ('7', '海盐乳酪芝士蛋糕', '芝士口味', '2', 'cakes/list_10782.jpg', null, '198.00', '+18元升级', '1', null, null), ('8', '和风抹茶红豆蛋糕', '慕斯口味', '2', 'cakes/list_13490.jpg', null, '198.00', '+18元升级', '1', 'FAAA4D4FC907999E74482B1A26DAAB1E.png', null), ('9', '红圆舞蛋糕', '奶油口味', '2', 'cakes/list_18602.jpg', null, '218.00', 'HOT +18元升级', '1', null, null), ('10', '环游世界·秋冬季蛋糕', '慕斯口味', '2', 'cakes/list_12287.jpg', null, '218.00', '人气爆款 +18元升级', '1', null, null), ('11', '辣么巧流心蛋糕', '巧克力味蛋糕', '2', 'cakes/list_15717.jpg', null, '258.00', 'HOT +18元升级', '1', null, null), ('12', '蓝莓拿破仑蛋糕', '鲜果口味', '2', 'cakes/list_12085.jpg', null, '198.00', 'HOT +18元升级', '1', '2AE77DDA75DB0BE5C55A8AF49994443F.png', null), ('13', '栗子千层蛋糕', '奶油口味', '2', 'cakes/list_18684.jpg', null, '218.00', 'NEW', '1', null, null), ('14', '芒果千层拿破仑蛋糕', '鲜果口味', '2', 'cakes/list_12152.jpg', null, '198.00', '+18元升级', '1', null, null), ('15', '芒果心愿盒蛋糕', '鲜果口味', '2', 'cakes/list_12578.jpg', null, '218.00', '+18元升级', '1', null, null), ('16', '玫瑰雪域芝士蛋糕', '芝士口味', '2', 'cakes/list_12244.jpg', null, '218.00', null, '1', null, null), ('17', '莓果缤纷蛋糕', '奶油口味', '2', 'cakes/list_15965.jpg', null, '336.00', 'HOT 198蛋糕卡免差', '1', null, null), ('18', '美刀刀蛋糕', '芝士口味', '2', 'cakes/list_15474.jpg', null, '298.00', '人气爆款', '1', '83AEC27BB63DE1B9B5290F81F6AA2C03.png', null), ('19', '牛乳大理石雪域双拼蛋糕', '雪域口味', '2', 'cakes/list_15411.jpg', null, '198.00', 'HOT', '1', null, null), ('20', '牛乳蓝莓雪域双拼蛋糕', '雪域口味', '2', 'cakes/list_15393.jpg', null, '198.00', 'HOT', '1', null, null), ('21', '怦然心动蛋糕', '奶油口味', '2', 'cakes/list_17113.jpg', null, '198.00', 'NEW', '1', null, null), ('22', '敲敲话·巧克力流心蛋糕', '巧克力味蛋糕', '2', 'cakes/list_16049.jpg', null, '318.00', '298蛋糕卡免差', '1', null, null), ('23', '巧克力四重奏蛋糕', '巧克力味蛋糕', '2', 'cakes/list_10473.jpg', null, '198.00', '+18元升级', '1', null, null), ('24', '巧克力松露蛋糕', '巧克力味蛋糕', '2', 'cakes/list_10648.png', null, '218.00', '+18元升级', '1', null, null), ('25', '实栗派核桃栗蓉蛋糕', '慕斯口味', '2', 'cakes/list_18764.jpg', null, '218.00', 'HOT +18元升级', '1', null, null), ('26', '数字蛋糕（数字6）', '奶油口味', '2', 'cakes/list_16196.jpg', null, '198.00', 'NEW', '1', '886EAF13A321E84BC3E7F71D117B3B50.png', null), ('27', '数字蛋糕520款', '奶油口味', '2', 'cakes/list_16181.jpg', null, '594.00', 'NEW', '1', null, null), ('28', '提拉米苏乐脆蛋糕', '慕斯口味', '2', 'cakes/list_12775.jpg', null, '198.00', '人气爆款 +18元升级', '1', '7440E83E6EF449EB01592C9F8B2060DC.png', null), ('29', '王子蛋糕', '巧克力味蛋糕', '2', 'cakes/list_12486.jpg', null, '218.00', '+18元升级', '1', null, null), ('30', '小甜鬼蛋糕', '巧克力味蛋糕', '2', 'cakes/list_18475.jpg', null, '198.00', 'HOT', '1', '580D09BC59F5FF171573EAB879A6162B.png', null), ('31', '雪域大理石芝士蛋糕', '雪域口味', '2', 'cakes/list_10479.jpg', null, '198.00', 'HOT', '1', null, null), ('32', '雪域蓝莓芝士蛋糕', '雪域口味', '2', 'cakes/list_10491.jpg', null, '198.00', 'HOT', '1', '63375E2D7D39092F96773A2C24158788.png', null), ('33', '原味千层蛋糕', '奶油口味', '2', 'cakes/list_18462.jpg', null, '218.00', '12月底前198蛋糕卡免差', '1', '449CCDC14D1C016252792382D5C9E318.png', null), ('34', '费南雪金砖形礼盒（8枚入）', '特殊商品', '2', 'gifts/list_18263.jpg', null, '128.00', '顺丰物流配送', '2', null, null), ('35', '核桃曲奇礼盒（迷迭紫）', '特殊商品', '2', 'gifts/list_17477.jpg', null, '98.00', null, '2', null, null), ('36', '金砖形费南雪礼盒（18枚入）', '特殊商品', '2', 'gifts/list_17480.jpg', null, '298.00', '顺丰物流配送', '2', null, null), ('37', '浪漫巴黎曲奇礼包（混合装）', '特殊商品', '2', 'gifts/list_17417.jpg', null, '58.00', null, '2', null, null), ('38', '乐熊熊曲奇礼盒', '特殊商品', '2', 'gifts/list_17018.jpg', null, '128.00', null, '2', null, null), ('39', '蔓越莓曲奇礼盒（樱花粉）', '特殊商品', '2', 'gifts/list_17474.jpg', null, '98.00', null, '2', null, null), ('40', '千层蝴蝶酥。ForMe（原味）', '特殊商品', '2', 'gifts/list_13291.jpg', null, '98.00', null, '2', null, null), ('41', '千层蝴蝶酥。拾光礼盒', '特殊商品', '2', 'gifts/list_18819.jpg', null, '168.00', null, '2', null, null), ('42', '千层蝴蝶酥。月影礼盒', '特殊商品', '2', 'gifts/list_18816.jpg', null, '168.00', null, '2', null, null), ('43', '个性字母透明挎包', '特殊商品', '2', 'gifts/list_17633.jpg', null, '68.00', '秀场街拍潮品', '2', null, null);
COMMIT;

-- ----------------------------
-- Table structure for `product_detail_img`
-- ----------------------------
DROP TABLE IF EXISTS `product_detail_img`;
CREATE TABLE `product_detail_img` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`product_id`  int(11) NULL DEFAULT NULL ,
`detail_img_url`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品详情图片地址' ,
`sort`  int(11) NULL DEFAULT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=13

;

-- ----------------------------
-- Records of product_detail_img
-- ----------------------------
BEGIN;
INSERT INTO `product_detail_img` VALUES ('1', '1', 'display_10800_37944.jpg', '1'), ('2', '1', '雪域pc提炼.jpg', '2'), ('3', '1', 'xueyu.mp4', '3'), ('4', '1', 'pc-切分.jpg', '4'), ('5', '1', '奶油1.jpg', '5'), ('6', '1', '白巧克力.jpg', '6'), ('7', '1', '制作材料.png', '7'), ('8', '1', '奶油1.png', '8'), ('9', '1', '白巧克力.png', '9'), ('10', '1', '主要原材料.png', '10'), ('11', '1', '作品简介.png', '11'), ('12', '2', 'display_12253_60343.jpg', '1');
COMMIT;

-- ----------------------------
-- Table structure for `product_spec`
-- ----------------------------
DROP TABLE IF EXISTS `product_spec`;
CREATE TABLE `product_spec` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`product_id`  int(11) NULL DEFAULT NULL ,
`spec_id`  int(11) NULL DEFAULT NULL ,
`price`  decimal(8,2) NULL DEFAULT NULL ,
`stocks`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '库存' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=5

;

-- ----------------------------
-- Records of product_spec
-- ----------------------------
BEGIN;
INSERT INTO `product_spec` VALUES ('1', '1', '1', '198.00', '10'), ('2', '1', '2', '268.00', '10'), ('3', '2', '3', '111.00', '11'), ('4', '2', '2', null, null);
COMMIT;

-- ----------------------------
-- Table structure for `province`
-- ----------------------------
DROP TABLE IF EXISTS `province`;
CREATE TABLE `province` (
`id`  int(11) NOT NULL ,
`name`  varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_general_ci

;

-- ----------------------------
-- Records of province
-- ----------------------------
BEGIN;
INSERT INTO `province` VALUES ('1', '北京'), ('2', '上海'), ('3', '天津'), ('4', '重庆'), ('5', '黑龙江'), ('6', '吉林'), ('7', '辽宁'), ('8', '内蒙古'), ('9', '宁夏'), ('10', '新疆'), ('11', '青海'), ('12', '甘肃'), ('13', '陕西'), ('14', '河北'), ('15', '河南'), ('16', '山东'), ('17', '山西'), ('18', '湖北'), ('19', '湖南'), ('20', '安徽'), ('21', '江苏'), ('22', '浙江'), ('23', '江西'), ('24', '广东'), ('25', '广西'), ('26', '福建'), ('27', '四川'), ('28', '云南'), ('29', '贵州'), ('30', '西藏'), ('31', '海南'), ('32', '香港'), ('33', '澳门'), ('34', '台湾');
COMMIT;

-- ----------------------------
-- Table structure for `specification`
-- ----------------------------
DROP TABLE IF EXISTS `specification`;
CREATE TABLE `specification` (
`id`  int(11) NOT NULL AUTO_INCREMENT COMMENT '规格id' ,
`number_of_eat`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '食用人数' ,
`tableware_num`  varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '餐具数' ,
`length`  double NULL DEFAULT NULL ,
`width`  double NULL DEFAULT NULL ,
`height`  double NULL DEFAULT NULL ,
`weight`  double NULL DEFAULT NULL COMMENT '重量' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=6

;

-- ----------------------------
-- Records of specification
-- ----------------------------
BEGIN;
INSERT INTO `specification` VALUES ('1', '2人食', '含3套餐具', '11', '8', '4', '278'), ('2', '2-4人食', '含5套餐具', '13', '13', '4', '390'), ('3', '5-8人食', '含10套餐具', '17', '17', '4', '700'), ('4', '10-12人食', '含15套餐具', '22', '22', '4', '1060'), ('5', '15-20人食', '含25套餐具', '31', '31', '4', '2100');
COMMIT;

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`account`  varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`email`  varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`phone_num`  varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`password`  varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`sex`  varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`birthday`  date NULL DEFAULT NULL ,
`qq_num`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`addr_id`  int(11) NULL DEFAULT NULL COMMENT '默认地址id' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=9

;

-- ----------------------------
-- Records of user
-- ----------------------------
BEGIN;
INSERT INTO `user` VALUES ('1', '张三', 'zhangsan@163.com', '13369691999', '1234567', null, '2018-11-15', '153623', null), ('8', '李四', null, '13209656939', '123456', null, null, null, null);
COMMIT;

-- ----------------------------
-- Table structure for `user_num_verify`
-- ----------------------------
DROP TABLE IF EXISTS `user_num_verify`;
CREATE TABLE `user_num_verify` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`user_id`  int(11) NULL DEFAULT NULL ,
`num`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`code`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`created_date`  datetime NULL DEFAULT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=5

;

-- ----------------------------
-- Records of user_num_verify
-- ----------------------------
BEGIN;
INSERT INTO `user_num_verify` VALUES ('4', null, '13209656939', '1234', null);
COMMIT;

-- ----------------------------
-- Auto increment value for `address`
-- ----------------------------
ALTER TABLE `address` AUTO_INCREMENT=4;

-- ----------------------------
-- Auto increment value for `comment`
-- ----------------------------
ALTER TABLE `comment` AUTO_INCREMENT=14;

-- ----------------------------
-- Auto increment value for `express`
-- ----------------------------
ALTER TABLE `express` AUTO_INCREMENT=3;

-- ----------------------------
-- Auto increment value for `gift`
-- ----------------------------
ALTER TABLE `gift` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `orderitem`
-- ----------------------------
ALTER TABLE `orderitem` AUTO_INCREMENT=3;

-- ----------------------------
-- Auto increment value for `orderzz`
-- ----------------------------
ALTER TABLE `orderzz` AUTO_INCREMENT=3;

-- ----------------------------
-- Auto increment value for `product`
-- ----------------------------
ALTER TABLE `product` AUTO_INCREMENT=44;

-- ----------------------------
-- Auto increment value for `product_detail_img`
-- ----------------------------
ALTER TABLE `product_detail_img` AUTO_INCREMENT=13;

-- ----------------------------
-- Auto increment value for `product_spec`
-- ----------------------------
ALTER TABLE `product_spec` AUTO_INCREMENT=5;

-- ----------------------------
-- Auto increment value for `specification`
-- ----------------------------
ALTER TABLE `specification` AUTO_INCREMENT=6;

-- ----------------------------
-- Auto increment value for `user`
-- ----------------------------
ALTER TABLE `user` AUTO_INCREMENT=9;

-- ----------------------------
-- Auto increment value for `user_num_verify`
-- ----------------------------
ALTER TABLE `user_num_verify` AUTO_INCREMENT=5;
