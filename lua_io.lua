return {
    io = {
        new = function(self, stdin, stdout)
            local obj = {
                stdin   = stdin;
                stdout  = stdout;
                write   = getmetatable(stdin).__index.write;
                read    = getmetatable(stdout).__index.read;
            }
            return setmetatable(obj, {__index=self})
        end;
        
        print = function(self, ...)
            local msg = table.concat({...}, " ") .. "\n"
            self.write(self.stdout, msg)
        end;
        
        input = function(self, msg)
            self.write(self.stdout, msg)
            return self.read(self.stdin)
        end;
    }
}
