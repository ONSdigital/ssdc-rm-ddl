-- ****************************************************************************
-- RM SQL DATABASE INSERT ROLLBACK SCRIPT
-- ****************************************************************************
-- Number: 200
-- Purpose: Rollback script for Support UI permissions insert
-- Author: Liam Toozer
-- ****************************************************************************

-- RM SUPPORT ACTIONS
DELETE FROM casev3.user_group_permission WHERE id = '938cee41-3ad7-4740-af07-1501a2931d90';
DELETE FROM casev3.user_group_permission WHERE id = 'e454c6a4-37b8-48f2-b180-33a6d1dac0db';
DELETE FROM casev3.user_group_permission WHERE id = '08be718e-0afd-4320-9cf7-1531e84f69da';
DELETE FROM casev3.user_group_permission WHERE id = 'b853b901-8159-40d0-a373-309ff32f8bca';
DELETE FROM casev3.user_group_permission WHERE id = '13c8f54e-9ed1-40e2-a89d-d5714a2b9e46';
DELETE FROM casev3.user_group_permission WHERE id = 'bd0a7643-8db3-4b52-ba8c-ff62aa3068fd';
DELETE FROM casev3.user_group_permission WHERE id = '3c2cd0bd-9c7d-4802-b01d-a9d62b24d37c';
DELETE FROM casev3.user_group_permission WHERE id = 'ce7c2e7e-8b0f-483a-b80c-1dbc3e6a91ba';
DELETE FROM casev3.user_group_permission WHERE id = '0f24d3c2-d625-41f8-b1a6-9f42f4de60a9';
DELETE FROM casev3.user_group_permission WHERE id = 'd57bc0aa-e98b-4f7e-85b5-5c9bcfa284db';
DELETE FROM casev3.user_group_permission WHERE id = 'c6424f68-87a5-417d-9ea1-2969795ee01a';
DELETE FROM casev3.user_group_permission WHERE id = 'b87d94b9-f916-420f-90cc-52705fc415b8';
DELETE FROM casev3.user_group_permission WHERE id = '1b5219ca-9e56-4b49-9208-95edc6ead0d3';
DELETE FROM casev3.user_group_permission WHERE id = '7d9324aa-deb7-4da7-bd38-4c89345a7ecd';
DELETE FROM casev3.user_group_permission WHERE id = '188a309b-c4cb-4e84-9846-aefec2929216';
DELETE FROM casev3.user_group_permission WHERE id = '825179c4-076d-49c4-81d5-53848b288b48';
DELETE FROM casev3.user_group_permission WHERE id = '54c61071-4c61-4477-8b83-071d7314f943';
DELETE FROM casev3.user_group_permission WHERE id = 'b787fba3-1bf0-4ea4-be66-ed71e235be02';
DELETE FROM casev3.user_group_permission WHERE id = '5b34b96b-b813-4cab-af07-ea6e9c3c2d0d';
DELETE FROM casev3.user_group_permission WHERE id = '6a4dd655-423d-4d56-bc38-604a61e55721';
DELETE FROM casev3.user_group_permission WHERE id = '4b244c4d-d3ca-4841-a396-d03dc200396f';
DELETE FROM casev3.user_group_permission WHERE id = '5798a4a2-9ab8-4509-9f88-71fde81e6948';
DELETE FROM casev3.user_group_permission WHERE id = '5cfe474a-71f3-46bf-b9fe-fa6388c8c9da';
DELETE FROM casev3.user_group_permission WHERE id = 'c484fdc8-3bfd-40ad-b608-75b9d94b434e';
DELETE FROM casev3.user_group_permission WHERE id = '336002f6-b98b-40dc-acf6-6490b6348d8e';
DELETE FROM casev3.user_group_permission WHERE id = '20348a51-352f-4f2d-98d3-d6549110b9bf';
DELETE FROM casev3.user_group_permission WHERE id = '07d11c99-a41b-4039-b1e2-90d13b190783';
DELETE FROM casev3.user_group_permission WHERE id = '96dfd6f3-3692-4c03-8989-f19156854d36';

DELETE FROM casev3.user_group WHERE id = 'a25c7f99-d2ce-4267-aea4-0a133028f793';


-- RM SUPPORT
DELETE FROM casev3.user_group_permission WHERE id = '6f655e60-be27-4092-84e0-3b64971a4dac';
DELETE FROM casev3.user_group_permission WHERE id = '81e78da1-5e2a-4457-a2ee-cc12c884f2fa';
DELETE FROM casev3.user_group_permission WHERE id = 'ff682c9f-11db-42be-9e22-b384cf96557e';
DELETE FROM casev3.user_group_permission WHERE id = 'db5e3d2b-0bb1-4fcd-a99b-0f90a319ba04';
DELETE FROM casev3.user_group_permission WHERE id = '0fefc7ac-3548-49a8-8f5c-512b1e319ecc';
DELETE FROM casev3.user_group_permission WHERE id = '900abc3c-ee97-4101-81ca-09f753651109';
DELETE FROM casev3.user_group_permission WHERE id = '191408ca-7579-4135-a070-c5c9c3907b51';
DELETE FROM casev3.user_group_permission WHERE id = '7ebd8b21-e90d-4c76-b98c-984146137507';
DELETE FROM casev3.user_group_permission WHERE id = 'f1f526ee-a10e-4772-923b-ec3586826cbf';
DELETE FROM casev3.user_group_permission WHERE id = '9fabaeb6-479f-4474-b22f-4ce1e9c06f9c';
DELETE FROM casev3.user_group_permission WHERE id = '40d65e5c-5a07-43c8-8243-c263e2d26b78';
DELETE FROM casev3.user_group_permission WHERE id = '44945e73-f295-42b6-b240-d5d9aa57b217';
DELETE FROM casev3.user_group_permission WHERE id = '81395c04-416c-4e3f-9397-83a08ac8bdf2';
DELETE FROM casev3.user_group_permission WHERE id = 'cc542d88-b1e6-4ab0-ba09-9857a4cc5877';
DELETE FROM casev3.user_group_permission WHERE id = '53d7355d-fce6-40e1-9dd9-17af1d9a0dfc';
DELETE FROM casev3.user_group_permission WHERE id = '60e8bf0b-079d-4784-89b9-ab8613f23af0';
DELETE FROM casev3.user_group_permission WHERE id = '29a3b8ac-81ca-41c7-be4a-ceb57071a8c8';
DELETE FROM casev3.user_group_permission WHERE id = '80363171-0e29-4f01-b1f9-17272da66552';
DELETE FROM casev3.user_group_permission WHERE id = '23a7f3a1-194f-4455-adbd-e3da1047a88e';
DELETE FROM casev3.user_group_permission WHERE id = '91f93759-a0ba-41e6-b368-d331efb01366';
DELETE FROM casev3.user_group_permission WHERE id = '28e30f2e-2d1b-4fa1-92ca-cd8323179c55';
DELETE FROM casev3.user_group_permission WHERE id = '26cf0f7a-7f0f-4e5b-8be2-640745be9cdf';
DELETE FROM casev3.user_group_permission WHERE id = '18c78ba8-17ec-4c09-972d-c1c6c88359d5';

DELETE FROM casev3.user_group WHERE id = 'b19a77bd-6a02-4851-8116-9e915738b700';

-- support
DELETE FROM casev3.user_group_permission WHERE id = 'c469377e-680e-4cb1-92a0-5217be2b3a52';

DELETE FROM casev3.user_group WHERE id = '8269d75c-bfa1-4930-aca2-10dd9c6a2b42';
