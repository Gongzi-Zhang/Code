import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

BufferedReader objReader = new BufferedReader(new FileReadder("filename"));

String line;
while ((line = objReader.readLine()) != null) {
    ...
}
objReader.close();
