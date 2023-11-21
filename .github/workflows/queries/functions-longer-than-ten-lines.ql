/**
 * @description find all functions longer than 10 lines
 * @kind problem
 * @id javascript/functions-longer-than-ten-lines
 * @problem.severity recommendation
 */
import javascript

predicate isJavaScriptOrTypeScriptFile(File file) {
  file.getExtension() = "ts" or file.getExtension() = "tsx"
}

from File file
where isJavaScriptOrTypeScriptFile(file) and 
       file.getLocation().getFile() = file and
      file.getNumLines() > 10
select file, "Function longer than 10 lines in TypeScript file: " + file.getAbsolutePath() + " at line " + file.getLocation().getStartLine()