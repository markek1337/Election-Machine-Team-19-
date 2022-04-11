-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: vaalikone
-- ------------------------------------------------------
-- Server version	5.7.37-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `answers`
--

DROP TABLE IF EXISTS `answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `answers` (
  `CANDIDATE_ID` int(11) NOT NULL,
  `QUESTION_ID` int(11) NOT NULL,
  `ANSWER` int(11) DEFAULT NULL,
  `COMMENTS` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`CANDIDATE_ID`,`QUESTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answers`
--

LOCK TABLES `answers` WRITE;
/*!40000 ALTER TABLE `answers` DISABLE KEYS */;
INSERT INTO `answers` VALUES (1,1,2,'candidate\'s answer to question'),(1,2,4,'candidate\'s answer to question'),(1,3,3,'candidate\'s answer to question'),(1,4,2,'candidate\'s answer to question'),(1,5,1,'candidate\'s answer to question'),(1,6,2,'candidate\'s answer to question'),(1,7,5,'candidate\'s answer to question'),(1,8,2,'candidate\'s answer to question'),(1,9,4,'candidate\'s answer to question'),(1,10,1,'candidate\'s answer to question'),(1,11,1,'candidate\'s answer to question'),(1,12,2,'candidate\'s answer to question'),(1,13,4,'candidate\'s answer to question'),(1,14,5,'candidate\'s answer to question'),(1,15,3,'candidate\'s answer to question'),(1,16,1,'candidate\'s answer to question'),(1,17,4,'candidate\'s answer to question'),(1,18,4,'candidate\'s answer to question'),(1,19,3,'candidate\'s answer to question'),(2,1,1,'candidate\'s answer to question'),(2,2,5,'candidate\'s answer to question'),(2,3,2,'candidate\'s answer to question'),(2,4,1,'candidate\'s answer to question'),(2,5,4,'candidate\'s answer to question'),(2,6,5,'candidate\'s answer to question'),(2,7,1,'candidate\'s answer to question'),(2,8,3,'candidate\'s answer to question'),(2,9,3,'candidate\'s answer to question'),(2,10,4,'candidate\'s answer to question'),(2,11,5,'candidate\'s answer to question'),(2,12,1,'candidate\'s answer to question'),(2,13,2,'candidate\'s answer to question'),(2,14,1,'candidate\'s answer to question'),(2,15,4,'candidate\'s answer to question'),(2,16,3,'candidate\'s answer to question'),(2,17,1,'candidate\'s answer to question'),(2,18,1,'candidate\'s answer to question'),(2,19,4,'candidate\'s answer to question'),(3,1,1,'candidate\'s answer to question'),(3,2,2,'candidate\'s answer to question'),(3,3,1,'candidate\'s answer to question'),(3,4,4,'candidate\'s answer to question'),(3,5,3,'candidate\'s answer to question'),(3,6,1,'candidate\'s answer to question'),(3,7,1,'candidate\'s answer to question'),(3,8,4,'candidate\'s answer to question'),(3,9,5,'candidate\'s answer to question'),(3,10,2,'candidate\'s answer to question'),(3,11,2,'candidate\'s answer to question'),(3,12,4,'candidate\'s answer to question'),(3,13,1,'candidate\'s answer to question'),(3,14,1,'candidate\'s answer to question'),(3,15,1,'candidate\'s answer to question'),(3,16,3,'candidate\'s answer to question'),(3,17,4,'candidate\'s answer to question'),(3,18,4,'candidate\'s answer to question'),(3,19,5,'candidate\'s answer to question'),(4,1,3,'candidate\'s answer to question'),(4,2,1,'candidate\'s answer to question'),(4,3,4,'candidate\'s answer to question'),(4,4,1,'candidate\'s answer to question'),(4,5,2,'candidate\'s answer to question'),(4,6,4,'candidate\'s answer to question'),(4,7,3,'candidate\'s answer to question'),(4,8,5,'candidate\'s answer to question'),(4,9,2,'candidate\'s answer to question'),(4,10,3,'candidate\'s answer to question'),(4,11,5,'candidate\'s answer to question'),(4,12,5,'candidate\'s answer to question'),(4,13,1,'candidate\'s answer to question'),(4,14,3,'candidate\'s answer to question'),(4,15,4,'candidate\'s answer to question'),(4,16,1,'candidate\'s answer to question'),(4,17,2,'candidate\'s answer to question'),(4,18,1,'candidate\'s answer to question'),(4,19,4,'candidate\'s answer to question'),(5,1,1,'candidate\'s answer to question'),(5,2,2,'candidate\'s answer to question'),(5,3,5,'candidate\'s answer to question'),(5,4,4,'candidate\'s answer to question'),(5,5,5,'candidate\'s answer to question'),(5,6,2,'candidate\'s answer to question'),(5,7,3,'candidate\'s answer to question'),(5,8,3,'candidate\'s answer to question'),(5,9,3,'candidate\'s answer to question'),(5,10,3,'candidate\'s answer to question'),(5,11,3,'candidate\'s answer to question'),(5,12,2,'candidate\'s answer to question'),(5,13,1,'candidate\'s answer to question'),(5,14,5,'candidate\'s answer to question'),(5,15,1,'candidate\'s answer to question'),(5,16,3,'candidate\'s answer to question'),(5,17,4,'candidate\'s answer to question'),(5,18,5,'candidate\'s answer to question'),(5,19,4,'candidate\'s answer to question'),(6,1,3,'candidate\'s answer to question'),(6,2,5,'candidate\'s answer to question'),(6,3,4,'candidate\'s answer to question'),(6,4,5,'candidate\'s answer to question'),(6,5,2,'candidate\'s answer to question'),(6,6,4,'candidate\'s answer to question'),(6,7,1,'candidate\'s answer to question'),(6,8,3,'candidate\'s answer to question'),(6,9,1,'candidate\'s answer to question'),(6,10,5,'candidate\'s answer to question'),(6,11,3,'candidate\'s answer to question'),(6,12,1,'candidate\'s answer to question'),(6,13,2,'candidate\'s answer to question'),(6,14,1,'candidate\'s answer to question'),(6,15,3,'candidate\'s answer to question'),(6,16,2,'candidate\'s answer to question'),(6,17,3,'candidate\'s answer to question'),(6,18,5,'candidate\'s answer to question'),(6,19,5,'candidate\'s answer to question'),(7,1,3,'candidate\'s answer to question'),(7,2,4,'candidate\'s answer to question'),(7,3,5,'candidate\'s answer to question'),(7,4,4,'candidate\'s answer to question'),(7,5,2,'candidate\'s answer to question'),(7,6,5,'candidate\'s answer to question'),(7,7,2,'candidate\'s answer to question'),(7,8,5,'candidate\'s answer to question'),(7,9,5,'candidate\'s answer to question'),(7,10,2,'candidate\'s answer to question'),(7,11,3,'candidate\'s answer to question'),(7,12,3,'candidate\'s answer to question'),(7,13,1,'candidate\'s answer to question'),(7,14,1,'candidate\'s answer to question'),(7,15,2,'candidate\'s answer to question'),(7,16,2,'candidate\'s answer to question'),(7,17,5,'candidate\'s answer to question'),(7,18,2,'candidate\'s answer to question'),(7,19,5,'candidate\'s answer to question'),(8,1,3,'candidate\'s answer to question'),(8,2,1,'candidate\'s answer to question'),(8,3,5,'candidate\'s answer to question'),(8,4,2,'candidate\'s answer to question'),(8,5,3,'candidate\'s answer to question'),(8,6,4,'candidate\'s answer to question'),(8,7,4,'candidate\'s answer to question'),(8,8,2,'candidate\'s answer to question'),(8,9,1,'candidate\'s answer to question'),(8,10,3,'candidate\'s answer to question'),(8,11,5,'candidate\'s answer to question'),(8,12,2,'candidate\'s answer to question'),(8,13,2,'candidate\'s answer to question'),(8,14,5,'candidate\'s answer to question'),(8,15,4,'candidate\'s answer to question'),(8,16,4,'candidate\'s answer to question'),(8,17,5,'candidate\'s answer to question'),(8,18,5,'candidate\'s answer to question'),(8,19,3,'candidate\'s answer to question'),(9,1,2,'candidate\'s answer to question'),(9,2,5,'candidate\'s answer to question'),(9,3,2,'candidate\'s answer to question'),(9,4,3,'candidate\'s answer to question'),(9,5,2,'candidate\'s answer to question'),(9,6,2,'candidate\'s answer to question'),(9,7,2,'candidate\'s answer to question'),(9,8,5,'candidate\'s answer to question'),(9,9,4,'candidate\'s answer to question'),(9,10,3,'candidate\'s answer to question'),(9,11,1,'candidate\'s answer to question'),(9,12,1,'candidate\'s answer to question'),(9,13,1,'candidate\'s answer to question'),(9,14,3,'candidate\'s answer to question'),(9,15,1,'candidate\'s answer to question'),(9,16,5,'candidate\'s answer to question'),(9,17,5,'candidate\'s answer to question'),(9,18,5,'candidate\'s answer to question'),(9,19,5,'candidate\'s answer to question'),(10,1,4,'candidate\'s answer to question'),(10,2,2,'candidate\'s answer to question'),(10,3,3,'candidate\'s answer to question'),(10,4,3,'candidate\'s answer to question'),(10,5,1,'candidate\'s answer to question'),(10,6,3,'candidate\'s answer to question'),(10,7,2,'candidate\'s answer to question'),(10,8,2,'candidate\'s answer to question'),(10,9,5,'candidate\'s answer to question'),(10,10,5,'candidate\'s answer to question'),(10,11,3,'candidate\'s answer to question'),(10,12,2,'candidate\'s answer to question'),(10,13,2,'candidate\'s answer to question'),(10,14,3,'candidate\'s answer to question'),(10,15,3,'candidate\'s answer to question'),(10,16,1,'candidate\'s answer to question'),(10,17,4,'candidate\'s answer to question'),(10,18,5,'candidate\'s answer to question'),(10,19,5,'candidate\'s answer to question'),(11,1,2,'candidate\'s answer to question'),(11,2,2,'candidate\'s answer to question'),(11,3,4,'candidate\'s answer to question'),(11,4,2,'candidate\'s answer to question'),(11,5,4,'candidate\'s answer to question'),(11,6,5,'candidate\'s answer to question'),(11,7,5,'candidate\'s answer to question'),(11,8,5,'candidate\'s answer to question'),(11,9,4,'candidate\'s answer to question'),(11,10,2,'candidate\'s answer to question'),(11,11,3,'candidate\'s answer to question'),(11,12,4,'candidate\'s answer to question'),(11,13,1,'candidate\'s answer to question'),(11,14,2,'candidate\'s answer to question'),(11,15,4,'candidate\'s answer to question'),(11,16,2,'candidate\'s answer to question'),(11,17,4,'candidate\'s answer to question'),(11,18,2,'candidate\'s answer to question'),(11,19,3,'candidate\'s answer to question'),(12,1,2,'candidate\'s answer to question'),(12,2,3,'candidate\'s answer to question'),(12,3,2,'candidate\'s answer to question'),(12,4,2,'candidate\'s answer to question'),(12,5,5,'candidate\'s answer to question'),(12,6,5,'candidate\'s answer to question'),(12,7,2,'candidate\'s answer to question'),(12,8,3,'candidate\'s answer to question'),(12,9,2,'candidate\'s answer to question'),(12,10,2,'candidate\'s answer to question'),(12,11,5,'candidate\'s answer to question'),(12,12,4,'candidate\'s answer to question'),(12,13,1,'candidate\'s answer to question'),(12,14,3,'candidate\'s answer to question'),(12,15,5,'candidate\'s answer to question'),(12,16,4,'candidate\'s answer to question'),(12,17,5,'candidate\'s answer to question'),(12,18,2,'candidate\'s answer to question'),(12,19,5,'candidate\'s answer to question'),(13,1,3,'candidate\'s answer to question'),(13,2,1,'candidate\'s answer to question'),(13,3,4,'candidate\'s answer to question'),(13,4,4,'candidate\'s answer to question'),(13,5,1,'candidate\'s answer to question'),(13,6,1,'candidate\'s answer to question'),(13,7,4,'candidate\'s answer to question'),(13,8,5,'candidate\'s answer to question'),(13,9,3,'candidate\'s answer to question'),(13,10,4,'candidate\'s answer to question'),(13,11,3,'candidate\'s answer to question'),(13,12,3,'candidate\'s answer to question'),(13,13,3,'candidate\'s answer to question'),(13,14,5,'candidate\'s answer to question'),(13,15,3,'candidate\'s answer to question'),(13,16,4,'candidate\'s answer to question'),(13,17,4,'candidate\'s answer to question'),(13,18,2,'candidate\'s answer to question'),(13,19,4,'candidate\'s answer to question'),(14,1,5,'candidate\'s answer to question'),(14,2,2,'candidate\'s answer to question'),(14,3,1,'candidate\'s answer to question'),(14,4,2,'candidate\'s answer to question'),(14,5,3,'candidate\'s answer to question'),(14,6,2,'candidate\'s answer to question'),(14,7,4,'candidate\'s answer to question'),(14,8,2,'candidate\'s answer to question'),(14,9,3,'candidate\'s answer to question'),(14,10,2,'candidate\'s answer to question'),(14,11,1,'candidate\'s answer to question'),(14,12,2,'candidate\'s answer to question'),(14,13,2,'candidate\'s answer to question'),(14,14,4,'candidate\'s answer to question'),(14,15,3,'candidate\'s answer to question'),(14,16,4,'candidate\'s answer to question'),(14,17,3,'candidate\'s answer to question'),(14,18,3,'candidate\'s answer to question'),(14,19,3,'candidate\'s answer to question'),(15,1,4,'candidate\'s answer to question'),(15,2,2,'candidate\'s answer to question'),(15,3,1,'candidate\'s answer to question'),(15,4,1,'candidate\'s answer to question'),(15,5,1,'candidate\'s answer to question'),(15,6,1,'candidate\'s answer to question'),(15,7,1,'candidate\'s answer to question'),(15,8,2,'candidate\'s answer to question'),(15,9,5,'candidate\'s answer to question'),(15,10,4,'candidate\'s answer to question'),(15,11,1,'candidate\'s answer to question'),(15,12,3,'candidate\'s answer to question'),(15,13,4,'candidate\'s answer to question'),(15,14,5,'candidate\'s answer to question'),(15,15,1,'candidate\'s answer to question'),(15,16,4,'candidate\'s answer to question'),(15,17,2,'candidate\'s answer to question'),(15,18,2,'candidate\'s answer to question'),(15,19,3,'candidate\'s answer to question'),(16,1,3,'candidate\'s answer to question'),(16,2,2,'candidate\'s answer to question'),(16,3,5,'candidate\'s answer to question'),(16,4,5,'candidate\'s answer to question'),(16,5,1,'candidate\'s answer to question'),(16,6,4,'candidate\'s answer to question'),(16,7,2,'candidate\'s answer to question'),(16,8,1,'candidate\'s answer to question'),(16,9,1,'candidate\'s answer to question'),(16,10,5,'candidate\'s answer to question'),(16,11,4,'candidate\'s answer to question'),(16,12,2,'candidate\'s answer to question'),(16,13,4,'candidate\'s answer to question'),(16,14,4,'candidate\'s answer to question'),(16,15,3,'candidate\'s answer to question'),(16,16,2,'candidate\'s answer to question'),(16,17,2,'candidate\'s answer to question'),(16,18,2,'candidate\'s answer to question'),(16,19,2,'candidate\'s answer to question'),(17,1,4,'candidate\'s answer to question'),(17,2,1,'candidate\'s answer to question'),(17,3,1,'candidate\'s answer to question'),(17,4,4,'candidate\'s answer to question'),(17,5,3,'candidate\'s answer to question'),(17,6,5,'candidate\'s answer to question'),(17,7,1,'candidate\'s answer to question'),(17,8,5,'candidate\'s answer to question'),(17,9,2,'candidate\'s answer to question'),(18,10,1,'candidate\'s answer to question'),(18,11,2,'candidate\'s answer to question'),(18,12,2,'candidate\'s answer to question'),(18,13,5,'candidate\'s answer to question'),(18,14,2,'candidate\'s answer to question'),(18,15,4,'candidate\'s answer to question'),(18,16,4,'candidate\'s answer to question'),(18,17,3,'candidate\'s answer to question'),(18,18,3,'candidate\'s answer to question'),(18,19,2,'candidate\'s answer to question'),(19,1,2,'candidate\'s answer to question'),(19,2,1,'candidate\'s answer to question'),(19,3,4,'candidate\'s answer to question'),(19,4,5,'candidate\'s answer to question'),(19,5,1,'candidate\'s answer to question'),(19,6,4,'candidate\'s answer to question'),(19,7,1,'candidate\'s answer to question'),(19,8,2,'candidate\'s answer to question'),(19,9,4,'candidate\'s answer to question'),(19,10,2,'candidate\'s answer to question'),(19,11,1,'candidate\'s answer to question'),(19,12,5,'candidate\'s answer to question'),(19,13,4,'candidate\'s answer to question'),(19,14,4,'candidate\'s answer to question'),(19,15,3,'candidate\'s answer to question'),(19,16,3,'candidate\'s answer to question'),(19,17,1,'candidate\'s answer to question'),(19,18,5,'candidate\'s answer to question'),(19,19,4,'candidate\'s answer to question'),(20,1,1,'candidate\'s answer to question'),(20,2,1,'candidate\'s answer to question'),(20,3,5,'candidate\'s answer to question'),(20,4,5,'candidate\'s answer to question'),(20,5,1,'candidate\'s answer to question'),(20,6,1,'candidate\'s answer to question'),(20,7,1,'candidate\'s answer to question'),(20,8,3,'candidate\'s answer to question'),(20,9,4,'candidate\'s answer to question'),(20,10,2,'candidate\'s answer to question'),(20,11,3,'candidate\'s answer to question'),(20,12,1,'candidate\'s answer to question'),(20,13,1,'candidate\'s answer to question'),(20,14,4,'candidate\'s answer to question'),(20,15,2,'candidate\'s answer to question'),(20,16,1,'candidate\'s answer to question'),(20,17,1,'candidate\'s answer to question'),(20,18,1,'candidate\'s answer to question'),(20,19,4,'candidate\'s answer to question');
/*!40000 ALTER TABLE `answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `candidates`
--

DROP TABLE IF EXISTS `candidates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `candidates` (
  `CANDIDATE_ID` int(11) NOT NULL,
  `SURNAME` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `FIRSTNAME` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PARTY` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LOCATION` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `AGE` int(11) DEFAULT NULL,
  `REASON_FOR_RUNNING` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `AIMS_AND_GOALS` varchar(2000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PROFESSION` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`CANDIDATE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `candidates`
--

LOCK TABLES `candidates` WRITE;
/*!40000 ALTER TABLE `candidates` DISABLE KEYS */;
INSERT INTO `candidates` VALUES (1,'PerchLake ','Joel','Finland\'s Christian Democrats (KD)','Uurainen',86,'Ideally I\'d do something else, but the kingdom is to be corrected. I get along about eight languages, and I am familiar with many fields Urban and rural common sense. ',' I want to promote Finland, where no one has to suffer from deprivation or a feeling of powerlessness in influencing their own affairs. ',' Member of Parliament '),(2,'Aintila ',' Henrik Jeremias ',' Finland\'s Swedish People\'s party ',' Helsinki ',47,' I am a bilingual forwar-thinkiner, with a common sense approach. I strive to be prudent and versatile with my thinking. I am experienced in the business world and public administration. I also work full-time whilst being a mother of three children. ',' My motto is Human livelihood and genuine equality for all, regardless of status - Genuine sovereignty and impartiality - The well-being of the people over corporate profits - Transparency in all matters! ','Librarian'),(3,'Aittakumpu','Alviina','Left Alliance','Jämsä',46,'I know various silent grievances. For example, issues related to corruption and dishonesty. For democracy to work so full honesty is required.',' Finnish markka alongside the euro, and to sell Finland\'s domestic economy in good condition. Jobs in the public and private sectors; investments and basic income in Finnish marks; much easier business conditions and employment incentives.','Engineer'),(4,'Ala-Kokko','Henri','Green League','Espoo',87,'I go ahead, for independence, the countryside, Finnishness and social justice.','The role of the elderly and carers There is no need for more cuts in services for the elderly and more money for preventive services, support for family care needs to be increased and enough holidays need to be provided for every caregiver. positive experience of the workplace. ',' Chief Nurse, Chief shop steward '),(5,'Ala-Nissilä','Benjamin','Suomen Keskusta','Lappajärvi',26,'I want a change in the current government activities, the activities have not met the expectations of the Katainen-Stubb government, the state has more debt than never ',' Finland\'s difference from the EU. Introduction of the national central bank\'s own currency in Finland. Termination of the host country agreement between Finland and NATO and return to neutrality. Securing welfare state services with the help of the central bank, national currency and independent economic policy. ',' Metallimies '),(6,'Lower Reinikka ',' Karl-Mikael ',' National Coalition ','the Black Island ',37,' Because I am brave and honest.','Overall, parliament should choose only those with the right kind of education and Education. The reform of working life and educational institutions - people\'s individuality must be taken into account through flexible working hours, mobile work, teaching methods. The 8-hour system is old-fashioned and needs reform. More creativity in working life! ',' Lecturer in Sports '),(7,'Lower Forest','Grain','Green Alliance','Eagle',82,'If you want the same expenditure to continue in the next parliamentary term, skip this candidate. If you want a change then you are at the right address.',' It is absolutely paramount to build good relations with non-EU countries as well. We need more trade to increase our exports and create new jobs while maintaining existing ones. ',' Junior Hockey Club Liaison Manager '),(8,'Alanko-Kahiluoto','Sara','Green Alliance','Nokia',21,'I want to contribute to the well-being of society through politics.','Securing the Nordic welfare state with an economic system based on modern monetary theory (neo-Hartalism). Defending Finland\'s military non-alignment and foreign policy neutrality. Supporting the University of Education and non-profit research. These issues include opposition to EU, EMU, NATO and TTIP memberships. ',' Lecturer in Mother Tongue and Literature '),(9,'Alasalmi','Otto','Finnish Social Democratic Party','Varkaus',30,'Finland needs new ideas and I can find them. This country needs to cooperate. I look forward, I believe in the better and I defend the weakest . ',' Leaving the EU is the most important thing! I\'ve never done paid work, so entrepreneurship is also a matter of the heart! No NATO, no EU, no TTIP, no GMO, no euro! YES INDEPENDENCE AND PEOPLE! what the government does and the legality of its decisions! The EEA Agreement is enough for us! It guarantees training, mobility and trade within the EU! ',' Freelancer '),(10,'Alatalo ',' Cosmo ',' Center Party of Finland ','Tampere ',68,' I am an energetic matters common to the nurse, and I have 20 years of experience in the management of human affairs. In recent municipal elections, I received a sign of trust ääniharavan station in my city . ',' Politicians do not create jobs, but constructive frameworks. The employment rate must be raised to the level of Sweden, and structural reforms in the public sector as well as in the labor market must be carried out to substantially reduce taxation and barriers to employment. must be reduced. I will focus on preventing employment and exclusion. ',' Student / Employee '),(11,'Albert','Essi','Centre Party','Turku',47,'Although it sounds cliché, I would run everyone\'s business in Parliament, and I have no vague motives. In Parliament, I want to create a society where everyone love is enough. ',' Balanced state finances, credible defense capability, safe everyday life, diversity of education and greater individual freedom. ',' Architect '),(12,'Alän','Mikko','Independence Party','Kuopio',82,'My goal is to bring fresh and modern ideas into the miserable political field of the ruling parties. As a candidate for the small half, the party discipline set by the elderly does not limit me.','MAKES SENSE TO REGULATORY, SPACE FOR WORK AND OPTIONS. Finland needs work and movement. Unnecessary bureaucracy and over-regulation must be dismantled to create space for entrepreneurship, activity and everyday choices. For example, regulation of store opening hours and location should be liberalized. The obligations of SMEs in particular need to be relaxed. The impact of laws needs to be better assessed. FOR CHILDREN, YOUNG PEOPLE AND FAMILIES DRIVERS Families need support and flexibility to reconcile work and family. Sharing home care allowance is a family affair. Finnish quality early childhood education and training must be adhered to, and education can no longer be afforded to cut. EVERYDAY SECURITY AND STRONGER LEGAL SECURITY Everyday security and legal security must be strengthened. The operational capacity of the police, the judiciary and the defense forces must be safeguarded. This requires adequate resources and reforms. Penalties for serious crimes against life and health, especially children, must be increased.','Performing artist, showman'),(13,'Alho','Inna','National Coalition Party','Kouvola',62,'I want to promote the growth of holistic well-being without interest policy orientation.','I want to be involved in building a responsible and encouraging society with Promoting employment and investing in education are key to future well-being. Work is a guarantee of well-being at both the individual and collective levels. Therefore, barriers to employment must be removed. Education is the key to the future! ','mixed worker '),(14,'Alhojärvi','Mikael','Finnish Communist Party','Lappeenranta',19,'Unlike Parliament, not just one, but several new perspectives.','Fighter for fundamental rights. Transparency, reliability and keeping his promises, the jacket will not turn even after the election. ',' Lieutenant Colonel evp, taxi driver '),(15,'Alho Noro ',' Jasmine ',' Green League ','Tampere ',53,' I am ready to run even larger structural reforms to improve Finland\'s competitiveness. I am confident the Finns that they themselves know what is best for themselves and not so much power. ',' Long-term experience in working with people - company, sports and organizers. Working in municipal politics in the 80\'s and 90\'s ... ',' Photographer '),(16,'Alijärvi','Daniel','Finnish Social Democratic Party','Helsinki',20,'I keep my word','Decision-making needs future MPs who are competent, cooperative, experienced and have good leadership skills.',' specialist '),(17,'Allahmoradi','Tuomas','Left Alliance ','Inkoo',73,'Because someone is needed ',' Own country strawberry, other country blueberry ',' Mediapastori '),(18,'Anderson','Otto','Swedish People\'s Party of Finland','Vantaa',45,'Through my special assistant work, I have solid experience in national politics. parliament is needed pirated Technological development is the greatest force for change in society, and it must be taken into account as a very significant aspect. ','gained experience as a physicist and teacher, knowledgeable contributor, I will strive for technological and social advancement. ','physicist, agriculture and forestry practitioner '),(19,'Andersson ',' Cosmo ',' Left ',' Joensuu ',41,' I think it should be dedicated member of parliament who is freedom and social justice based on the values, strong opinions, and the ability COOPERATION. ',' I\'m irreligious supporter of individual freedom. NATO affirmative, supporter of nuclear power. ',' Member of Parliament '),(20,'Andersson','Essi','Swedish People\'s Party of Finland','Kouvola',63,'FINLAND\'S ECONOMIC OUTLOOK IS BLEAK It is important to start raising the Finnish economy. from some other alliance. ',' I have a strong scientific education as a doctor of physics and as a software entrepreneur a lot of experience in society, including public administration. Vision and ability to reform is my strength. ',' master builder ');
/*!40000 ALTER TABLE `candidates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `questions` (
  `QUESTION_ID` int(11) NOT NULL,
  `QUESTION` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`QUESTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` VALUES (1,'It is too easy to live on social security in Finland'),(2,'Opening hours of trade and other shops must be liberalized.'),(3,'Finland needs to move to a basic income for all.'),(4,'The employee must be guaranteed by law a minimum working time.'),(5,'The duration of earnings-related occupational safety must be shortened.'),(6,'Outside the euro, Finland would do better.'),(7,'Food taxation can afford to be tightened.'),(8,'The state and municipal finances must be balanced primarily by cutting spending.'),(9,'Child benefits must be increased and taxed.'),(10,'Finland cannot afford social and health services on the current scale.'),(11,'NATO membership would strengthen Finland\'s security policy position.'),(12,'Finland needs more police.'),(13,'Immigration to Finland must be restricted due to the threat of terrorism.'),(14,'Russia\'s policy of interests is a threat to Finland.'),(15,'In network surveillance, state security is more important than the protection of citizens\' privacy.'),(16,'Finland must take part in the fight against Isis by training Iraqi government forces.'),(17,'The terminally ill must have the right to assisted death.'),(18,'Health and social services must be provided primarily as public services.'),(19,'Authorities need to address the problems of families with children more sensitively.');
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `useraccount`
--

DROP TABLE IF EXISTS `useraccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `useraccount` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hashedpassword` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `salt` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `useraccount`
--

LOCK TABLES `useraccount` WRITE;
/*!40000 ALTER TABLE `useraccount` DISABLE KEYS */;
INSERT INTO `useraccount` VALUES (1,'slavakich','hdHMNmbqieDqlUbZ/tTAxdbhPE/5koJONa3j5bIBykw=','mekxJ89Up0y/e79RSORwVQ=='),(2,'slavakich','ICfyAhzpY8n1w44uasFtvVNWRHuh9kHSOtHB9DozUSU=','+jt6QHojms4izLyheX0o7w=='),(3,'slava','LVzCZdULfTNjs3821eAjbIDO2kAvI1o4qRse3HXu0Vg=','41Nu+RfheHTOai5Qsgn+hA=='),(4,'slavik','79XtB8rajGsgSrDKXianLew94pW0uCWBo9nODz7pga0=','Wiiwi0r6Kpf8qZBn5ZIrhg==');
/*!40000 ALTER TABLE `useraccount` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-11 11:14:59
