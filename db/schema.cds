using {
    managed,
    sap.common.CodeList
} from '@sap/cds/common';


namespace sap.fe.cap.tickets;

entity Ticket : managed {
        @Common.Label : 'Ticket Numarası'
    key TicketUUID              : UUID @odata.Type: 'Edm.String';
        @Common.Label : 'Açıklama'
        Subject                 : String(250);
        @Common.Label : 'İşin Durumu'
        TicketStat              : Association to TicketStatus          @readOnly  @Common.ValueListWithFixedValues;
        @Common.Label : 'İşin Önceliği'
        TicketPriorityStat      : Association to TicketPriorityStatus  @readonly  @Common.ValueListWithFixedValues;
        to_User                 : Composition of many TicketUser on to_User.to_ticket = $self;
/*        to_TicketForWhom        : Composition of many TicketForWhom
                                      on to_TicketForWhom.to_ticket = $self;
        to_TicketOwner          : Composition of many TicketOwner
                                      on to_TicketOwner.to_ticket = $self;
        to_TicketForInformation : Composition of many TicketForInformation
                                      on to_TicketForInformation.to_ticket = $self; */
}

entity TicketUser {
    key ID : UUID  @odata.Type: 'Edm.String';
    to_ticket : Association to Ticket;
    @Common.Label : 'Personel Numarası' 
    to_personnel : Association to Personnel;
    UserRole   : Association to UserRoles @readonly @Common.ValueListWithFixedValues;
}
entity Personnel {
    key PersonnelUUID           : UUID @odata.Type: 'Edm.String';
        PersonnelName           : String(50);
        PersonnelDepartment     : Association to Department  @readonly  @Common.ValueListWithFixedValues;
        PersonnelPhone          : String(20);
        PersonnelMail           : String(30);
        PersonnelAddress        : String(100);
        to_TicketUser           : Composition of many TicketUser on to_TicketUser.to_personnel = $self;
 /*       to_TicketForWhom        : Composition of many TicketForWhom
                                      on to_TicketForWhom.to_personnel = $self;
        to_TicketOwner          : Composition of many TicketOwner
                                      on to_TicketOwner.to_personnel = $self;
        to_TicketForInformation : Composition of many TicketForInformation
                                      on to_TicketForInformation.to_personnel = $self; */
}

/*entity TicketForWhom {
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
}*/

entity TicketStatus : CodeList {
    key code : String enum {
            New       = '0';
            Analysis  = '1';
            Planning  = '2';
            Test      = '3';
            Problem   = '4';
            Completed = '5';
            Candeled  = '6';
        };
        criticality : Integer;
}

entity UserRoles : CodeList {
    key code : String enum {
        Owner = '0';
        For  =  '1';
        Information = '2';

    }
    
}
entity TicketPriorityStatus : CodeList {
    key code :  String enum {
            
            VeryHigh = '0' @( title: 'Yuksek');
            High     = '1';
            Medium   = '2';
            Low      = '3';
            VeryLow  = '4';
        };
        criticality : Integer;
}

entity Department : CodeList {
    key code : String enum {
            Software   = '0';
            Ik         = '1';
            It         = '2';
            Accounting = '3';
        }
}
