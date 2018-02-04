require 'spec_helper'

describe(Jekyll::JekyllCloudCannonSchedule) do
  let(:overrides) { Hash.new }
  let(:config) do
    Jekyll.configuration(Jekyll::Utils.deep_merge_hashes({
      "full_rebuild" => true,
      "source"      => source_dir,
      "destination" => dest_dir,
      "show_drafts" => true,
      "url"         => "http://example.org",
      "name"       => "My awesome site",
      "author"      => {
        "name"        => "Dr. Jekyll"
      },
      "collections" => {
        "my_collection" => { "output" => true },
        "other_things"  => { "output" => false }
      }
    }, overrides))
  end
  let(:site)     { Jekyll::Site.new(config) }
  let(:contents) { File.read(dest_dir("schedule.txt")) }
  let(:context)  { make_context(site: site) }
  before(:each) do
    site.process
  end

  it "has no layout" do
    expect(contents).not_to match(/\ATHIS IS MY LAYOUT/)
  end

  it "creates a schedule.txt file" do
    expect(Pathname.new(dest_dir("schedule.txt"))).to exist
  end

  it "has empty lines or formatted lines" do
    lines = contents.split("\n")

    lines.each do |line|
      parts = line.split ", "
      if parts.length < 2
        expect(line).to match(/^\s+$/)
      else
        expect(parts[0].to_s).to match /\d{4}-[01]\d-[0-3]\dT[0-2]\d:[0-5]\d:[0-5]\d([+-][0-2]\d:[0-5]\d|Z)/
        expect(parts[1].to_s).to match /Build \'.*\'/
        expect(parts[2].to_s).to match /_posts\/\d{4}-[01]\d-[0-3]\d-(.*)\.(md|html)$/
      end
    end

  end
end