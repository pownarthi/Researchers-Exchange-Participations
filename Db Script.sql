CREATE TABLE `user` (
  `Username` varchar(50) NOT NULL DEFAULT '',
  `Password` varchar(50) DEFAULT NULL,
  `Type` varchar(50) DEFAULT NULL,
  `Studies` int(15) DEFAULT NULL,
  `Participation` int(15) DEFAULT NULL,
  `Coins` int(15) DEFAULT NULL,
  `Name` varchar(40) DEFAULT NULL,
  `salt` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

CREATE TABLE `reported` (
  `QuestionID` int(20) NOT NULL,
  `StudyID` int(20) NOT NULL,
  `Date` date DEFAULT NULL,
  `NumParticipants` int(15) DEFAULT NULL,
  `Status` varchar(50) DEFAULT NULL,
  `ReporterEmail` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`StudyID`,`QuestionID`),
  KEY `QuestionID` (`QuestionID`),
  CONSTRAINT `reported_ibfk_1` FOREIGN KEY (`QuestionID`) REFERENCES `question` (`QuestionID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `reported_ibfk_2` FOREIGN KEY (`StudyID`) REFERENCES `study` (`StudyID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;


CREATE TABLE `study` (
  `StudyID` int(20) NOT NULL AUTO_INCREMENT,
  `StudyName` varchar(40) DEFAULT NULL,
  `Description` varchar(50) DEFAULT NULL,
  `Username` varchar(50) DEFAULT NULL,
  `DateCreated` date DEFAULT NULL,
  `ImageURL` varchar(50) DEFAULT NULL,
  `ReqParticipants` int(15) DEFAULT NULL,
  `ActParticipants` int(15) DEFAULT '0',
  `SStatus` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`StudyID`),
  KEY `Username` (`Username`),
  CONSTRAINT `study_ibfk_1` FOREIGN KEY (`Username`) REFERENCES `user` (`Username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

CREATE TABLE `backuptable` (
  `email` varchar(45) NOT NULL,
  `token` varchar(45) DEFAULT NULL,
  `issuetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

CREATE TABLE `answer` (
  `StudyID` int(20) NOT NULL,
  `QuestionID` int(20) NOT NULL,
  `UserName` varchar(40) NOT NULL DEFAULT '',
  `Choice` varchar(40) DEFAULT NULL,
  `DateSubmitted` date DEFAULT NULL,
  PRIMARY KEY (`StudyID`,`QuestionID`,`UserName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

CREATE TABLE `question` (
  `QuestionID` int(20) NOT NULL AUTO_INCREMENT,
  `StudyID` int(20) DEFAULT NULL,
  `Question` varchar(50) DEFAULT NULL,
  `AnswerType` varchar(10) DEFAULT NULL,
  `Option1` varchar(40) DEFAULT NULL,
  `Option2` varchar(40) DEFAULT NULL,
  `Option3` varchar(40) DEFAULT NULL,
  `Option4` varchar(40) DEFAULT NULL,
  `Option5` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`QuestionID`),
  KEY `StudyID` (`StudyID`),
  CONSTRAINT `question_ibfk_1` FOREIGN KEY (`StudyID`) REFERENCES `study` (`StudyID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

CREATE TABLE `tmpuser` (
  `UserName` varchar(40) NOT NULL,
  `Password` varchar(40) DEFAULT NULL,
  `Name` varchar(25) DEFAULT NULL,
  `token` varchar(45) DEFAULT NULL,
  `IssueDate` date DEFAULT NULL,
  `salt` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`UserName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;