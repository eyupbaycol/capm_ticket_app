using {
    managed,
    sap.common.CodeList
} from '@sap/cds/common';


namespace sap.fe.cap.tickets;

entity Ticket : managed {
    key TicketUUID              : UUID @odata.Type: 'Edm.String';
        Subject                 : String(250);
        TicketStat              : Association to TicketStatus          @readOnly  @Common.ValueListWithFixedValues;
        TicketPriorityStat      : Association to TicketPriorityStatus  @readonly  @Common.ValueListWithFixedValues;
        to_TicketForWhom        : Composition of many TicketForWhom
                                      on to_TicketForWhom.to_ticket = $self;
        to_TicketOwner          : Composition of many TicketOwner
                                      on to_TicketOwner.to_ticket = $self;
        to_TicketForInformation : Composition of many TicketForInformation
                                      on to_TicketForInformation.to_ticket = $self;
}

entity Personnel {
    key PersonnelUUID           : UUID @odata.Type: 'Edm.String';
        PersonnelName           : String(50);
        PersonnelSurname        : String(50);
        PersonnelDepartment     : Association to Department  @readonly  @Common.ValueListWithFixedValues;
        PersonnelPhone          : String(20);
        PersonnelMail           : String(30);
        PersonnelAddress        : String(100);
        to_TicketForWhom        : Composition of many TicketForWhom
                                      on to_TicketForWhom.to_personnel = $self;
        to_TicketOwner          : Composition of many TicketOwner
                                      on to_TicketOwner.to_personnel = $self;
        to_TicketForInformation : Composition of many TicketForInformation
                                      on to_TicketForInformation.to_personnel = $self;
}

entity TicketForWhom {
    key ID           : UUID @odata.Type: 'Edm.String';
        to_ticket    : Association to Ticket;
        to_personnel : Association to Personnel;
}

entity TicketOwner {
    key ID           : UUID @odata.Type: 'Edm.String';
        to_ticket    : Association to Ticket;
        to_personnel : Association to Personnel;
}

entity TicketForInformation {
    key ID           : UUID @odata.Type: 'Edm.String';
        to_ticket    : Association to Ticket;
        to_personnel : Association to Personnel;
}

entity TicketStatus : CodeList {
    key code : String enum {
            New       = '0';
            Analysis  = '1';
            Planning  = '2';
            Test      = '3';
            Problem   = '4';
            Completed = '5';
            Candeled  = '6';
        }
}

entity TicketPriorityStatus : CodeList {
    key code : String enum {
            VeryHigh = '0';
            High     = '1';
            Medium   = '2';
            Low      = '3';
            VeryLow  = '4';
        }
}

entity Department : CodeList {
    key code : String enum {
            Software   = '0';
            Ik         = '1';
            It         = '2';
            Accounting = '3';
        }
}
