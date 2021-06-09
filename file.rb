
module File_
  class File_Help
    def self.read(file_name)
      File.open(file_name, 'r') {|f| f.read }
    end

    def self.write(file_name, text)
      File.open(file_name, 'w') {|f| f.write(text) }
    end
  end
end
