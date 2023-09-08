using { sap.fe.cap.tickets as my } from '../db/schema';

@odata.draft.enabled
service TicketService @(path:'/ticketservice') {

    entity Ticket as projection on my.Ticket;
    entity Personnel as projection on my.Personnel;
    entity TicketUser as projection on my.TicketUser actions {
        action changeUserRole(User_Role :  UserRoles: code);
    };
    entity Customer as projection on my.Customer;
    entity UserRoles as projection on my.UserRoles;
    entity Comments as projection on my.Comments;
}