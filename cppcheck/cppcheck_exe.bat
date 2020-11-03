rem This works if run as administrator - otherwise no files are created
set GCOVEXE="C:\Program Files\Cppcheck\cppcheck.exe"
%GCOVEXE% --enable=all --template={file},{line},{severity},{id},\"{message}\" --project=./ACU.cppcheck --output-file=.\cppcheck_result.csv
pause
