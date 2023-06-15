CREATE TABLE `users` (
                         `id` bigint(20) NOT NULL AUTO_INCREMENT,
                         `username` varchar(255) NOT NULL,
                         `password` varchar(255) NOT NULL,
                         PRIMARY KEY (`id`)
);

CREATE TABLE `roles` (
                         `id` bigint(20) NOT NULL AUTO_INCREMENT,
                         `name` varchar(255) NOT NULL,
                         PRIMARY KEY (`id`)
);

CREATE TABLE `user_roles` (
                              `user_id` bigint(20) NOT NULL,
                              `role_id` bigint(20) NOT NULL,
                              PRIMARY KEY (`user_id`, `role_id`),
                              FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
                              FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
);

INSERT INTO roles(name) VALUES ('ROLE_ADMIN');
INSERT INTO roles(name) VALUES ('ROLE_USER');

INSERT INTO users(username, password) VALUES ('admin', SHA2('admin', 256));
INSERT INTO users(username, password) VALUES ('user', SHA2('user', 256));

INSERT INTO user_roles(user_id, role_id) VALUES (1, 1); -- admin a le rôle ADMIN
INSERT INTO user_roles(user_id, role_id) VALUES (2, 2); -- user a le rôle USER
