using TicketService as service from '../../srv/ticket-service';

annotate service.Ticket with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : TicketStat_code,
            Label : 'Ticket Statu',
        },
        {
            $Type : 'UI.DataField',
            Value : TicketPriorityStat_code,
            Label : 'Ticket Priority',
        },
        {
            $Type : 'UI.DataField',
            Value : to_TicketForInformation.to_personnel_PersonnelUUID,
            Label : 'İnformation',
        },
    ]
);
