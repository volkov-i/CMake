/*/*===================================================================-*-C++-*-
  CMake - Cross Platform Makefile Generator
  Copyright 2000-2009 Kitware, Inc., Insight Software Consortium

  Distributed under the OSI-approved BSD License (the "License");
  see accompanying file Copyright.txt for details.

  This software is distributed WITHOUT ANY WARRANTY; without even the
  implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
  See the License for more information.
============================================================================*/
#ifndef cmInstallDirectoryGenerator_h
#define cmInstallDirectoryGenerator_h

#include "cmInstallGenerator.h"

/** \class cmInstallDirectoryGenerator
 * \brief Generate directory installation rules.
 */
class cmInstallDirectoryGenerator: public cmInstallGenerator
{
public:
  cmInstallDirectoryGenerator(std::vector<std::string> const& dirs,
                              const char* dest,
                              const char* file_permissions,
                              const char* dir_permissions,
                              std::vector<std::string> const& configurations,
                              const char* component,
                              MessageLevel message,
                              bool exclude_from_all,
                              const char* literal_args,
                              bool optional = false);
  virtual ~cmInstallDirectoryGenerator();

  void Compute(cmLocalGenerator* lg);

  std::string GetDestination(std::string const& config) const;

protected:
  virtual void GenerateScriptActions(std::ostream& os, Indent const& indent);
  virtual void GenerateScriptForConfig(std::ostream& os,
                                       const std::string& config,
                                       Indent const& indent);
  void AddDirectoryInstallRule(std::ostream& os,
                               const std::string& config,
                               Indent const& indent,
                               std::vector<std::string> const& dirs);
  cmLocalGenerator* LocalGenerator;
  std::vector<std::string> Directories;
  std::string FilePermissions;
  std::string DirPermissions;
  std::string LiteralArguments;
  bool Optional;
};

#endif
