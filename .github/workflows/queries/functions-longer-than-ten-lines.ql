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
       f.getLocation().getFile() = file and
      f.getNumLines() > 10
select f, "Function longer than 10 lines in TypeScript file: " + file.getAbsolutePath() + " at line " + f.getLocation().getStartLine()