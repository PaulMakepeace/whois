require 'test_helper'
require 'whois/answer/parser/whois.nic.bo'

class AnswerParserWhoisNicBoTest < Whois::Answer::Parser::TestCase

  def setup
    @klass  = Whois::Answer::Parser::WhoisNicBo
    @host   = "whois.nic.bo"
  end


  def test_domain
    parser    = @klass.new(load_part('status_registered.txt'))
    expected  = "google.bo"
    assert_equal_and_cached expected, parser, :domain

    parser    = @klass.new(load_part('status_available.txt'))
    expected  = nil
    assert_equal_and_cached expected, parser, :domain
  end

  def test_domain_id
    assert_raise(Whois::PropertyNotSupported) { @klass.new(load_part('status_registered.txt')).domain_id }
    assert_raise(Whois::PropertyNotSupported) { @klass.new(load_part('status_available.txt')).domain_id }
  end


  def test_status
    parser    = @klass.new(load_part('status_registered.txt'))
    expected  = :registered
    assert_equal_and_cached expected, parser, :status

    parser    = @klass.new(load_part('status_available.txt'))
    expected  = :available
    assert_equal_and_cached expected, parser, :status
  end

  def test_available?
    parser    = @klass.new(load_part('status_registered.txt'))
    expected  = false
    assert_equal_and_cached expected, parser, :available?

    parser    = @klass.new(load_part('status_available.txt'))
    expected  = true
    assert_equal_and_cached expected, parser, :available?
  end

  def test_registered?
    parser    = @klass.new(load_part('status_registered.txt'))
    expected  = true
    assert_equal_and_cached expected, parser, :registered?

    parser    = @klass.new(load_part('status_available.txt'))
    expected  = false
    assert_equal_and_cached expected, parser, :registered?
  end


  def test_created_on
    parser    = @klass.new(load_part('status_registered.txt'))
    expected  = Time.parse("2006-08-22")
    assert_equal_and_cached expected, parser, :created_on

    parser    = @klass.new(load_part('status_available.txt'))
    expected  = nil
    assert_equal_and_cached expected, parser, :created_on
  end

  def test_updated_on
    assert_raise(Whois::PropertyNotSupported) { @klass.new(load_part('status_registered.txt')).updated_on }
    assert_raise(Whois::PropertyNotSupported) { @klass.new(load_part('status_available.txt')).updated_on }
  end

  def test_expires_on
    parser    = @klass.new(load_part('status_registered.txt'))
    expected  = Time.parse("2011-08-22")
    assert_equal_and_cached expected, parser, :expires_on

    parser    = @klass.new(load_part('status_available.txt'))
    expected  = nil
    assert_equal_and_cached expected, parser, :expires_on
  end


  def test_nameservers
    assert_raise(Whois::PropertyNotSupported) { @klass.new(load_part('status_registered.txt')).nameservers }
    assert_raise(Whois::PropertyNotSupported) { @klass.new(load_part('status_available.txt')).nameservers }
  end

end
