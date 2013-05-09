require 'zipruby'
require 'net/http'

url = "http://apps.irs.gov/pub/epostcard/data-download-pub78.zip"

zipbytes = Net::HTTP.get(URI.parse(url))

Zip::Archive.open_buffer(zipbytes) do |zf|
  # this is a single file archive, so read the first file
  zf.fopen(zf.get_name(0)) do |f|
    unzipped = f.read
    puts unzipped
    # done! do something with the unzipped file.
  end
end
