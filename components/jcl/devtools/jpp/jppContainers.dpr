{ **************************************************************************** }
{                                                                              }
{    Pascal PreProcessor                                                       }
{    Copyright (c) 2001 Barry Kelly.                                           }
{    barry_j_kelly@hotmail.com                                                 }
{                                                                              }
{    The contents of this file are subject to the Mozilla Public License       }
{    Version 1.1 (the "License"); you may not use this file except in          }
{    compliance with the License. You may obtain a copy of the License at      }
{    http://www.mozilla.org/MPL/                                               }
{                                                                              }
{    Software distributed under the License is distributed on an "AS IS"       }
{    basis, WITHOUT WARRANTY OF ANY KIND, either express or implied. See the   }
{    License for the specific language governing rights and limitations        }
{    under the License.                                                        }
{                                                                              }
{    The Original Code is ppp.dpr                                              }
{                                                                              }
{    The Initial Developer of the Original Code is Barry Kelly.                }
{    Portions created by Barry Kelly are Copyright (C) 2001                    }
{    Barry Kelly. All Rights Reserved.                                         }
{                                                                              }
{    Contributors:                                                             }
{      Robert Rossmair,                                                        }
{      Peter Th�rnqvist,                                                       }
{      Florent Ouchet                                                          }
{                                                                              }
{    Alternatively, the contents of this file may be used under the terms      }
{    of the Lesser GNU Public License (the  "LGPL License"), in which case     }
{    the provisions of LGPL License are applicable instead of those            }
{    above.  If you wish to allow use of your version of this file only        }
{    under the terms of the LPGL License and not to allow others to use        }
{    your version of this file under the MPL, indicate your decision by        }
{    deleting  the provisions above and replace  them with the notice and      }
{    other provisions required by the LGPL License.  If you do not delete      }
{    the provisions above, a recipient may use your version of this file       }
{    under either the MPL or the LPGL License.                                 }
{                                                                              }
{ **************************************************************************** }

// Last modified: $Date: 2010-08-09 17:10:10 +0200 (lun., 09 août 2010) $

{$APPTYPE CONSOLE}
program jpp;

uses
  SysUtils,
  JppState in 'JppState.pas',
  JppParser in 'JppParser.pas',
  JppLexer in 'JppLexer.pas',
  JppMain in 'JppMain.pas',
  JclTemplates in 'Templates\JclTemplates.pas',
  JclContainerTypes in 'Templates\JclContainerTypes.pas',
  JclAlgorithmsTemplates in 'Templates\JclAlgorithmsTemplates.pas',
  JclArrayListsTemplates in 'Templates\JclArrayListsTemplates.pas',
  JclArraySetsTemplates in 'Templates\JclArraySetsTemplates.pas',
  JclBinaryTreesTemplates in 'Templates\JclBinaryTreesTemplates.pas',
  JclContainerIntfTemplates in 'Templates\JclContainerIntfTemplates.pas',
  JclContainerKnownTypes in 'Templates\JclContainerKnownTypes.pas',
  JclContainerTemplates in 'Templates\JclContainerTemplates.pas',
  JclLinkedListsTemplates in 'Templates\JclLinkedListsTemplates.pas',
  JclQueuesTemplates in 'Templates\JclQueuesTemplates.pas',
  JclStacksTemplates in 'Templates\JclStacksTemplates.pas',
  JclVectorsTemplates in 'Templates\JclVectorsTemplates.pas',
  JclTreesTemplates in 'Templates\JclTreesTemplates.pas',
  JclContainer1DTemplates in 'Templates\JclContainer1DTemplates.pas',
  JclContainer2DTemplates in 'Templates\JclContainer2DTemplates.pas',
  JclContainerKnownMaps in 'Templates\JclContainerKnownMaps.pas',
  JclHashMapsTemplates in 'Templates\JclHashMapsTemplates.pas',
  JclSortedMapsTemplates in 'Templates\JclSortedMapsTemplates.pas';

var
  CommandLine: string;
  i: Integer;
  State: TJclContainerParams;
begin
  try
    {$IFDEF DEBUG}
    CheckJclContainers;
    {$ENDIF DEBUG}
    State := TJclContainerParams.Create;
    try
      i := 1;
      if ParamCount = 0 then
        Syntax
      else
      begin
        while i <= ParamCount do
        begin
          CommandLine := CommandLine + ' ' + ParamStr(i);
          Inc(i);
        end;
        Params(State, PChar(CommandLine));
      end;
    finally
      State.Free;
    end;
  except
    on e: Exception do
      Writeln(e.Message);
  end;
end.
