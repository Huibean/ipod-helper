#!/usr/bin/env ruby

def remove_tracker_num(dirPath)
  dirPath = dirPath[0] if dirPath.class == Array
  Dir.foreach(dirPath) do |file|
    file_path = dirPath +"/"+ file
    if File::file?( file_path )
      if file != "." && file != ".." && file =~ /.m4a/
        origin_name = File::basename(dirPath+"/"+file)
        target_name = file
        if target_name[0] =~ /\d/ && target_name[1] =~ /\d/ && target_name[2] =~ /\s/
          1..3.times do 
            target_name[0] = ""
          end
          puts target_name
          File.rename(dirPath+"/"+origin_name , dirPath+"/"+target_name)
        end
      end   
    elsif File::directory?( file_path )
      puts file_path
      remove_tracker_num(file_path)
    end 
  end
end

remove_tracker_num(ARGV)
