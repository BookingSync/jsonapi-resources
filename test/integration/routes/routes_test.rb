require File.expand_path('../../../test_helper', __FILE__)

class RoutesTest < ActionDispatch::IntegrationTest

  def test_routing_post
    assert_routing({path: 'posts', method: :post},
                   {controller: 'posts', action: 'create'})
  end

  def test_routing_put
    assert_routing({path: '/posts/1', method: :put},
                   {controller: 'posts', action: 'update', id: '1'})
  end

  def test_routing_posts_show
    assert_routing({path: '/posts/1', method: :get},
                   {action: 'show', controller: 'posts', id: '1'})
  end

  def test_routing_posts_links_author_show
    assert_routing({path: '/posts/1/links/author', method: :get},
                   {controller: 'posts', action: 'show_association', post_id: '1', association: 'author'})
  end

  def test_routing_posts_links_author_destroy
    assert_routing({path: '/posts/1/links/author', method: :delete},
                   {controller: 'posts', action: 'destroy_association', post_id: '1', association: 'author'})
  end

  def test_routing_posts_links_author_create
    assert_routing({path: '/posts/1/links/author', method: :post},
                   {controller: 'posts', action: 'create_association', post_id: '1', association: 'author'})
  end

  def test_routing_posts_links_author_update
    assert_routing({path: '/posts/1/links/author', method: :put},
                   {controller: 'posts', action: 'update_association', post_id: '1', association: 'author'})
  end

  def test_routing_posts_links_tags_show
    assert_routing({path: '/posts/1/links/tags', method: :get},
                   {controller: 'posts', action: 'show_association', post_id: '1', association: 'tags'})
  end

  def test_routing_posts_links_tags_destroy
    assert_routing({path: '/posts/1/links/tags/1,2', method: :delete},
                   {controller: 'posts', action: 'destroy_association', post_id: '1', keys: '1,2', association: 'tags'})
  end

  def test_routing_posts_links_tags_create
    assert_routing({path: '/posts/1/links/tags', method: :post},
                   {controller: 'posts', action: 'create_association', post_id: '1', association: 'tags'})
  end

  def test_routing_posts_links_tags_update_acts_as_set
    assert_routing({path: '/posts/1/links/tags', method: :put},
                   {controller: 'posts', action: 'update_association', post_id: '1', association: 'tags'})
  end

  def test_routing_authors_show
    assert_routing({path: '/authors/1', method: :get},
                   {action: 'show', controller: 'authors', id: '1'})
  end

  def test_routing_author_links_posts_create_not_acts_as_set
    assert_routing({path: '/authors/1/links/posts', method: :post},
                   {controller: 'authors', action: 'create_association', author_id: '1', association: 'posts'})
  end

  # ToDo: Test that non acts as set has_many association update route is not created
  # def test_routing_author_links_posts_update_not_acts_as_set
  #   refute_routing({ path: '/authors/1/links/posts', method: :put },
  #                  { controller: 'authors', action: 'update_association', author_id: '1', association: 'posts' })
  # end

  # V1
  def test_routing_v1_posts_show
    assert_routing({path: '/api/v1/posts/1', method: :get},
                   {action: 'show', controller: 'api/v1/posts', id: '1'})
  end

  def test_routing_v1_posts_delete
    assert_routing({path: '/api/v1/posts/1', method: :delete},
                   {action: 'destroy', controller: 'api/v1/posts', id: '1'})
  end

  def test_routing_v1_posts_links_author_show
    assert_routing({path: '/api/v1/posts/1/links/author', method: :get},
                   {controller: 'api/v1/posts', action: 'show_association', post_id: '1', association: 'author'})
  end

  # V2
  def test_routing_v2_posts_show
    assert_routing({path: '/api/v2/authors/1', method: :get},
                   {action: 'show', controller: 'api/v2/authors', id: '1'})
  end

  def test_routing_v2_posts_links_author_show
    assert_routing({path: '/api/v2/posts/1/links/author', method: :get},
                   {controller: 'api/v2/posts', action: 'show_association', post_id: '1', association: 'author'})
  end

  def test_routing_v2_preferences_show
    assert_routing({path: '/api/v2/preferences', method: :get},
                   {action: 'show', controller: 'api/v2/preferences'})
  end

  # V3
  def test_routing_v3_posts_show
    assert_routing({path: '/api/v3/posts/1', method: :get},
                   {action: 'show', controller: 'api/v3/posts', id: '1'})
  end

  #primary_key
  def test_routing_primary_key_jsonapi_resources
    assert_routing({path: '/iso_currencies/USD', method: :get},
                   {action: 'show', controller: 'iso_currencies', code: 'USD'})
  end

  # ToDo: Refute routing
  # def test_routing_v3_posts_delete
  #   assert_routing({ path: '/api/v3/posts/1', method: :delete },
  #                  {action: 'destroy', controller: 'api/v3/posts', id: '1'})
  # end

  # def test_routing_posts_links_author_except_destroy
  #   assert_routing({ path: '/api/v3/posts/1/links/author', method: :delete },
  #                  { controller: 'api/v3/posts', action: 'destroy_association', post_id: '1', association: 'author' })
  # end
  #
  # def test_routing_posts_links_tags_only_create_show
  #   assert_routing({ path: '/api/v3/posts/1/links/tags/1,2', method: :delete },
  #                  { controller: 'api/v3/posts', action: 'destroy_association', post_id: '1', keys: '1,2', association: 'tags' })
  # end

  # Test that non acts as set has_many association update route is not created

end

