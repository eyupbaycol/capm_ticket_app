using { TicketService } from '../srv/ticket-service';


annotate TicketService.TicketUser actions{
    changeUserRole @(
        Common              : {SideEffects: {
            $Type           : 'Common.SideEffectsType',
            SourceProperties: ['in/UserRole_code'],
            TargetProperties: ['in/UserRole/name']
        }, }
    )
}
