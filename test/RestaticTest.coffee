exec = require("child_process").exec
fs = require("fs")

source = "./test/demo_data/source_folder_example"
target = "./test/demo_data/target_folder_example"

describe "SiteParser", ->
    it "should be able to parse data correctly to demo target", ->
        cmd = "./bin/restatic -s " + source + " -t " + target
        console.log cmd
        exec cmd, ->
            content = fs.readFileSync(target + "/snippet.html")
            content.replace("/-Posts-B1-/", "").should.not.be.eql content
            done()