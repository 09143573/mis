    CREATE TABLE `�豸����` (
    `�豸����ID` int(11) NOT NULL,
    `�豸����` varchar(45) NOT NULL,
    `��������` int(11) NOT NULL,
    `��ǰ��` int(11) NOT NULL,
    `��ע` varchar(45) DEFAULT NULL,
    PRIMARY KEY (`�豸����ID`));
  INSERT INTO `�豸����` VALUES (2,'����Һ�����豸',7,2,'11��20��-4��1��'),(5,'Ͱλ��',30,5,NULL),(16,'��ɸ���',180,7,NULL),(18,'��ĥ��',365,20,NULL);
  CREATE TABLE `�豸` (
    `�豸ID` int(11) NOT NULL,
    `�豸����ID` int(11) NOT NULL,
    `���һ�α���ʱ��` date NOT NULL,
    PRIMARY KEY (`�豸ID`),
    KEY `k1_idx` (`�豸����ID`),
    CONSTRAINT `k1` FOREIGN KEY (`�豸����ID`) REFERENCES `�豸����` (`�豸����ID`) ON DELETE CASCADE ON UPDATE CASCADE);
  INSERT INTO `�豸` VALUES (1,2,'2016-10-11'),(2,5,'2016-10-10'),(3,16,'2016-10-10'),(4,18,'2016-10-09'),(5,2,'2016-10-11');
  CREATE TABLE `������Ŀ` (
    `������ĿID` int(11) NOT NULL,
    `�豸����ID` int(11) NOT NULL,
    `��Ŀ����` varchar(45) NOT NULL,
    PRIMARY KEY (`������ĿID`),
    KEY `k2_idx` (`�豸����ID`),
    CONSTRAINT `k2` FOREIGN KEY (`�豸����ID`) REFERENCES `�豸����` (`�豸����ID`) ON DELETE CASCADE ON UPDATE CASCADE);
  INSERT INTO `������Ŀ` VALUES (1,2,'����Һ����ϵͳ��ŷ��ܷ⡢������'),(2,2,'����Һ����ϵͳ�ú�Һѹվ������ߡ��ܷ⡢������'),(3,2,'����Һ����ϵͳ�ֳ����ؼ�顢��������ߡ��ܷ⡢������'),(4,5,'У��Һλ��׼ȷ��');
  CREATE TABLE `������¼` (
    `������¼ID` int(11) NOT NULL,
    `�豸ID` int(11) NOT NULL,
    `������ĿID` int(11) NOT NULL,
    `������` varchar(45) NOT NULL,
    `������` varchar(45) NOT NULL,
    `ʱ��` date NOT NULL,
    PRIMARY KEY (`������¼ID`),
    KEY `k3_idx` (`�豸ID`),
    KEY `k4_idx` (`������ĿID`),
    CONSTRAINT `k3` FOREIGN KEY (`�豸ID`) REFERENCES `�豸` (`�豸ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT `k4` FOREIGN KEY (`������ĿID`) REFERENCES `������Ŀ` (`������ĿID`) ON DELETE NO ACTION ON UPDATE NO ACTION);
  INSERT INTO `������¼` VALUES (1,1,1,'����','���','2016-10-09'),(2,1,2,'����','���','2016-10-11'),(3,2,4,'��','���','2016-10-10');

  CREATE TABLE `��������` (
    `��������ID` int(11) NOT NULL,
    `������¼ID` int(11) NOT NULL,
    `���Ĳ�������` varchar(45) NOT NULL,
    `����` int(11) NOT NULL,
    `��λ` varchar(45) NOT NULL,
    PRIMARY KEY (`��������ID`),
    KEY `k5_idx` (`������¼ID`),
    CONSTRAINT `k5` FOREIGN KEY (`������¼ID`) REFERENCES `������¼` (`������¼ID`) ON DELETE CASCADE ON UPDATE CASCADE);
  INSERT INTO `��������` VALUES (1,1,'����',2,'��');