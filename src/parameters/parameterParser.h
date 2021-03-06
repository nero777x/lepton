#ifndef LEPTON_PARAMETER_PARSER_2_H
#define LEPTON_PARAMETER_PARSER_2_H

#include <utility>
#include <stdexcept>
#include <string>
#include <unordered_map>
#include <vector>

#include "../files/drachmaAppFileReader.h"
#include "../files/leptonSpecFileReader.h"

using params_map_t = std::unordered_multimap<std::string, std::string>;

struct parsedFileContents {
  params_map_t params_map;
  std::vector<std::string> data;
};

struct regionAndModuleCounts {

  unsigned sr_count_;
  unsigned rr_count_;
  std::vector<unsigned> sr_module_counts_;
  std::vector<unsigned> rr_module_counts_;

  regionAndModuleCounts();
};

// Collection of functions that use the file handler to parse input files for relevant parameters.
struct parameterParser {

  parsedFileContents parseLeptonSpecificationFile(const std::string &spec_file_path) const;
  regionAndModuleCounts countRegionsAndModules(const std::string &app_file_path) const;
};

#endif
