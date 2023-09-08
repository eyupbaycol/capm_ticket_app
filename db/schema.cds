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
        to_Customer   : Association to Customer @readonly;
        to_Comment    : Composition of many Comments on to_Comment.to_Ticket = $self;

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
        to_Comment              : Composition of many Comments on to_Comment.to_Personnel = $self;


}
entity Customer  {
    key ID : UUID @odata.Type: 'Edm.String';
    CustomerName: String(100);
    CustomerLocationX : String(100);
    CustomerLocationY: String(100);
    to_Ticket : Composition of many Ticket on to_Ticket.to_Customer = $self;
}

entity Comments {
    key ID: UUID @odata.Type : 'Edm.String';
    Comment : String(250);
    to_Personnel : Association to Personnel;
    to_Ticket : Association to Ticket;
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
