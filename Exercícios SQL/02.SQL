SELECT testimonials.id, users.name AS "writerId", users.name AS "recipientId", testimonials.message FROM testimonials JOIN users ON testimonials."writerId" = users.id;

--  INNER JOIN users ON testimonials."recipientId" = users.id

--  JOIN users ON testimonials."recipientId" = users.id