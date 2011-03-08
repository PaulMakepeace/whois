require 'test_helper'
require 'whois/answer/parser/whois.nic.tel'

class AnswerParserWhoisNicTelTest < Whois::Answer::Parser::TestCase

  def setup
    @klass  = Whois::Answer::Parser::WhoisNicTel
    @host   = "whois.nic.tel"
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
    expected  = Time.parse("2009-04-19 12:36:25 GMT")
    assert_equal_and_cached expected, parser, :created_on

    parser    = @klass.new(load_part('status_available.txt'))
    expected  = nil
    assert_equal_and_cached expected, parser, :created_on
  end

  def test_updated_on
    parser    = @klass.new(load_part('status_registered.txt'))
    expected  = Time.parse("2009-04-20 12:39:49 GMT")
    assert_equal_and_cached expected, parser, :updated_on

    parser    = @klass.new(load_part('status_available.txt'))
    expected  = nil
    assert_equal_and_cached expected, parser, :updated_on
  end

  def test_expires_on
    parser    = @klass.new(load_part('status_registered.txt'))
    expected  = Time.parse("2010-04-18 23:59:59 GMT")
    assert_equal_and_cached expected, parser, :expires_on

    parser    = @klass.new(load_part('status_available.txt'))
    expected  = nil
    assert_equal_and_cached expected, parser, :expires_on
  end


  def test_nameservers
    parser    = @klass.new(load_part('status_registered.txt'))
    expected  = %w( a0.cth.dns.nic.tel d0.cth.dns.nic.tel n0.cth.dns.nic.tel s0.cth.dns.nic.tel t0.cth.dns.nic.tel ).map { |ns| nameserver(ns) }
    assert_equal_and_cached expected, parser, :nameservers

    parser    = @klass.new(load_part('status_available.txt'))
    expected  = %w()
    assert_equal_and_cached expected, parser, :nameservers
  end

end
