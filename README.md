# G5 Foundation Client

[![Build Status](https://travis-ci.org/G5/g5_foundation_client.svg)](https://travis-ci.org/G5/g5_foundation_client)

A Ruby gem to access G5 services, including [g5-hub](https://github.com/g5/g5-hub).

### Installation

Include `g5_foundation_client` in your Gemfile, or manually install with rubygems.

### Usage

It's pretty limited right now. You may fetch a Location given a UID, which must point to a G5 Hub Location detail page.

```ruby
> model = G5FoundationClient::Location.find_by_uid("http://example.com/clients/g5-c-123-test/locations/g5-cl-123-test")
=> #<G5FoundationClient::Location:0x007f4aa8c25ef8
 @name="Location Name",
 @phone="123-123-1234",
 @uid=
  "http://example.com/clients/g5-c-123-test/locations/g5-cl-123-test">
> model.attributes
=> {:uid=>
  "http://example.com/clients/g5-c-123-test/locations/g5-cl-123-test",
 :name=>"Test Name",
 :phone=>"123-123-1234"}
```

If this gets much more complicated – and it will – you should probably use YARD and point to rdoc.info, or whatever documentation builder you set up.

### Contributing

Create a Github pull request. Please make sure that Travis CI passes before you do.
