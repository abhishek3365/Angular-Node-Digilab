USE [companionproduction]
GO

/****** Object:  View [dbo].[USER_TYPE]    Script Date: 4/19/2018 2:55:27 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Script for SelectTopNRows command from SSMS  ******/

CREATE VIEW [dbo].[USER_TYPE]
AS
(SELECT        user_type = 'Admin', u.id AS user_id, a.id AS user_type_id, u.email, u.password, name = 'Test Admin'
FROM            Admin a, Users u
WHERE        a.Email = u.email)
UNION
(SELECT        user_type = 'Host', u.id AS user_id, dh.id AS user_type_id, u.email, u.password, dh.name
 FROM            DigilabHost dh, Users u
 WHERE        dh.Email = u.email)
UNION
(SELECT        user_type = 'Guest', u.id AS user_id, g.id AS user_type_id, u.email, u.password, g.name
 FROM            Guest g, Users u
 WHERE        g.Email = u.email)
UNION
(SELECT        user_type = 'Receptionist', u.id AS user_id, u.id AS user_type_id, u.email, u.password , u.name
 FROM            Digilab d, Users u
 WHERE        d.ReceptionEmail = u.email)
 UNION
(SELECT        user_type = 'Initiator', u.id AS user_id, u.id AS user_type_id, u.email, u.password, u.name
 FROM            Users u
 WHERE        u.email NOT IN
                              (SELECT        email
                                FROM            Admin
                                UNION
                                SELECT        email
                                FROM            SessionHost
                                UNION
                                SELECT        email
                                FROM            DigilabHost
                                UNION
                                SELECT        email
                                FROM            Guest
								UNION
								SELECT		ReceptionEmail
								FROM		Digilab))
GO


