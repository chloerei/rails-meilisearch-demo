class CreatePostSearchIndex < ActiveRecord::Migration[7.0]
  def change
    # postgres
    add_index :posts, %q[(to_tsvector('simple', coalesce("posts"."headline"::text, '')) || to_tsvector('simple', coalesce("posts"."content"::text, '')))], using: :gin, name: "index_posts_on_pg_search"

    # postgres-zhparser
    # execute <<~SQL
    #   CREATE EXTENSION zhparser;
    #   CREATE TEXT SEARCH CONFIGURATION chinese (PARSER = zhparser);
    #   ALTER TEXT SEARCH CONFIGURATION chinese ADD MAPPING FOR n,v,a,i,e,l WITH simple;
    # SQL
    # add_index :posts, %q[(to_tsvector('chinese', coalesce("posts"."headline"::text, '')) || to_tsvector('chinese', coalesce("posts"."content"::text, '')))], using: :gin, name: "index_posts_on_pg_search"

    # postgres-jieba
    # execute <<~SQL
    #   CREATE EXTENSION jieba;
    # SQL
    # add_index :posts, %q[(to_tsvector('jiebaqry', coalesce("posts"."headline"::text, '')) || to_tsvector('jiebaqry', coalesce("posts"."content"::text, '')))], using: :gin, name: "index_posts_on_pg_search"
  end
end
