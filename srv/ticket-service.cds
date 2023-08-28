using { sap.fe.cap.tickets as my } from '../db/schema';

service TicketService {

    entity Ticket as projection on my.Ticket;
    entity Personnel as projection on my.Personnel;
    entity TicketForWhom as projection on my.TicketForWhom;
    entity TicketOwner as projection on my.TicketOwner;
}