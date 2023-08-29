using TicketService as service from '../../srv/ticket-service';



annotate service.Ticket with @(
    UI.SelectionFields : [
        Subject,
        TicketPriorityStat_code,
        TicketStat_code,
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : Subject,
            Label : 'Subject',
        },
        {
            $Type : 'UI.DataField',
            Value : TicketStat_code,
            Label : 'Ticket Statu',
        },
        {
            $Type : 'UI.DataField',
            Value : TicketPriorityStat_code,
            Label : 'Ticket Priority',
            ![@UI.Importance] : #High,
        },
        {
            $Type : 'UI.DataField',
            Value : to_TicketForWhom.to_personnel_PersonnelUUID,
            Label : 'Ticket For Whom',
        },
        {
            $Type : 'UI.DataField',
            Value : to_TicketOwner.to_personnel_PersonnelUUID,
            Label : 'Ticket Owner',
        },
        {
            $Type : 'UI.DataField',
            Value : to_TicketForInformation.to_personnel_PersonnelUUID,
            Label : 'Ticket Information'
        }
    ]
);
