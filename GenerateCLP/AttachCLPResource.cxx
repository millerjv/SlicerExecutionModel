#include <fstream>
#include <iterator>
#include <algorithm>
#include <string>
#include <iostream>

int main(int argc, char* argv[])
{
  //std::cout << argv[0] << " " << argv[1] << " " << argv[2] << std::endl;

  if (argc != 3)
  {
    std::cerr << "Usage: AttachCLPResource resourceFileName targetFileName"
                  << std::endl;
    return EXIT_FAILURE;
  }

  std::string resourceFileName(argv[1]);
  std::string targetFileName(argv[2]);

  std::ifstream resourceFile(resourceFileName.c_str(), std::ios::in | std::ios::binary);
  std::ofstream targetFile(targetFileName.c_str(), std::ios::app | std::ios::binary);

  std::copy(
          std::istreambuf_iterator<char>(resourceFile),
          std::istreambuf_iterator<char>( ),
          std::ostreambuf_iterator<char>(targetFile));

  return EXIT_SUCCESS;
}
