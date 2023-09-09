using TicketService as service from '../../srv/ticket-service';



annotate service.Ticket with @(
    UI.SelectionFields : [
        TicketUUID,
        Subject,
        TicketStat_code,
        to_User.to_personnel_PersonnelUUID,
        TicketPriorityStat_code,
    ]
);
annotate service.Ticket with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : TicketUUID,
            Label : 'Ticket Numarası',
        },
        {
            $Type : 'UI.DataField',
            Value : Subject,
            Label : 'Konu',
        },
        {
            $Type : 'UI.DataField',
            Value : createdAt,
            Label : 'Oluşturma Tarihi',
        },
        {
            $Type : 'UI.DataField',
            Value : TicketPriorityStat.name,
            Label : 'Aciliyet Durumu',
            Criticality : TicketPriorityStat.criticality
        },
        {
            $Type : 'UI.DataField',
            Value : TicketStat.name,
            Label : 'Ticket Durumu',
            Criticality: TicketStat.criticality
        }
    ]
);

annotate service.Ticket with @(
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Ticket Detay',
            ID : 'TicketDetay',
            Target : '@UI.FieldGroup#TicketDetay',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Ticket Personelleri',
            ID : 'TicketPersonelleri',
            Target : 'to_User/@UI.LineItem#TicketPersonelleri',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'deneme',
            ID : 'deneme',
            Target : 'to_Comment/@UI.LineItem#deneme',
        }
    ],
    UI.FieldGroup #TicketDetay : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : createdAt,
            },{
                $Type : 'UI.DataField',
                Value : Subject,
            },{
                $Type : 'UI.DataField',
                Value : TicketUUID,
            },{
                $Type : 'UI.DataField',
                Value : TicketPriorityStat.name,
                Criticality : TicketPriorityStat.criticality
            },{
                $Type : 'UI.DataField',
                Value : TicketStat.name,
                Criticality: TicketStat.criticality
            },],
    }
);

annotate service.TicketUser with @(
    UI.LineItem #TicketPersonelleri : [
        {
            $Type : 'UI.DataFieldForAnnotation',
            Target : '@Communication.Contact#contact',
            Label : 'Personel',
            ![@UI.Importance] : #High,
        },
        {
            $Type : 'UI.DataField',
            Value : UserRole.name,
            Label : 'Ticket Rolü'
        },
        {
        $Type : 'UI.DataFieldForAction',
        Label : 'Rol Değiştir',
        Action: 'TicketService.changeUserRole',
        Inline: true
    },]
);
annotate service.TicketUser with @(
    Communication.Contact #contact : {
        $Type : 'Communication.ContactType',
        fn : to_personnel.PersonnelName,
        title : to_personnel.PersonnelDepartment.name,
        role : to_personnel.PersonnelDepartment.name,
        org : to_personnel.PersonnelDepartment.name,
        tel : [
            {
                $Type : 'Communication.PhoneNumberType',
                type : #work,
                uri : to_personnel.PersonnelPhone,
            },
        ],
        email : [
            {
                $Type : 'Communication.EmailAddressType',
                type : #work,
                address : to_personnel.PersonnelMail,
            },
        ],
        adr : [
            {
                $Type : 'Communication.AddressType',
                type : #work,
                country : to_personnel.PersonnelAddress,
            },
        ],
    }
);
annotate service.Comments with @(
    UI.LineItem #deneme : [
        {
            $Type : 'UI.DataField',
            Value : Comment,
            Label : 'Comment',
        },{
            $Type : 'UI.DataField',
            Value : to_Personnel_PersonnelUUID,
            Label : 'to_Personnel_PersonnelUUID',
        },]
);
