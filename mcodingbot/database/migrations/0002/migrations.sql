CREATE TABLE user_highlights ();
CREATE TABLE highlights ();
ALTER TABLE user_words DROP CONSTRAINT word_id_fk;
ALTER TABLE user_words DROP CONSTRAINT user_id_fk;
DROP TABLE user_words;
DROP TABLE words;
ALTER TABLE user_highlights ADD COLUMN highlight_id SERIAL;
ALTER TABLE user_highlights ADD COLUMN user_id NUMERIC;
ALTER TABLE highlights ADD COLUMN id SERIAL;
ALTER TABLE highlights ADD COLUMN highlight VARCHAR(32);
ALTER TABLE user_highlights ALTER COLUMN highlight_id SET NOT NULL;
ALTER TABLE user_highlights ALTER COLUMN user_id SET NOT NULL;
ALTER TABLE highlights ALTER COLUMN id SET NOT NULL;
ALTER TABLE highlights ALTER COLUMN highlight SET NOT NULL;
ALTER TABLE highlights ADD CONSTRAINT highlight_unique UNIQUE ( highlight );
ALTER TABLE user_highlights ADD CONSTRAINT _user_highlights_highlight_id_user_id_primary_key PRIMARY KEY ( highlight_id , user_id );
ALTER TABLE highlights ADD CONSTRAINT _highlights_id_primary_key PRIMARY KEY ( id );
ALTER TABLE user_highlights ADD CONSTRAINT highlight_id_fk FOREIGN KEY ( highlight_id ) REFERENCES highlights ( id ) MATCH SIMPLE ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE user_highlights ADD CONSTRAINT user_id_fk FOREIGN KEY ( user_id ) REFERENCES users ( user_id ) MATCH SIMPLE ON DELETE CASCADE ON UPDATE CASCADE;