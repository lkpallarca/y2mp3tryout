require 'open3'

OUTPUT_DIR = "path_to_directory"

print "Enter YouTube URL/s (hint: separate links with commas ','): "
youtube_urls = gets.chomp.split(",")

youtube_urls.each_with_index do |url, index|
  puts "Downlading url #{index + 1} of #{youtube_urls.count}"
  download_video(url.strip, (index + 1))
end

def download_video(url, index)
  command = "yt-dlp -x --audio-format mp3 -o '#{OUTPUT_DIR}/%(title)s.%(ext)s' #{url}"
  stdout, stderr, status = Open3.capture3(command)

  if status.success?
    puts "URL #{index} downloaded successfully!"
  else
    puts "Error downloading URL #{index}: #{stderr}"
  end
end

puts "\nDone!"
