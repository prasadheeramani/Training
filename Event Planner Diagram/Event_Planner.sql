CREATE TABLE Session
(
  Session_ID INT NOT NULL,
  Start_Time INT NOT NULL,
  End_Time INT NOT NULL,
  Presenter_ID INT NOT NULL,
  Event_ID INT NOT NULL,
  PRIMARY KEY (Session_ID)
);

CREATE TABLE Presenter
(
  Presenter_ID INT NOT NULL,
  Presenter_Name INT NOT NULL,
  Designation INT NOT NULL,
  PRIMARY KEY (Presenter_ID)
);

CREATE TABLE Attendee
(
  Attendee_ID INT NOT NULL,
  Attendee_Name INT NOT NULL,
  Designation INT NOT NULL,
  PRIMARY KEY (Attendee_ID)
);

CREATE TABLE Presenter_Contact_Number
(
  Contact_Number INT NOT NULL,
  Presenter_ID INT NOT NULL,
  PRIMARY KEY (Contact_Number, Presenter_ID),
  FOREIGN KEY (Presenter_ID) REFERENCES Presenter(Presenter_ID)
);

CREATE TABLE Attendee_Contact_Number
(
  Contact_Number INT NOT NULL,
  Attendee_ID INT NOT NULL,
  PRIMARY KEY (Contact_Number, Attendee_ID),
  FOREIGN KEY (Attendee_ID) REFERENCES Attendee(Attendee_ID)
);

CREATE TABLE Event
(
  Event_ID INT NOT NULL,
  Event_Name INT NOT NULL,
  Session_ID INT NOT NULL,
  PRIMARY KEY (Event_ID),
  FOREIGN KEY (Session_ID) REFERENCES Session(Session_ID)
);

CREATE TABLE Event_Planner
(
  EventPlanner_ID INT NOT NULL,
  Event_ID INT NOT NULL,
  PRIMARY KEY (EventPlanner_ID),
  FOREIGN KEY (Event_ID) REFERENCES Event(Event_ID)
);

CREATE TABLE Presented_by
(
  Event_ID INT NOT NULL,
  Presenter_ID INT NOT NULL,
  PRIMARY KEY (Event_ID, Presenter_ID),
  FOREIGN KEY (Event_ID) REFERENCES Event(Event_ID),
  FOREIGN KEY (Presenter_ID) REFERENCES Presenter(Presenter_ID)
);

CREATE TABLE Attended_by
(
  Event_ID INT NOT NULL,
  Attendee_ID INT NOT NULL,
  PRIMARY KEY (Event_ID, Attendee_ID),
  FOREIGN KEY (Event_ID) REFERENCES Event(Event_ID),
  FOREIGN KEY (Attendee_ID) REFERENCES Attendee(Attendee_ID)
);