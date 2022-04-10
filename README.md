Team members: Edgar Luks, Vjatšeslav Semjonov, Mark Petrov
Scrum: https://docs.google.com/spreadsheets/d/1EPOgKsJzAFIK61o6Ag0LTe64R9SUspPWWakftZANHsM/edit#gid=56636606

Translated Database:

drop database vaalikone;
grant all on vaalikone.* to team19@localhost identified by 'kukkuu';

create database vaalikone;
use vaalikone;
-- This line is to handle utf8 character needs (like ä and ö) if you have not set utf8 encoding already default for your mysql
ALTER DATABASE vaalikone CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;



-- these drops are not needed now (we droppped the whole database), but as an example of how to drop a table
DROP TABLE if exists CANDIDATES;
DROP TABLE if exists QUESTIONS;
DROP TABLE if exists ANSWERS;

-- create a table candidates (mysql does not bother with the case of letters - in this case)
CREATE TABLE CANDIDATES (
   CANDIDATE_ID INTEGER NOT NULL,
   SURNAME VARCHAR (25),
   FIRSTNAME VARCHAR (25),
   PARTY VARCHAR (50),
   LOCATION VARCHAR (25),
   AGE INTEGER,
   REASON_FOR_RUNNING VARCHAR (250),
   AIMS_AND_GOALS VARCHAR (2000),
   PROFESSION VARCHAR (50),
   PRIMARY KEY (CANDIDATE_ID)
);

-- create a table questions
CREATE TABLE QUESTIONS (
   QUESTION_ID INTEGER NOT NULL,
   QUESTION VARCHAR (100),
   PRIMARY KEY (QUESTION_ID)
);

-- create a table answers
CREATE TABLE ANSWERS (
   CANDIDATE_ID INTEGER NOT NULL,
   QUESTION_ID INTEGER NOT NULL,
   ANSWER INTEGER,
   COMMENTS VARCHAR (50),
   PRIMARY KEY (CANDIDATE_ID, QUESTION_ID)
);


-- insert values ​​into the table candidates
INSERT INTO CANDIDATES VALUES (1, "PerchLake ", "Joel", "Finland's Christian Democrats (KD)", "Uurainen" , 86, "Ideally I'd do something else, but the kingdom is to be corrected. I get along about eight languages, and I am familiar with many fields Urban and rural common sense. "," I want to promote Finland, where no one has to suffer from deprivation or a feeling of powerlessness in influencing their own affairs. "," Member of Parliament ");
INSERT INTO CANDIDATES VALUES (2, "Aintila "," Henrik Jeremias "," Finland's Swedish People's party "," Helsinki ", 47," I am a bilingual forwar-thinkiner, with a common sense approach. I strive to be prudent and versatile with my thinking. I am experienced in the business world and public administration. I also work full-time whilst being a mother of three children. "," My motto is Human livelihood and genuine equality for all, regardless of status - Genuine sovereignty and impartiality - The well-being of the people over corporate profits - Transparency in all matters! ", "Librarian");
INSERT INTO CANDIDATES VALUES (3, "Aittakumpu", "Alviina", "Left Alliance", "Jämsä", 46, "I know various silent grievances. For example, issues related to corruption and dishonesty. For democracy to work so full honesty is required.", " Finnish markka alongside the euro, and to sell Finland's domestic economy in good condition. Jobs in the public and private sectors; investments and basic income in Finnish marks; much easier business conditions and employment incentives." , "Engineer");
INSERT INTO CANDIDATES VALUES (4, "Ala-Kokko", "Henri", "Green League", "Espoo", 87, "I go ahead, for independence, the countryside, Finnishness and social justice.", "The role of the elderly and carers There is no need for more cuts in services for the elderly and more money for preventive services, support for family care needs to be increased and enough holidays need to be provided for every caregiver. positive experience of the workplace. "," Chief Nurse, Chief shop steward ");
INSERT INTO CANDIDATES VALUES (5, "Ala-Nissilä", "Benjamin", "Suomen Keskusta", "Lappajärvi", 26, "I want a change in the current government activities, the activities have not met the expectations of the Katainen-Stubb government, the state has more debt than never "," Finland's difference from the EU. Introduction of the national central bank's own currency in Finland. Termination of the host country agreement between Finland and NATO and return to neutrality. Securing welfare state services with the help of the central bank, national currency and independent economic policy. "," Metallimies " );
INSERT INTO CANDIDATES VALUES (6, "Lower Reinikka "," Karl-Mikael "," National Coalition ", "the Black Island ", 37," Because I am brave and honest." , "Overall, parliament should choose only those with the right kind of education and Education. The reform of working life and educational institutions - people's individuality must be taken into account through flexible working hours, mobile work, teaching methods. The 8-hour system is old-fashioned and needs reform. More creativity in working life! "," Lecturer in Sports ");
INSERT INTO CANDIDATES VALUES (7, "Lower Forest", "Grain", "Green Alliance", "Eagle", 82, "If you want the same expenditure to continue in the next parliamentary term, skip this candidate. If you want a change then you are at the right address.", " It is absolutely paramount to build good relations with non-EU countries as well. We need more trade to increase our exports and create new jobs while maintaining existing ones. "," Junior Hockey Club Liaison Manager ");
INSERT INTO CANDIDATES VALUES (8, "Alanko-Kahiluoto", "Sara", "Green Alliance", "Nokia", 21, "I want to contribute to the well-being of society through politics.", "Securing the Nordic welfare state with an economic system based on modern monetary theory (neo-Hartalism). Defending Finland's military non-alignment and foreign policy neutrality. Supporting the University of Education and non-profit research. These issues include opposition to EU, EMU, NATO and TTIP memberships. "," Lecturer in Mother Tongue and Literature ");
INSERT INTO CANDIDATES VALUES (9, "Alasalmi", "Otto", "Finnish Social Democratic Party", "Varkaus", 30, "Finland needs new ideas and I can find them. This country needs to cooperate. I look forward, I believe in the better and I defend the weakest . "," Leaving the EU is the most important thing! I've never done paid work, so entrepreneurship is also a matter of the heart! No NATO, no EU, no TTIP, no GMO, no euro! YES INDEPENDENCE AND PEOPLE! what the government does and the legality of its decisions! The EEA Agreement is enough for us! It guarantees training, mobility and trade within the EU! "," Freelancer ");
INSERT INTO CANDIDATES VALUES (10, "Alatalo "," Cosmo "," Center Party of Finland ", "Tampere ", 68," I am an energetic matters common to the nurse, and I have 20 years of experience in the management of human affairs. In recent municipal elections, I received a sign of trust ääniharavan station in my city . "," Politicians do not create jobs, but constructive frameworks. The employment rate must be raised to the level of Sweden, and structural reforms in the public sector as well as in the labor market must be carried out to substantially reduce taxation and barriers to employment. must be reduced. I will focus on preventing employment and exclusion. "," Student / Employee ");
INSERT INTO CANDIDATES VALUES (11, "Albert", "Essi", "Centre Party", "Turku", 47, "Although it sounds cliché, I would run everyone's business in Parliament, and I have no vague motives. In Parliament, I want to create a society where everyone love is enough. "," Balanced state finances, credible defense capability, safe everyday life, diversity of education and greater individual freedom. "," Architect ");
INSERT INTO CANDIDATES VALUES (12, "Alän", "Mikko", "Independence Party", "Kuopio", 82, "My goal is to bring fresh and modern ideas into the miserable political field of the ruling parties. As a candidate for the small half, the party discipline set by the elderly does not limit me.", "MAKES SENSE TO REGULATORY, SPACE FOR WORK AND OPTIONS. Finland needs work and movement. Unnecessary bureaucracy and over-regulation must be dismantled to create space for entrepreneurship, activity and everyday choices. For example, regulation of store opening hours and location should be liberalized. The obligations of SMEs in particular need to be relaxed. The impact of laws needs to be better assessed. FOR CHILDREN, YOUNG PEOPLE AND FAMILIES DRIVERS Families need support and flexibility to reconcile work and family. Sharing home care allowance is a family affair. Finnish quality early childhood education and training must be adhered to, and education can no longer be afforded to cut. EVERYDAY SECURITY AND STRONGER LEGAL SECURITY Everyday security and legal security must be strengthened. The operational capacity of the police, the judiciary and the defense forces must be safeguarded. This requires adequate resources and reforms. Penalties for serious crimes against life and health, especially children, must be increased.", "Performing artist, showman");
INSERT INTO CANDIDATES VALUES (13, "Alho", "Inna", "National Coalition Party", "Kouvola", 62, "I want to promote the growth of holistic well-being without interest policy orientation.", "I want to be involved in building a responsible and encouraging society with Promoting employment and investing in education are key to future well-being. Work is a guarantee of well-being at both the individual and collective levels. Therefore, barriers to employment must be removed. Education is the key to the future! ",  "mixed worker ");
INSERT INTO CANDIDATES VALUES (14, "Alhojärvi", "Mikael", "Finnish Communist Party", "Lappeenranta", 19, "Unlike Parliament, not just one, but several new perspectives.", "Fighter for fundamental rights. Transparency, reliability and keeping his promises, the jacket will not turn even after the election. "," Lieutenant Colonel evp, taxi driver ");
INSERT INTO CANDIDATES VALUES (15, "Alho Noro "," Jasmine "," Green League ", "Tampere ", 53," I am ready to run even larger structural reforms to improve Finland's competitiveness. I am confident the Finns that they themselves know what is best for themselves and not so much power. "," Long-term experience in working with people - company, sports and organizers. Working in municipal politics in the 80's and 90's ... "," Photographer ");
INSERT INTO CANDIDATES VALUES (16, "Alijärvi", "Daniel", "Finnish Social Democratic Party", "Helsinki", 20, "I keep my word", "Decision-making needs future MPs who are competent, cooperative, experienced and have good leadership skills.", " specialist ");
INSERT INTO CANDIDATES VALUES (17, "Allahmoradi", "Tuomas", "Left Alliance ", "Inkoo", 73, "Because someone is needed "," Own country strawberry, other country blueberry "," Mediapastori ");
INSERT INTO CANDIDATES VALUES (18, "Anderson", "Otto", "Swedish People's Party of Finland", "Vantaa", 45, "Through my special assistant work, I have solid experience in national politics. parliament is needed pirated Technological development is the greatest force for change in society, and it must be taken into account as a very significant aspect. " , "gained experience as a physicist and teacher, knowledgeable contributor, I will strive for technological and social advancement. ", "physicist, agriculture and forestry practitioner ");
INSERT INTO CANDIDATES VALUES (19, "Andersson " , " Cosmo "," Left "," Joensuu ", 41," I think it should be dedicated member of parliament who is freedom and social justice based on the values, strong opinions, and the ability COOPERATION. ", " I'm irreligious supporter of individual freedom. NATO affirmative, supporter of nuclear power. "," Member of Parliament ");
INSERT INTO CANDIDATES VALUES (20, "Andersson", "Essi", "Swedish People's Party of Finland", "Kouvola", 63, "FINLAND'S ECONOMIC OUTLOOK IS BLEAK It is important to start raising the Finnish economy. from some other alliance. "," I have a strong scientific education as a doctor of physics and as a software entrepreneur a lot of experience in society, including public administration. Vision and ability to reform is my strength. "," master builder ");

-- insert values ​​into the table questions
INSERT INTO QUESTIONS VALUES (1, "It is too easy to live on social security in Finland");
INSERT INTO QUESTIONS VALUES (2, "Opening hours of trade and other shops must be liberalized.");
INSERT INTO QUESTIONS VALUES (3, "Finland needs to move to a basic income for all.");
INSERT INTO QUESTIONS VALUES (4, "The employee must be guaranteed by law a minimum working time.");
INSERT INTO QUESTIONS VALUES (5, "The duration of earnings-related occupational safety must be shortened.");
INSERT INTO QUESTIONS VALUES (6, "Outside the euro, Finland would do better.");
INSERT INTO QUESTIONS VALUES (7, "Food taxation can afford to be tightened.");
INSERT INTO QUESTIONS VALUES (8, "The state and municipal finances must be balanced primarily by cutting spending.");
INSERT INTO QUESTIONS VALUES (9, "Child benefits must be increased and taxed.");
INSERT INTO QUESTIONS VALUES (10, "Finland cannot afford social and health services on the current scale.");
INSERT INTO QUESTIONS VALUES (11, "NATO membership would strengthen Finland's security policy position.");
INSERT INTO QUESTIONS VALUES (12, "Finland needs more police.");
INSERT INTO QUESTIONS VALUES (13, "Immigration to Finland must be restricted due to the threat of terrorism.");
INSERT INTO QUESTIONS VALUES (14, "Russia's policy of interests is a threat to Finland.");
INSERT INTO QUESTIONS VALUES (15, "In network surveillance, state security is more important than the protection of citizens' privacy.");
INSERT INTO QUESTIONS VALUES (16, "Finland must take part in the fight against Isis by training Iraqi government forces.");
INSERT INTO QUESTIONS VALUES (17, "The terminally ill must have the right to assisted death.");
INSERT INTO QUESTIONS VALUES (18, "Health and social services must be provided primarily as public services.");
INSERT INTO QUESTIONS VALUES (19, "Authorities need to address the problems of families with children more sensitively.");

-- insert values ​​into the table answers
-- insert values ​​into the table answers
INSERT INTO ANSWERS VALUES ( 1 , 1 , 2 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 1 , 2 , 4 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 1 , 3 , 3 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 1 , 4 , 2 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 1 , 5 , 1 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 1 , 6 , 2 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 1 , 7 , 5 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 1 , 8 , 2 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 1 , 9 , 4 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 1 , 10 , 1 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 1 , 11 , 1 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 1 , 12 , 2 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 1 , 13 , 4 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 1 , 14 , 5 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 1 , 15 , 3 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 1 , 16 , 1 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 1 , 17 , 4 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 1 , 18 , 4 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 1 , 19 , 3 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 2 , 1 , 1 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 2 , 2 , 5 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 2 , 3 , 2 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 2 , 4 , 1 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 2 , 5 , 4 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 2 , 6 , 5 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 2 , 7 , 1 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 2 , 8 , 3 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 2 , 9 , 3 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 2 , 10 , 4 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 2 , 11 , 5 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 2 , 12 , 1 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 2 , 13 , 2 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 2 , 14 , 1 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 2 , 15 , 4 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 2 , 16 , 3 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 2 , 17 , 1 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 2 , 18 , 1 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 2 , 19 , 4 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 3 , 1 , 1 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 3 , 2 , 2 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 3 , 3 , 1 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 3 , 4 , 4 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 3 , 5 , 3 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 3 , 6 , 1 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 3 , 7 , 1 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 3 , 8 , 4 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 3 , 9 , 5 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 3 , 10 , 2 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 3 , 11 , 2 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 3 , 12 , 4 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 3 , 13 , 1 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 3 , 14 , 1 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 3 , 15 , 1 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 3 , 16 , 3 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 3 , 17 , 4 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 3 , 18 , 4 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 3 , 19 , 5 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 4 , 1 , 3 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 4 , 2 , 1 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 4 , 3 , 4 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 4 , 4 , 1 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 4 , 5 , 2 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 4 , 6 , 4 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 4 , 7 , 3 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 4 , 8 , 5 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 4 , 9 , 2 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 4 , 10 , 3 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 4 , 11 , 5 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 4 , 12 , 5 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 4 , 13 , 1 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 4 , 14 , 3 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 4 , 15 , 4 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 4 , 16 , 1 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 4 , 17 , 2 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 4 , 18 , 1 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 4 , 19 , 4 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 5 , 1 , 1 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 5 , 2 , 2 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 5 , 3 , 5 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 5 , 4 , 4 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 5 , 5 , 5 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 5 , 6 , 2 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 5 , 7 , 3 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 5 , 8 , 3 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 5 , 9 , 3 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 5 , 10 , 3 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 5 , 11 , 3 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 5 , 12 , 2 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 5 , 13 , 1 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 5 , 14 , 5 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 5 , 15 , 1 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 5 , 16 , 3 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 5 , 17 , 4 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 5 , 18 , 5 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 5 , 19 , 4 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 6 , 1 , 3 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 6 , 2 , 5 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 6 , 3 , 4 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 6 , 4 , 5 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 6 , 5 , 2 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 6 , 6 , 4 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 6 , 7 , 1 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 6 , 8 , 3 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 6 , 9 , 1 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 6 , 10 , 5 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 6 , 11 , 3 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 6 , 12 , 1 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 6 , 13 , 2 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 6 , 14 , 1 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 6 , 15 , 3 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 6 , 16 , 2 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 6 , 17 , 3 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 6 , 18 , 5 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 6 , 19 , 5 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 7 , 1 , 3 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 7 , 2 , 4 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 7 , 3 , 5 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 7 , 4 , 4 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 7 , 5 , 2 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 7 , 6 , 5 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 7 , 7 , 2 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 7 , 8 , 5 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 7 , 9 , 5 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 7 , 10 , 2 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 7 , 11 , 3 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 7 , 12 , 3 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 7 , 13 , 1 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 7 , 14 , 1 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 7 , 15 , 2 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 7 , 16 , 2 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 7 , 17 , 5 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 7 , 18 , 2 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 7 , 19 , 5 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 8 , 1 , 3 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 8 , 2 , 1 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 8 , 3 , 5 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 8 , 4 , 2 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 8 , 5 , 3 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 8 , 6 , 4 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 8 , 7 , 4 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 8 , 8 , 2 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 8 , 9 , 1 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 8 , 10 , 3 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 8 , 11 , 5 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 8 , 12 , 2 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 8 , 13 , 2 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 8 , 14 , 5 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 8 , 15 , 4 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 8 , 16 , 4 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 8 , 17 , 5 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 8 , 18 , 5 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 8 , 19 , 3 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 9 , 1 , 2 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 9 , 2 , 5 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 9 , 3 , 2 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 9 , 4 , 3 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 9 , 5 , 2 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 9 , 6 , 2 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 9 , 7 , 2 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 9 , 8 , 5 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 9 , 9 , 4 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 9 , 10 , 3 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 9 , 11 , 1 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 9 , 12 , 1 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 9 , 13 , 1 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 9 , 14 , 3 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 9 , 15 , 1 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 9 , 16 , 5 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 9 , 17 , 5 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 9 , 18 , 5 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 9 , 19 , 5 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 10 , 1 , 4 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 10 , 2 , 2 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 10 , 3 , 3 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 10 , 4 , 3 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 10 , 5 , 1 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 10 , 6 , 3 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 10 , 7 , 2 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 10 , 8 , 2 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 10 , 9 , 5 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 10 , 10 , 5 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 10 , 11 , 3 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 10 , 12 , 2 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 10 , 13 , 2 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 10 , 14 , 3 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 10 , 15 , 3 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 10 , 16 , 1 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 10 , 17 , 4 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 10 , 18 , 5 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 10 , 19 , 5 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 11 , 1 , 2 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 11 , 2 , 2 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 11 , 3 , 4 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 11 , 4 , 2 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 11 , 5 , 4 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 11 , 6 , 5 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 11 , 7 , 5 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 11 , 8 , 5 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 11 , 9 , 4 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 11 , 10 , 2 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 11 , 11 , 3 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 11 , 12 , 4 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 11 , 13 , 1 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 11 , 14 , 2 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 11 , 15 , 4 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 11 , 16 , 2 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 11 , 17 , 4 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 11 , 18 , 2 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 11 , 19 , 3 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 12 , 1 , 2 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 12 , 2 , 3 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 12 , 3 , 2 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 12 , 4 , 2 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 12 , 5 , 5 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 12 , 6 , 5 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 12 , 7 , 2 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 12 , 8 , 3 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 12 , 9 , 2 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 12 , 10 , 2 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 12 , 11 , 5 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 12 , 12 , 4 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 12 , 13 , 1 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 12 , 14 , 3 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 12 , 15 , 5 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 12 , 16 , 4 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 12 , 17 , 5 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 12 , 18 , 2 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 12 , 19 , 5 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 13 , 1 , 3 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 13 , 2 , 1 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 13 , 3 , 4 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 13 , 4 , 4 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 13 , 5 , 1 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 13 , 6 , 1 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 13 , 7 , 4 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 13 , 8 , 5 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 13 , 9 , 3 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 13 , 10 , 4 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 13 , 11 , 3 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 13 , 12 , 3 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 13 , 13 , 3 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 13 , 14 , 5 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 13 , 15 , 3 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 13 , 16 , 4 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 13 , 17 , 4 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 13 , 18 , 2 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 13 , 19 , 4 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 14 , 1 , 5 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 14 , 2 , 2 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 14 , 3 , 1 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 14 , 4 , 2 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 14 , 5 , 3 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 14 , 6 , 2 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 14 , 7 , 4 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 14 , 8 , 2 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 14 , 9 , 3 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 14 , 10 , 2 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 14 , 11 , 1 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 14 , 12 , 2 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 14 , 13 , 2 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 14 , 14 , 4 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 14 , 15 , 3 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 14 , 16 , 4 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 14 , 17 , 3 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 14 , 18 , 3 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 14 , 19 , 3 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 15 , 1 , 4 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 15 , 2 , 2 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 15 , 3 , 1 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 15 , 4 , 1 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 15 , 5 , 1 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 15 , 6 , 1 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 15 , 7 , 1 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 15 , 8 , 2 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 15 , 9 , 5 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 15 , 10 , 4 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 15 , 11 , 1 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 15 , 12 , 3 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 15 , 13 , 4 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 15 , 14 , 5 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 15 , 15 , 1 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 15 , 16 , 4 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 15 , 17 , 2 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 15 , 18 , 2 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 15 , 19 , 3 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 16 , 1 , 3 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 16 , 2 , 2 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 16 , 3 , 5 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 16 , 4 , 5 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 16 , 5 , 1 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 16 , 6 , 4 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 16 , 7 , 2 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 16 , 8 , 1 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 16 , 9 , 1 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 16 , 10 , 5 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 16 , 11 , 4 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 16 , 12 , 2 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 16 , 13 , 4 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 16 , 14 , 4 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 16 , 15 , 3 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 16 , 16 , 2 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 16 , 17 , 2 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 16 , 18 , 2 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 16 , 19 , 2 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 17 , 1 , 4 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 17 , 2 , 1 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 17 , 3 , 1 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 17 , 4 , 4 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 17 , 5 , 3 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 17 , 6 , 5 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 17 , 7 , 1 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 17 , 8 , 5 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 17 , 9 , 2 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 18 , 10 , 1 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 18 , 11 , 2 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 18 , 12 , 2 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 18 , 13 , 5 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 18 , 14 , 2 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 18 , 15 , 4 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 18 , 16 , 4 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 18 , 17 , 3 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 18 , 18 , 3 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 18 , 19 , 2 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 19 , 1 , 2 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 19 , 2 , 1 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 19 , 3 , 4 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 19 , 4 , 5 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 19 , 5 , 1 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 19 , 6 , 4 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 19 , 7 , 1 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 19 , 8 , 2 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 19 , 9 , 4 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 19 , 10 , 2 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 19 , 11 , 1 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 19 , 12 , 5 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 19 , 13 , 4 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 19 , 14 , 4 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 19 , 15 , 3 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 19 , 16 , 3 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 19 , 17 , 1 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 19 , 18 , 5 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 19 , 19 , 4 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 20 , 1 , 1 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 20 , 2 , 1 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 20 , 3 , 5 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 20 , 4 , 5 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 20 , 5 , 1 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 20 , 6 , 1 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 20 , 7 , 1 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 20 , 8 , 3 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 20 , 9 , 4 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 20 , 10 , 2 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 20 , 11 , 3 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 20 , 12 , 1 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 20 , 13 , 1 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 20 , 14 , 4 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 20 , 15 , 2 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 20 , 16 , 1 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 20 , 17 , 1 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 20 , 18 , 1 , "candidate's answer to question" );
INSERT INTO ANSWERS VALUES ( 20 , 19 , 4 , "candidate's answer to question" );

CREATE TABLE useraccount (
id int not null auto_increment primary key,
username varchar(100) not null,
hashedpassword varchar(100) not null,
salt varchar(100) not null
);
