require 'test_helper'
require 'whois/answer/parser/whois.pnina.ps'

class AnswerParserWhoisPninaPsTest < Whois::Answer::Parser::TestCase

  def setup
    @klass  = Whois::Answer::Parser::WhoisPninaPs
    @host   = "whois.pnina.ps"
  end


  def test_status
    parser    = @klass.new(load_part('/registered.txt'))
    expected  = :registered
    assert_equal  expected, parser.status
    assert_equal  expected, parser.instance_eval { @status }

    parser    = @klass.new(load_part('/available.txt'))
    expected  = :available
    assert_equal  expected, parser.status
    assert_equal  expected, parser.instance_eval { @status }
  end

  def test_available?
    parser    = @klass.new(load_part('/registered.txt'))
    expected  = false
    assert_equal  expected, parser.available?
    assert_equal  expected, parser.instance_eval { @available }

    parser    = @klass.new(load_part('/available.txt'))
    expected  = true
    assert_equal  expected, parser.available?
    assert_equal  expected, parser.instance_eval { @available }
  end

  def test_registered?
    parser    = @klass.new(load_part('/registered.txt'))
    expected  = true
    assert_equal  expected, parser.registered?
    assert_equal  expected, parser.instance_eval { @registered }

    parser    = @klass.new(load_part('/available.txt'))
    expected  = false
    assert_equal  expected, parser.registered?
    assert_equal  expected, parser.instance_eval { @registered }
  end


  def test_created_on
    parser    = @klass.new(load_part('/registered.txt'))
    expected  = Time.parse("2004-05-19")
    assert_equal  expected, parser.created_on
    assert_equal  expected, parser.instance_eval { @created_on }

    parser    = @klass.new(load_part('/available.txt'))
    expected  = nil
    assert_equal  expected, parser.created_on
    assert_equal  expected, parser.instance_eval { @created_on }
  end

  def test_updated_on
    assert_raise(Whois::PropertyNotSupported) { @klass.new(load_part('/registered.txt')).updated_on }
    assert_raise(Whois::PropertyNotSupported) { @klass.new(load_part('/available.txt')).updated_on }
  end

  def test_expires_on
    parser    = @klass.new(load_part('/registered.txt'))
    expected  = Time.parse("2011-05-19")
    assert_equal  expected, parser.expires_on
    assert_equal  expected, parser.instance_eval { @expires_on }

    parser    = @klass.new(load_part('/available.txt'))
    expected  = nil
    assert_equal  expected, parser.expires_on
    assert_equal  expected, parser.instance_eval { @expires_on }
  end


  def test_nameservers
    parser    = @klass.new(load_part('/registered.txt'))
    expected  = %w( ns1.google.com ns2.google.com ns3.google.com )
    assert_equal  expected, parser.nameservers
    assert_equal  expected, parser.instance_eval { @nameservers }

    parser    = @klass.new(load_part('/available.txt'))
    expected  = %w()
    assert_equal  expected, parser.nameservers
    assert_equal  expected, parser.instance_eval { @nameservers }
  end

  def test_nameservers_with_nodns
    parser    = @klass.new(load_part('/property_nameservers_with_nodns.txt'))
    expected  = %w( ns1.pnn-ps.com )
    assert_equal  expected, parser.nameservers
    assert_equal  expected, parser.instance_eval { @nameservers }
  end

end