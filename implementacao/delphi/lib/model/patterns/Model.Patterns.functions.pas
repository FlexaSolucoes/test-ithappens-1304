unit Model.Patterns.functions;

interface


{$REGION 'directivas'}
{$IFDEF MSWINDOWS}
{$WARN UNIT_PLATFORM ON}
{$WARN SYMBOL_PLATFORM OFF}
{$ENDIF}
{$IFDEF LINUX}
{$WARN UNIT_PLATFORM ON}
{$WARN SYMBOL_PLATFORM OFF}
{$ENDIF}
{$ENDREGION}
{$REGION 'uses'}

uses
  Winapi.Windows                 ,
  Winapi.Messages                ,
  Winapi.ShellApi                ,
  Winapi.Wininet                 ,
  Winapi.ImageHlp                ,
  System.Win.Registry            ,
  System.SysUtils                ,
  System.Classes                 ,
  System.Variants                ,
  System.Math                    ,
  System.RTLConsts               ,
  System.Types                   ,
  Vcl.Graphics                   ,
  Vcl.Forms                      ,
  Vcl.ExtCtrls                   ,
  Vcl.StdCtrls                   ,
  Vcl.ComCtrls                   ,
  Vcl.Controls                   ,
  Vcl.Grids                      ,
  Vcl.Buttons                    ,
  Vcl.ClipBrd                    ,
  Vcl.Dialogs                    ,
  Vcl.Printers                   ,
  Vcl.Mask                       ,
  Vcl.GraphUtil                  ,
  Model.Patterns.functions.config;
{$ENDREGION}
{$REGION 'const'}

const
  DefaultColorFrame: TColor = $00E9E0CF;

const
  PercentChar = '%';

const
  CMaskCPF = '000.000.000-00';

const
  CMaskCNPJ = '00.000.000/0000-00';

const
  CMaskCEPLOG = '00000-000';

const
  CMaskCPFFormat = '   .   .   -  ';

const
  CMaskCNPJFormat = '  .   .   /    -  ';

const
  CMaskDate = '00/00/0000';

const
  CMaskDateShort = '00/00/00';

const
  CMaskTime = '00:00:00';

const
  CMaskDateTime = CMaskDate + ' ' + CMaskTime;

const
  CMaskTimeShort = '00:00';

const
  CMaskNrPlac = 'AAA-0000';

const
  CMaskEditCPF = '   .   .   -  ';

const
  CMaskEditCNPJ = '  .   .   /    -  ';

const
  CMaskEditCEPLOG = '     -   ';

const
  CMaskEditCPFFormat = '   .   .   -  ';

const
  CMaskEditCNPJFormat = '  .   .   /    -  ';

const
  CMaskEditDate = '  /  /    ';

const
  CMaskEditDateShort = '  /  /  ';

const
  CMaskEditTime = '  :  :  ';

const
  CMaskEditTimeShort = '  :  ';

const
  CMaskEditNrPlac = '   -    ';

const
  CMaskKeyNFe = '    -    -    -    -    -    -    -    -    -    -    ';
{$ENDREGION}
{$REGION 'type'}

type

  // ********************************************************************
  Percent = Extended; // TIPO DE REAL
  Float = Extended; // TIPO DE REAL
  Numeric = Extended; // TIPO DE REAL
  Long = type Longint;
  // ********************************************************************
  DateTime = type TDateTime; // UMA DATA HORA
  TData = type TDate; // UMA DATA
  THora = type TTime; // UMA HORA
  // ********************************************************************
  TShowDialog = (cxInfo, cxWarning, cxQuest, cxQuestWarning, cxError);
  TDisplaPixel = (T1024x768, T800x600, T640x480); // CONFIGURAÇÕES DE VIDEO

  TDayWeek = (swDOM = 1, swSEG = 2, swTER = 3, swQUA = 4, swQUI = 5, swSEX = 6, swSAB = 7);

  // ********************************************************************                                                                              // LOCAL DE CRIAÇÃO DE LINK's
  TLocalDirectory = (ldCSIDL_DESKTOP, { <desktop> }
    ldCSIDL_INTERNET, { Internet Explorer (icon on desktop) }
    ldCSIDL_PROGRAMS, { Start Menu\Programs }
    ldCSIDL_CONTROLS, { My Computer\Control Panel }
    ldCSIDL_PRINTERS, { My Computer\Printers }
    ldCSIDL_PERSONAL, { My Documents.  This is equivalent to CSIDL_MYDOCUMENTS in XP and above }
    ldCSIDL_FAVORITES, { <user name>\Favorites }
    ldCSIDL_STARTUP, { Start Menu\Programs\Startup }
    ldCSIDL_RECENT, { <user name>\Recent }
    ldCSIDL_SENDTO, { <user name>\SendTo }
    ldCSIDL_BITBUCKET, { <desktop>\Recycle Bin }
    ldCSIDL_STARTMENU, { <user name>\Start Menu }
    ldCSIDL_MYDOCUMENTS, { logical "My Documents" desktop icon }
    ldCSIDL_MYMUSIC, { "My Music" folder }
    ldCSIDL_MYVIDEO, { "My Video" folder }
    ldCSIDL_DESKTOPDIRECTORY, { <user name>\Desktop }
    ldCSIDL_DRIVES, { My Computer }
    ldCSIDL_NETWORK, { Network Neighborhood (My Network Places) }
    ldCSIDL_NETHOOD, { <user name>\nethood }
    ldCSIDL_FONTS, { windows\fonts }
    ldCSIDL_TEMPLATES, ldCSIDL_COMMON_STARTMENU, { All Users\Start Menu }
    ldCSIDL_COMMON_PROGRAMS, { All Users\Start Menu\Programs }
    ldCSIDL_COMMON_STARTUP, { All Users\Startup }
    ldCSIDL_COMMON_DESKTOPDIRECTORY, { All Users\Desktop }
    ldCSIDL_APPDATA, { <user name>\Application Data }
    ldCSIDL_PRINTHOOD, { <user name>\PrintHood }
    ldCSIDL_LOCAL_APPDATA, { <user name>\Local Settings\Application Data (non roaming) }
    ldCSIDL_ALTSTARTUP, { non localized startup }
    ldCSIDL_COMMON_ALTSTARTUP, { non localized common startup }
    ldCSIDL_COMMON_FAVORITES, ldCSIDL_INTERNET_CACHE, ldCSIDL_COOKIES, ldCSIDL_HISTORY, ldCSIDL_COMMON_APPDATA, { All Users\Application Data }
    ldCSIDL_WINDOWS, { GetWindowsDirectory() }
    ldCSIDL_SYSTEM, { GetSystemDirectory() }
    ldCSIDL_PROGRAM_FILES, { C:\Program Files }
    ldCSIDL_MYPICTURES, { C:\Program Files\My Pictures }
    ldCSIDL_PROFILE, { USERPROFILE }
    ldCSIDL_SYSTEMX86, { x86 system directory on RISC }
    ldCSIDL_PROGRAM_FILESX86, { x86 C:\Program Files on RISC }
    ldCSIDL_PROGRAM_FILES_COMMON, { C:\Program Files\Common }
    ldCSIDL_PROGRAM_FILES_COMMONX86, { x86 C:\Program Files\Common on RISC }
    ldCSIDL_COMMON_TEMPLATES, { All Users\Templates }
    ldCSIDL_COMMON_DOCUMENTS, { All Users\Documents }
    ldCSIDL_COMMON_ADMINTOOLS, { All Users\Start Menu\Programs\Administrative Tools }
    ldCSIDL_ADMINTOOLS, { <user name>\Start Menu\Programs\Administrative Tools }
    ldCSIDL_CONNECTIONS, { Network and Dial-up Connections }
    ldCSIDL_COMMON_MUSIC, { All Users\My Music }
    ldCSIDL_COMMON_PICTURES, { All Users\My Pictures }
    ldCSIDL_COMMON_VIDEO, { All Users\My Video }
    ldCSIDL_RESOURCES, { Resource Directory }
    ldCSIDL_RESOURCES_LOCALIZED, { Localized Resource Directory }
    ldCSIDL_COMMON_OEM_LINKS, { Links to All Users OEM specific apps }
    ldCSIDL_CDBURN_AREA, { USERPROFILE\Local Settings\Application Data\Microsoft\CD Burning }
    ldCSIDL_COMPUTERSNEARME, { Computers Near Me (computered from Workgroup membership) }
    ldCSIDL_FLAG_CREATE, { combine with CSIDL_ value to force folder creation in SHGetFolderPath() }
    ldCSIDL_FLAG_DONT_VERIFY, { combine with CSIDL_ value to return an unverified folder path }
    ldCSIDL_FLAG_DONT_UNEXPAND, { combine with CSIDL_ value to avoid unexpanding environment variables }
    ldCSIDL_FLAG_NO_ALIAS, { combine with CSIDL_ value to insure non-alias versions of the pidl }
    ldCSIDL_FLAG_PER_USER_INIT, { combine with CSIDL_ value to indicate per-user init (eg. upgrade) }
    ldCSIDL_FLAG_MASK); { mask for all possible flag values }

  // ********************************************************************
  // TIPO DE PLATAFORMA É A DO WINDOWS
  TWINPlataform = (Win32s, WindowsNT40, Windows95, Windows95OSR2, Windows98, Windows98SE, Windows2000, WindowsMe, WindowsXP);
  TOSLanguage = (oslXXX = 0, oslING = 1, oslPTB = 2);

  TKindConection = (cnNone, cnModem, cnLAN, cnPROXI, cnModem_BUSY);
  TPosicao = (poEsquerda, poCentro, poDireita); // TIPO DE ALINHAMENTOS
  // ********************************************************************
  TUF = (ufNames, ufSiglas);
  // ********************************************************************
{$ENDREGION}
{$REGION 'procedure'}
procedure InvertValues(var V1, V2: Int64); overload;
procedure InvertValues(var V1, V2: Extended); overload;
procedure InvertValues(var V1, V2: TDateTime); overload;
procedure InvertValues(var V1, V2: Cardinal); overload;
procedure ClearArray(var Args: array of TObject; defaultValue: TObject = nil); overload;
procedure ClearArray(var Args: array of string; defaultValue: string = ''); overload;
procedure ClearArray(var Args: array of Integer; defaultValue: Integer = 0); overload;
procedure ClearArray(var Args: array of TDate; defaultValue: TDate = 0); overload;
procedure ClearArray(var Args: array of Float; defaultValue: Float = 0); overload;
procedure ClearArray(var Args: array of Byte; defaultValue: Byte = 0); overload;
function seekArray(var Args: array of string; value: string): Boolean;

procedure ClearVar(var xvar: string); overload;
procedure ClearVar(var xvar: Integer); overload;
procedure ClearVar(var xvar: TDate); overload;
procedure ClearVar(var xvar: Extended); overload;

procedure AlignToCenter(W: TWinControl);

procedure OpenFolderFile(Arquivo: string); // CHAMA PASTA VIA EXPLORER

procedure AlignForm(Form: TForm; Centralizar: Boolean); // ALINHA UM FORMULARIO AO SCREEN DO MONITOR
procedure SetUF(Item: Tstrings; OutType: TUF = ufSiglas); // CARREGA TODOS OS ESTADOS EM UMA LISTA

procedure GetDay(Item: Tstrings; CShort: Boolean); overload;
procedure GetMonth(Item: Tstrings; CShort: Boolean); overload;
procedure GetYear(Item: Tstrings; CStart: Integer; CEnd: Integer); overload;

function MonthInt(Value:String):Integer;


procedure SetAlfabeto(Items: Tstrings); // CARREGA ALFABETO EM UMA LISTA

procedure TopToGrid(AControl: TCustomControl; ATop: Integer; ARect: TRect);
// procedure M(Value:Float);overload;
// procedure M(Value:TDateTime);overload;
// procedure M(Value:string);overload;

procedure FixeMouse(Fixe: Boolean = False; X1: Integer = 0; Y1: Integer = 0; X2: Integer = 0; Y2: Integer = 0);
procedure CreateShortCut(FileName, NameLink: string; LocalIcon: string = ''; LocalLink: TLocalDirectory = ldCSIDL_DESKTOP); overload;
procedure CloseApplication(Const ApplicationTitle: string);
procedure PrepareDates(var D1, D2: TDate); overload;

{$ENDREGION}
{$REGION 'function'}
{$IFDEF SW_UNICODE}
{$ELSE}
function CharInSet(C: AnsiChar; const CharSet: TSysCharSet): Boolean;
{$ENDIF}
function valida_ean1318(ean: string): Boolean; // Dica número 1595 de www.deephi.rg3.net.
function ReadTextFile(FileName: string): string;

function IfNegativeSet(var value: Integer; NewValue: Integer): Integer; overload;
function IfNegativeSet(var value: Real; NewValue: Real): Real; overload;

// function Assigned(Value:Pointer):Boolean;
function FreeAndNiltry(var CPointer: Pointer): Boolean;
function NotAssigned(value: Pointer): Boolean;
function CompareDates(Date1, Date2: TDateTime): Boolean;
function ValideFloat(var Value1, Value2: Float): Boolean;
function ValideDatesCheck(MinDate, MaxDate: TDateTime): Boolean; overload;
function ValideDates(var MinDate, MaxDate: TDateTime): Boolean; overload;
function ValideTimes(var Value1, Value2: TDateTime): Boolean; overload;
function ValideInteger(var Value1, Value2: Int64): Boolean; overload;
function ValideInteger(var Value1, Value2: Integer): Boolean; overload;

function EncodeDateD(Year, Month, Day: Word): TDateTime;
function EncodeDateS(Year, Month, Day: Word): string;

function ToPositive(value: Int64): Int64; overload;
function ToPositive(value: Extended): Extended; overload;
function ToNagative(value: Int64): Int64; overload;
function ToNagative(value: Extended): Extended; overload;

function BetweenDat(value, Value1, Value2: TDateTime): Boolean;
function BetweenTim(value, Value1, Value2: TDateTime): Boolean;
function BetweenInt(value, Value1, Value2: Integer): Boolean;
function BetweenCar(value, Value1, Value2: Cardinal): Boolean;
function BetweenFlt(value, Value1, Value2: Float): Boolean;

function valueInStr(value: string; values: array of string): Boolean;
function valueInDat(value: TDateTime; values: array of TDateTime): Boolean;
function valueInTim(value: TDateTime; values: array of TDateTime): Boolean;
function valueInInt(value: Int64; values: array of Int64): Boolean;
function valueInCar(value: Cardinal; values: array of Cardinal): Boolean;
function valueInFlt(value: Extended; values: array of Extended): Boolean;

function QuoteString(value: string): string;
function Space(const Size: Integer): string;
function Asc(Character: Char): Cardinal;
function StrToLines(const value: string; const MaxCharsLines: Integer = -1): string;
function GetDecstring(var Source: string; const Size: Integer): string;

function PrepareDates(var D1, D2: string): Boolean; overload;
function PrepareDates(D1, D2: string; out Date1, Date2: TDate): Boolean; overload;

function Substrings(ValueText: string; strings: array of string; From: array of string): string;
function DecSpace(value: string): string;
function DecDecimal(value: Extended; OutDecimalCount: Integer): Float;
function DecimalCount(const value: Extended): Integer;
function DecimalFormat(const value: Extended; DecimalOutCount: Integer): Float;

function FormatMask(Mask: string; value: string): string;
function FormatPrint(const CFormat: string; Args: array of string; const SPos: Char = '_'): string;
function FrtFloat(const AValue: Extended; const AFormat: string = ''; const ADecSep: Char = '.'): String;

function DecInt(var value: Integer; CInc: Integer = 1): Integer; overload;
function DecFlt(var value: Float; CInc: Float = 1): Float; overload;
function DecStr(var value: string; iLength: Integer): string;

function IncStr(var value: string; const CIntStr: Integer): string; overload;
function IncStr(var value: string; const CStrInc: string): string; overload;
function IncStr(var value: string; CFormat: string; Args: array of const): string; overload;
function IncInt(var value: Integer; CInc: Integer = 1): Integer;
function IncFlt(var value: Float; CInc: Float = 1): Float;
function IncDta(var value: TDateTime; D: Word = 1; M: Word = 0; Y: Word = 0): TDateTime;
function IncTim(var value: TDateTime; S: Word = 0; M: Word = 0; H: Word = 0; Ms: Word = 0): TDateTime;

function UnicNumberShort(iLength: Integer = 4): string;
function UnicNumberLong(iLength: Integer = 6): string;

function CriarDir(Const Dir: string): Boolean; deprecated;
function ForceDirectories(const Dir: string): Boolean;

function DecOfValiable(var value: string; Const CharacterBreack: Char = #1; UseTrim: Boolean = True): string; overload;
function DecOfValiable(var value: string; LengthText: Integer): string; overload;
function FloatToUnix(value: Float): string; overload;
function FloatToUnix(value: string): string; overload;

function FUnx(value: Float): string; overload;
function FUnx(value: string): string; overload;

//function CreateForm(Form: TCForm): Pointer;
//function ShowForm(Form: TCForm): Integer; overload;
//function ShowForm(Form: TForm): Integer; overload;

function DecMonth(value: TDateTime; Month: Cardinal = 1): TDate;

function RoundUp(value: Extended): Int64; overload;
function RoundUp(value: string): Int64; overload;

function Round(value: string): Int64; overload;
function Round(value: Double): Int64; overload;
function Round(value: string; Out Surpluses: Extended): Int64; overload;
function Round(value: Double; Out Surpluses: Extended): Int64; overload;

function CDiv(dividendo, divisor: Extended; simple: Boolean = False): Extended;
function CountDays(Date1, Date2: TDate): Integer;
function CountMonths(Date1, Date2: TDate): Integer;
function CountYears(Date1, Date2: TDate): Integer;
function MoveDates(var Date1, Date2: string): Boolean;
function WeekNumberOfTheMonth(Date: TDate): Integer;

function MaxDayOfMonth(Month, Year: Integer): TDate;
function MinDayOfMonth(Month, Year: Integer): TDate;

function DayWeek(DateBase: TDate; Day: TDayWeek; Jump: Integer): TDate;

function ToStr(IncValue: string; var value: string): string;
function DecZeroLeft(value: string): string;
function BlendColors(const Color1, Color2: TColor; Amount: Extended): TColor;
function ExtractFilePath(FileName: string): string;
function ExtractFileName(FileName: string; ignoreextension: Boolean = False): string;
function RemoveFileExt(const FileName: string): string;
function ExtractFileExt(const FileName: string): string;
function AlterFileExtencion(Const FileName: string; NewExtension: string = ''): string;
function AlterExt(sFileName: string; NewExt: string = ''): string; // Alterna a extenção de um arquivo
function InternetConectType: TKindConection; //
function InvertStr(value: string): string;
function InString(textfind: string; text: string): Boolean;
function Mid(value: string; Start: Integer; Count: Integer = 0): string; overload;
function Mid(value: Integer; Start: Integer; Count: Integer = 0): string; overload;
function Pos(sSub: string; sStr: string; IniIndex: Integer = 0): Integer; //
function AccessPointer(Pointer: Pointer = nil): Boolean; //
function DecimalForRomano(value: Integer): string; //

function ExcedRecord(Count: Integer): Boolean;

function CInt(value: Variant): Integer; overload; // EXECUTA CONVERSÃO P/ INTEIRO
function CInt(value: string): Integer; overload;
function CInt(value: Extended): Integer; overload; // EXECUTA CONVERSÃO P/ INTEIRO
function CCar(value: string): Cardinal; overload;
function CInt64(value: string): Int64; overload;
function CInt64(value: Extended): Int64; overload;
function CWChar(value: Variant): PWideChar; // EXECUTA CONVERSÃO P/ WIDEstring
function CAChar(value: Variant): PChar;
function CVrt(value: Variant): Variant;
function CStrBoo(value: Boolean): string;
function UChr(value: string): Char; overload;
function UChr(value: Char): Char; overload;
function CChr(value: Variant; Pos: Integer; Upper: Boolean = True): Char; overload;
function CChr(value: Variant; Upper: Boolean = True): Char; overload;
function CStr(value: Int64): string; overload;
function CStr(value: Extended): string; overload;
function CStr(value: Variant): string; overload; // EXECUTA CONVERSÃO P/ string
function CBoo(value: Variant): Boolean;
function CPer(value: Variant): Float;
function CDat(value: Variant): TDate; overload;
function CDat(value: TDateTime): TDate; overload;
function CTim(value: Variant): TTime;
function CCur(value: Variant): Currency;
function CFlt(value: Variant): Float;
function CPureFlt(value: string): Float;

function PadD(const AString: string; const nLen: Integer; const Caracter: Char): String;

function CPChar_or_PWideChar(value: string): {$IFDEF SW_UNICODE then}PWideChar{$ELSE}PChar{$ENDIF};

function AStr(Length: Integer; value: string; Alignment: TAlignment = taLeftJustify; Char: Char = ' '): string; overload;
function AStr(Length: Integer; SFormat: string; Args: array of const; Alignment: TAlignment = taLeftJustify; Char: Char = ' '): string; overload;

function AStrL(Length: Integer; value: string; Char: Char = ' '): string; overload;
function AStrL(Length: Integer; SFormat: string; Args: array of const; Char: Char = ' '): string; overload;

function AStrC(Length: Integer; value: string; Char: Char = ' '): string; overload;
function AStrC(Length: Integer; SFormat: string; Args: array of const; Char: Char = ' '): string; overload;

function AStrR(Length: Integer; value: string; Char: Char = ' '): string; overload;
function AStrR(Length: Integer; SFormat: string; Args: array of const; Char: Char = ' '): string; overload;

function SFmt(format: string; Args: array of const): string;
function SFmtCOD(codigo: Integer; descri: string; alignCOD: Integer; defaulttext: string = ''): string; overload;
function SFmtCOD(codigo: Integer; descri: string; defaulttext: string = ''): string; overload;
function SFmtCOD(codigo: string; descri: string; defaulttext: string = ''): string; overload;
function SCod(value: string; iLength: Integer = 0): string; overload;
function SCod(value: Int64; iLength: Integer = 0): string; overload;
// function SCod(Value: Double; iLength: Integer = 0): string; overload;
function SDat(value: string; CFormat: string = ''): string; overload;
function SDat(value: TDate; CFormat: string = ''): string; overload;
function SDat(value: TDate; SimpleDate: Boolean): string; overload;
function SDiv(dividendo, divisor: Extended): Extended;
function SInt(value: Extended; CFormat: string = ''): string; overload;
function SInt(value: string; CFormat: string = ''): string; overload;
function SInt(value: Integer; CFormat: string = ''): string; overload;
function STim(value: string; CFormat: string = ''): string; overload;
function STim(value: TDateTime; CFormat: string = ''): string; overload;

function SFlt(value: string): string; overload;
function SFlt(value: Float; format: string = ''): string; overload;
function SPer(value: string; IncludeChar: Boolean = False; IncludeSinal: Boolean = False): string; overload;
function SPer(value: Float; IncludeChar: Boolean = False; IncludeSinal: Boolean = False): string; overload;
function SCur(value: string; IncludeCurrencySymbol: Boolean = False): string; overload;
function SCur(value: Float; IncludeCurrencySymbol: Boolean = False): string; overload;
function SCur(value: Float; format: string): string; overload;
function SBoo(value: Boolean): Char;
function IBoo(value: Boolean): Integer;
function PBoo(value: Boolean): Char; overload; // RETORNAR 'T','F'
function PBoo(value: string): Char; overload; // RETORNAR 'S','N'

function FileLength(CFile: string): Cardinal;
function FileAllAtributes(cFileName: string): WIN32_FIND_DATA;
function FileAtributos(const FileName: string): Cardinal; // RECEBE NOME DE UM ARQUIVO E RETORNA SEUS ATRIBUTOS

function DelFolder(Pasta: string): Boolean; // DELERA PASTA COM OU SEM ARQUIVOS
function DelFile(cFileName: string): Boolean;
function Getstring(sCaption, sPrompt: string; var sResult: string): Boolean; // CONSTROI UMA JANELA DE ENTRADA DE DADOS 'string'
function SubChar(iPos: Integer; sChar: Char; S: string): string; // FUNCAO SOBREPOE UM DETERMINADO CHAR
function DelChar(iPos: Integer; S: string): string; // FUNCAO DELETA   UM DETERMINADO CHAR
function CountChar(Chr: Char; value: string): Cardinal;
function LocLeftRigth(Const sChar: Char; Const S: string): Integer; // SIMULA O POS NORMAL
function LocRigthLeft(Const sChar: Char; Const S: string): Integer; // SIMULA UM POS DA DIREITA PARA A ESQUERDA(INVERTIDO)
function path: string; // RETORNA O PAT DO APLLICATIVO
function pathSW: string; // RETORNA O PAT DO APLLICATIVO
function pathSWBin: string; // RETORNA O PAT DO APLLICATIVO
function pathInclude(LocalDir: string): Boolean;
function FileName(const Arquivo: string): string; // EXTRAI O NOME DE UM ARQUIVO COM DIRETÓRIO
function DateSystem: string; // RETORNA DATA DO SISTEMA
function TimeSystem: string; // RETORNA HOTA DO SYSTEMA
function Date: TDate; overload;
function Date(Day, Month, Year: Word): TDate; overload;
function DateTimeSystem: string; // DATA HORA DO SISTEMA
function DirWin: string; // RETORNA O DIRETORIO DE INSTALACAO DO WINDOWS

function DirSystem(Local: TLocalDirectory): string; overload;
function DirSystem: string; overload; // RETORNA O DIRETORIO DE INSTALACAO DO SYSTEM DO WINDOWS
function DirWinTemp: string; // RETORNA O DIRETORIO TEMPORARIO DO WINDOWS

function IsEqual(value: string; CompareValue: string): Boolean;
overload
function IsEqual(value: string; CompareValue: array of string): Boolean;
overload

function IsEqual(value: Integer; CompareValue: Integer): Boolean;
overload
function IsEqual(value: Integer; CompareValue: array of Integer): Boolean;
overload

function IsEqual(value: Extended; CompareValue: Extended): Boolean;
overload
function IsEqual(value: Extended; CompareValue: array of Extended): Boolean;
overload

function IsUnidade(const Unidade: Char): Boolean; // VERIVIDA SE A UNIDADE É VÁLIDA
function IsDir(const Dir: string): Boolean; // BERIFICA SE O DIRETÓRIO EXISTE
function IsFile(const FileName: string): Boolean; // TESTE SE O ARQUIVO EXISTE
function IsTime(value: string): Boolean; overload;
function IsTime(value: TDateTime): Boolean; overload;
function IsDate(value: string): Boolean; overload;
function IsDate(value: TDateTime): Boolean; overload;

function IsNotDate(value: string): Boolean; overload;
function IsNotDate(value: TDateTime): Boolean; overload;

function IsDateTime(value: string): Boolean; // TESTA A string É UMA DATA HORA
function IsInt(value: string): Boolean; // TESTA A string É UM INTEIRO
function IsFloat(value: string): Boolean; // TESTA A string É UM REAL OU FLOAT
function IsMoeda(value: string): Boolean; // TESTA A string É UM CURRENCY

function IsNotEmpty(value: Integer): Boolean; overload;
function IsNotEmpty(value: string): Boolean; overload;
function IsNotEmpty(value: TDateTime): Boolean; overload;
function IsNotEmpty(value: TObject): Boolean; overload;
function IsNotEmpty(value: Extended): Boolean; overload;

function IsEmpty(value: string): Boolean; overload; // TESTA A string É UM NULO
function IsEmpty(value: Extended): Boolean; overload;
function IsEmpty(value: TDateTime): Boolean; overload;
function IsEmpty(value: TObject): Boolean; overload;

function IsEmptySet(var value: string; NewValue: string): Boolean; overload;
function IsEmptySet(var value: Integer; NewValue: Integer): Boolean; overload;
function IsEmptySet(var value: Float; NewValue: Float): Boolean; overload;
function IsEmptySet(var value: Currency; NewValue: Currency): Boolean; overload;
function IsEmptySet(var value: TDateTime; NewValue: TDateTime): Boolean; overload;
function IsEmptySet(var value: TObject; NewValue: TObject): Boolean; overload;

function IfThen(AValue: Boolean; const ATrue: Int64; const AFalse: Int64): Int64; overload;
function IfThen(AValue: Boolean; const ATrue: Cardinal; const AFalse: Cardinal): Cardinal; overload;
function IfThen(AValue: Boolean; const ATrue: Integer; const AFalse: Integer): Integer; overload;
function IfThen(AValue: Boolean; const ATrue: Extended; const AFalse: Extended): Extended; overload;
function IfThen(AValue: Boolean; const ATrue: string; const AFalse: string): string; overload;
function IfThen(AValue: Boolean; const ATrue: TDateTime; const AFalse: TDateTime): TDateTime; overload;
function IfThenColor(AValue: Boolean; const ATrue: TColor; const AFalse: TColor): TColor; overload;
Function IIF(xTeste: Boolean; SeTrue, SeFalse: Variant): Variant;

function FormataData(format: string; Data: string): string; deprecated; // FORMATA DATA PERSONALIZADO
function FormataHora(format: string; Hora: string): string; deprecated; // FORMATA HORA PERSONALIZADO
function FormataDataHota(format: string; DataHota: string): string; deprecated; // FORMATA DATA-HORA PERSONALIZADO
function GetCountChars(value: string; CChar: array of Char): Integer; overload;
function GetCountChars(value: string; CChar: Char): Integer; overload;
function GetNumbers(value: string): string; overload; // EXTAIR SOMENTE NUMEROS DE UMA string MIXTA
function GetAlfa(value: string): string;
function GetAlfaNumeric(value: string): string;
function xCaixaDialogo(Const CMessage: string): Boolean; overload; deprecated;
function xCaixaDialogo(CShow: TShowDialog; Const CMessage: string): Boolean; overload; deprecated;
function xCaixaDialogo(CShow: TShowDialog; const CFormat: string; Args: array of const): Boolean; overload; deprecated;
function SimpleMessage(Const CMessage: string): Boolean; overload;
function SimpleMessage(const CFormat: string; Args: array of const): Boolean; overload;
function SimpleMessage(CShow: TShowDialog; const CFormat: string; Args: array of const): Boolean; overload;
function SimpleMessage(CShow: TShowDialog; Const CMessage: string): Boolean; overload;
function IsDiskInDriver(Const Unidade: Char): Boolean; deprecated; // VGERIFICA SE EXISTE DISQUETE NO DRIVER
function FreeSpace(TamanhoDesejado: Integer; Unidade: Byte): Boolean; deprecated; // DEVOLVI O ESPAÇO DISPONIVEL EM DISCO
function AlignStr(Tamanho: Integer; value, Caracter: string; Alinhar: TAlignment): string; // ACERTA string COM UMA QUANTIDADE DE string ALEM DE SEU TAMANHO(USADA PARA IMPRIMIR OU EXIBIR RELATORIOS EM FORMA DE COLUNAS)
function DupStr(Length: Integer; Const Str: string): string; // DUPLICA UMA string QUANTAS VEZES FOR DADO NA VARIAVEL QUANTIDADE
function isInscEst(numinsc, uf: string): Boolean;
function IsRG(RG: string): Boolean; // TESTA DE O RG É VALIDO
function IsCPF(Const CPF: string): Boolean; // TESTA DE O CPF É VÁLIDO
function IsCGC(CGC: string): Boolean; // TESTA DE O CGC É VÁLIDO
function isRenavam(const value: string): Boolean;
function IncDateMax(value: TDateTime): TDateTime;
function IncDate(Data: string; Dia: Integer): string; // SOMA A DATA A QUANTIDADE DADA NA VASRIAVEL DIA
function MaiorDiaMes(Mes, Ano: string): string; deprecated; // RETORNA O MAIOR DIA DO MÊS
function DiferencaHora(Hora1, Hora2: TTime): TTime; // RETORNA A DIFERENCA ENTRE DOIS HORÁRIOS
function DelChars(sChar: Char; sStr: string; Count: Integer = 0): string; overload; // RETIRA CARACTER OU SEQUENCIA DE stringS DE OUTRA string
function DelChars(sChar: array of Char; sStr: string; Count: Integer = 0): string; overload;
function Len(Const Texto: string): Integer; // EQUIVALENE AO LENGTH DO DELPHI
function DataHoraArquivo(Const Arquivo: string): string; // RETORNA A DATA/HORA DE CRICAÇÃO DE UM ARQUIVO
function SubChars(sInChar, sOutChar: Char; sStr: string): string; // SUBSTITUI CARCTERES DE UMA ESTARING
function Imput(Const value: Variant): Variant; deprecated; // SIMULA UM INPUTBOX
function Codificastring(Const Str: string): string; // FORMATA UMA string CODIFICAND COMO SENHA
function Tratastring(S: string): string; // TRATA string
function BooToStr(Boo: Boolean): Char; // PEGA BOOLEAN E RETORNA TRUE = 'T' FALSE = 'F'
function StrToBoo(Str: string): Boolean; // PROCESSO INVERSO DE BOOFORSTR

function DifferenceDatesDays(DtLarger, DtSmaller: TDate): Integer;
function diferencaentredatas(data1,data2:TDateTime;Abreviado:Boolean):string;

function DiferencaDias(DtMenor, DtMaior: string): Integer; // DIFERENCOA DE DIAS ENTER DUAS DATAS
function SerialDisco(FDrive: string): string; // EXTRAI O NUMERO SERIAL DO HA
function DiscLabel(FDrive: Char): string;
function ExecAndWait(const ExecuteFile, Paramstring: string): Boolean; // EXECUTA PROGRAMA E PASSA PARAMETROS E ESPERA TERMINAR
{$IFDEF MSWINDOWS}
function RegisterOCX(FileOCX: string): Boolean; // REGISTRA UMA OCX NO SISTEMA
{$ENDIF}
function KillFile(cFileName: string): Boolean;
function MoveFile(cFileName: string; CNewFileName: string): Boolean;
function CopyFile(cFileName: string; CNewFileName: string; QueimeFile: Boolean = True): Boolean;
function Second: TTime; // RETORNA O EQUIVALENTE A UM SEGUNDO
function QtdeChars(Char: Char; Str: string): Integer; // RETORNA A QTDE DE CARACTERES EM UMA string
function DateIToDateP(Data: string): string; deprecated; // DATA INLGÊS PARA DATA PORTUGUÊS

function TimeToFloat(Hora: string): Float;
function ForCNPJ(CNPJ: Variant): string;
function ForCPF(CPF: Variant): string;

function NullString: string; // RETORNA NULO DE string
function NullCurrency(IncludeChar: Boolean = False): string;
function NullFloat: string; // RETORNA NULO DE FLOAT
function NullInteger: string; // RETORNA NULO DE INTEGER
function NullPercent(IncludeChar: Boolean = False): string; // RETORNA NULO DE PERCENTUAL
function NullData: string; // RETORNA NULO DE DATA
function NullHora: string; // RETORNA NULO DE HORA

function ucase(Const S: string): string; // EMULA UPPERCASEASCII FUNÇÃO MAIS CURTA
function lcase(Const S: string): string; // EMULA LOWERCASEASCII FUNÇÃO MAIS CURTA
function ExpStr(Qt: Integer; Str: string): string; // SEPARA CADAS LETRA COM ' '
function GetExt(Const sFile: string): string; // RETORNA A EXTENÇÃO DE UM ATQUIVO

function GetDir(out Dir: string; iniDir: string = ''): Boolean; // FUNÇÃO DE BUSCA DE DIRETÓRIOS
function GetFile(out sFileName: string; sFilter: string = '*.*'; StartPath: string = ''; simple: Boolean = False; TitleForm: string = ''; TitleRoot: string = ''): Boolean; overload;
function GetOSLanguage: TOSLanguage; overload;
function GetOSLanguage(out oslanguage: string): TOSLanguage; overload;

function ShowProgram(Const sProgram: string): Boolean; // EXECUTA PROGRAMA EXTERNO E EXPERA SEU TERMINO
function SetAniCursor(Const sCursor: TFileName): Boolean; // COLOCA CURSOR ANIMADO NO SISTEMA
function AppIsRunning(TypeShow: Integer): Boolean; // VERIFICA SE O APLICATIVO JÁ ESTÁ ABERTO
function SetDisplay(DisplaPixel: TDisplaPixel): Boolean; // SETA UMA CONFIGURAÇÃO DE VIDEO
function CompareStr(Str1, Str2: string; Like: Boolean = False): Boolean;
{ fim function }{ fim function }{ fim function }{ fim function }{ fim function }{ fim function }
{ fim function }{ fim function }{ fim function }{ fim function }{ fim function }{ fim function }

{ fim conversores }{ fim conversores }{ fim conversores }{ fim conversores }{ fim conversores }
{ fim conversores }{ fim conversores }{ fim conversores }{ fim conversores }{ fim conversores }

{ %%%%percentuais%%%% }{ %%%%percentuais%%%% }{ %%%%percentuais%%%% }{ %%%%percentuais%%%% }
{ %%%%percentuais%%%% }{ %%%%percentuais%%%% }{ %%%%percentuais%%%% }{ %%%%percentuais%%%% }
// função que Dados um Valor 'V' já incrementado um percentual 'P'
// retornará o valor de 'V' antes da aplicação do percentual 'P'
// 10 + 12% = 12
// 12 - 12% = 8,8 Errado {A função não faz isso}
// Ela retornara o valor que foi preciso para incrementar para se alcançar 12>=10
function ValueOutPercentReceive(value, Per: Float): Float;
// função que com dois valores retorna o percentual em relação ao outro
function RecPercent(ValueMax, ValueActual: Float): Float;
// função que Decrementa um percentual de um valor
function DecPercent(value, Per: Float): Float;
// função que Resulta valor equivamente percentual a um percentual
function RetPercentValue(value, Per: Float): Float;
// função que Incrementa um percentual de um valor
function IncPercent(value, Per: Float): Float;
{ %%%%percentuais%%%% }{ %%%%percentuais%%%% }{ %%%%percentuais%%%% }{ %%%%percentuais%%%% }
{ %%%%percentuais%%%% }{ %%%%percentuais%%%% }{ %%%%percentuais%%%% }{ %%%%percentuais%%%% }

function DateToDescri(DateTime: TDateTime): string;
function FloatToDescri(Numero: Extended): string;
function ReplaceSubstring(StrSource, StrNew, StrActual: string): string;

function GetUserWindows: string;
function GetIpHost: string;

{$ENDREGION}
{$REGION 'type'}

type
  TForceFormat = record
    Force: Boolean;
    FormatInt: string;
    FormatFlt: string;
    FormatCur: string;
    FormatPer: string;
    FormatDat: string;
    FormatTim: string;
  end;
{$ENDREGION}
{$REGION 'var'}

var
  Date1900: TDateTime = 0; // 01/01/1901
  Date2000: TDateTime = 0; // 01/01/2000
  Date2500: TDateTime = 0; // 01/01/2500

var
  ForceUsesSimpleMessage: Boolean = False;

{$ENDREGION}
{$REGION 'rotinas de controle de aplicacoes para debugs'}
procedure developer_memory_leaks_onshutdown_enabled;
procedure developer_memory_leaks_onshutdown_disabled;
{$ENDREGION}
{$REGION 'procedure.initialization'}
procedure DoUseRegionalSettings;

procedure windows_execute(command: string; showprompt: Boolean = False);
overload
procedure windows_execute(command: TstringList; showprompt: Boolean = False);
overload
procedure windows_application_hide_task_manager;
procedure windows_set_icon_start_menu(FileName: string);
procedure windows_close_system_windows;
procedure windows_block_enabled;
procedure windows_block_disabled;

procedure windows_kill_mslicensing;

procedure windows_do_shutdown;
procedure windows_do_restart;
procedure windows_do_logoff;
procedure windows_do_poweroff;
procedure windows_do_force;

procedure windows_start_monitor(Active: Boolean);
procedure windows_keyboard_numlock_start(Active: Boolean);

{$ENDREGION}

const
  varStrTrue = 't';

const
  varStrFalse = 'f';

const
  varIntTrue = 001;

const
  varIntFalse = 000;

implementation

{$REGION 'uses'}

uses
{$IFDEF MSWINDOWS}
{$ENDIF}
{$IFDEF MSWINDOWS}
  WinSock,
  ShlObj,
  ActiveX,
  ComObj, // usados na função de criação de atalhos 'CreateShortCut'
{$ENDIF}
{$IFDEF MSWINDOWS}
  TypInfo,
{$ENDIF}
  // ZLib      ,
  DateUtils,
  StrUtils;

{$ENDREGION}
{$REGION 'procedure'}

procedure windows_kill_mslicensing;
var
  R: TRegistry;
begin
  R := TRegistry.Create;
  R.RootKey := HKEY_LOCAL_MACHINE;

  if R.OpenKey('\SOFTWARE\Microsoft\', False) then
  begin
    R.DeleteKey('MSLicensing');
    R.CloseKey;
  end;
  R.Destroy;
end;

procedure windows_do_shutdown;
begin
  Sleep(1000);
  // ExitWindowsEx(EWX_FORCE, 0);    // Leia WinAPI help para mais opções
  ExitWindowsEx(EWX_SHUTDOWN, 0); // Leia WinAPI help para mais opções
end;

procedure windows_do_restart;
begin
  Sleep(1000);
  ExitWindowsEx(EWX_FORCE, 0); // Leia WinAPI help para mais opções
  ExitWindowsEx(EWX_REBOOT, 0); // Leia WinAPI help para mais opções
end;

procedure windows_do_logoff;
begin
  Sleep(1000);
  ExitWindowsEx(EWX_FORCE, 0); // Leia WinAPI help para mais opções
  ExitWindowsEx(EWX_LOGOFF, 0); // Leia WinAPI help para mais opções
end;

procedure windows_do_poweroff;
begin
  Sleep(1000);
  ExitWindowsEx(EWX_FORCE, 0); // Leia WinAPI help para mais opções
  ExitWindowsEx(EWX_POWEROFF, 0); // Leia WinAPI help para mais opções
end;

procedure windows_do_force;
begin
  Sleep(1000);
  ExitWindowsEx(EWX_FORCE, 0); // Leia WinAPI help para mais opções
end;

// ligamonitor
procedure windows_start_monitor(Active: Boolean);
begin
  if Active then
    SendMessage(Application.Handle, WM_SYSCOMMAND, SC_MONITORPOWER, -1)
  else
    SendMessage(Application.Handle, WM_SYSCOMMAND, SC_MONITORPOWER, 0);
end;

procedure windows_keyboard_numlock_start(Active: Boolean);
var
  KeyState: TKeyboardState;
begin
  GetKeyboardState(KeyState);
  if Active then
    KeyState[VK_NUMLOCK] := 1
  else
    KeyState[VK_NUMLOCK] := 0;
  SetKeyboardState(KeyState);
end;

procedure InvertValues(var V1, V2: Int64);
var
  a: Int64;
begin
  a := V1;
  V1 := V2;
  V2 := a;
end;

procedure InvertValues(var V1, V2: Extended);
var
  a: Extended;
begin
  a := V1;
  V1 := V2;
  V2 := a;
end;

procedure InvertValues(var V1, V2: TDateTime);
var
  a: TDateTime;
begin
  a := V1;
  V1 := V2;
  V2 := a;
end;

procedure InvertValues(var V1, V2: Cardinal);
var
  a: Cardinal;
begin
  a := V1;
  V1 := V2;
  V2 := a;
end;

procedure ClearArray(var Args: array of TObject; defaultValue: TObject = nil);
var
  i: Integer;
begin
  for i := 0 to High(Args) do
  begin
    Args[i] := defaultValue;
  end;
end;

procedure ClearArray(var Args: array of string; defaultValue: string = '');
var
  i: Integer;
begin
  for i := 0 to High(Args) do
  begin
    Args[i] := defaultValue;
  end;
end;

procedure ClearArray(var Args: array of Integer; defaultValue: Integer = 0);
var
  i: Integer;
begin
  for i := 0 to High(Args) do
  begin
    Args[i] := defaultValue;
  end;
end;

procedure ClearArray(var Args: array of TDate; defaultValue: TDate = 0);
var
  i: Integer;
begin
  for i := 0 to High(Args) do
  begin
    Args[i] := defaultValue;
  end;
end;

procedure ClearArray(var Args: array of Float; defaultValue: Float = 0);
var
  i: Integer;
begin
  for i := 0 to High(Args) do
  begin
    Args[i] := defaultValue;
  end;
end;

procedure ClearArray(var Args: array of Byte; defaultValue: Byte = 0);
var
  i: Integer;
begin
  for i := 0 to High(Args) do
  begin
    Args[i] := defaultValue;
  end;
end;

function seekArray(var Args: array of string; value: string): Boolean;
var
  i: Integer;
begin
  Result := False;
  for i := 0 to High(Args) do
  begin
    if Args[i] = value then
    begin
      Result := True;
      Break;
    end;
  end;
end;

procedure ClearVar(var xvar: string);
begin
  xvar := '';
end;

procedure ClearVar(var xvar: Integer);
begin
  xvar := 0;
end;

procedure ClearVar(var xvar: TDate);
begin
  xvar := 0;
end;

procedure ClearVar(var xvar: Extended);
begin
  xvar := 0;
end;

procedure AlignToCenter(W: TWinControl);
var
  P: TWinControl;
var
  X: TPoint;
begin
  if Assigned(W) and Assigned(W.Parent) then
  begin
    P := W.Parent;

    X.X := (P.Width div 2) - (W.Width div 2);

    X.Y := (P.Height div 2) - (W.Height div 2);

    W.SetBounds(X.X, X.Y, W.Width, W.Height);
  end;
end;

procedure OpenFolderFile(Arquivo: string);
begin
  Arquivo := Trim(Arquivo);
  if IsDir(ExtractFilePath(Arquivo)) then
  begin
    ShellExecute(0, nil, CPChar_or_PWideChar(Arquivo), 'open', nil, SW_SHOWNORMAL);
  end
  else if FileExists(Arquivo) then
  begin
    ShellExecute(0, nil, CPChar_or_PWideChar(Arquivo), 'open', nil, SW_SHOWNORMAL);
  end;
end;

procedure PrepareDates(var D1, D2: TDate); overload;
var
  DX: TDate;
begin
  if D1 > D2 then
  begin
    DX := D2;
    D2 := D1;
    D1 := DX;
  end;
end;

procedure AlignForm(Form: TForm; Centralizar: Boolean);
var
  V: Variant;
begin
  with Form do
  begin
    if Centralizar = True then
    begin
      V := (Screen.Width div 2) - (Form.Width div 2);
      V := Int(V);
      Form.Left := StrToInt(V);
      V := (Screen.Height div 2) - (Form.Height div 2) - (50);
      V := Int(V);
      Form.top := StrToInt(V);
    end
    else
    begin
      Form.Left := 0;
      Form.top := 0;
      Form.Width := Screen.Width;
      Form.Height := Screen.Height;
    end;
    if top < 0 then
      top := 0;
    if Left < 0 then
      Left := 0;
  end;
end;

procedure SetUF(Item: Tstrings; OutType: TUF = ufSiglas);
begin
  if Assigned(Item) then
  begin
    Item.Clear;
    case OutType of
      ufSiglas:
        begin
          Item.Add('AC');
          Item.Add('AL');
          Item.Add('AM');
          Item.Add('AP');
          Item.Add('BA');
          Item.Add('CE');
          Item.Add('DF');
          Item.Add('ES');
          Item.Add('GO');
          Item.Add('MA');
          Item.Add('MG');
          Item.Add('MS');
          Item.Add('MT');
          Item.Add('PA');
          Item.Add('PE');
          Item.Add('PI');
          Item.Add('PB');
          Item.Add('PR');
          Item.Add('RJ');
          Item.Add('RN');
          Item.Add('RO');
          Item.Add('RR');
          Item.Add('RS');
          Item.Add('SC');
          Item.Add('SE');
          Item.Add('SP');
          Item.Add('TO');
        end;
      ufNames:
        begin
          Item.Add('AC - Acre');
          Item.Add('AL - Alagoas');
          Item.Add('AM - Amazonas');
          Item.Add('AP - Amapa');
          Item.Add('BA - Bahia');
          Item.Add('CE - Ceara');
          Item.Add('DF - Distrito Federal');
          Item.Add('ES - Espirito Santo');
          Item.Add('GO - Goiais');
          Item.Add('MA - Maranhao');
          Item.Add('MG - Minas Gerais');
          Item.Add('MS - Mato Grasso do Sul');
          Item.Add('MT - Mato Grasso');
          Item.Add('PA - Para');
          Item.Add('PE - Pernambuco');
          Item.Add('PI - Piaui');
          Item.Add('PB - Paraiba');
          Item.Add('PR - Parana');
          Item.Add('RJ - Rio de Janeiro');
          Item.Add('RN - Rio Grande do Norte');
          Item.Add('RO - Roondonia');
          Item.Add('RR - Roraima');
          Item.Add('RS - Rio Grande do Sul');
          Item.Add('SC - Santa Catarina');
          Item.Add('SE - Sergipe');
          Item.Add('SP - Sao Paulo');
          Item.Add('TO - Tocantins');
        end;
    end;
  end;
end;

procedure GetDay(Item: Tstrings; CShort: Boolean);
begin
  if Assigned(Item) then
  begin
    Item.Clear;
    Item.Add(FormatSettings.LongDayNames[01]);
    Item.Add(FormatSettings.LongDayNames[02]);
    Item.Add(FormatSettings.LongDayNames[03]);
    Item.Add(FormatSettings.LongDayNames[04]);
    Item.Add(FormatSettings.LongDayNames[05]);
    Item.Add(FormatSettings.LongDayNames[06]);
    Item.Add(FormatSettings.LongDayNames[07]);
  end;
end;

procedure GetMonth(Item: Tstrings; CShort: Boolean);
  function XMonth(ID: Integer): string;
  begin
    if CShort then
      Result := FormatSettings.ShortMonthNames[ID]
    else
      Result := FormatSettings.LongMonthNames[ID]
  end;

var
  i: Integer;
begin
  if Assigned(Item) then
  begin
    Item.Clear;
    for i := 1 to High(FormatSettings.LongMonthNames) do
    begin
      Item.Add(XMonth(i));
    end;
  end;
end;

function MonthInt(Value:String):Integer;
var i:Integer;
var sMes:String;
begin
     Result:=-1;
     sMes:=Copy(Value,1,Pos(' ',Value)-1);
     for i := 1 to High(FormatSettings.LongMonthNames) do
     begin
          if UpperCase(sMes) = UpperCase(FormatSettings.LongMonthNames[i]) then
          begin
               Result:=i;
               Break;
          end;
     end;

end;

procedure GetYear(Item: Tstrings; CStart: Integer; CEnd: Integer);
var
  i: Integer;
begin
  for i := CStart to CEnd do
  begin
    Item.Add(SCod(i, 4))
  end;
end;

procedure SetAlfabeto(Items: Tstrings);
begin
  if Assigned(Items) then
  begin
    Items.Clear;
    Items.Add(NullString);
    Items.Add('A');
    Items.Add('B');
    Items.Add('C');
    Items.Add('D');
    Items.Add('E');
    Items.Add('F');
    Items.Add('G');
    Items.Add('H');
    Items.Add('I');
    Items.Add('J');
    Items.Add('K');
    Items.Add('L');
    Items.Add('M');
    Items.Add('N');
    Items.Add('O');
    Items.Add('P');
    Items.Add('Q');
    Items.Add('R');
    Items.Add('S');
    Items.Add('T');
    Items.Add('U');
    Items.Add('V');
    Items.Add('W');
    Items.Add('Y');
    Items.Add('X');
    Items.Add('Z');
  end;
end;

procedure TopToGrid(AControl: TCustomControl; ATop: Integer; ARect: TRect);
begin
  if Assigned(AControl) then
    AControl.top := ARect.top + ATop + 2;
end;

procedure FixeMouse(Fixe: Boolean = False; X1: Integer = 0; Y1: Integer = 0; X2: Integer = 0; Y2: Integer = 0);
var
  Area: TRect;
begin
  // Ex: FixeMouse(true,Form1.Left + 100, Form1.Top + 100, Form1.Left + 400, Form1.Top + 200);
  if not Fixe then
    ClipCursor(nil)
  else
  begin
    Area.Left := X1;
    Area.top := Y1;
    Area.Right := X2;
    Area.Bottom := Y2;
    ClipCursor(@Area);
  end;
end;

procedure CreateShortCut(FileName, NameLink: string; LocalIcon: string = ''; LocalLink: TLocalDirectory = ldCSIDL_DESKTOP); overload;

var
  IObject: IUnknown;
var
  ISLink: IShellLink;
var
  IPFile: IPersistFile;
var
  DirSave: string;
begin
  NameLink := Trim(NameLink);
  FileName := Trim(FileName);

  if NameLink = '' then
    NameLink := ExtractFileName(FileName);

  IObject := CreateComObject(CLSID_ShellLink);
  ISLink := IObject as IShellLink;
  IPFile := IObject as IPersistFile;

  if FileExists(LocalIcon) then
  begin
    ISLink.SetIconLocation(CPChar_or_PWideChar(LocalIcon), 0);
  end;
  ISLink.SetPath(CPChar_or_PWideChar(FileName));
  ISLink.SetWorkingDirectory(CPChar_or_PWideChar(ExtractFilePath(FileName)));

  DirSave := DirSystem(LocalLink);

  NameLink := format('%s%s.lnk', [DirSave, NameLink]);
  IPFile.Save(PWChar(CWChar(NameLink)), False);

end;

procedure CloseApplication(const ApplicationTitle: string);
var
  Win: THandle;
begin
  Win := FindWindow(nil, CPChar_or_PWideChar(ApplicationTitle));
  if Win <> 0 then
    PostMessage(Win, WM_CLOSE, 0, 0)
end;

{$ENDREGION}
{$REGION 'function'}
{$IFDEF SW_UNICODE}
{$ELSE}

function CharInSet(C: AnsiChar; const CharSet: TSysCharSet): Boolean;
begin
  Result := C in CharSet;
end;
{$ENDIF}
// function Assigned(Value:Pointer):Boolean;
// begin
// Result:=Assigned(Value);
// end;

function valida_ean1318(ean: string): Boolean; // Dica número 1595 de www.deephi.rg3.net.
// Funciona com EAN8 e EAN13
var
  ret, Temp1, Temp2: Integer;
  tmp, Temp3: string;
begin
  Temp2 := 0;
  Temp3 := '';

  for Temp1 := Length(ean) - 1 downto 1 do // Inverte, retirando o dígito
    Temp3 := Temp3 + ean[Temp1];

  for Temp1 := 1 to Length(Temp3) do // Multiplica as posições impares por 3,
    // fazendo o somatório
    if Temp1 mod 2 = 0 then
      Temp2 := Temp2 + StrToInt(Temp3[Temp1])
    else
      Temp2 := Temp2 + StrToInt(Temp3[Temp1]) * 3;

  Temp2 := 10 - Round(Frac(Temp2 / 10) * 10); // 10 menos o resto da divisão

  tmp := Copy(ean, Length(ean), 1);

  if not TryStrToInt(tmp, ret) then
    Result := False
  else
    Result := Temp2 = ret;
end;

function ReadTextFile(FileName: string): string;
var
  L: TstringList;
begin
  L := TstringList.Create;
  L.LoadFromFile(FileName);
  Result := L.text;
  L.Destroy;
end;

function IfNegativeSet(var value: Integer; NewValue: Integer): Integer;
begin
  if value < 0 then
    value := NewValue;
  Result := value;
end;

function IfNegativeSet(var value: Real; NewValue: Real): Real;
begin
  if value < 0 then
    value := NewValue;
  Result := value;
end;

function FreeAndNiltry(var CPointer: Pointer): Boolean;
begin

  try
    Dispose(CPointer);
    CPointer := nil;
    Result := True;
  except
    Result := False;
  end;
end;

function NotAssigned(value: Pointer): Boolean;
begin
  Result := not Assigned(value);
end;

function BetweenDat(value, Value1, Value2: TDateTime): Boolean;
var
  D, M, Y: Word;
begin
  DecodeDate(value, Y, M, D);
  value := EncodeDate(Y, M, D);
  Result := (value >= Value1) and (value <= Value2);
end;

function BetweenTim(value, Value1, Value2: TDateTime): Boolean;
begin
  Result := (value >= Value1) and (value <= Value2);
end;

function BetweenInt(value, Value1, Value2: Integer): Boolean;
begin
  Result := (value >= Value1) and (value <= Value2);
end;

function BetweenCar(value, Value1, Value2: Cardinal): Boolean;
begin
  Result := (value >= Value1) and (value <= Value2);
end;

function BetweenFlt(value, Value1, Value2: Float): Boolean;
begin
  Result := (value >= Value1) and (value <= Value2);
end;

function valueInStr(value: string; values: array of string): Boolean;
var
  i: Integer;
begin
  Result := False;
  for i := 0 to High(values) do
  begin
    if (value = values[i]) then
    begin
      Result := True;
      Break;
    end;
  end;
end;

function valueInDat(value: TDateTime; values: array of TDateTime): Boolean;
var
  i: Integer;
begin
  Result := False;
  for i := 0 to High(values) do
  begin
    if (value = values[i]) then
    begin
      Result := True;
      Break;
    end;
  end;

end;

function valueInTim(value: TDateTime; values: array of TDateTime): Boolean;
var
  i: Integer;
begin
  Result := False;
  for i := 0 to High(values) do
  begin
    if (value = values[i]) then
    begin
      Result := True;
      Break;
    end;
  end;
end;

function valueInInt(value: Int64; values: array of Int64): Boolean;
var
  i: Integer;
begin
  Result := False;
  for i := 0 to High(values) do
  begin
    if (value = values[i]) then
    begin
      Result := True;
      Break;
    end;
  end;
end;

function valueInCar(value: Cardinal; values: array of Cardinal): Boolean;
var
  i: Integer;
begin
  Result := False;
  for i := 0 to High(values) do
  begin
    if (value = values[i]) then
    begin
      Result := True;
      Break;
    end;
  end;
end;

function valueInFlt(value: Extended; values: array of Extended): Boolean;
var
  i: Integer;
begin
  Result := False;
  for i := 0 to High(values) do
  begin
    if (value = values[i]) then
    begin
      Result := True;
      Break;
    end;
  end;
end;

function QuoteString(value: string): string;
begin
{$IFDEF SW_UNICODE}
  Result := SysUtils.QuotedStr(value);
{$ELSE}
  Result := QuotedStr(value);
{$ENDIF}
end;

function Space(const Size: Integer): string;
var
  i: Integer;
begin
  Result := '';
  for i := 1 to Size do
  begin
    Result := Result + ' ';
  end;
end;

function Asc(Character: Char): Cardinal;
begin
  Result := ord(Character);
end;

function StrToLines(const value: string; const MaxCharsLines: Integer = -1): string;
var
  C: Char;
var
  S: string;
var
  X: Integer;
var
  i: Integer;
begin
  Result := '';
  X := 0;
  for i := 1 to Length(value) do
  begin
    C := value[i];
    X := X + 1;
    if X = MaxCharsLines then
    begin
      Result := Result + (S + #13);
      S := '';
      X := 0;
    end
    else
    begin
      S := S + C;
    end;

  end;
  if Length(S) > 0 then
  begin
    Result := Result + S;
  end;
end;

function GetDecstring(var Source: string; const Size: Integer): string;
begin
  if Length(Source) < Size then
  begin
    Result := Source;
    Source := '';
  end
  else
  begin
    Result := Copy(Source, 1, Size);
    Source := Copy(Source, Size + 1, Length(Source));
  end;
end;

function PrepareDates(var D1, D2: string): Boolean;
var
  X1, X2: TDate;
begin
  Result := False;
  D1 := Trim(D1);
  D2 := Trim(D2);
  if IsDate(D1) or IsDate(D2) then
  begin

    if IsDate(D1) and IsDate(D2) then
    begin
      X1 := StrToDate(D1);
      X2 := StrToDate(D2);
    end
    else if IsDate(D1) then
    begin
      X1 := StrToDate(D1);
      X2 := X1;
    end
    else
    begin
      X1 := StrToDate(D2);
      X2 := X1;
    end;
    D1 := DateToStr(X1);
    D2 := DateToStr(X2);

    Result := True;

  end;
end;

function PrepareDates(D1, D2: string; out Date1, Date2: TDate): Boolean;
begin
  Result := False;

  Date1 := 0;
  Date2 := 0;

  if PrepareDates(D1, D2) then
  begin
    Result := True;
    Date1 := StrToDate(D1);
    Date2 := StrToDate(D2);
  end;

end;

function Substrings(ValueText: string; strings: array of string; From: array of string): string;
var
  sfind: string;
var
  i, P: Integer;

var
  s1, s2, s3: string;
var
  found: Boolean;

begin
  ValueText := Trim(ValueText);
  while True do
  begin
    found := False;
    for i := 0 to High(strings) do
    begin
      sfind := strings[i];
      P := Pos(LowerCase(sfind), LowerCase(ValueText));
      if P > 0 then
      begin
        s1 := Copy(ValueText, 1, P - 1);
        s2 := From[i];
        s3 := Copy(ValueText, P + Length(sfind), Length(ValueText));
        ValueText := s1 + s2 + s3;
        found := True;
      end;
    end;
    if not found then
    begin
      Break;
    end;
  end;
  Result := ValueText;
end;

function DecSpace(value: string): string;
var
  L: TstringList;
var
  i: Integer;
var
  S: string;
begin
  L := TstringList.Create;
  value := Trim(value) + ' ';
  for i := 1 to Length(value) do
  begin
    case value[i] of
      ' ':
        begin
          S := Trim(S);
          if Length(S) > 0 then
            L.Add(S);
          S := '';
        end;
    else
      S := S + value[i];
    end;
  end;
  Result := '';
  for i := 0 to L.Count - 1 do
  begin
    Result := format('%s%s ', [Result, L.strings[i]]);
  end;
  Result := Trim(Result);

  L.Clear;
  L.Destroy;
end;

function DecDecimal(value: Extended; OutDecimalCount: Integer): Float;
var
  E: Extended;
var
  S: string;
var
  i: Integer;
begin
  case DecimalMode of
    dmFixed:
      begin
        S := FloatToStr(value);
        i := Pos(FormatSettings.DecimalSeparator, S);
        if i > 0 then
        begin
          S := Copy(S, 1, i + OutDecimalCount);
        end;
        if not TryStrToFloat(S, E) then
          E := 0;
      end;
    dmRound:
      begin
        S := format('%%0.%sn', [IntToStr(OutDecimalCount)]);
        S := Trim(format(S, [value]));
        S := DelChars(FormatSettings.ThousandSeparator, S);
        if not TryStrToFloat(S, E) then
          E := 0;
      end;
  else
    E := value;
  end;
  Result := E;

end;

function DecimalCount(const value: Extended): Integer;
var
  S: string;
var
  i: Integer;
var
  X: Integer;
begin
  Result := 0;
  X := 0;
  S := FloatToStr(value);
  for i := Length(S) downto 1 do
  begin
    if S[i] = FormatSettings.DecimalSeparator then
    begin
      Result := X;
      Break;
    end
    else
    begin
      X := X + 1;
    end;
  end;
end;

function DecimalFormat(const value: Extended; DecimalOutCount: Integer): Float;
var
  S: string;
  // var i:Integer;
var
  DC: Integer;
var
  V: Extended;
begin
  Result := value;
  DC := DecimalCount(value);
  case DecimalOutCount of
    0:
      begin
        Result := System.Round(value);
      end;
  else
    if DC > DecimalOutCount then
    begin
      S := format('%%12.%sn', [IntToStr(DecimalOutCount)]);
      S := format(S, [value]);
      if not TryStrToFloat(S, V) then
        V := 0;
      Result := V;
    end;
  end;
end;

function DecOfValiable(var value: string; Const CharacterBreack: Char = #1; UseTrim: Boolean = True): string;
var
  i: Integer;
begin
  Result := '';
  for i := 1 to Length(value) do
  begin
    if value[i] = CharacterBreack then
    begin
      value := Mid(value, i + 1, Length(value));
      Break;
    end
    else
    begin
      Result := Result + value[i];
    end;
  end;
  if UseTrim then
    Result := Trim(Result);
end;

function DecOfValiable(var value: string; LengthText: Integer): string;
begin
  if Length(value) > 0 then
  begin
    Result := Copy(value, 1, LengthText);
    value := Copy(value, LengthText + 1, Length(value));
  end
  else
  begin
    Result := '';
  end;
end;

function FloatToUnix(value: Float): string;
begin
  value := DecDecimal(value, 2);
  Result := FloatToUnix(FloatToStr(value));
end;

function FloatToUnix(value: string): string;
begin
  value := CStr(DecDecimal(CFlt(value), 2));
  value := DelChars('.', value);
  value := SubChars(',', '.', value);
  Result := value;
end;

function FUnx(value: Float): string;
begin
  Result := FloatToUnix(value);
end;

function FUnx(value: string): string;
begin
  Result := FloatToUnix(value);
end;

function AlterExt(sFileName: string; NewExt: string = ''): string;
var
  pt: string;
var
  fn: string;
var
  ex: string;
begin
  pt := ExtractFilePath(sFileName);
  case Length(pt) of
    0:
      fn := sFileName;
  else
    fn := ExtractFileName(sFileName);
  end;
  ex := ExtractFileExt(sFileName);

  if Length(NewExt) > 0 then
    if NewExt[1] <> '.' then
      NewExt := format('.%s', [NewExt]);

  if Len(Trim(ex)) > 0 then
  begin
    fn := Copy(fn, 1, Len(fn) - Len(ex));
  end;
  if Len(Trim(NewExt)) > 0 then
    ex := NewExt;
  Result := format('%s%s%s', [pt, fn, ex]);
end;

function DelFolder(Pasta: string): Boolean;
var
  R: TshFileOpStruct;
begin
  Result := False;
  if IsDir(Pasta) then
    try
      if Pasta[Length(Pasta)] <> PathDelim then
      begin
        Pasta := Pasta + PathDelim;
      end;
      Delete(Pasta, Length(Pasta), 1);
      FillChar(R, SizeOf(R), 0);
      R.wFunc := FO_DELETE;
      R.pFrom := CPChar_or_PWideChar(Pasta);
      R.fFlags := FOF_ALLOWUNDO or FOF_NOCONFIRMATION;
      Result := ((ShFileOperation(R) = 0) and (not R.fAnyOperationsAborted));
    except
    end;
end;

function DelFile(cFileName: string): Boolean;
begin
  Result := System.SysUtils.DeleteFile(cFileName)
end;

function CompareDates(Date1, Date2: TDateTime): Boolean;
var
  D, M, Y: Word;
begin
  DecodeDate(Date1, Y, M, D);
  Date1 := EncodeDate(Y, M, D);

  DecodeDate(Date2, Y, M, D);
  Date2 := EncodeDate(Y, M, D);

  Result := (Date1 = Date2);
end;

function ValideFloat(var Value1, Value2: Float): Boolean;
var
  aux: Float;
begin
  aux := Value2;
  if Value2 < Value1 then
  begin
    Value2 := Value1;
    Value1 := aux;
  end;
  Result := (Value1 > 0) or (Value2 > 0);
end;

function ValideDatesCheck(MinDate, MaxDate: TDateTime): Boolean;
begin
  Result := (MaxDate >= MinDate) and (MaxDate > 0)
end;

function ValideDates(var MinDate, MaxDate: TDateTime): Boolean;
var
  aux: TDateTime;
begin
  if MinDate < 0 then
    MinDate := 0;

  aux := MaxDate;
  if MaxDate < MinDate then
  begin
    MaxDate := MinDate;
    MinDate := aux;
  end;
  Result := (MinDate > 0) or (MaxDate > 0);
end;

function ValideTimes(var Value1, Value2: TDateTime): Boolean;
begin
  Result := ValideDates(Value1, Value2);
end;

function ValideInteger(var Value1, Value2: Int64): Boolean;
var
  aux: Int64;
begin
  aux := Value2;
  if Value2 < Value1 then
  begin
    Value2 := Value1;
    Value1 := aux;
  end;
  Result := (Value1 > 0) or (Value2 > 0);
end;

function ValideInteger(var Value1, Value2: Integer): Boolean;
var
  aux: Integer;
begin
  aux := Value2;
  if Value2 < Value1 then
  begin
    Value2 := Value1;
    Value1 := aux;
  end;
  Result := (Value1 > 0) or (Value2 > 0);
end;

function EncodeDateD(Year, Month, Day: Word): TDateTime;
begin
  Result := EncodeDate(Year, Month, Day);
end;

function EncodeDateS(Year, Month, Day: Word): string;
begin
  Result := format('%s%s%s%s%s', [IntToStr(Day),
  FormatSettings.DateSeparator, IntToStr(Month),
  FormatSettings.DateSeparator, IntToStr(Year)]);
end;

function ToPositive(value: Int64): Int64;
begin
  if value < 0 then
    value := value * -1;
  Result := value;
end;

function ToPositive(value: Extended): Extended;
begin
  if value < 0 then
    value := value * -1;
  Result := value;
end;

function ToNagative(value: Int64): Int64;
begin
  if value > 0 then
    value := value * -1;
  Result := value;
end;

function ToNagative(value: Extended): Extended;
begin
  if value > 0 then
    value := value * -1;
  Result := value;
end;

function FormatMask(Mask: string; value: string): string;
  function SetTextInMask(CValue: string): string;
  var
    M: string;
  var
    i: Integer;
  var
    P: Integer;
  begin
    if (Length(Mask) > 0) and (Length(value) > 0) then
    begin
      CValue := GetAlfaNumeric(CValue);
      M := Mask;
      P := 0;
      for i := 1 to Length(M) do
      begin
        case M[i] of
          ' ':
            begin
              inc(P);
              if Length(CValue) >= P then
              begin
                M[i] := CValue[P];
              end;
            end;
        end;
      end;
      Result := M;
    end
    else
    begin
      Result := CValue;
    end;
  end;

begin
  Result := SetTextInMask(value);
end;

function FormatPrint(const CFormat: string; Args: array of string; const SPos: Char = '_'): string;
var
  i: Integer;
var
  j: Integer;
var
  L: Integer;
var
  X: Integer;
var
  P: TstringList;
var
  S: string;
var
  R: string;
begin

  P := TstringList.Create;
  L := Length(CFormat);
  Result := '';
  for i := 1 to L do
  begin
    if (CFormat[i] = SPos) and (i + 1 < L) then
    begin
      if (i - 1 >= 0) then
      begin
        if (CFormat[i - 1] <> SPos) then
        begin
          P.Add(IntToStr(i));
        end;
      end;
    end;
  end;

  if ((High(Args) + 1) <> (P.Count)) then
  begin
    raise Exception.CreateFmt('incorrect parameters[%s,%s]:format:%s', [IntToStr(High(Args) + 1), IntToStr(P.Count), CFormat]);
  end;

  L := 0; // 1ª posição
  R := CFormat;
  for i := 0 to High(Args) do
  begin
    S := Args[i];
    X := StrToInt(P.strings[L]); // retorna 1ª posição de preenchimento
    for j := 1 to Length(S) do
    begin
      if R[X] = SPos then
      begin
        R[X] := S[j];
      end
      else
      begin
        Break;
      end;
      X := X + 1;
    end;
    L := L + 1;
  end;

  for i := 1 to Length(R) do
  begin
    if R[i] = SPos then
    begin
      R[i] := ' ';
    end;
  end;

  Result := R;

  P.Destroy;

end;

function FrtFloat(const AValue: Extended; const AFormat: string; const ADecSep: Char): String;
var
  vSettings: TFormatSettings;
  vFormat: string;
begin
  if IsEmpty(AFormat) then
  begin
    vSettings.DecimalSeparator := ',';
    vSettings.ThousandSeparator := '.';
    vFormat := '###,###,##0.00';
  end
  else
  begin
    vSettings.DecimalSeparator := ADecSep;
    vFormat := AFormat;
  end;
  Result := System.SysUtils.FormatFloat(vFormat, AValue, vSettings);
end;

function DecInt(var value: Integer; CInc: Integer = 1): Integer;
begin
  Dec(value, CInc);
  Result := value;
end;

function DecFlt(var value: Float; CInc: Float = 1): Float;
begin
  value := (value - CInc);
  Result := value;
end;

function DecStr(var value: string; iLength: Integer): string;
var
  Len: Integer;
begin
  Len := Length(value);

  if (iLength <= 0) then // se nao houver tamanho nao faz nada
  begin
    value := value;
  end
  else if (iLength >= Len) then // se decremento for >= entao nao retorna nada
  begin
    value := '';
  end
  else if (iLength < Len) then // se decremento for < entao string menos decremento
  begin
    value := Copy(value, 1, Len - iLength);
  end
  else // senao retorna nada
  begin
    value := '';
  end;
  Result := value;
end;

function IncStr(var value: string; const CIntStr: Integer): string;
begin
  Result := IncStr(value, IntToStr(CIntStr));
end;

function IncStr(var value: string; const CStrInc: string): string;
begin
  Result := value + CStrInc;
end;

function IncStr(var value: string; CFormat: string; Args: array of const): string;
begin
  Result := value + format(CFormat, Args);
end;

function IncInt(var value: Integer; CInc: Integer = 1): Integer;
begin
  inc(value, CInc);
  Result := value;
end;

function IncFlt(var value: Float; CInc: Float = 1): Float;
begin
  value := (value + CInc);
  Result := value;
end;

function IncDta(var value: TDateTime; D: Word = 1; M: Word = 0; Y: Word = 0): TDateTime;
begin
  IncYear(value, Y);
  IncMonth(value, M);
  IncDay(value, D);

  Result := value;
end;

function IncTim(var value: TDateTime; S: Word = 0; M: Word = 0; H: Word = 0; Ms: Word = 0): TDateTime;
begin
  IncHour(value, H);
  IncMinute(value, M);
  IncSecond(value, S);
  IncMilliSecond(value, Ms);
  Result := value;
end;

function UnicNumberShort(iLength: Integer = 4): string;
begin
  Result := UnicNumberLong(iLength);
end;

function UnicNumberLong(iLength: Integer = 6): string;
var
  S, s1, s2, s3: string;
var
  o: string;
var
  i: Integer;
var
  X: Integer;
var
  t: Integer;

  function Rec(V: string): string;
  begin
    Result := GetNumbers(Result);
  end;

begin
  s1 := formatdatetime('hhmmss', now);
  s2 := Reversestring(s1);

  s1 := Rec(s1);
  s2 := Rec(s2);

  S := s1 + s2;

  while Length(S) < 11 do
  begin
    s3 := Rec(S);
    S := S + s3;

    while S[1] = '0' do
    begin
      S := Copy(S, 2, Length(S));
    end;
  end;

  S := Copy(S, 1, 11);

  o := '';
  t := CInt(S[Length(S)]);
  for i := 1 to Length(S) do
  begin
    X := CInt(S[i]);
    o := o + IntToStr(X + t);
  end;
  o := Copy(o, 1, 11);

  Result := IntToStr(CInt64(o));
  if iLength > 0 then
    Result := Copy(Result, 1, iLength);
end;

function CriarDir(const Dir: string): Boolean;
var
  CDir: string;
begin
{$IFDEF MSWINDOWS}
  CDir := SubChars('/', '\', Dir);
{$ENDIF}
{$IFDEF LINUX}
  CDir := SubChars('\', '/', Dir);
{$ENDIF}
  // **************************************************************
  if Length(CDir) > 0 then
    System.SysUtils.ForceDirectories(CDir);
  Result := IsDir(Dir)
  // **************************************************************

end;

function ForceDirectories(const Dir: string): Boolean;
var
  CDir: string;
begin
{$IFDEF MSWINDOWS}
  CDir := SubChars('/', '\', Dir);
{$ENDIF}
{$IFDEF LINUX}
  CDir := SubChars('\', '/', Dir);
{$ENDIF}
  // **************************************************************
  if Length(CDir) > 0 then
    try
      System.SysUtils.ForceDirectories(CDir);
    except
    end;
  Result := DirectoryExists(Dir)
  // **************************************************************

end;

function DecMonth(value: TDateTime; Month: Cardinal = 1): TDate;

  function xDec(value: TDateTime; Month: Integer = 1): TDate;
    function DataStr(Day, Mes, Ano: Integer): string;
    begin
      Result := format('%s%s%s%s%s', [IntToStr(Day), FormatSettings.DateSeparator, IntToStr(Mes), FormatSettings.DateSeparator, IntToStr(Ano)]);
    end;

  var
    D, M, Y: Word;
  var
    S: string;
  var
    i: Integer;
  begin
    DecodeDate(value, Y, M, D);

    case M of
      1:
        begin
          M := 12 - (Month - 1);
          Y := Y - 1;
        end;
    else
      System.Dec(M, Month);
    end;

    for i := 31 downto 1 do
    begin
      S := DataStr(i, M, Y);
      if TryStrToDate(S, value) then
      begin
        Break;
      end;
    end;

    Result := value;
  end;

var
  i: Integer;
begin
  Result := value;
  for i := 1 to Month do
  begin
    Result := xDec(Result);
  end;
end;

function RoundUp(value: Extended): Int64; overload;
var
  S: Extended;
begin
  Result := Round(value, S);
  if S > 0 then
    inc(Result);
end;

function RoundUp(value: string): Int64; overload;
begin
  Result := RoundUp(CFlt(value))
end;

function Round(value: string): Int64; overload;
begin
  Result := Round(CFlt(value));
end;

function Round(value: string; Out Surpluses: Extended): Int64;
begin
  Result := Round(CFlt(value), Surpluses);
end;

function Round(value: Double): Int64; overload;
var
  i: Int64;
var
  S: string;
var
  P: Integer;
begin
  i := System.Round(value);
  if (i - value) = 0 then
  begin
    Result := i;
  end
  else
  begin
    S := FloatToStr(value);
    P := Pos(FormatSettings.DecimalSeparator, S);
    case P of
      0:
        begin
          if TryStrToInt64(S, i) then
          begin
            Result := i;
          end
          else
          begin
            Result := 0;
          end;
        end;
    else
      S := Copy(S, 1, P - 1);
      if TryStrToInt64(S, i) then
      begin
        Result := i;
      end
      else
      begin
        Result := 0;
      end;
    end;
  end;
end;

function Round(value: Double; Out Surpluses: Extended): Int64; overload;
begin
  Result := Round(value);
  Surpluses := Frac(value)
end;

function CDiv(dividendo, divisor: Extended; simple: Boolean = False): Extended;
var
  V: Extended;
var
  n: Boolean;
  // var s:string;
begin
  if simple then
  begin
    if (divisor = 0) or (dividendo = 0) then
      Result := 0
    else
      Result := (dividendo / divisor);
  end
  else
  begin
    // devido a problema relacionado com divisão em cima de valores 1000x maior que o dividendo
    // foi necessario fazer o seguinte tratamento
    // ex: (0.02 / 30) = 0.00666666666, mas quando se faz o calculo no windows
    // resulta em ex: (0.02 / 30) = 6,6666666666666666666666666666667e-4, o que é ireal
    // o falto é que o divisou dividido por mil ainda pe maior que o dividendo sendo assim
    // utilizo isso para corrigir o problema, mas esta ainda não é a solucção é apenas provisório
    // ate rescobrir porque no windows ocore esse problema

    // if (divisor=0) then
    // Result:=0
    // else
    // Result:=(dividendo/divisor);

    n := (dividendo < 0);

    if n then
      dividendo := (dividendo * -1);

    V := (divisor / 1000);

    if (divisor = 0) or (dividendo < V) then
      Result := 0
    else
      Result := (dividendo / divisor);

    if n then
      Result := (Result * -1);
  end;
end;

function ToStr(IncValue: string; var value: string): string;
begin
  value := value + IncValue;
  Result := value;
end;

function CountDays(Date1, Date2: TDate): Integer;
var
  i: Integer;
var
  D, M, Y: Word;
begin

  D := 0;
  M := 0;
  Y := 0;

  if Date1 <> 0 then
    DecodeDate(Date1, Y, M, D);
  if (Y > 0) and (M > 0) and (D > 0) then
    Date1 := EncodeDate(Y, M, D)
  else
    Date1 := 0;

  D := 0;
  M := 0;
  Y := 0;

  if Date2 <> 0 then
    DecodeDate(Date2, Y, M, D);

  if (Y > 0) and (M > 0) and (D > 0) then
    Date2 := EncodeDate(Y, M, D)
  else
    Date2 := 0;

  i := 0;
  while (Date1 < Date2) do
  begin
    i := i + 1;
    Date1 := Date1 + 1;
  end;
  Result := i;
end;

function CountMonths(Date1, Date2: TDate): Integer;
var
  i: Integer;
var
  D, M, Y: array [0 .. 1] of Word;
begin
  i := 0;
  if (Date1 <= Date2) then
  begin
    repeat
      DecodeDate(Date1, Y[0], M[0], D[0]);
      if M[1] <> M[0] then
      begin
        inc(i)
      end;
      M[1] := M[0];
      IncDay(Date1, 1);
    until (Date1 = Date2);
  end;
  Result := i;
end;

function CountYears(Date1, Date2: TDate): Integer;
var
  i: Integer;
var
  D, M, Y: array [0 .. 1] of Word;
begin
  i := 0;
  if (Date1 <= Date2) then
  begin
    repeat
      DecodeDate(Date1, Y[0], M[0], D[0]);
      if Y[1] <> Y[0] then
      begin
        inc(i)
      end;
      Y[1] := Y[0];
      IncDay(Date1, 1);
    until (Date1 = Date2);
  end;
  Result := i;
end;

function MoveDates(var Date1, Date2: string): Boolean;
var
  D: string;
begin
  Result := False;
  if IsDate(Date1) or (IsDate(Date2)) then
  begin
    Result := True;
    if IsDate(Date1) and (IsDate(Date2)) then
    begin
      if CDat(Date1) > CDat(Date2) then
      begin
        D := Date2;
        Date2 := Date1;
        Date1 := D;
      end;
    end
    else if IsDate(Date2) then
    begin
      Date1 := Date2;
    end;
  end;
end;

function WeekNumberOfTheMonth(Date: TDate): Integer;
var
  nW: Integer;
  D0, D1: TDate;
  Days: array [1 .. 31] of Integer;
  wY, wM, wD: Word;
begin
  D0 := EncodeDateD(YearOf(Date), MonthOf(Date), 01);
  D1 := EncodeDateD(YearOf(Date), MonthOf(Date), DateUtils.DaysInAMonth(YearOf(Date), MonthOf(Date)));

  nW := 1;
  while D0 < D1 do
  begin
    DecodeDate(D0, wY, wM, wD);
    Days[wD] := nW;
    case DayOfWeek(D0) of
      7:
        inc(nW);
    end;
    D0 := D0 + 1;
  end;
  DecodeDate(Date, wY, wM, wD);

  Result := Days[wD];

end;

function MaxDayOfMonth(Month, Year: Integer): TDate;
var
  D: Word;
begin
  D := MonthDays[IsLeapYear(Year)][Month];
  Result := EncodeDate(Year, Month, D);
end;

function MinDayOfMonth(Month, Year: Integer): TDate;
begin
  Result := EncodeDate(Year, Month, 01);
end;

function DayWeek(DateBase: TDate; Day: TDayWeek; Jump: Integer): TDate;
var
  D0: TDayWeek;
var
  DateCalc: TDate;
var
  i0: TDayWeek;
begin
  DateCalc := DateBase;

  if Jump < 0 then
    Jump := 0;

  // D0:=TDayWeek( DayOfWeek(DateCalc) );

  // ENQUANTO PUDE CONTA VAI RODAR SALTO A SALTO PARA CADA SEMANA
  while Jump >= 0 do
  begin
    D0 := TDayWeek(DayOfWeek(DateCalc)); // DESCOBRI O DIA DA SEMANA

    if D0 <> Day then // SENAO PROCURAR PROXIMO DIA EQUIVALENTE
    begin

      D0 := TDayWeek(DayOfWeek(DateCalc)); // RECUPERA O DIA PARA CONTAGEM

      for i0 := D0 to swSAB do
      begin
        DateCalc := IncDay(DateCalc); // AUMENTA A DATA PQ A ATUAL JA NAO SERVE

        D0 := TDayWeek(DayOfWeek(DateCalc)); // DESCOBRI O NOVO DIA

        if (Jump = 0) and (D0 = Day) then // SE NAO HOUVER SALTO DE SEMANA, PARA E RETORNA A DATA CALCULADA
        begin
          Break;
        end;
      end;
    end;

    Dec(Jump);

  end;

  Result := DateCalc;

end;

function ExcedRecord(Count: Integer): Boolean;
const
  Limite = 999;
begin
  Result := (Count mod Limite) = 0;
end;

function DecZeroLeft(value: string): string;
var
  i: Integer;
var
  C: Char;
begin
  for i := 1 to Length(value) do
  begin
    C := value[i];
    if C <> '0' then
    begin
      value := Mid(value, i);
      Break;
    end;
  end;
  Result := value;
end;

function FormatF(F: string): string; { FUNCAO QUE CORRIGE UM FLOAT MAL FORMADO EX: 1.00.000 => 1.000.00 => 1.000,00 = 1000,00 }
  function Trata(value: string): string;
    function CountPontos(value: string): Integer;
    var
      i: Integer;
    begin
      Result := 0;
      for i := 1 to Length(value) do
      begin
        if value[i] = '.' then
        begin
          inc(Result);
        end;
      end;
    end;
    function CountVirgu(value: string): Integer;
    var
      i: Integer;
    begin
      Result := 0;
      for i := 1 to Length(value) do
      begin
        if value[i] = ',' then
        begin
          inc(Result);
        end;
      end;
    end;

  var
    i: Integer;
    // Ex: 1.00   = 1,00
    // 1.000  = 1.000,00
    // 1.01   = 1,01
    // 1.001  = 1,001,00
    // 0.001  = 0,01
    function TestaMilharouDecimal(value: string): Boolean;
    var
      i: Integer;
      Cont: Integer;
      S: string;
      X: Double;
    begin
      Result := False;
      Cont := 0;
      if CountPontos(value) > 0 then
      begin
        for i := Len(value) downto 1 do
        begin
          if value[i] = '.' then
          begin
            if (Cont) >= 3 then
              Result := True;
            if Result then
            begin
              S := Copy(value, 1, i - 1);
              try
                Result := TryStrToFloat(S, X) and (X > 0);
              except
                Result := False;
              end;
            end;
            Break;
          end
          else
            inc(Cont);
        end;
      end;
    end;

  begin
    if CountVirgu(value) > 0 then
    begin
      // Se tem Virgula Deleta-se todos os pontos
      i := CountPontos(value);
      if i > 0 then
        value := DelChars('.', value, i)
    end
    else if TestaMilharouDecimal(value) then
    begin
      // Retira todos os pontos e formata para milha
      value := DelChars('.', value);
    end
    else
    begin
      // Retira Todos os Pontos menos o ultimo que
      // será substituido por "0".
      i := CountPontos(value);
      // Mais de um ponto retina todos -1 e i uti
      if i > 1 then
        value := DelChars('.', value, i - 1);
      value := SubChars('.', ',', value)
    end;
    Result := value;
  end;

var
  Tam, i, j: Integer;
  function GetPnt: Integer;
  begin
    Result := Pos('.', F);
    Tam := Result;
  end;

var
  R: Double;
begin
  F := Trim(F);
  F := Trata(DecZeroLeft(F));
  if not TryStrToFloat(F, R) then
  begin
    if not IsEmpty(F) then
    begin
      for i := 1 to Length(FormatSettings.Currencystring) do
      begin // PODE SE QUE SEJA $ ou R$
        F := DelChars(ucase(FormatSettings.Currencystring[i])[1], F);
      end;
      F := DelChars(' ', F);
      F := DelChars('%', F);
    end;
    while GetPnt > 0 do
    begin
      i := Tam;
      j := Length(F) - i;
      if j >= 3 then
      begin
        F := DelChar(i, F);
      end
      else
      begin
        F := SubChar(i, ',', F);
      end;
      Tam := Pos('.', F);
    end;
  end;
  Result := F;
end;

function BlendColors(const Color1, Color2: TColor; Amount: Extended): TColor;
var
  R, R2, G, G2, B, B2: Integer;
  win1, win2: Integer;
begin
  win1 := ColorToRGB(Color1);
  win2 := ColorToRGB(Color2);

  // Convert first
  R := GetRValue(win1);
  G := GetGValue(win1);
  B := GetBValue(win1);
  // Convert second
  R2 := GetRValue(win2);
  G2 := GetGValue(win2);
  B2 := GetBValue(win2);

  // Mix them into color1

  B2 := Round((1 - Amount) * B + Amount * B2);
  G2 := Round((1 - Amount) * G + Amount * G2);
  R2 := Round((1 - Amount) * R + Amount * R2);

  // Just to make sure...
  if R2 < 0 then
    R2 := 0;
  if G2 < 0 then
    G2 := 0;
  if B2 < 0 then
    B2 := 0;

  // if we ever reach white we should revert to first color
  if R2 > 255 then
    R2 := R;
  if G2 > 255 then
    G2 := G;
  if B2 > 255 then
    B2 := B;

  Result := TColor(RGB(R2, G2, B2));
end;

function RemoveFileExt(const FileName: string): string;
var
  i: Integer;
begin
  Result := '';
  for i := Length(FileName) downto 1 do
  begin
    case FileName[i] of
      '.':
        begin
          Result := Copy(FileName, 1, i - 1);
          Break;
        end;
    end;
  end;
  case Length(Result) of
    0:
      Result := FileName;
  end;
end;

function ExtractFilePath(FileName: string): string;
var
  i: Integer;
var
  j: Integer;
begin
  j := 0;
  for i := 1 to Length(FileName) do
  begin
    case FileName[i] of
      '\', '/':
        j := i;
    end
  end;
  if j > 0 then
    Result := Copy(FileName, 1, j)
  else
    Result := '';

end;

function ExtractFileName(FileName: string; ignoreextension: Boolean = False): string;
var
  i: Integer;
var
  j: Integer;
var
  P: string;
var
  R: string;
begin
  j := 0;

  P := ExtractFilePath(FileName);

  if (Length(Trim(P)) = 0) then
  begin
    Result := FileName
  end
  else
  begin
    for i := Length(FileName) downto 1 do
    begin
      case FileName[i] of
        '\', '/':
          begin
            j := i;
            Break;
          end;
      else
        R := FileName[i] + R;
      end
    end;

    Result := Model.Patterns.functions.IfThen(j = 0, '', R);

  end;

  if ignoreextension then
  begin
    if Pos('.', Result) > 0 then
    begin
      for i := Length(Result) downto 0 do
      begin
        case Result[i] of
          '.':
            begin
              Result := Copy(Result, 1, i - 1);
              Break;
            end;
        end;
      end;
    end;
  end;

end;

function ExtractFileExt(const FileName: string): string;
var
  E: string;
var
  i: Integer;
begin
  E := '';
  for i := Length(FileName) downto 1 do
  begin
    case FileName[i] of
      '.':
        begin
          E := Copy(FileName, i, Length(FileName));
          Break;
        end;
    end;
  end;
  Result := E;
end;

function AlterFileExtencion(Const FileName: string; NewExtension: string = ''): string;
var
  ex: string;
var
  Fi: string;
begin
  ex := ExtractFileExt(FileName);
  if Length(ex) > 0 then
  begin
    Fi := Copy(FileName, 1, Length(FileName) - Len(ex));
    if Length(NewExtension) > 0 then
    begin
      Fi := format('%s.%s', [Fi, NewExtension]);
    end;
  end
  else
  begin
    Fi := FileName;
  end;
  Result := Fi;
end;

function InternetConectType: TKindConection;
var
  flags: DWORD;
begin
  Result := cnNone;
  if not InternetGetConnectedState(@flags, 0) then
    Exit;

  if (flags and INTERNET_CONNECTION_MODEM) = INTERNET_CONNECTION_MODEM then
    Result := cnModem;
  if (flags and INTERNET_CONNECTION_LAN) = INTERNET_CONNECTION_LAN then
    Result := cnLAN;
  if (flags and INTERNET_CONNECTION_PROXY) = INTERNET_CONNECTION_PROXY then
    Result := cnPROXI;
  if (flags and INTERNET_CONNECTION_MODEM_BUSY) = INTERNET_CONNECTION_MODEM_BUSY then
    Result := cnModem_BUSY;
end;

function InvertStr(value: string): string;
var
  i: Integer;
var
  S: string;
begin
  S := value;
  Result := '';
  if Length(S) > 0 then
  begin
    for i := Length(S) downto 1 do
      Result := Result + S[i]
  end;
end;

function InString(textfind: string; text: string): Boolean;
begin
  Result := Pos(textfind, text) > 0;
end;

function Mid(value: string; Start: Integer; Count: Integer = 0): string;
begin
  Result := '';
  if Count = 0 then
  begin
    Count := Length(value);
  end;

  try
    Result := Copy(value, Start, Count);
  except
    Result := '';
  end;
end;

function Mid(value: Integer; Start: Integer; Count: Integer = 0): string;
begin
  Result := Mid(CStr(value), Start, Count);
end;

function Pos(sSub: string; sStr: string; IniIndex: Integer = 0): Integer;
var
  i: Integer;
var
  sublength: Integer;
var
  sSel: string;
begin
  Result := 0;
  if Length(sStr) = 0 then
    Exit;
  if Length(sSub) = 0 then
    Exit;
  if Length(sSub) > Length(sStr) then
    Exit;
  if Length(sStr) < IniIndex then
    Exit;

  sSub := UpperCase(sSub);
  sStr := UpperCase(sStr);

  sublength := Length(sSub);

  if (IniIndex > 0) then
  begin
    sStr := Copy(sStr, IniIndex, Len(sStr));
  end;

  Result := System.Pos(sSub, sStr);

  if IniIndex = 0 then
    IniIndex := 1;

  for i := IniIndex to Length(sStr) do
  begin
    sSel := Copy(sStr, i, sublength);
    if sSel = sSub then
    begin
      Result := i;
      Break;
    end;
  end;

  if (Result > 0) and (IniIndex > 0) then
    Result := Result + (IniIndex - 1);

end;

function DecimalForRomano(value: Integer): string;
  Function DecToRoman(Decimal: Integer): string;
  const
    Romans: Array [1 .. 13] of string = ('I', 'IV', 'V', 'IX', 'X', 'XL', 'L', 'XC', 'C', 'CD', 'D', 'CM', 'M');
    Arabics: Array [1 .. 13] of Integer = (1, 4, 5, 9, 10, 40, 50, 90, 100, 400, 500, 900, 1000);
  var
    i: Integer;
    scratch: string;
  begin
    scratch := '';
    for i := 13 downto 1 do
      while (Decimal >= Arabics[i]) do
      begin
        Decimal := Decimal - Arabics[i];
        scratch := scratch + Romans[i];
      end;
    Result := scratch;
  end;

begin
  Result := DecToRoman(value);
end;

function AccessPointer(Pointer: Pointer = nil): Boolean;
begin
  Result := Assigned(Pointer);
end;

function CInt(value: Variant): Integer;
var
  E: Extended;
begin
  Result := 0;
  case Length(value) of // teste para acelerar
    0:
      Result := 0;
  else
    if TryStrToFloat(value, E) then
    begin // teste para acelera
      value := CStr(Round(E)); // muda decimal pra inteiro
      if not TryStrToInt(value, Result) then
      begin
        value := FormatF(value);
        if not TryStrToInt(value, Result) then
        begin
          Result := 0;
        end;
      end;
    end;
  end;
end;

function CInt(value: string): Integer;
var
  E: Extended;
begin
  Result := 0;
  case Length(value) of // teste para acelerar
    0:
      Result := 0;
  else
    value := FormatF(value);
    if TryStrToFloat(value, E) then
    begin // teste para acelera
      value := CStr(Round(E)); // muda decimal pra inteiro
      if not TryStrToInt(value, Result) then
      begin
        value := FormatF(value);
        if not TryStrToInt(value, Result) then
        begin
          Result := 0;
        end;
      end;
    end;
  end;
end;

function CInt(value: Extended): Integer;
begin
  Result := Round(value);
end;

function CCar(value: string): Cardinal;
var
  fResult: Int64;
begin
  fResult := 0;
  if not TryStrToInt64(value, fResult) then
  begin
    value := FormatF(value);
    if not TryStrToInt64(value, fResult) then
    begin
      fResult := 0;
    end;
  end;
  if fResult < 0 then
    fResult := 0;

  Result := fResult;
end;

function CInt64(value: string): Int64;
begin
  Result := 0;
  if not TryStrToInt64(value, Result) then
  begin
    value := FormatF(value);
    if not TryStrToInt64(value, Result) then
    begin
      Result := 0;
    end;
  end;
end;

function CInt64(value: Extended): Int64;
begin
  Result := Round(value);
end;

function CPer(value: Variant): Float;
var
  R: Double;
begin
  R := 0;
  value := FormatF(value);
  if not TryStrToFloat(value, R) then
  begin
    R := 0;
  end
  else
  begin
    R := ValideDecimalForFormat(ForceFormat.FormatPer, R);
  end;
  Result := R;
end;

function CCur(value: Variant): Currency;
var
  S: string;
begin
  Result := 0;
  value := FormatF(value);
  if not TryStrToCurr(value, Result) then
  begin
    Result := 0;
  end
  else
  begin
    Result := ValideDecimalForFormat(ForceFormat.FormatCur, Result);
    S := FormatCurr(ForceFormat.FormatCur, Result);
    S := DelChars([FormatSettings.ThousandSeparator], S);
    Result := StrToCurr(S);
  end;
end;

function CFlt(value: Variant): Float;
var
  V: Double;
begin
  V := 0;
  value := FormatF(value);
  if not TryStrToFloat(value, V) then
  begin
    V := 0;
  end
  else
  begin
    V := ValideDecimalForFormat(ForceFormat.FormatFlt, V);
  end;

  Result := V;
end;

function CPureFlt(value: string): Float;
const
  CMask = '0.00000000000';
var
  V: Double;
begin
  V := 0;
  value := FormatF(value);
  if not TryStrToFloat(value, V) then
  begin
    V := 0;
  end
  else
  begin
    V := ValideDecimalForFormat(CMask, V);
  end;

  Result := V;
end;

function PadD(const AString: string; const nLen: Integer; const Caracter: Char): String;
begin
  Result := Copy(AString, 1, nLen);
  Result := StringOfChar(Caracter, (nLen - Length(Result))) + Result;
end;

function CPChar_or_PWideChar(value: string): {$IFDEF SW_UNICODE then}PWideChar{$ELSE}PChar{$ENDIF};
begin
  Result := {$IFDEF SW_UNICODE then}PWideChar{$ELSE}PChar{$ENDIF}(value);
end;

function CWChar(value: Variant): PWideChar;
var
  S: string;
begin
  try
    S := value;
    Result := stringToLPOLESTR(S);
  except
    Result := '';
  end;
end;

function CAChar(value: Variant): PChar;
var
  S: string;
begin
  try
    S := value;
    Result := CPChar_or_PWideChar(S);
  except
    Result := '';
  end;
end;

function CVrt(value: Variant): Variant;
begin
  try
    Result := value;
  except
    Result := Null;
  end;
end;

function CStrBoo(value: Boolean): string;
begin
  if value then
    Result := 'T'
  else
    Result := 'F'
end;

function CChr(value: Variant; Pos: Integer; Upper: Boolean = True): Char;
var
  S: string;
begin
  S := Trim(value);
  Result := #0;
  if Length(S) > 0 then
  begin
    if (Pos > 0) and (Pos <= Length(S)) then
    begin
      Result := S[Pos];
    end
    else
    begin
      Result := S[1];
    end;
  end;
end;

function CChr(value: Variant; Upper: Boolean = True): Char;
begin
  Result := CChr(value, 0, Upper);;
end;

function UChr(value: string): Char;
begin
  if Length(value) = 0 then
  begin
    Result := #0
  end
  else
  begin
    Result := upcase(value[1]);
  end;
end;

function UChr(value: Char): Char;
begin
  Result := upcase(value);
end;

function CStr(value: Int64): string;
begin
  Result := IntToStr(value)
end;

function CStr(value: Extended): string;
begin
  Result := format('%12.6n', [value]);

  // tratamento macaco de bug do da rotina floattostring
  while (Length(Result) > 0) and (Result[Length(Result)] = '0') do
  begin
    Result[Length(Result)] := ' ';
    Result := Trim(Result);
  end;

  if Result[Length(Result)] = FormatSettings.DecimalSeparator then
  begin
    Result := format('%s0', [Result])
  end;

end;

function CStr(value: Variant): string;
begin
  try
    Result := value;
  except
    Result := NullString;
  end;
end;

function AStr(Length: Integer; value: string; Alignment: TAlignment = taLeftJustify; Char: Char = ' '): string; overload;
begin
  Result := AlignStr(Length, value, Char, Alignment);
end;

function AStr(Length: Integer; SFormat: string; Args: array of const; Alignment: TAlignment = taLeftJustify; Char: Char = ' '): string; overload;
begin
  Result := AlignStr(Length, format(SFormat, Args), Char, Alignment);
end;

function AStrL(Length: Integer; value: string; Char: Char = ' '): string; overload;
begin
  Result := AStr(Length, value, taLeftJustify, Char);
end;

function AStrL(Length: Integer; SFormat: string; Args: array of const; Char: Char = ' '): string; overload;
begin
  Result := AStr(Length, format(SFormat, Args), taLeftJustify, Char);
end;

function AStrC(Length: Integer; value: string; Char: Char = ' '): string; overload;
begin
  Result := AStr(Length, value, taCenter, Char);
end;

function AStrC(Length: Integer; SFormat: string; Args: array of const; Char: Char = ' '): string; overload;
begin
  Result := AStr(Length, format(SFormat, Args), taCenter, Char);
end;

function AStrR(Length: Integer; value: string; Char: Char = ' '): string; overload;
begin
  Result := AStr(Length, value, taRightJustify, Char);
end;

function AStrR(Length: Integer; SFormat: string; Args: array of const; Char: Char = ' '): string; overload;
begin
  Result := AStr(Length, format(SFormat, Args), taRightJustify, Char);
end;

function SFmt(format: string; Args: array of const): string;
begin
  Result := System.SysUtils.format(format, Args);
end;

function SFmtCOD(codigo: Integer; descri: string; alignCOD: Integer; defaulttext: string = ''): string;
begin
  if (codigo <= 0) and (descri = '') then
    Result := defaulttext
  else
    Result := System.SysUtils.format('%s-%s', [SCod(codigo, alignCOD), descri]);
end;

function SFmtCOD(codigo: Integer; descri: string; defaulttext: string = ''): string;
begin
  if (codigo <= 0) then
    Result := defaulttext
  else
    Result := System.SysUtils.format('%d-%s', [codigo, descri]);
end;

function SFmtCOD(codigo: string; descri: string; defaulttext: string = ''): string;
begin
  if (codigo = '') and (descri = '') then
    Result := defaulttext
  else
    Result := System.SysUtils.format('%s-%s', [codigo, descri]);
end;

function SCod(value: string; iLength: Integer = 0): string;
begin
  case iLength of
    0:
      begin
        Result := value;
      end;
  else
    while Length(value) < iLength do
      value := format('0%s', [value]);
    Result := value;
  end;
end;

function SCod(value: Int64; iLength: Integer = 0): string;
begin
  Result := SCod(IntToStr(value), iLength);
end;

// function SCod(Value: Double; iLength: Integer = 0): string;
// begin
// Result := SCod(Round(Value), iLength);
// end;

function SDat(value: string; CFormat: string = ''): string;
var
  D: string;
begin
  D := DelChars('_', Trim(value));
  Result := SDat(CDat(D));
end;

function SDat(value: TDate; SimpleDate: Boolean): string;
var
  dy, dm, dd: Word;
begin
  if SimpleDate then
  begin
    DecodeDate(value, dy, dm, dd);
    value := EncodeDate(dy, dm, dd);
  end;
  Result := SDat(value);
end;

function SDat(value: TDate; CFormat: string = ''): string;

  function Al(S: string; Q: Integer): string;
  var
    i: Integer;
  begin
    Result := '';
    for i := 1 to Q do
      Result := Result + S;
  end;

const
  S = '_';
var
  X: string;
var
  D, M, Y, hh, hm, hs, hc: Word;
var
  date_valide: Boolean;
begin

  D := 0;
  M := 0;
  Y := 0;
  hh := 0;
  hm := 0;
  hs := 0;
  hc := 0;

  date_valide := (value <> 0) and (value <> 1) and (value <> 2);
  date_valide := date_valide and ((value <> EncodeDate(1900, 01, 01)) and (value <> EncodeDate(1901, 01, 01)));

  date_valide := date_valide and ((value <> EncodeDateTime(1900, 01, 01, 01, 01, 01, 000)) and (value <> EncodeDateTime(1901, 01, 01, 01, 01, 01, 000)));

  if date_valide then
  begin
    DecodeDateTime(value, Y, M, D, hh, hm, hs, hc)
  end;

  if IsEmpty(CFormat) then
  begin
    if (hh > 0) or (hm > 0) or (hs > 0) or (hc > 0) then
    begin
      CFormat := ForceFormat.FormatDeT
    end
    else
    begin
      CFormat := ForceFormat.FormatDat;
    end;
  end;

  if not date_valide then
  begin
    D := GetCountChars(CFormat, 'd');
    M := GetCountChars(CFormat, 'm');
    Y := GetCountChars(CFormat, 'y');
    X := format('%s%s%s%s%s', [Al(S, D), FormatSettings.DateSeparator, Al(S, M), FormatSettings.DateSeparator, Al(S, Y)]);
    Result := X;
  end
  else
  begin
    Result := formatdatetime(CFormat, value);
  end;
end;

function STim(value: string; CFormat: string = ''): string;
var
  D: TDateTime;
begin
  value := Trim(value);
  value := DelChars('_', value);
  if TryStrToTime(value, D) then
  begin
    if IsEmpty(CFormat) then
      CFormat := ForceFormat.FormatTim;
    Result := formatdatetime(CFormat, D);
  end
  else
  begin
    Result := '';
  end;
end;

function STim(value: TDateTime; CFormat: string = ''): string;
begin
  if IsEmpty(CFormat) then
    CFormat := ForceFormat.FormatTim;
  Result := formatdatetime(CFormat, value);
end;

function SDiv(dividendo, divisor: Extended): Extended;
begin
  Result := 0;
  try
    if divisor <> 0 then
      Result := (dividendo / divisor);
  except
  end;
end;

function SInt(value: Extended; CFormat: string = ''): string;
begin
  Result := SInt(CStr(Round(value)), CFormat);
end;

function SInt(value: string; CFormat: string = ''): string;
begin
  Result := SInt(CInt(value), CFormat);
end;

function SInt(value: Integer; CFormat: string = ''): string;
var
  V: Extended;
begin
  V := value;
  DoUseRegionalSettings;
  if Length(CFormat) > 0 then
  begin
    Result := FormatFloat(CFormat, V);
  end
  else
  begin
    Result := FormatFloat(ForceFormat.FormatInt, V);
  end;
end;

function SFlt(value: string): string;
var
  V: Extended;
begin
  if not TryStrToFloat(value, V) then
  begin
    V := 0;
  end;
  Result := SFlt(V, ForceFormat.FormatFlt);
end;

function SFlt(value: Float; format: string): string;
var
  F: string;
begin

  DoUseRegionalSettings;

  if Length(format) > 0 then
    F := format
  else
    F := ForceFormat.FormatFlt;

  value := ValideDecimalForFormat(F, value);
  Result := FormatFloat(F, value)
end;

function SPer(value: string; IncludeChar: Boolean = False; IncludeSinal: Boolean = False): string;
var
  V: Extended;
begin
  if not TryStrToFloat(value, V) then
  begin
    V := 0;
  end;
  Result := SPer(V, IncludeChar, IncludeSinal);
end;

function SPer(value: Float; IncludeChar: Boolean = False; IncludeSinal: Boolean = False): string;
begin
  DoUseRegionalSettings;
  // --------------------------------------------------------
  Result := FormatFloat(ForceFormat.FormatPer, CPer(value));
  // --------------------------------------------------------
  if IncludeChar then
    Result := Result + PercentChar;
  // --------------------------------------------------------
  if IncludeSinal then
  begin
    if CPer(value) >= 0 then
      Result := format('+ %s', [Result])
    else
      Result := format('- %s', [Result]);
  end;
  // --------------------------------------------------------
end;

function SCur(value: string; IncludeCurrencySymbol: Boolean = False): string;
var
  V: Extended;
begin
  DoUseRegionalSettings;
  if not TryStrToFloat(value, V) then
  begin
    V := 0;
  end;
  V := ValideDecimalForFormat(ForceFormat.FormatCur, V);
  Result := SCur(V, IncludeCurrencySymbol);
end;

function SCur(value: Float; IncludeCurrencySymbol: Boolean = False): string;
begin
  DoUseRegionalSettings;
  value := ValideDecimalForFormat(ForceFormat.FormatCur, value);
  Result := FormatFloat(ForceFormat.FormatCur, value);
  if IncludeCurrencySymbol then
    Result := format('%s %s', [FormatSettings.Currencystring, Result])
end;

function SCur(value: Float; format: string): string;
var
  F: string;
begin

  DoUseRegionalSettings;

  if Length(format) > 0 then
    F := format
  else
    F := ForceFormat.FormatCur;

  value := ValideDecimalForFormat(F, value);
  Result := FormatFloat(F, value)
end;

function CBoo(value: Variant): Boolean;
var
  S: string;
begin
  if Length(value) > 0 then
  begin
    try
      S := UpperCase(value);
      if CharInSet(AnsiChar(S[1]), ['T', 'S']) then
      begin
        Result := True;
      end
      else if (S = '-1') or (S = '1') then
      begin
        Result := True;
      end
      else
      begin
        Result := False;
      end;
    except
      Result := False;
    end
  end
  else
  begin
    Result := False;
  end;
end;

function SBoo(value: Boolean): Char;
begin
  if value then
    Result := 't'
  else
    Result := 'f';
end;

function IBoo(value: Boolean): Integer;
begin
  if value then
    Result := 1
  else
    Result := 0;
end;

function PBoo(value: Boolean): Char;
begin
  if value then
    Result := 's'
  else
    Result := 'n';
end;

function PBoo(value: string): Char;
begin
  Result := PBoo(CBoo(value));
end;

function CDat(value: Variant): TDate;
var
  D: TDateTime;
var
  X: TDate;
begin
  value := Trim(value);
  value := DelChars('_', value);
  if not TryStrToDate(value, D) then
  begin
    X := 0;
  end
  else
  begin
    X := StrToDate(value);
  end;

  if X < 0 then
  begin
    X := 0;
  end;

  Result := X;
end;

function CDat(value: TDateTime): TDate;
var
  D, M, Y: Word;
begin
  DecodeDate(value, Y, M, D);
  Result := EncodeDateD(Y, M, D);
end;

function CTim(value: Variant): TTime;
var
  t: TDateTime;
begin
  if not TryStrToTime(value, t) then
  begin
    t := 0;
  end;
  Result := t;
end;

// function DecompressFile(FileName:string;out outfile:string):Boolean;
//
// var f1:TFileStream;
// var f2:TFileStream;
// var r:Integer;
// var a:array[0..1023] of Char;
// var zb:zlib.TDecompressionStream;
//
// var n1,n2:string;
// begin
//
// n1:=FileName;
// n2:=AlterExt(n1,'decompress');
//
// f1:=TFileStream.Create(n1,fmOpenRead);
// f2:=TFileStream.Create(n2,fmCreate);
// zb:=TDecompressionStream.Create(f1);
//
// repeat
// a:='';
// r:=zb.Read(a,1024);
// f2.Write(a,r);
//
// until (r=0);
//
// zb.Destroy;
// f2.Destroy;
// f1.Destroy;
//
// outfile:=n2;
//
// Result:=True;
// end;
//
// function CompressFile(FileName:string;out outfile:string):Boolean;
//
// var f1:TFileStream;
// var f2:TFileStream;
// var r:Integer;
// var a:array[0..1023] of Char;
// var zb:zlib.TCompressionStream;
//
// var n1,n2:string;
//
// begin
//
// n1:=FileName;
// n2:=AlterExt(n1,'compress');
//
// f1:=TFileStream.Create(n1,fmOpenRead);
// f2:=TFileStream.Create(n2,fmCreate);
// zb:=TCompressionStream.Create(clDefault,f2);
//
// repeat
// a:='';
//
// r:=f1.Read(a,1024);
// zb.Write(a,r);
//
// until (r=0);
//
// zb.Destroy;
// f2.Destroy;
// f1.Destroy;
//
// Result:=True;
//
// outfile:=n2;
//
//
// end;

// function DecompressQFile(FileName:string;outfile:string):Boolean;
// var params:string;
// begin
// Result:=false;
// DeleteFile(outfile);
// if FileExists(FileName) and (not FileExists(outfile)) then
// begin
// FileName:=SubChars('\','/',FileName );
// outfile :=SubChars('\','/',outfile  );
// params:=Format('u %s %s',[FileName,outfile]);
// ExecAndWait(pathswbin+'sw_compress_files_000.exe',params);
// Result:=FileExists(outfile);
// end;
// end;
//
// function CompressQFile(FileName:string;outfile:string):Boolean;
// var params:string;
// begin
// Result:=false;
// DeleteFile(outfile);
// if FileExists(FileName) and (not FileExists(outfile)) then
// begin
// FileName:=SubChars('\','/',FileName );
// outfile :=SubChars('\','/',outfile  );
// params:=Format('c %s %s',[FileName,outfile]);
// ExecAndWait(pathswbin+'sw_compress_files_000.exe',params);
// Result:=FileExists(outfile);
// end;
// end;
//
// function DecompressGFile(FileName:string;outfile:string):Boolean;
// var params:string;
// var newfilename:string;
// var ext:string;
// begin
// Result:=false;
// DeleteFile(outfile);
// if FileExists(FileName) and (not FileExists(outfile)) then
// begin
// ext:=ExtractFileExt(FileName);
// newfilename:=Copy(FileName,1,(length(FileName)-length(ext))-1);
// FileName:=SubChars('/','\',FileName );
// outfile :=SubChars('/','\',outfile  );
// params:=Format('-d %s',[FileName]);
// ExecAndWait(pathswbin+'gzip.exe',params);
// Result:=RenameFile(newfilename,outfile) and FileExists(outfile);
// end;
// end;
//
// function CompressGFile(FileName:string;outfile:string):Boolean;
// var params:string;
// var newFileName:string;
// begin
// Result:=false;
// DeleteFile(outfile);
// if FileExists(FileName) and (not FileExists(outfile)) then
// begin
// newFileName:=Format('%s.gz',[FileName]);
// FileName:=SubChars('/','\',FileName);
// outfile :=SubChars('/','\',outfile);
// params:=Format('-v -9 %s',[FileName]);
// ExecAndWait(pathswbin+'gzip.exe',params);
//
// Result:=RenameFile(newFileName,outfile) and FileExists(outfile);
// end;
// end;

function FileLength(CFile: string): Cardinal;
begin
  Result := FileAllAtributes(CFile).nFileSizeLow;
end;

function FileAllAtributes(cFileName: string): WIN32_FIND_DATA;
var
  C: Cardinal;
begin
  C := Winapi.Windows.FindFirstFile(CPChar_or_PWideChar(cFileName), Result);
  if C = 0 then
    CloseHandle(C);
end;

function FileAtributos(Const FileName: string): Cardinal;
begin
{$IFDEF SW_UNICODE}
  Result := Windows.GetFileAttributesW(CPChar_or_PWideChar(FileName));
{$ELSE}
  Result := Winapi.Windows.GetFileAttributes(CPChar_or_PWideChar(FileName));
{$ENDIF}
end;

function Getstring(sCaption, sPrompt: string; var sResult: string): Boolean;
begin
  Result := InputQuery(sCaption, sPrompt, sResult);
end;

function SubChar(iPos: Integer; sChar: Char; S: string): string; // FUNCAO SOBREPOE UM DETERMINADO CHAR
begin
  try
    S[iPos] := sChar;
    Result := S;
  except
    Result := S;
  end;
end;

function DelChar(iPos: Integer; S: string): string; // FUNCAO DELETA   UM DETERMINADO CHAR
begin
  Result := Copy(S, 1, iPos - 1) + Copy(S, iPos + 1, Length(S));
end;

function CountChar(Chr: Char; value: string): Cardinal;
var
  i: Integer;
begin
  Result := 0;
  for i := 1 to Length(value) do
  begin
    if value[i] = Chr then
    begin
      Result := Result + 1;
    end;
  end;
end;

function LocLeftRigth(Const sChar: Char; Const S: string): Integer;
begin
  Result := Pos(sChar, S);
end;

function LocRigthLeft(Const sChar: Char; Const S: string): Integer;
var
  i: Integer;
begin
  i := Length(S);
  while not i = 0 do
  begin
    if S[i] = sChar then
    begin
      Break;
    end
    else
    begin
      i := i - 1;
    end;
  end;
  Result := i;
end;

function IsEqual(value: string; CompareValue: string): Boolean;
begin
  Result := (value = CompareValue);
end;

function IsEqual(value: string; CompareValue: array of string): Boolean;
var
  i: Integer;
begin
  Result := False;
  for i := 0 to High(CompareValue) do
  begin
    if (value = CompareValue[i]) then
    begin
      Result := True;
      Break;
    end;
  end;
end;

function IsEqual(value: Integer; CompareValue: Integer): Boolean;
begin
  Result := (value = CompareValue);
end;

function IsEqual(value: Integer; CompareValue: array of Integer): Boolean;
var
  i: Integer;
begin
  Result := False;
  for i := 0 to High(CompareValue) do
  begin
    if (value = CompareValue[i]) then
    begin
      Result := True;
      Break;
    end;
  end;
end;

function IsEqual(value: Extended; CompareValue: Extended): Boolean;
begin
  Result := (value = CompareValue);
end;

function IsEqual(value: Extended; CompareValue: array of Extended): Boolean;
var
  i: Integer;
begin
  Result := False;
  for i := 0 to High(CompareValue) do
  begin
    if (value = CompareValue[i]) then
    begin
      Result := True;
      Break;
    end;
  end;
end;

function IsUnidade(Const Unidade: Char): Boolean;
begin
  Result := DirectoryExists(format('%s:%s', [Unidade, PathDelim]));
end;

var
  fpath: string = '';

function path: string;
begin
  if fpath = '' then
    fpath := ExtractFilePath(Application.ExeName);

  Result := fpath;
end;

function pathSW: string;
begin
  Result := 'c:\flexa\';
  // Result:=funcoes.path;
end;

function pathSWBin: string;
begin
  Result := format('%sbin\', [pathSW]);
end;

function pathInclude(LocalDir: string): Boolean;
const
  NPath = 'path';
var
  SPath: string;
begin
  SPath := GetEnvironmentVariable(NPath);

  if Copy(LocalDir, Length(LocalDir), 1) = PathDelim then
  begin
    LocalDir := Copy(LocalDir, 1, Length(LocalDir) - 1);
  end;

  SPath := SPath + format(';%s', [LocalDir]);

  SetEnvironmentVariable(PChar(NPath), PChar(SPath));
  Result := True;

end;

function FileName(Const Arquivo: string): string;
begin
  Result := ExtractFileName(Arquivo);
end;

function DateSystem: string; // RETORNA DATA DO SISTEMA
begin
  Result := formatdatetime(FormatSettings.ShortDateFormat, Date);
end;

function TimeSystem: string; // RETORNA HOTA DO SYSTEMA
begin
  Result := TimeToStr(Time);
end;

function Date: TDate;
begin
  Result := System.SysUtils.Date;
end;

function Date(Day, Month, Year: Word): TDate; overload;
var
  S: string;
begin
  S := format('%s%s%s%s%s', [IntToStr(Day),
  FormatSettings.DateSeparator, IntToStr(Month),
  FormatSettings.DateSeparator, IntToStr(Year)]);
  Result := StrToDate(S);
end;

function DateTimeSystem: string; // DATA HORA DO SISTEMA
begin
  Result := DateTimeToStr(now);
end;

function IsDir(const Dir: string): Boolean;
begin
  Result := DirectoryExists(Dir)
end;

function IsFile(const FileName: string): Boolean;
begin
  Result := FileExists(FileName)
end;

function IsDate(value: string): Boolean;
var
  D: TDateTime;
begin
  value := Trim(value);
  value := DelChars('_', value);
  Result := TryStrToDate(value, D)
end;

function IsDate(value: TDateTime): Boolean;
begin
  Result := (value <> 0);
end;

function IsNotDate(value: string): Boolean;
begin
  Result := not IsDate(value)
end;

function IsNotDate(value: TDateTime): Boolean;
begin
  Result := not IsDate(value)
end;

function IsTime(value: string): Boolean;
var
  D: TDateTime;
begin
  value := Trim(value);
  value := DelChars('_', value);
  Result := TryStrToTime(value, D)
end;

function IsTime(value: TDateTime): Boolean;
begin
  Result := (value <> 0);
end;

function IsDateTime(value: string): Boolean;
var
  D: TDateTime;
begin
  value := Trim(value);
  value := DelChars('_', value);
  Result := TryStrToDateTime(value, D)
end;

function IsInt(value: string): Boolean;
var
  i: Int64;
begin
  Result := TryStrToInt64(value, i);
end;

function IsFloat(value: string): Boolean;
var
  F: Double;
begin
  Result := True;
  value := Trim(value);
  if not TryStrToFloat(value, F) then
  begin
    value := Trim(DelChars('.', value));
    Result := TryStrToFloat(value, F)
  end;
end;

function IsMoeda(value: string): Boolean;
var
  C: Currency;
begin
  Result := True;
  value := Trim(value);
  if not TryStrToCurr(value, C) then
  begin
    value := Trim(DelChars('.', value));
    Result := TryStrToCurr(value, C)
  end;
end;

function IsNotEmpty(value: Integer): Boolean;
begin
  Result := not IsEmpty(value)
end;

function IsNotEmpty(value: string): Boolean;
begin
  Result := not IsEmpty(value)
end;

function IsNotEmpty(value: TDateTime): Boolean;
begin
  Result := not IsEmpty(value)
end;

function IsNotEmpty(value: TObject): Boolean;
begin
  Result := not IsEmpty(value)
end;

function IsNotEmpty(value: Extended): Boolean;
begin
  Result := not IsEmpty(value)
end;

function IsEmpty(value: string): Boolean;
begin
  Result := Length(Trim(value)) = 0;
end;

function IsEmpty(value: Extended): Boolean;
begin
  Result := value = 0;
end;

function IsEmpty(value: TDateTime): Boolean;
begin
  Result := (value = 0);
end;

function IsEmpty(value: TObject): Boolean;
begin
  try
    Result := not Assigned(value);
  except
    Result := True;
  end;
end;

function IsEmptySet(var value: string; NewValue: string): Boolean;
begin
  Result := IsEmpty(value);
  if Result then
  begin
    value := NewValue;
  end;
end;

function IsEmptySet(var value: Float; NewValue: Float): Boolean;
begin
  Result := IsEmpty(value);
  if Result then
  begin
    value := NewValue;
  end;
end;

function IsEmptySet(var value: Currency; NewValue: Currency): Boolean;
begin
  Result := IsEmpty(value);
  if Result then
  begin
    value := NewValue;
  end;
end;

function IsEmptySet(var value: Integer; NewValue: Integer): Boolean;
begin
  Result := IsEmpty(value);
  if Result then
  begin
    value := NewValue;
  end;
end;

function IsEmptySet(var value: TDateTime; NewValue: TDateTime): Boolean;
begin
  Result := IsEmpty(value);
  if Result then
  begin
    value := NewValue;
  end;
end;

function IsEmptySet(var value: TObject; NewValue: TObject): Boolean;
begin
  Result := IsEmpty(value);
  if Result then
  begin
    value := NewValue;
  end;
end;

function IfThen(AValue: Boolean; const ATrue: Int64; const AFalse: Int64): Int64; overload;
begin
  Result := System.Math.IfThen(AValue, ATrue, AFalse);
end;

function IfThen(AValue: Boolean; const ATrue: Cardinal; const AFalse: Cardinal): Cardinal; overload;
begin
  Result := System.Math.IfThen(AValue, ATrue, AFalse);
end;

function IfThen(AValue: Boolean; const ATrue: Integer; const AFalse: Integer): Integer; overload;
begin
  Result := System.Math.IfThen(AValue, ATrue, AFalse);
end;

function IfThen(AValue: Boolean; const ATrue: Extended; const AFalse: Extended): Extended; overload;
begin
  Result := System.Math.IfThen(AValue, ATrue, AFalse);
end;

function IfThen(AValue: Boolean; const ATrue: string; const AFalse: string): string; overload;
begin
  if AValue then
  begin
    Result := ATrue
  end
  else
  begin
    Result := AFalse;
  end;
end;

function IfThen(AValue: Boolean; const ATrue: TDateTime; const AFalse: TDateTime): TDateTime; overload;
begin
  Result := System.Math.IfThen(AValue, ATrue, AFalse);
end;

function IfThenColor(AValue: Boolean; const ATrue: TColor; const AFalse: TColor): TColor; overload;
begin
  Result := System.Math.IfThen(AValue, ATrue, AFalse);
end;

Function IIF(xTeste: Boolean; SeTrue, SeFalse: Variant): Variant;
begin if xTeste then Result := SeTrue else Result := SeFalse end;

function FormataData(format: string; Data: string): string;
var
  D: TDateTime;
begin
  Result := '';
  format := Trim(format);
  if IsEmpty(format) then
    format := FormatSettings.ShortDateFormat;
  if TryStrToDate(Data, D) then
  begin
    Result := formatdatetime(format, D);
  end;
end;

function FormataHora(format: string; Hora: string): string;
var
  H: TDateTime;
begin
  Result := '';
  format := Trim(format);
  if IsEmpty(format) then
    format := FormatSettings.ShortTimeFormat;
  if TryStrToTime(Hora, H) then
  begin
    Result := formatdatetime(format, H);
  end;
end;

function FormataDataHota(format: string; DataHota: string): string;
begin
  format := Trim(format);
  if IsEmpty(format) then
  begin
    format := System.SysUtils.format('%s "as" %s', [FormatSettings.ShortTimeFormat, FormatSettings.ShortDateFormat]);
  end;
  try
    Result := formatdatetime(format, StrToDateTime(DataHota));
  except
  end;
end;

function GetCountChars(value: string; CChar: array of Char): Integer;
var
  i, j: Integer;
var
  C: Char;
begin
  Result := 0;
  for i := 1 to Length(value) do
  begin
    C := value[i];
    for j := 0 to High(CChar) do
    begin
      if C = CChar[j] then
      begin
        Result := Result + 1;
        Break;
      end;
    end;
  end;
end;

function GetCountChars(value: string; CChar: Char): Integer;
begin
  Result := GetCountChars(value, [CChar]);
end;

function GetNumbers(value: string): string;
var
  i: Integer;
var
  C: Char;
begin
  Result := NullString;
  for i := 1 to Length(value) do
  begin
    C := upcase(value[i]);
    if CharInSet(AnsiChar(C), ['0' .. '9']) then
    begin
      Result := Result + C;
    end;
  end;
end;

function GetAlfa(value: string): string;
var
  i: Integer;
var
  C: Char;
begin
  Result := NullString;
  for i := 1 to Length(value) do
  begin
    C := upcase(value[i]);
    if CharInSet(AnsiChar(C), ['A' .. 'Z']) then
    begin
      Result := Result + C;
    end;
  end;
end;

function GetAlfaNumeric(value: string): string;
var
  i: Integer;
var
  C: Char;
begin
  Result := NullString;
  for i := 1 to Length(value) do
  begin
    C := upcase(value[i]);
    if CharInSet(AnsiChar(upcase(C)), ['A' .. 'Z', '0' .. '9']) then
    begin
      Result := Result + C;
    end;
  end;
end;

function xCaixaDialogo(Const CMessage: string): Boolean;
begin
  Result := xCaixaDialogo(cxInfo, CMessage);
end;

function xCaixaDialogo(CShow: TShowDialog; Const CMessage: string): Boolean;
begin
  Result := SimpleMessage(CShow, CMessage);
end;

function xCaixaDialogo(CShow: TShowDialog; const CFormat: string; Args: array of const): Boolean; overload;
begin
  Result := xCaixaDialogo(CShow, format(CFormat, Args));
end;

function SimpleMessage(Const CMessage: string): Boolean;
begin
  Result := SimpleMessage(cxInfo, CMessage)
end;

function SimpleMessage(const CFormat: string; Args: array of const): Boolean;
begin
  Result := SimpleMessage(cxInfo, CFormat, Args)
end;

function SimpleMessage(CShow: TShowDialog; const CFormat: string; Args: array of const): Boolean;
begin
  Result := SimpleMessage(CShow, format(CFormat, Args));
end;

function SimpleMessage(CShow: TShowDialog; Const CMessage: string): Boolean;
  function Show(Icon: Integer; Title: string; Prompt: string; flags: Integer): Boolean;
  begin
    Result := Application.MessageBox(CPChar_or_PWideChar(Prompt), CPChar_or_PWideChar(Title), Icon + flags) = mrYes;
  end;

begin
  case CShow of
    cxInfo:
      Result := Show(MB_ICONINFORMATION, 'Informação', CMessage, MB_OK);
    cxWarning:
      Result := Show(MB_ICONWARNING, 'Atenção', CMessage, MB_OK);
    cxQuest:
      Result := Show(MB_ICONQUESTION, 'Confirme', CMessage, MB_YESNO);
    cxQuestWarning:
      Result := Show(MB_ICONWARNING, 'Confirme', CMessage, MB_YESNO);
    cxError:
      Result := Show(MB_ICONERROR, 'Falha Detectada', CMessage, MB_OK);
  else
    Result := False;
  end;
end;

function IsDiskInDriver(Const Unidade: Char): Boolean;
var
  DrvNum: Byte;
var
  EMode: Word;
begin
  DrvNum := ord(Unidade);
  if DrvNum >= ord('a') then
    System.Dec(DrvNum, $20);
  EMode := SetErrorMode(SEM_FAILCRITICALERRORS);
  try
    Result := (DiskSize(DrvNum - $40) <> -1);
  finally
    SetErrorMode(EMode);
  end;
end;

function DirWin: string;
var
  Buffer: array [0 .. 144] of Char;
begin
  try
    GetWindowsDirectory(Buffer, 144);
    Result := StrPas(Buffer) + PathDelim;
  except
  end;
end;

function DirSystem(Local: TLocalDirectory): string;
var
  CSLDL: Integer;
var
  PIDL: PItemIDList;
var
  GetDire: array [0 .. MAX_PATH] of Char;
begin
  case Local of
    ldCSIDL_DESKTOP:
      CSLDL := CSIDL_DESKTOP;
    ldCSIDL_INTERNET:
      CSLDL := CSIDL_INTERNET;
    ldCSIDL_PROGRAMS:
      CSLDL := CSIDL_PROGRAMS;
    ldCSIDL_CONTROLS:
      CSLDL := CSIDL_CONTROLS;
    ldCSIDL_PRINTERS:
      CSLDL := CSIDL_PRINTERS;
    ldCSIDL_PERSONAL:
      CSLDL := CSIDL_PERSONAL;
    ldCSIDL_FAVORITES:
      CSLDL := CSIDL_FAVORITES;
    ldCSIDL_STARTUP:
      CSLDL := CSIDL_STARTUP;
    ldCSIDL_RECENT:
      CSLDL := CSIDL_RECENT;
    ldCSIDL_SENDTO:
      CSLDL := CSIDL_SENDTO;
    ldCSIDL_BITBUCKET:
      CSLDL := CSIDL_BITBUCKET;
    ldCSIDL_STARTMENU:
      CSLDL := CSIDL_STARTMENU;
    ldCSIDL_MYDOCUMENTS:
      CSLDL := CSIDL_MYDOCUMENTS;
    ldCSIDL_MYMUSIC:
      CSLDL := CSIDL_MYMUSIC;
    ldCSIDL_MYVIDEO:
      CSLDL := CSIDL_MYVIDEO;
    ldCSIDL_DESKTOPDIRECTORY:
      CSLDL := CSIDL_DESKTOPDIRECTORY;
    ldCSIDL_DRIVES:
      CSLDL := CSIDL_DRIVES;
    ldCSIDL_NETWORK:
      CSLDL := CSIDL_NETWORK;
    ldCSIDL_NETHOOD:
      CSLDL := CSIDL_NETHOOD;
    ldCSIDL_FONTS:
      CSLDL := CSIDL_FONTS;
    ldCSIDL_TEMPLATES:
      CSLDL := CSIDL_TEMPLATES;
    ldCSIDL_COMMON_STARTMENU:
      CSLDL := CSIDL_COMMON_STARTMENU;
    ldCSIDL_COMMON_PROGRAMS:
      CSLDL := CSIDL_COMMON_PROGRAMS;
    ldCSIDL_COMMON_STARTUP:
      CSLDL := CSIDL_COMMON_STARTUP;
    ldCSIDL_COMMON_DESKTOPDIRECTORY:
      CSLDL := CSIDL_COMMON_DESKTOPDIRECTORY;
    ldCSIDL_APPDATA:
      CSLDL := CSIDL_APPDATA;
    ldCSIDL_PRINTHOOD:
      CSLDL := CSIDL_PRINTHOOD;
    ldCSIDL_LOCAL_APPDATA:
      CSLDL := CSIDL_LOCAL_APPDATA;
    ldCSIDL_ALTSTARTUP:
      CSLDL := CSIDL_ALTSTARTUP;
    ldCSIDL_COMMON_ALTSTARTUP:
      CSLDL := CSIDL_COMMON_ALTSTARTUP;
    ldCSIDL_COMMON_FAVORITES:
      CSLDL := CSIDL_COMMON_FAVORITES;
    ldCSIDL_INTERNET_CACHE:
      CSLDL := CSIDL_INTERNET_CACHE;
    ldCSIDL_COOKIES:
      CSLDL := CSIDL_COOKIES;
    ldCSIDL_HISTORY:
      CSLDL := CSIDL_HISTORY;
    ldCSIDL_COMMON_APPDATA:
      CSLDL := CSIDL_COMMON_APPDATA;
    ldCSIDL_WINDOWS:
      CSLDL := CSIDL_WINDOWS;
    ldCSIDL_SYSTEM:
      CSLDL := CSIDL_SYSTEM;
    ldCSIDL_PROGRAM_FILES:
      CSLDL := CSIDL_PROGRAM_FILES;
    ldCSIDL_MYPICTURES:
      CSLDL := CSIDL_MYPICTURES;
    ldCSIDL_PROFILE:
      CSLDL := CSIDL_PROFILE;
    ldCSIDL_SYSTEMX86:
      CSLDL := CSIDL_SYSTEMX86;
    ldCSIDL_PROGRAM_FILESX86:
      CSLDL := CSIDL_PROGRAM_FILESX86;
    ldCSIDL_PROGRAM_FILES_COMMON:
      CSLDL := CSIDL_PROGRAM_FILES_COMMON;
    ldCSIDL_PROGRAM_FILES_COMMONX86:
      CSLDL := CSIDL_PROGRAM_FILES_COMMONX86;
    ldCSIDL_COMMON_TEMPLATES:
      CSLDL := CSIDL_COMMON_TEMPLATES;
    ldCSIDL_COMMON_DOCUMENTS:
      CSLDL := CSIDL_COMMON_DOCUMENTS;
    ldCSIDL_COMMON_ADMINTOOLS:
      CSLDL := CSIDL_COMMON_ADMINTOOLS;
    ldCSIDL_ADMINTOOLS:
      CSLDL := CSIDL_ADMINTOOLS;
    ldCSIDL_CONNECTIONS:
      CSLDL := CSIDL_CONNECTIONS;
    ldCSIDL_COMMON_MUSIC:
      CSLDL := CSIDL_COMMON_MUSIC;
    ldCSIDL_COMMON_PICTURES:
      CSLDL := CSIDL_COMMON_PICTURES;
    ldCSIDL_COMMON_VIDEO:
      CSLDL := CSIDL_COMMON_VIDEO;
    ldCSIDL_RESOURCES:
      CSLDL := CSIDL_RESOURCES;
    ldCSIDL_RESOURCES_LOCALIZED:
      CSLDL := CSIDL_RESOURCES_LOCALIZED;
    ldCSIDL_COMMON_OEM_LINKS:
      CSLDL := CSIDL_COMMON_OEM_LINKS;
    ldCSIDL_CDBURN_AREA:
      CSLDL := CSIDL_CDBURN_AREA;
    ldCSIDL_COMPUTERSNEARME:
      CSLDL := CSIDL_COMPUTERSNEARME;
    // ldCSIDL_PROFILES                    :CSLDL:=CSIDL_PROFILES                    ;
    ldCSIDL_FLAG_CREATE:
      CSLDL := CSIDL_FLAG_CREATE;
    ldCSIDL_FLAG_DONT_VERIFY:
      CSLDL := CSIDL_FLAG_DONT_VERIFY;
    ldCSIDL_FLAG_DONT_UNEXPAND:
      CSLDL := CSIDL_FLAG_DONT_UNEXPAND;
    ldCSIDL_FLAG_NO_ALIAS:
      CSLDL := CSIDL_FLAG_NO_ALIAS;
    ldCSIDL_FLAG_PER_USER_INIT:
      CSLDL := CSIDL_FLAG_PER_USER_INIT;
    ldCSIDL_FLAG_MASK:
      CSLDL := CSIDL_FLAG_MASK;
  else
    CSLDL := CSIDL_DESKTOP;
  end;
  SHGetSpecialFolderLocation(0, CSLDL, PIDL);

  SHGetPathFromIDList(PIDL, GetDire);
  Result := Trim(GetDire);
  if (Length(Result) > 0) and (Result[Length(Result)] <> PathDelim) then
  begin
    Result := Result + PathDelim;
  end;

end;

function DirSystem: string;
var
  Buffer: Array [0 .. 144] of Char;
begin
  try
    GetSystemDirectory(Buffer, 144);
    Result := StrPas(Buffer) + PathDelim;
  except
  end;
end;

function DirWinTemp: string;
var
  TempDir: Array [0 .. 255] of Char;
begin
  GetTempPath(255, @TempDir);
  Result := StrPas(TempDir);
end;

function FreeSpace(TamanhoDesejado: Integer; Unidade: Byte): Boolean;
begin
  Result := False;
  if TamanhoDesejado > DiskFree(Unidade) then
    Result := True;
end;

function AlignStr(Tamanho: Integer; value, Caracter: string; Alinhar: TAlignment): string;
var
  i: Integer;
begin
  value := Copy(value, 1, Tamanho);;
  Tamanho := Tamanho - Length(value);
  Result := value;
  for i := 1 to Tamanho do
  begin
    case Alinhar of
      taLeftJustify:
        Result := Result + Caracter;
      taRightJustify:
        Result := Caracter + Result;
      taCenter:
        if Odd(i) then
        begin
          Result := Result + Caracter;
        end
        else
        begin
          Result := Caracter + Result;
        end;
    end;
  end;
  value := NullString;
end;

function DupStr(Length: Integer; const Str: string): string;
var
  i: Integer;
begin
  Result := NullString;
  if Length > 0 then
  begin
    for i := 1 to Length do
    begin
      Result := Result + Str;
    end;
  end;

end;

function isInscEst(numinsc, uf: string): Boolean;

  function validaUF(uf: string): Boolean;
  var
    ufs: string;
  begin
    ufs := 'AC,AL,AP,AM,BA,CE,DF,ES,GO,MA,MT,MS,MG,PA,PB,PR,PE,PI,RJ,RN,RS,RO,RR,SC,SP,SE,TO,EX';
    Result := Pos(uf, ufs) > 0;
  end;

  function Modulo11(Valor: String; Base: Integer = 9; checkZERO_UM: Boolean = True; initialSoma: Integer = 0; reiniPeso: Integer = 2; resDiv: Boolean = False): string;
  var
    Soma: Integer;
  var
    Contador, Peso, Digito: Integer;
  begin
    Soma := initialSoma;
    Peso := 2;

    for Contador := Length(Valor) downto 1 do
    begin
      Soma := Soma + (StrToInt(Valor[Contador]) * Peso);
      if Peso < Base then
        Peso := Peso + 1
      else
        Peso := reiniPeso;
    end;

    Digito := 0;
    if Soma >= 11 then
      Digito := (Soma mod 11);

    if resDiv then
    begin
    end
    else if (Digito = 0) or (Digito = 1) then
    begin
      if checkZERO_UM then
        Digito := 0;
    end
    else
    begin
      Digito := 11 - Digito;
    end;

    Result := IntToStr(Digito);
  end;

  function regras_Maranhao: Boolean;
  var
    Digito: string;
  var
    insc: string;
  begin
    // Tamanho: 9 dígitos
    // - os dois primeiros correspondentes ao código do Estado(12);
    // - os seis seguintes ao número de ordem no cadastro;
    // - e o último dígito ao dígito de controle, calculado através do módulo 11.
    Result := False;
    if (Len(numinsc) = 9) and (Copy(numinsc, 1, 2) = '12') then
    begin
      Digito := Copy(numinsc, 09, 01);
      insc := Copy(numinsc, 01, 08);

      Result := Digito = (Modulo11(insc));
    end;
  end;

  function regras_Para: Boolean;
  var
    Digito: string;
  var
    insc: string;
  begin
    // Tamanho: 9 dígitos
    // - 15: Número Padrão Pará
    // - 999999: Sequência
    // - Dígito Verificador (Módulo 11)
    Result := False;
    if (Len(numinsc) = 9) and (Copy(numinsc, 1, 2) = '15') then
    begin
      Digito := Copy(numinsc, 09, 01);
      insc := Copy(numinsc, 01, 08);

      Result := Digito = (Modulo11(insc));
    end;
  end;

  function regras_Tocantins: Boolean;
  var
    Digito: string;
  var
    insc: string;
  begin
    // --Aplica-se o cálculo "módulo 11" com os algarismos 1,2,5,6,7,8,9,10 da Inscrição Estadual,
    // --criando o "11º" que é o dígito verificador. Os dígitos "3" e "4" não entram no cálculo,
    // --porém podem assumir somente os seguintes valores:
    Result := False;
    if (Len(numinsc) = 11) then
    begin
      Digito := Copy(numinsc, 11, 1);
      insc := Copy(numinsc, 1, 2) + Copy(numinsc, 5, 6);

      Result := Digito = (Modulo11(insc));
    end
    else if (Len(numinsc) = 09) then
    begin
      Digito := Copy(numinsc, 09, 01);
      insc := Copy(numinsc, 01, 08);

      Result := Digito = (Modulo11(insc));
    end;
  end;

  function regras_Goias: Boolean;
  var
    Digito: string;
  var
    digche: string;
  var
    insc: string;
  begin
    // 102770581

    // Formato da Inscrição: AB.CDE.FGH-I 8 dígitos (ABCDEFGH) + 1 dígito verificador (I);
    // onde AB pode ser igual a 10 ou 11 ou 15.
    Result := False;
    if (Len(numinsc) = 09) and ((Copy(numinsc, 1, 2) = '10') or (Copy(numinsc, 1, 2) = '11') or (Copy(numinsc, 1, 2) = '15')) then
    begin
      Digito := Copy(numinsc, 09, 01);
      insc := Copy(numinsc, 01, 08);

      if insc = '11094402' then
        digche := '0'
      else
        digche := Modulo11(insc, 9, False, 0, 2, True);

      if (digche = '0') then
        digche := '0'
      else if (digche = '1') and (BetweenInt(CInt(insc), 10103105, 10119997)) then
        digche := '1'
      else if (digche = '1') and not(BetweenInt(CInt(insc), 10103105, 10119997)) then
        digche := '0'
      else
      begin
        digche := SCod(11 - CInt(digche));
      end;

      Result := Digito = digche;
    end;
  end;

  function regras_Parana: Boolean;
  var
    digito01: string;
  var
    digito02: string;
  var
    insc01: string;
  var
    insc02: string;
  begin
    // Cálculo do Primeiro Dígito: Módulo 11 com pesos de 2 a 7,
    // aplicados da direita para esquerda, sobre as 8 primeiras posições.
    // ------------------------------------------------------------------
    // Cálculo do Segundo Dígito: Módulo 11 com pesos de 2 a 7,
    // aplicados da direita para esquerda, sobre as 9 primeiras posições
    // (inclui o primeiro dígito).
    Result := False;
    if (Len(numinsc) = 10) then
    begin
      digito01 := Copy(numinsc, 09, 01);
      digito02 := Copy(numinsc, 10, 01);

      insc01 := Copy(numinsc, 01, 08);
      insc02 := Copy(numinsc, 01, 09);

      Result := (digito01 = (Modulo11(insc01, 7))) and (digito02 = (Modulo11(insc02, 7)));
    end;
  end;

  function regras_Piaui: Boolean;
  var
    Digito: string;
  var
    insc: string;
  begin
    // Tamanho: 9 dígitos
    // - 15: Número Padrão Pará
    // - 999999: Sequência
    // - Dígito Verificador (Módulo 11)
    Result := False;
    if (Len(numinsc) = 9) then
    begin
      Digito := Copy(numinsc, 09, 01);
      insc := Copy(numinsc, 01, 08);

      Result := Digito = (Modulo11(insc));
    end;
  end;

  function regras_SantaCatarina: Boolean;
  var
    Digito: string;
  var
    insc: string;
  begin
    // Atribui-se um peso a cada dígito da inscrição exceto o ultimo digito a direita
    Result := False;
    if (Len(numinsc) = 9) then
    begin
      Digito := Copy(numinsc, 09, 01);
      insc := Copy(numinsc, 01, 08);

      Result := Digito = (Modulo11(insc));
    end;
  end;

  function regras_RioGrandeDoSul: Boolean;
  var
    Digito: string;
  var
    insc: string;
  begin
    // Formato: 3 dígitos (município) + 6 dígitos (empresa) + 1 dígito verificador
    // Exemplo: Inscrição Estadual número 224/3658792
    Result := False;
    if (Len(numinsc) = 10) then
    begin
      Digito := Copy(numinsc, 10, 01);
      insc := Copy(numinsc, 01, 09);

      Result := Digito = (Modulo11(insc));
    end;
  end;

  function regras_Ceara: Boolean;
  var
    Digito: string;
  var
    insc: string;
  begin
    // Formato: 8 dígitos + 1 dígito verificador
    // Exemplo: CGF número 06000001-5
    Result := False;
    if (Len(numinsc) = 09) then
    begin
      Digito := Copy(numinsc, 09, 01);
      insc := Copy(numinsc, 01, 08);

      Result := Digito = (Modulo11(insc));
    end;
  end;

  function regras_RioDeJaneiro: Boolean;
  var
    Digito: string;
  var
    insc: string;
  begin
    Result := False;
    if (Len(numinsc) = 08) then
    begin
      Digito := Copy(numinsc, 08, 01);
      insc := Copy(numinsc, 01, 07);

      Result := Digito = (Modulo11(insc, 7));
    end;
  end;

  function regras_Alagoas: Boolean;
  var
    Digito: string;
  var
    insc: string;
  begin
    // 24 – Código do Estado
    // X – Tipo de empresa (0-Normal, 3-Produtor Rural, 5-Substituta, 7- Micro-Empresa Ambulante, 8-Micro-Empresa)
    // NNNNN – Número da empresa
    // D – Dígito de verificação calculado pelo Módulo11, pêsos 2 à 9 da direita para a esquerda, exceto D
    Result := False;
    if ((Len(numinsc)) = 09) and (Copy(numinsc, 1, 2) = '24') then
    begin
      Digito := Copy(numinsc, 09, 01);
      insc := Copy(numinsc, 01, 08);

      Result := Digito = (Modulo11(insc));
    end;
  end;

  function regras_Sergipe: Boolean;
  var
    Digito: string;
  var
    insc: string;
  begin
    // Formato: 8 dígitos + 1 dígito verificador
    // Exemplo: IE número 27123456-3
    // Desconsidera-se, para efeito de cálculo, o dígito verificador:
    Result := False;
    if (Len(numinsc)) = 09 then
    begin
      Digito := Copy(numinsc, 09, 01);
      insc := Copy(numinsc, 01, 08);

      Result := Digito = (Modulo11(insc));
    end;
  end;

  function regras_Acre: Boolean;
  var
    digito01: string;
  var
    digito02: string;
  var
    insc01: string;
  var
    insc02: string;
  begin
    // Fórmula do cálculo do dígito verificador da inscrição estadual (módulo 11)
    // Formato: 11 dígitos + 2 dígitos verificadores
    // Os primeiros dois dígitos são sempre 01
    Result := False;
    if (Len(numinsc) = 13) and (Copy(numinsc, 1, 2) = '01') then
    begin
      digito01 := Copy(numinsc, 12, 01);
      digito02 := Copy(numinsc, 13, 01);

      insc01 := Copy(numinsc, 01, 11);
      insc02 := Copy(numinsc, 01, 12);

      Result := (digito01 = (Modulo11(insc01))) and (digito02 = (Modulo11(insc02)));
    end;
  end;

  function regras_Amapa: Boolean;
  var
    Digito: string;
  var
    insc: string;
  var
    P, D: Integer;
  var
    digche: string;
  begin
    // Formato: 2 dígitos constantes (03) + 6 dígitos (empresa) +1 dígito verificador
    // Exemplo: Inscrição Estadual número 030123459
    // Define-se dois valores, p e d, de acordo com as seguintes faixas de Inscrição Estadual:
    // De 03000001 a 03017000 => p = 5 e d = 0
    // De 03017001 a 03019022 => p = 9 e d = 1
    // De 03019023 em diante ===>p = 0 e d = 0

    Result := False;
    if (Len(numinsc) = 09) and (Copy(numinsc, 1, 2) = '03') then
    begin
      Digito := Copy(numinsc, 09, 01);
      insc := Copy(numinsc, 01, 08);
      P := 00;
      D := 00;

      if BetweenInt(CInt(insc), 03000001, 03017000) then
      begin
        P := 5;
        D := 0;
      end
      else if BetweenInt(CInt(insc), 03017001, 03019022) then
      begin
        P := 9;
        D := 1;
      end
      else if CInt(insc) >= 03019023 then
      begin
        P := 0;
        D := 0;
      end;

      digche := (Modulo11(insc, 9, False, P));

      if digche = '1' then
        digche := '0'
      else if digche = '0' then
        digche := SCod(D);

      Result := digche = Digito;
    end;
  end;

  function regras_Amazonas: Boolean;
  var
    Digito: string;
  var
    insc: string;
  begin
    // Máscara de edição: 99 . 999 . 999 - 9
    // Cálculo do dígito verificador: 99 . 999 . 999
    // Modulo 11
    Result := False;
    if (Len(numinsc)) = 09 then
    begin
      Digito := Copy(numinsc, 09, 01);
      insc := Copy(numinsc, 01, 08);

      Result := Digito = (Modulo11(insc));
    end;
  end;

  function regras_DistritoFederal: Boolean;
  var
    digito01: string;
  var
    digito02: string;
  var
    insc01: string;
  var
    insc02: string;
  begin
    // Fórmula do cálculo do dígito verificador da inscrição estadual (módulo 11)
    // Formato: 11 dígitos + 2 dígitos verificadores
    // Os primeiros dois dígitos são sempre 07
    Result := False;
    if (Len(numinsc) = 13) and (Copy(numinsc, 1, 2) = '07') then
    begin
      digito01 := Copy(numinsc, 12, 01);
      digito02 := Copy(numinsc, 13, 01);

      insc01 := Copy(numinsc, 01, 11);
      insc02 := Copy(numinsc, 01, 12);

      Result := (digito01 = (Modulo11(insc01))) and (digito02 = (Modulo11(insc02)));
    end;
  end;

  function regras_EspiritoSanto: Boolean;
  var
    Digito: string;
  var
    insc: string;
  begin
    // Máscara de edição: 99 . 999 . 999 - 9
    // Cálculo do dígito verificador: 99 . 999 . 999
    // Modulo 11
    Result := False;
    if (Len(numinsc)) = 09 then
    begin
      Digito := Copy(numinsc, 09, 01);
      insc := Copy(numinsc, 01, 08);

      Result := Digito = (Modulo11(insc));
    end;
  end;

  function regras_MatoGrosso: Boolean;
  var
    Digito: string;
  var
    insc: string;
  begin
    // Modulo 11
    Result := False;

    if Len(numinsc) <= 11 then
      numinsc := SCod(numinsc, 11);
    if (Len(numinsc)) = 11 then
    begin
      Digito := Copy(numinsc, 11, 01);
      insc := Copy(numinsc, 01, 10);

      Result := Digito = (Modulo11(insc));
    end;
  end;

  function regras_MatoGrossoDoSul: Boolean;
  var
    Digito: string;
  var
    insc: string;
  begin
    // I – o primeiro dígito será sempre representado pelo número 2;
    // II - o segundo dígito será sempre representado pelo número 8.
    Result := False;

    if ((Len(numinsc)) = 9) and (Copy(numinsc, 1, 2) = '28') then
    begin
      Digito := Copy(numinsc, 09, 01);
      insc := Copy(numinsc, 01, 08);

      Result := Digito = (Modulo11(insc));
    end;
  end;

  function regras_Paraiba: Boolean;
  var
    Digito: string;
  var
    insc: string;
  begin
    // Máscara de edição: 99 . 999 . 999 - 9
    // Cálculo do dígito verificador: 99 . 999 . 999
    // Modulo 11
    Result := False;
    if (Len(numinsc)) = 09 then
    begin
      Digito := Copy(numinsc, 09, 01);
      insc := Copy(numinsc, 01, 08);

      Result := Digito = (Modulo11(insc));
    end;
  end;

  function regras_Pernambuco: Boolean;
  var
    digito01: string;
  var
    digito02: string;
  var
    insc01: string;
  var
    insc02: string;
  begin
    Result := False;
    if (Len(numinsc) = 09) then
    begin
      digito01 := Copy(numinsc, 08, 01);
      digito02 := Copy(numinsc, 09, 01);

      insc01 := Copy(numinsc, 01, 07);
      insc02 := Copy(numinsc, 01, 08);

      Result := (digito01 = (Modulo11(insc01))) and (digito02 = (Modulo11(insc02)));
    end
    else if Len(numinsc) = 14 then
    begin
      digito01 := Copy(numinsc, 14, 01);
      insc01 := Copy(numinsc, 01, 13);

      Result := digito01 = Modulo11(insc01, 9, True, 0, 1);
    end;
  end;

  function regras_Roraima: Boolean;
  var
    Digito: string;
  var
    insc: string;

    function modulo09(ie: string): string;
    var
      Soma: Integer;
    var
      Contador, Peso, Digito: Integer;
    begin
      Soma := 0;
      Peso := 1;

      for Contador := 1 to Length(ie) do
      begin
        Soma := Soma + (StrToInt(ie[Contador]) * Peso);
        Peso := Peso + 1;
      end;

      Digito := 0;
      if Soma >= 09 then
        Digito := (Soma mod 09);

      Result := IntToStr(Digito);
    end;

  begin
    Result := False;
    if ((Len(numinsc)) = 09) and (Copy(numinsc, 1, 2) = '24') then
    begin
      Digito := Copy(numinsc, 09, 01);
      insc := Copy(numinsc, 01, 08);

      Result := Digito = (modulo09(insc));
    end;
  end;

  function regras_Rondonia: Boolean;
  var
    Digito: string;
  var
    insc: string;
  begin
    Result := False;
    // if (len(numinsc)=09) then
    // begin
    // digito := copy(numinsc,09,01);
    // insc   := copy(numinsc,04,05);
    //
    // Result := (digito = (Modulo11(insc)));
    // end
    // else
    if Len(numinsc) = 14 then
    begin
      Digito := Copy(numinsc, 14, 01);
      insc := Copy(numinsc, 01, 13);

      Result := Digito = Modulo11(insc);
    end;
  end;

  function regras_RioGrandeDoNorte: Boolean;
  var
    Digito: string;
  var
    insc: string;

    function ModuloRN(ie: String; Base: Integer = 10): string;
    var
      Soma: Integer;
    var
      Contador, Peso, Digit: Integer;
    begin
      Soma := 00;
      Peso := 02;

      for Contador := Length(ie) downto 1 do
      begin
        Soma := Soma + (StrToInt(ie[Contador]) * Peso);
        if Peso < Base then
          Peso := Peso + 1
        else
          Peso := 02;
      end;

      Soma := Soma * 10;

      Digit := 0;
      if Soma >= 11 then
        Digit := (Soma mod 11);
      if Digit = 10 then
        Digit := 0;

      Result := IntToStr(Digit);
    end;

  begin
    Result := False;
    if (Len(numinsc) = 09) and (Copy(numinsc, 1, 2) = '20') then
    begin
      Digito := Copy(numinsc, 09, 01);
      insc := Copy(numinsc, 01, 08);

      Result := (Digito = (ModuloRN(insc)));
    end
    else if (Len(numinsc) = 10) and (Copy(numinsc, 1, 2) = '20') then
    begin
      Digito := Copy(numinsc, 14, 01);
      insc := Copy(numinsc, 01, 13);

      Result := Digito = ModuloRN(insc);
    end;
  end;

  function regras_Bahia: Boolean;
  var
    digito01: string;
  var
    digito02: string;
  var
    insc01: string;
  var
    insc02: string;

    function Modulo10(Valor: String; Base: Integer = 9): string;
    var
      Soma: Integer;
    var
      Contador, Peso, Digito: Integer;
    begin
      Soma := 0;
      Peso := 2;

      for Contador := Length(Valor) downto 1 do
      begin
        Soma := Soma + (StrToInt(Valor[Contador]) * Peso);
        if Peso < Base then
          Peso := Peso + 1
        else
          Peso := 02;
      end;

      Digito := 0;
      if Soma >= 10 then
        Digito := (Soma mod 10);

      if (Digito = 0) then
      begin
        Digito := 0;
      end
      else
      begin
        Digito := 10 - Digito;
      end;

      Result := IntToStr(Digito);
    end;

  begin
    Result := False;
    if Len(numinsc) = 09 then
    begin
      digito01 := Copy(numinsc, 8, 1);
      digito02 := Copy(numinsc, 9, 1);
      insc01 := Copy(numinsc, 1, 7) + digito02;
      insc02 := Copy(numinsc, 1, 7);

      if CInt(Copy(numinsc, 2, 1)) in [0, 1, 2, 3, 4, 5, 8] then
      begin
        Result := (digito01 = Modulo10(insc01, 9)) and (digito02 = Modulo10(insc02, 8));
      end
      else if CInt(Copy(numinsc, 2, 1)) in [6, 7, 9] then
      begin
        Result := (digito01 = Modulo11(insc01, 9)) and (digito02 = Modulo11(insc02, 8));
      end;
    end
    else if Len(numinsc) = 08 then
    begin
      digito01 := Copy(numinsc, 7, 1);
      digito02 := Copy(numinsc, 8, 1);
      insc01 := Copy(numinsc, 1, 6) + digito02;
      insc02 := Copy(numinsc, 1, 6);

      if CInt(Copy(numinsc, 1, 1)) in [0, 1, 2, 3, 4, 5, 8] then
      begin
        Result := (digito01 = Modulo10(insc01, 9)) and (digito02 = Modulo10(insc02, 8));
      end
      else if CInt(Copy(numinsc, 1, 1)) in [6, 7, 9] then
      begin
        Result := (digito01 = Modulo11(insc01, 9)) and (digito02 = Modulo11(insc02, 8));
      end;
    end;
  end;

  function regras_MinasGerais: Boolean;
  var
    digito01: string;
  var
    digito02: string;
  var
    insc01: string;
  var
    insc02: string;

    function ModuloMG(ie: string): string;
    var
      Soma, Valor: Integer;
    var
      Contador, Peso, Digito: Integer;
    begin
      Soma := 00;
      for Contador := 1 to Length(ie) do
      begin
        Peso := Model.Patterns.functions.IfThen((Contador mod 2) = 0, Contador - (Contador - 2), Contador - (Contador - 1));

        Valor := (StrToInt(ie[Contador]) * Peso);

        Soma := Soma + Model.Patterns.functions.IfThen(Valor > 9, Valor - 9, Valor);
      end;

      Valor := Soma;
      while (Valor mod 10 <> 0) do
      begin
        Valor := Valor + 01;
      end;

      Digito := Valor - Soma;

      Result := IntToStr(Digito);
    end;

  begin
    Result := False;

    if Len(numinsc) = 13 then
    begin
      digito01 := Copy(numinsc, 12, 01);
      digito02 := Copy(numinsc, 13, 01);
      insc01 := Copy(numinsc, 01, 03) + '0' + Copy(numinsc, 04, 08);
      insc02 := Copy(numinsc, 01, 12);

      Result := (digito01 = ModuloMG(insc01)) and (digito02 = Modulo11(insc02, 11));
    end;
  end;

  function regras_SaoPaulo: Boolean;
  var
    digito01: string;
  var
    digito02: string;
  var
    insc01: string;
  var
    insc02: string;

    function ModuloSPDig01(ie: string): string;
    var
      Soma, Valor: Integer;
    var
      Contador, Peso, Digito: Integer;
    begin
      Soma := 00;
      Peso := 00;
      for Contador := 1 to Length(ie) do
      begin
        Peso := Peso + 01;

        if Peso in [2, 9] then
          Peso := Peso + 01;

        Valor := (StrToInt(ie[Contador]) * Peso);

        Soma := Soma + Valor;
      end;

      Digito := 0;
      if Soma >= 11 then
        Digito := (Soma mod 11);

      if Digito >= 10 then
        Digito := 0;

      Result := IntToStr(Digito);
    end;

    function ModuloSPDig02(ie: String): string;
    var
      Soma: Integer;
    var
      Contador, Peso, Digito: Integer;
    begin
      Soma := 00;
      Peso := 02;
      for Contador := Length(ie) downto 1 do
      begin
        Soma := Soma + (StrToInt(ie[Contador]) * Peso);
        if Peso < 10 then
          Peso := Peso + 1
        else
          Peso := 02;
      end;

      Digito := 0;
      if Soma >= 11 then
        Digito := (Soma mod 11);

      if Digito >= 10 then
        Digito := 0;

      Result := IntToStr(Digito);
    end;

  begin
    Result := False;

    if Len(numinsc) = 12 then
    begin
      digito01 := Copy(numinsc, 09, 01);
      digito02 := Copy(numinsc, 12, 01);
      insc01 := Copy(numinsc, 01, 08);
      insc02 := Copy(numinsc, 01, 11);

      Result := (digito01 = ModuloSPDig01(insc01)) and (digito02 = ModuloSPDig02(insc02));
    end;
  end;

begin
  Result := False;

  if not validaUF(uf) then
  begin
  end
  else
  begin
    // Nordeste
    if uf = 'MA' then
      Result := regras_Maranhao // 01
    else if uf = 'CE' then
      Result := regras_Ceara // 02
    else if uf = 'RN' then
      Result := regras_RioGrandeDoNorte // 03
    else if uf = 'BA' then
      Result := regras_Bahia // 04
    else if uf = 'AL' then
      Result := regras_Alagoas // 05
    else if uf = 'SE' then
      Result := regras_Sergipe // 06
    else if uf = 'PB' then
      Result := regras_Paraiba // 07
    else if uf = 'PE' then
      Result := regras_Pernambuco // 08
    else if uf = 'PI' then
      Result := regras_Piaui // 09
      // Norte
    else if uf = 'PA' then
      Result := regras_Para // 10
    else if uf = 'TO' then
      Result := regras_Tocantins // 11
    else if uf = 'AP' then
      Result := regras_Amapa // 12
    else if uf = 'AM' then
      Result := regras_Amazonas // 13
    else if uf = 'RR' then
      Result := regras_Roraima // 14
    else if uf = 'RO' then
      Result := regras_Rondonia // 15
    else if uf = 'AC' then
      Result := regras_Acre // 16
      // Centro Oeste
    else if uf = 'GO' then
      Result := regras_Goias // 17
    else if uf = 'DF' then
      Result := regras_DistritoFederal // 18
    else if uf = 'MT' then
      Result := regras_MatoGrosso // 19
    else if uf = 'MS' then
      Result := regras_MatoGrossoDoSul // 20
      // Sul
    else if uf = 'PR' then
      Result := regras_Parana // 21
    else if uf = 'SC' then
      Result := regras_SantaCatarina // 22
    else if uf = 'RS' then
      Result := regras_RioGrandeDoSul // 23
      // Suldeste
    else if uf = 'RJ' then
      Result := regras_RioDeJaneiro // 24
    else if uf = 'ES' then
      Result := regras_EspiritoSanto // 25
    else if uf = 'MG' then
      Result := regras_MinasGerais // 26
    else if uf = 'SP' then
      Result := regras_SaoPaulo // 27

    else if uf = 'EX' then
      Result := True;
  end;
end;

{$REGION 'Funcao Nova Gonzaga'}
// function isINSCEst(fsDocto, fsComplemento : string): boolean;
// const
// c0_9 : String = '0-9' ;
// cPesos : array[1..13] of array[1..14] of Integer =
// ((0 ,2 ,3 ,4 ,5 ,6 ,7 ,8 ,9 ,2 ,3 ,4 ,5 ,6 ),
// (0 ,0 ,2 ,3 ,4 ,5 ,6 ,7 ,8 ,9 ,2 ,3 ,4 ,5 ),
// (2 ,0 ,3 ,4 ,5 ,6 ,7 ,8 ,9 ,2 ,3 ,4 ,5 ,6 ),
// (0 ,2 ,3 ,4 ,5 ,6 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ),
// (0 ,8 ,7 ,6 ,5 ,4 ,3 ,2 ,1 ,0 ,0 ,0 ,0 ,0 ),
// (0 ,2 ,3 ,4 ,5 ,6 ,7 ,0 ,0 ,8 ,9 ,0 ,0 ,0 ),
// (0 ,2 ,3 ,4 ,5 ,6 ,7 ,8 ,9 ,1 ,2 ,3 ,4 ,5 ),
// (0 ,2 ,3 ,4 ,5 ,6 ,7 ,2 ,3 ,4 ,5 ,6 ,7 ,8 ),
// (0 ,0 ,2 ,3 ,4 ,5 ,6 ,7 ,2 ,3 ,4 ,5 ,6 ,7 ),
// (0 ,0 ,2 ,1 ,2 ,1 ,2 ,1 ,2 ,1 ,1 ,2 ,1 ,0 ),
// (0 ,2 ,3 ,4 ,5 ,6 ,7 ,8 ,9 ,10,11,2 ,3 ,0 ),
// (0 ,0 ,0 ,0 ,10,8 ,7 ,6 ,5 ,4 ,3 ,1 ,0 ,0 ),
// (0 ,2 ,3 ,4 ,5 ,6 ,7 ,8 ,9 ,10,2 ,3 ,0, 0 ) ) ;
//
//
// function ValidarUF(const UF: String): Boolean;
// begin
// Result := true;
// if Pos( ','+UF+',', ',AC,AL,AP,AM,BA,CE,DF,ES,GO,MA,MT,MS,MG,PA,PB,PR,PE,PI,'+
// 'RJ,RN,RS,RO,RR,SC,SP,SE,TO,EX,') = 0 then
// begin
// Result := false;
// end;
// end;
//
// function CharIsNum(const C: Char): Boolean;
// begin
// Result := ( C in ['0'..'9'] ) ;
// end ;
//
// function StrIsNumber(const S: String): Boolean;
// var A, LenStr : Integer ;
// begin
// LenStr := Length( S ) ;
// Result := (LenStr > 0) ;
// A      := 1 ;
// while Result and ( A <= LenStr )  do
// begin
// Result := CharIsNum(S[A]) ;
// Inc(A) ;
// end;
// end ;
//
// //
// function padR(const AString : String; const nLen : Integer;
// const Caracter : AnsiChar=' ') : String ;
// var
// Tam: Integer;
// begin
// Tam := Length(AString);
// if Tam < nLen then
// Result := StringOfChar(Caracter, (nLen - Tam)) + AString
// else
// Result := copy(AString,1,nLen) ;
// end ;
//
// var vDigitos : array of String ;
// var xROT, yROT :  String ;
// var Tamanho, FatorF, FatorG, I, xMD, xTP, yMD, yTP, DV, DVX, DVY : Integer ;
// var SOMA, SOMAq, nD, M                                           : Integer ;
// var OK : Boolean;
// var Passo, D : Char ;
//
//
// begin
// Result := true;
//
// if UpperCase( Trim(fsDocto) ) = 'ISENTO' then
// begin
// exit;
// end;
//
// if fsComplemento = '' then
// begin
// Result := false;
// //fsMsgErro := 'Informe a UF no campo Complemento' ;
// exit ;
// end ;
//
// if not ValidarUF(fsComplemento) then
// begin
// Result := false;
// exit ;
// end;
//
// { Somente digitos ou letra P na primeira posicao }
// { P usado pela Insc.Estadual de Produtor Rural de SP }
// if ( not StrIsNumber( copy(fsDocto,2,length(fsDocto) ))) or
// ( not CharIsNum(fsDocto[1]) and (fsDocto[1] <> 'P')) then
// begin
// //fsMsgErro := 'Caracteres invalidos na inscrição Estadual' ;
// Result := false;
// exit
// end ;
//
// Tamanho := 0  ;
// xROT    := 'E';
// xMD     := 11 ;
// xTP     := 1  ;
// yROT    := '' ;
// yMD     := 0  ;
// yTP     := 0  ;
// FatorF  := 0  ;
// FatorG  := 0  ;
//
// SetLength( vDigitos, 13);
// vDigitos := VarArrayOf(['','','','','','','','','','','','','','']) ;
//
// if fsComplemento = 'AC' then
// begin
// if Length(fsDocto) = 9 then
// begin
// Tamanho := 9 ;
// vDigitos := VarArrayOf(
// ['DVX',c0_9,c0_9,c0_9,c0_9,c0_9,c0_9,'1','0','','','','',''] ) ;
// end
// else
// if Length(fsDocto) = 13 then
// begin
// Tamanho := 13 ;
// xTP := 2   ;   yROT := 'E'   ;   yMD  := 11   ;   yTP  := 1 ;
// vDigitos := VarArrayOf(
// ['DVY','DVX',c0_9,c0_9,c0_9,c0_9,c0_9,c0_9,c0_9,c0_9,c0_9,'1','0','']);
// end ;
// end ;
//
// if fsComplemento = 'AL' then
// begin
// Tamanho := 9 ;
// xROT := 'BD' ;
// vDigitos   := VarArrayOf(
// ['DVX',c0_9,c0_9,c0_9,c0_9,c0_9,c0_9,'4','2','','','','',''] ) ;
// end ;
//
// if fsComplemento = 'AP' then
// begin
// if Length(fsDocto) = 9 then
// begin
// Tamanho := 9 ;
// xROT := 'CE' ;
// vDigitos   := VarArrayOf(
// ['DVX',c0_9,c0_9,c0_9,c0_9,c0_9,c0_9,'3','0','','','','',''] ) ;
//
// if (fsDocto >= '030170010') and (fsDocto <= '030190229') then
// FatorF := 1
// else if fsDocto >= '030190230' then
// xROT := 'E' ;
// end ;
// end ;
//
// if fsComplemento = 'AM' then
// begin
// Tamanho := 9 ;
// vDigitos  := VarArrayOf(
// [ 'DVX',c0_9,c0_9,c0_9,c0_9,c0_9,c0_9,c0_9,c0_9,'','','','',''] ) ;
// end ;
//
// if fsComplemento = 'BA' then
// begin
// if Length(fsDocto) < 9 then
// fsDocto := padR(fsDocto,9,'0') ;
//
// Tamanho := 9 ;
// xTP := 2   ;   yTP  := 3   ;   yROT := 'E' ;
// vDigitos := VarArrayOf(
// ['DVX','DVY',c0_9,c0_9,c0_9,c0_9,c0_9,c0_9,c0_9,'','','','',''] ) ;
//
// if pos(fsDocto[2],'0123458') > 0 then
// begin
// xMD := 10   ;   yMD := 10 ;
// end
// else
// begin
// xMD := 11   ;   yMD := 11 ;
// end ;
// end ;
//
// if fsComplemento = 'CE' then
// begin
// Tamanho := 9 ;
// vDigitos := VarArrayOf(
// [ 'DVX',c0_9,c0_9,c0_9,c0_9,c0_9,c0_9,c0_9,'0','','','','',''] ) ;
// end ;
//
// if fsComplemento = 'DF' then
// begin
// Tamanho := 13 ;
// xTP := 2   ;   yROT := 'E'  ;   yMD  := 11   ;   yTP  := 1 ;
// vDigitos  := VarArrayOf(
// ['DVY','DVX',c0_9,c0_9,c0_9,c0_9,c0_9,c0_9,c0_9,c0_9,c0_9,'7','0','']);
// end ;
//
// if fsComplemento = 'ES' then
// begin
// Tamanho  := 9 ;
// vDigitos := VarArrayOf(
// [ 'DVX',c0_9,c0_9,c0_9,c0_9,c0_9,c0_9,'0,8','0','','','','',''] ) ;
// end ;
//
// if fsComplemento = 'GO' then
// begin
// if Length(fsDocto) = 9 then
// begin
// Tamanho  := 9 ;
// vDigitos := VarArrayOf(
// [ 'DVX',c0_9,c0_9,c0_9,c0_9,c0_9,c0_9,'0,1,5','1','','','','',''] ) ;
//
// if (fsDocto >= '101031050') and (fsDocto <= '101199979') then
// FatorG := 1 ;
// end ;
// end ;
//
// if fsComplemento = 'MA' then
// begin
// Tamanho  := 9 ;
// vDigitos := VarArrayOf(
// ['DVX',c0_9,c0_9,c0_9,c0_9,c0_9,c0_9,'2','1','','','','',''] ) ;
// end ;
//
// if fsComplemento = 'MT' then
// begin
// if Length(fsDocto) = 9 then
// fsDocto := padR(fsDocto,11,'0') ;
//
// Tamanho := 11 ;
// vDigitos := VarArrayOf(
// ['DVX',c0_9,c0_9,c0_9,c0_9,c0_9,c0_9,c0_9,c0_9,c0_9,c0_9,'','',''] ) ;
// end ;
//
// if fsComplemento = 'MS' then
// begin
// Tamanho  := 9 ;
// vDigitos := VarArrayOf(
// ['DVX',c0_9,c0_9,c0_9,c0_9,c0_9,c0_9,'8','2','','','','',''] ) ;
// end ;
//
// if fsComplemento = 'MG' then
// begin
// Tamanho  := 13 ;
// xROT := 'AE'    ;   xMD := 10   ;   xTP := 10 ;
// yROT := 'E'     ;   yMD := 11   ;   yTP := 11 ;
// vDigitos := VarArrayOf(
// ['DVY','DVX',c0_9,c0_9,c0_9,c0_9,c0_9,c0_9,c0_9,c0_9,c0_9,c0_9,c0_9,'']);
// end ;
//
// if fsComplemento = 'PA' then
// begin
// Tamanho  := 9 ;
// vDigitos := VarArrayOf(
// [ 'DVX',c0_9,c0_9,c0_9,c0_9,c0_9,c0_9,'5','1','','','','',''] ) ;
// end ;
//
// if fsComplemento = 'PB' then
// begin
// Tamanho  := 9 ;
// vDigitos := VarArrayOf(
// [ 'DVX',c0_9,c0_9,c0_9,c0_9,c0_9,c0_9,'6','1','','','','',''] ) ;
// end ;
//
// if fsComplemento = 'PR' then
// begin
// Tamanho := 10 ;
// xTP := 9   ;   yROT := 'E'   ;   yMD := 11   ;   yTP := 8 ;
// vDigitos := VarArrayOf(
// [ 'DVY','DVX',c0_9,c0_9,c0_9,c0_9,c0_9,c0_9,c0_9,c0_9,'','','',''] ) ;
// end ;
//
// if fsComplemento = 'PE' then
// begin
// if Length(fsDocto) = 14 then
// begin
// Tamanho := 14;
// xTP := 7  ;   FatorF := 1;
// vDigitos := VarArrayOf(
// ['DVX',c0_9,c0_9,c0_9,c0_9,c0_9,c0_9,c0_9,c0_9,c0_9,c0_9,'1-9','8','1']);
// end
// else
// if Length(fsDocto) = 9 then
// begin
// Tamanho := 9;
// xTP  :=  9   ;  xMD := 11;
// yROT := 'E'  ;  yMD := 11  ;   yTP := 7;
// vDigitos := VarArrayOf(
// [ 'DVY','DVX',c0_9,c0_9,c0_9,c0_9,c0_9,c0_9,c0_9,'','','','',''] );
// end;
// end;
//
// if fsComplemento = 'PI' then
// begin
// Tamanho  := 9 ;
// vDigitos := VarArrayOf(
// [ 'DVX',c0_9,c0_9,c0_9,c0_9,c0_9,c0_9,'9','1','','','','',''] ) ;
// end ;
//
// if fsComplemento = 'RJ' then
// begin
// Tamanho := 8 ;
// xTP := 8 ;
// vDigitos := VarArrayOf(
// ['DVX',c0_9,c0_9,c0_9,c0_9,c0_9,c0_9,'1,7,8,9','','','','','',''] ) ;
// end ;
//
// if fsComplemento = 'RN' then
// begin
// if Length(fsDocto) = 9 then
// begin
// Tamanho := 9 ;
// xROT := 'BD' ;
// vDigitos := VarArrayOf(
// [ 'DVX',c0_9,c0_9,c0_9,c0_9,c0_9,c0_9,'0','2','','','','',''] ) ;
// end
// else
// if Length(fsDocto) = 10 then
// begin
// Tamanho := 10 ;
// xROT := 'BD' ;
// xTP := 11 ;
// vDigitos := VarArrayOf(
// [ 'DVX',c0_9,c0_9,c0_9,c0_9,c0_9,c0_9,c0_9,'0','2','','','',''] ) ;
// end;
//
// end ;
//
// if fsComplemento = 'RS' then
// begin
// Tamanho := 10 ;
// vDigitos := VarArrayOf(
// [ 'DVX',c0_9,c0_9,c0_9,c0_9,c0_9,c0_9,c0_9,c0_9,'0-4','','','',''] ) ;
// end ;
//
// if fsComplemento = 'RO' then
// begin
// FatorF := 1 ;
// if Length(fsDocto) = 9 then
// begin
// Tamanho := 9 ;
// xTP := 4 ;
// vDigitos := VarArrayOf(
// [ 'DVX',c0_9,c0_9,c0_9,c0_9,c0_9,c0_9,c0_9,'1-9','','','','',''] ) ;
// end ;
//
// if Length(fsDocto) = 14 then
// begin
// Tamanho  := 14 ;
// vDigitos := VarArrayOf(
// ['DVX',c0_9,c0_9,c0_9,c0_9,c0_9,c0_9,c0_9,c0_9,c0_9,c0_9,c0_9,c0_9,c0_9]);
// end ;
// end ;
//
// if fsComplemento = 'RR' then
// begin
// Tamanho  := 9 ;
// xROT := 'D'   ;   xMD := 9   ;   xTP := 5 ;
// vDigitos := VarArrayOf(
// [ 'DVX',c0_9,c0_9,c0_9,c0_9,c0_9,c0_9,'4','2','','','','',''] ) ;
// end ;
//
// if (fsComplemento = 'SC') or (fsComplemento = 'SE') then
// begin
// Tamanho  := 9 ;
// vDigitos := VarArrayOf(
// [ 'DVX',c0_9,c0_9,c0_9,c0_9,c0_9,c0_9,c0_9,c0_9,'','','','',''] ) ;
// end;
//
// if fsComplemento = 'SP' then
// begin
// xROT := 'D'   ;   xTP := 12 ;
// if fsDocto[1] = 'P' then
// begin
// Tamanho  := 13 ;
// vDigitos := VarArrayOf(
// [c0_9,c0_9,c0_9,'DVX',c0_9,c0_9,c0_9,c0_9,c0_9,c0_9,c0_9,c0_9,'P','']);
// end
// else
// begin
// Tamanho  := 12 ;
// yROT := 'D'   ;   yMD := 11   ;   yTP := 13 ;
// vDigitos := VarArrayOf(
// ['DVY',c0_9,c0_9,'DVX',c0_9,c0_9,c0_9,c0_9,c0_9,c0_9,c0_9,c0_9,'','']);
// end ;
// end ;
//
// if fsComplemento = 'TO' then
// begin
// if Length(fsDocto)=11 then
// begin
// Tamanho := 11 ;
// xTP := 6 ;
// vDigitos := VarArrayOf(
// ['DVX',c0_9,c0_9,c0_9,c0_9,c0_9,c0_9,'1,2,3,9','0,9','9','2','','','']);
// end
// else
// begin
// {          Tamanho := 10 ;
// vDigitos := VarArrayOf(
// [ 'DVX',c0_9,c0_9,c0_9,c0_9,c0_9,c0_9,c0_9,c0_9,'0-4','','','',''] ) ; }
// Tamanho := 9 ;
// vDigitos := VarArrayOf(
// [ 'DVX',c0_9,c0_9,c0_9,c0_9,c0_9,c0_9,c0_9,c0_9,'','','','',''] )
// end;
//
// // O primeiro e segundo dígito da IE será obrigatoriamente 2 e 9 respectivamente.
// if not(Pos('29', fsDocto)=1)then
// begin
// Result :=False;
// Exit ;
// end;
//
// end;
//
// { Verificando se o tamanho Total está correto }
// //if fsAjustarTamanho then
// fsDocto := padR(fsDocto, Tamanho, '0') ;
// //fsDocto :=StuffString(DupeString('0',Tamanho),Tamanho -Length(fsDocto),Tamanho,fsDocto) ;
//
// OK := (Tamanho > 0) and (Length(fsDocto) = Tamanho) ;
// if not OK then
// begin
// Result := false;
// //fsMsgErro := 'Tamanho Inválido';
// end;
//
// { Verificando os digitos nas posicoes são permitidos }
// fsDocto := padR(fsDocto,14) ;
// //fsDocto :=StuffString('              ',15-Length(fsDocto),14,fsDocto) ;
//
// DVX := 0  ;
// DVY := 0  ;
// I   := 13 ;
// while OK and (I >= 0) do
// begin
// D := fsDocto[14-I] ;
//
// if vDigitos[I] = '' then
// OK := (D = ' ')
//
// else if (vDigitos[I] = 'DVX') or (vDigitos[I] = 'DVY') or
// (vDigitos[I] = c0_9) then
// begin
// OK := CharIsNum( D ) ;
//
// if vDigitos[I] = 'DVX' then
// DVX := StrToIntDef( D, 0 )
// else
// if vDigitos[I] = 'DVY' then
// DVY := StrToIntDef( D, 0 ) ;
// end
//
// else if pos(',',vDigitos[I]) > 0 then   { Ex: '2,5,7,8' Apenas os da lista}
// OK := (pos( D, vDigitos[I] ) > 0)
//
// else if pos('-',vDigitos[I]) > 0 then
// OK := ( (D >= copy(vDigitos[I],1,1)) and (D <= copy(vDigitos[I],3,1)) )
//
// else
// OK := ( D = vDigitos[I] ) ;
//
// if not OK then
// begin
// Result := False;
// //fsMsgErro := Format('Digito %d deveria ser %s ', [14-I-(14-Tamanho), vDigitos[I]]) ;
// end;
//
// I := I - 1 ;
// end ;
//
// Passo := 'X' ;
// while OK and (xTP > 0) do
// begin
// SOMA := 0  ;
// SOMAq:= 0  ;
// I    := 14 ;
//
// while OK and (I > 0) do
// begin
// D := fsDocto[15-I] ;
//
// if CharIsNum(D) then
// begin
// nD := StrToIntDef(D,0) ;
// M  := nD * cPesos[xTP,I] ;
// SOMA := SOMA + M ;
//
// if pos('A',xROT) > 0 then
// SOMAq := SOMAq + Trunc(M / 10) ;
// end ;
//
// I := I - 1 ;
// end ;
//
// if pos('A',xROT) > 0 then
// SOMA := SOMA + SOMAq
//
// else if pos('B',xROT) > 0 then
// SOMA := SOMA * 10
//
// else if pos('C',xROT) > 0 then
// SOMA := SOMA + (5 + (4 * FatorF) ) ;
//
// { Calculando digito verificador }
// DV := Trunc(SOMA mod xMD) ;
// if pos('E',xROT) > 0 then
// DV := Trunc(xMD - DV) ;
//
// if DV = 10 then
// DV := FatorG   { Apenas GO modifica o FatorG para diferente de 0 }
// else if DV = 11 then
// DV := FatorF ;
//
// if Passo = 'X' then
// OK := (DVX = DV)
// else
// OK := (DVY = DV) ;
//
// //fsDigitoCalculado := IntToStr(DV) ;
// if not OK then
// begin
// Result := false;
// exit;
// //fsMsgErro := 'Digito verificador inválido.' ;
//
// //if fsExibeDigitoCorreto then
// //   fsMsgErro := fsMsgErro + '.. Calculado: '+fsDigitoCalculado ;
// end ;
//
// if PASSO = 'X' then
// begin
// PASSO := 'Y'  ;
// xROT  := yROT ;
// xMD   := yMD  ;
// xTP   := yTP  ;
// end
// else
// break ;
// end ;
//
// fsDocto := Trim(fsDocto);
// end;
{$ENDREGION}

function IsRG(RG: string): Boolean;
begin
  RG := GetNumbers(RG);
  Result := Length(RG) = 8;
end;

function IsCPF(Const CPF: string): Boolean;
  function ConfirmCPF(num: string): Boolean;
  var
    n1, n2, n3, n4, n5, n6, n7, n8, n9: Integer;
  var
    D1, D2: Integer;
  var
    digitado, calculado: string;
  begin
    Result := False;
    case Length(num) of
      11:
        begin
          n1 := StrToInt(num[1]);
          n2 := StrToInt(num[2]);
          n3 := StrToInt(num[3]);
          n4 := StrToInt(num[4]);
          n5 := StrToInt(num[5]);
          n6 := StrToInt(num[6]);
          n7 := StrToInt(num[7]);
          n8 := StrToInt(num[8]);
          n9 := StrToInt(num[9]);
          D1 := n9 * 2 + n8 * 3 + n7 * 4 + n6 * 5 + n5 * 6 + n4 * 7 + n3 * 8 + n2 * 9 + n1 * 10;
          D1 := 11 - (D1 mod 11);
          if D1 >= 10 then
            D1 := 0;
          D2 := D1 * 2 + n9 * 3 + n8 * 4 + n7 * 5 + n6 * 6 + n5 * 7 + n4 * 8 + n3 * 9 + n2 * 10 + n1 * 11;
          D2 := 11 - (D2 mod 11);
          if D2 >= 10 then
            D2 := 0;
          calculado := IntToStr(D1) + IntToStr(D2);
          digitado := num[10] + num[11];
          if calculado = digitado then
            Result := True

        end;
    end;
  end;

var
  S: string;
begin
  Result := False;
  S := GetNumbers(CPF);

  if (S <> '') or (S <> '00000000') or (S <> '11111111111') or (S <> '22222222222') or (S <> '33333333333') or (S <> '44444444444') or (S <> '55555555555') or (S <> '66666666666') or (S <> '77777777777') or (S <> '88888888888') or (S <> '99999999999') then
  begin

    if Length(S) > 0 then
      try
        Result := ConfirmCPF(S);
      except
      end;
  end;
end;

function IsCGC(CGC: string): Boolean;

  function Valide(Const CGC: string): Boolean;
  var
    TextCGC: string;
    Laco, Soma, Digito1, Digito2: Integer;
  begin
    Result := False;
    { verifica se existe carcteres inválidos }
    for Laco := 1 to Length(CGC) do
      if not CharInSet(AnSiChar(CGC[Laco]), ['0' .. '9', '-', '.', ' ', '/']) then
        Exit;
    { retira os caracteres não numéricos }
    TextCGC := NullString;
    for Laco := 1 to Length(CGC) do
      if CharInSet(AnsiChar(CGC[Laco]), ['0' .. '9']) then
        TextCGC := TextCGC + CGC[Laco];
    if TextCGC = NullString then
      Result := True;
    if Length(TextCGC) <> 14 then
      Exit;
    { verifica o primeiro digito }
    Soma := StrToInt(TextCGC[01]) * 5 + StrToInt(TextCGC[02]) * 4 + StrToInt(TextCGC[03]) * 3 + StrToInt(TextCGC[04]) * 2 + StrToInt(TextCGC[05]) * 9 + StrToInt(TextCGC[06]) * 8 + StrToInt(TextCGC[07]) * 7 + StrToInt(TextCGC[08]) * 6 + StrToInt(TextCGC[09]) * 5 + StrToInt(TextCGC[10]) * 4 + StrToInt(TextCGC[11]) * 3 + StrToInt(TextCGC[12]) * 2;
    Digito1 := Soma mod 11;
    if Digito1 <= 1 then
      Digito1 := 0
    else
      Digito1 := 11 - Digito1;
    { verifica o segundo digito }
    Soma := StrToInt(TextCGC[01]) * 6 + StrToInt(TextCGC[02]) * 5 + StrToInt(TextCGC[03]) * 4 + StrToInt(TextCGC[04]) * 3 + StrToInt(TextCGC[05]) * 2 + StrToInt(TextCGC[06]) * 9 + StrToInt(TextCGC[07]) * 8 + StrToInt(TextCGC[08]) * 7 + StrToInt(TextCGC[09]) * 6 + StrToInt(TextCGC[10]) * 5 + StrToInt(TextCGC[11]) * 4 + StrToInt(TextCGC[12]) * 3 + Digito1 * 2;
    Digito2 := Soma mod 11;
    if Digito2 <= 1 then
      Digito2 := 0
    else
      Digito2 := 11 - Digito2;
    { faz a checagem }
    if StrToInt(TextCGC[13]) = Digito1 then
      if StrToInt(TextCGC[14]) = Digito2 then
        Result := True;
  end;

begin
  Result := False;
  CGC := GetNumbers(CGC);
  if (CGC <> '') and (CGC <> '00000000') then
  begin
    Result := Valide(CGC);
  end;

end;

function isRenavam(const value: string): Boolean;
  function Replicate(Caracter: String; Quant: Integer): String;
  var
    i: Integer;
  begin
    Result := '';
    for i := 1 to Quant do
      Result := Result + Caracter;
  end;

var
  n1, n2, n3, n4, n5, n6, n7, n8, i: Integer;
  D1: Integer;
  digitado, calculado: String;
begin
  if (Length(value) <> 9) then
  begin
    Result := False;
  end
  else
  begin
    Result := True;
    for i := 0 to 8 do
      if (value = Replicate(IntToStr(i), 11)) then
        Result := False;

    if (Result) then
    begin
      try
        n1 := StrToInt(value[1]);
        n2 := StrToInt(value[2]);
        n3 := StrToInt(value[3]);
        n4 := StrToInt(value[4]);
        n5 := StrToInt(value[5]);
        n6 := StrToInt(value[6]);
        n7 := StrToInt(value[7]);
        n8 := StrToInt(value[8]);

        D1 := n8 * 2 + n7 * 3 + n6 * 4 + n5 * 5 + n4 * 6 + n3 * 7 + n2 * 8 + n1 * 9;
        D1 := 11 - (D1 mod 11);

        calculado := IntToStr(D1);
        digitado := value[9];

        if calculado = digitado then

          Result := True
        else
          Result := False;

      except
        on E: Exception do
          Result := False;
      end;
    end;
  end;
end;

function IncDateMax(value: TDateTime): TDateTime;
var
  Y, M, D: Word;
begin
  DecodeDate(value, Y, M, D);
  Result := EncodeDateTime(Y, M, D, 23, 59, 59, 998);
end;

function IncDate(Data: string; Dia: Integer): string;
var
  Dt: TDate;
var
  i: Integer;
begin
  if not IsDate(Data) then
  begin
    Result := Data
  end
  else
  begin
    Dt := StrToDate(Data);
    for i := 1 to Dia do
    begin
      Dt := Dt + 1;
    end;
    Result := DateToStr(Dt);
  end;

end;

function MaiorDiaMes(Mes, Ano: string): string;
var
  i: Integer;
var
  S: string;
var
  D: TDateTime;
begin
  Result := '';
  for i := 28 to 31 do
  begin
    S := format('%s%s%s%s%s', [IntToStr(i), FormatSettings.DateSeparator, Mes, FormatSettings.DateSeparator, Ano]);
    if not TryStrToDate(S, D) then
      Break
    else
    begin
      Result := CStr(DayOf(D));
    end;
  end;
end;

function DiferencaHora(Hora1, Hora2: TTime): TTime;
var
  t: TTime;
begin
  if Hora2 > Hora1 then
  begin
    t := Hora1;
    Hora1 := Hora2;
    Hora2 := t;
  end;
  Result := Hora1 - Hora2;
end;

function DelChars(sChar: Char; sStr: string; Count: Integer = 0): string; overload;
var
  s1, s2: string;
var
  iPos: Integer;
  function GetChar: Integer;
  begin
    Result := Pos(sChar, sStr);
    iPos := Result;
  end;

var
  Cont: Integer;
begin
  if not IsEmpty(sStr) then
  begin
    Cont := 0;
    while GetChar > 0 do
    begin
      s1 := Copy(sStr, 1, iPos - 1);
      s2 := Copy(sStr, iPos + 1, Length(sStr));
      sStr := s1 + s2;
      System.inc(Cont);
      if (Cont >= Count) and (Count > 0) then
        Break;
    end;
  end;
  Result := sStr;
end;

function DelChars(sChar: array of Char; sStr: string; Count: Integer = 0): string; overload;
var
  s1, s2: string;
  iPos: Integer;
  function GetChar(C: Char): Integer;
  begin
    Result := Pos(C, sStr);
    iPos := Result;
  end;

var
  Cont: Integer;
var
  i: Integer;
begin
  for i := 0 to High(sChar) do
  begin
    Cont := 0;
    while GetChar(sChar[i]) > 0 do
    begin
      s1 := Copy(sStr, 1, iPos - 1);
      s2 := Copy(sStr, iPos + 1, Length(sStr));
      sStr := s1 + s2;
      System.inc(Cont);
      if (Cont >= Count) and (Count > 0) then
        Break;
    end;
  end;
  Result := sStr;
end;

function Len(Const Texto: string): Integer;
begin
  Result := Length(Texto);
end;

function DataHoraArquivo(Const Arquivo: string): string;
var
  Fhandle: Integer;
begin
  try
    if FileExists(Arquivo) then
    begin
      Fhandle := FileOpen(Arquivo, 0);
      Result := DateTimeToStr(FileDateToDateTime(FileGetDate(Fhandle)));
      FileClose(Fhandle);
    end
    else
      Result := NullString;
  except
  end;
end;

function SubChars(sInChar, sOutChar: Char; sStr: string): string;
var
  j: Integer;
begin
  sInChar := upcase(sInChar);
  for j := 1 to Length(sStr) do
  begin
    if upcase(sStr[j]) = sInChar then
    begin
      sStr[j] := sOutChar;
    end;
  end;
  Result := sStr;
end;

function Imput(Const value: Variant): Variant;
var
  Form: TForm;
  MM: tmemo;
  PNL: TPANEL;
  BTN: TBitBtn;
begin
  Form := TForm.Create(nil);

  MM := tmemo.Create(nil);
  PNL := TPANEL.Create(nil);
  BTN := TBitBtn.Create(nil);

  with Form do
    try
      Align := alClient;
      Caption := 'Exibição de Informação';
      Position := poScreenCenter;
      MM.ScrollBars := ssBoth;
      MM.Parent := Form;
      MM.Align := alClient;
      MM.Font.Style := [fsbold];
      MM.Font.Name := 'Courier New';
      MM.text := value;

      PNL.Parent := Form;
      PNL.Height := 31;
      PNL.Align := alBottom;

      BTN.Parent := PNL;
      BTN.Left := 3;
      BTN.top := 3;
      BTN.Kind := bkClose;
      BTN.Default := True;
      BTN.Cancel := True;
      ShowModal;
    finally
      MM.Destroy;
      BTN.Destroy;
      PNL.Destroy;
      Destroy;
    end;
end;

function Codificastring(Const Str: string): string;
  function CodificaI(mStr, mChave: string): string;
  var
    i, Tamanhostring, Pos, PosLetra, TamanhoChave: Integer;
  begin
    Result := mStr;
    Tamanhostring := Length(mStr);
    TamanhoChave := Length(mChave);
    for i := 1 to Tamanhostring do
    begin
      Pos := (i mod TamanhoChave);
      if Pos = 0 then
        Pos := TamanhoChave;
      PosLetra := ord(Result[i]) xor ord(mChave[Pos]);
      if PosLetra = 0 then
        PosLetra := ord(Result[i]);
      Result[i] := Chr(PosLetra);
    end;
  end;

begin
  Result := CodificaI(Str, 'X');
end;

function Tratastring(S: string): string;
var
  i: Integer;
var
  C: Char;
begin
  for i := 1 to Length(S) do
  begin
    C := S[i];
    case C of
      '=':
        C := ' ';
      '¨':
        C := ' ';
      '?':
        C := ' ';
      '!':
        C := ' ';
      '_':
        C := ' ';
      '|':
        C := ' ';
      // '%':
      // C := ' ';
      'ª':
        C := ' ';
      'º':
        C := ' ';
      '°':
        C := ' ';
      '<':
        C := ' ';
      '>':
        C := ' ';
      ';':
        C := ' ';
      '´':
        C := ' ';
      '`':
        C := ' ';
      '"':
        C := ' ';
      '^':
        C := ' ';
      #1:
        C := ' ';
      // ********************************

      'Ç':
        C := 'C';
      'ç':
        C := 'c';

      'ã', 'á', 'à', 'ä', 'â':
        C := 'a';
      'Ã', 'Á', 'À', 'Ä', 'Â':
        C := 'A';

      'è', 'é', 'ë', 'ê':
        C := 'e';
      'È', 'É', 'Ë', 'Ê':
        C := 'E';

      'í', 'ì', 'ï', 'î':
        C := 'i';
      'Í', 'Ì', 'Ï', 'Î':
        C := 'I';

      'ö', 'ó', 'õ', 'ò', 'ô':
        C := 'o';
      'Ö', 'Ó', 'Õ', 'Ò', 'Ô':
        C := 'O';

      'ü', 'ù', 'ú', 'û':
        C := 'u';
      'Ü', 'Ù', 'Ú', 'Û':
        C := 'U';

      'ñ':
        C := 'n';
      'Ñ':
        C := 'N';

    end;
    S[i] := C;

  end;
  Result := S;
end;

function SerialDisco(FDrive: string): string;
var
  Serial: DWORD;
  DirLen, flags: DWORD;
  DLabel: Array [0 .. 11] of Char;
begin
  try
    GetVolumeInformation(CPChar_or_PWideChar(FDrive + ':\'), DLabel, 12, @Serial, DirLen, flags, nil, 0);
    Result := IntToHex(Serial, 8);
  except
    Result := NullString;
  end;
end;

function DiscLabel(FDrive: Char): string;
var
  Serial: DWORD;
  DirLen, flags: DWORD;
  DLabel: Array [0 .. 11] of Char;
begin
  try
    GetVolumeInformation(CPChar_or_PWideChar(FDrive + ':\'), DLabel, 12, @Serial, DirLen, flags, nil, 0);
    Result := Trim(DLabel);
  except
    Result := NullString;
  end;
end;

function BooToStr(Boo: Boolean): Char;
begin
  if Boo then
    Result := 'T'
  else
    Result := 'F'
end;

function StrToBoo(Str: string): Boolean;
begin
  Result := CBoo(Str);
end;

function DifferenceDatesDays(DtLarger, DtSmaller: TDate): Integer;
var
  D1, D2: TDate;
begin
  Result := 0;
  D1 := DtSmaller;
  D2 := DtLarger;
  if D2 > D1 then
  begin
    while D1 < D2 do
    begin
      System.inc(Result);
      D1 := D1 + 1;
    end;
  end
  else
  begin
    while D1 > D2 do
    begin
      System.Dec(Result);
      D2 := D2 + 1;
    end;
  end;
end;

function diferencaentredatas(data1, data2: TDateTime;Abreviado:Boolean): string;
var
  d, h, m: Integer;
begin
  if data1 = 0 then
    data1 := Now;
  if data2 = 0 then
    data2 := Now;

  d := DaysBetween(data1, data2);
  h := HoursBetween(data1, data2);
  m := MinutesBetween(data1, data2);

  h := h - (d * 24);
  m := m - (d * 24 * 60) - (h * 60);

  result := '';
  if d > 0 then
  begin
    result := result + IntToStr(d) + iif(Abreviado,'d',' dia' + iif(d > 1,'s','')) ;
    result := result + ' ';
  end;
  if h > 0 then
  begin
    result := result + IntToStr(h) +iif(Abreviado,'h', ' hora' + iif(h > 1,'s',''));
    result := result + ' ';
  end;
  if m > 0 then
  begin
    result := result + IntToStr(m) +iif(Abreviado,'min', ' minuto' + iif(m > 1,'s',''));
  end;

  result := Trim(result);

end;

function DiferencaDias(DtMenor, DtMaior: string): Integer;
var
  D1, D2: TDate;
begin
  Result := 0;
  D1 := CDat(DtMenor);
  D2 := CDat(DtMenor);
  if D2 >= D1 then
  begin
    while D1 <= D2 do
    begin
      System.inc(Result);
      D1 := D1 + 1;
    end;
  end;
end;

function QtdeChars(Char: Char; Str: string): Integer;
var
  i: Integer;
begin
  Result := 0;
  for i := 1 to Length(Str) do
  begin
    if Str[i] = Char then
    begin
      System.inc(Result);
    end;
  end;
end;

function DateIToDateP(Data: string): string;
var
  format: string;
begin
  format := 'dd/mm/yyyy';
  FormatSettings.ShortDateFormat := 'mm/dd/yyyy';
  Result := FormataData(format, Data);
  FormatSettings.ShortDateFormat := 'dd/mm/yyyy';
end;

function TimeToFloat(Hora: string): Float;
var
  H: THora;
  sHora, sMinuto: Integer;
begin
  Result := 0;
  sHora := 0;
  sMinuto := 0;
  try
    H := StrToTime(Hora);
    while (H > StrToTime('00:00:00')) do
    begin
      if H >= StrToTime('01:00:00') then
      begin
        H := H - StrToTime('01:00:00');
        System.inc(sHora);
      end
      else
      begin
        H := H - StrToTime('00:01:00');
        System.inc(sMinuto);
      end;
    end;
    Result := CFlt(IntToStr(sHora) + ',' + IntToStr(sMinuto));
  except
  end;
end;

function ForCNPJ(CNPJ: Variant): string;
// @@.@@@.@@@/@@@@-@@
// @@@@@@@@@@@@@@
// .   .   /
// 12345678901234

var
  i: Integer;
var
  S: string;
var
  C: string;
begin
  C := GetNumbers(CNPJ);
  S := '';
  for i := 1 to Len(C) do
  begin
    case i of
      3, 6:
        S := S + '.';
      009:
        S := S + '/';
      013:
        S := S + '-';
    end;
    S := S + C[i];
  end;
  Result := S;
end;

function ForCPF(CPF: Variant): string;


// @@@.@@@.@@@-@@
// 000.000.000
// @@@@@@@@@@@@@@
// .   .   /
// 12345678901234

var
  i: Integer;
var
  S: string;
var
  C: string;
begin
  C := GetNumbers(CPF);
  S := '';
  for i := 1 to Len(C) do
  begin
    case i of
      4, 7:
        S := S + '.';
      010:
        S := S + '-';
    end;
    S := S + C[i];
  end;
  Result := S;
end;

function NullString: string;
begin
  Result := '';
end;

function NullCurrency(IncludeChar: Boolean = False): string;
begin
  Result := SCur(0);
  if IncludeChar then
    Result := format('%s %s', [FormatSettings.Currencystring, Result]);
end;

function NullFloat: string;
begin
  Result := SFlt(0);
end;

function NullInteger: string;
begin
  Result := SInt(0);
end;

function NullPercent(IncludeChar: Boolean = False): string;
begin
  Result := SPer(0);
  if IncludeChar then
    Result := format('%s %s', [PercentChar, Result]);
end;

function NullData: string;
begin
  Result := SDat('')
end;

function NullHora: string;
begin
  Result := STim(NullString);
end;

function ucase(Const S: string): string;
begin
  Result := AnsiUpperCase(S)
end;

function lcase(Const S: string): string;
begin
  Result := AnsiLowerCase(S)
end;

function ExpStr(Qt: Integer; Str: string): string;
var
  i: Integer;
begin
  Result := NullString;
  for i := 1 to Length(Str) do
  begin
    Result := Result + Str[i] + DupStr(Qt, ' ');
  end;
  Result := Trim(Result);
end;

function ExecAndWait(const ExecuteFile, Paramstring: string): Boolean;
var
  SEInfo: TShellExecuteInfo;
var
  ExitCode: DWORD;
begin
  FillChar(SEInfo, SizeOf(SEInfo), 0);
  SEInfo.cbSize := SizeOf(TShellExecuteInfo);

  SEInfo.fMask := SEE_MASK_NOCLOSEPROCESS;
  SEInfo.Wnd := Application.Handle;
  SEInfo.lpFile := CPChar_or_PWideChar(ExecuteFile);
  SEInfo.lpParameters := CPChar_or_PWideChar(Paramstring);
  SEInfo.nShow := SW_HIDE;

  if ShellExecuteEx(@SEInfo) then
  begin
    repeat
      GetExitCodeProcess(SEInfo.hProcess, ExitCode);
      Sleep(100);
    until (ExitCode <> STILL_ACTIVE) or Application.Terminated;
    Result := True;
  end
  else
  begin
    Result := False;
  end;
end;

{$IFDEF MSWINDOWS}

function RegisterOCX(FileOCX: string): Boolean;
type
  TRegFunc = function: HResult; stdcall;

  (*
    RegSvr32.exe has the following command-line options:

    Regsvr32 [/u] [/s] [/n] [/i[:cmdline]] dllname
    /s - Silent; display no message boxes
    /u - Unregister server
    /i - Call DllInstall passing it an optional [cmdline];
    when used with /u calls dll uninstall
    /n - do not call DllRegisterServer; this option must
    be used with /i

  *)

var
  ARegFunc: TRegFunc;
var
  aHandle: THandle;
begin
  Result := False;
  try
    if IsFile(FileOCX) then
    begin
      aHandle := LoadLibrary(CPChar_or_PWideChar(FileOCX));
      if aHandle <> 0 then
      begin
        ARegFunc := GetProcAddress(aHandle, 'DllRegisterServer');
        if Assigned(ARegFunc) then
        begin
          ExecAndWait('regsvr32', '/s ' + FileOCX);
          Result := True;
        end
        else
        begin
          Result := False;
        end;
        FreeLibrary(aHandle);
      end
      else
      begin
        SimpleMessage(cxWarning, 'A função "DllRegisterServer", não pode ser acessada.');
      end;
    end;
  except
    SimpleMessage(cxWarning, format('Não foi possível registrar %s', [FileOCX]));
  end;
end;
{$ENDIF}

function GetExt(Const sFile: string): string;
var
  i: Integer;
var
  Y: Boolean;
begin
  Y := True;

  for i := Length(sFile) downto 1 do
  begin
    if sFile[i] = '.' then
    begin
      Break;
      Y := False;
    end;
  end;

  if Y then
  begin
    Result := Copy(sFile, i, Length(sFile));
  end
  else
  begin
    Result := NullString;
  end;
end;

function GetFile(out sFileName: string; sFilter: string = '*.*'; StartPath: string = ''; simple: Boolean = False; TitleForm: string = ''; TitleRoot: string = ''): Boolean;

  function SimpleFind: Boolean;
  var
    o: TOpenDialog;
  begin
    o := TOpenDialog.Create(nil);

    o.Filter := format('Arquivo %s|%s', [sFilter, sFilter]);
    o.InitialDir := ExtractFilePath(StartPath);
    // FileName := sFileName;
    if o.Execute then
    begin
      Result := True;
      sFileName := o.FileName;
    end
    else
    begin
      Result := False;
    end;

    o.Destroy;

  end;


begin
  if simple then
    Result := SimpleFind;
end;

function GetDir(out Dir: string; iniDir: string = ''): Boolean;
  function SelectDirectory(const Caption: string; const Root: Widestring; out Directory: Widestring): Boolean;
  var
    WindowList: Pointer;
  var
    BrowseInfo: TBrowseInfo;
  var
    Buffer: PChar;
  var
    RootItemIDList: PItemIDList;
  var
    ItemIDList: PItemIDList;
  var
    ShellMalloc: IMalloc;
  var
    IDesktopFolder: IShellFolder;
  var
    Eaten, flags: LongWord;
  var
    ActiveWindow: HWND;
  begin
    Result := False;
    Directory := '';
    FillChar(BrowseInfo, SizeOf(BrowseInfo), 0);
    if (ShGetMalloc(ShellMalloc) = S_OK) and Assigned(ShellMalloc) then
    begin
      Buffer := ShellMalloc.Alloc(MAX_PATH);
      try
        RootItemIDList := nil;
        if Root <> '' then
        begin
          SHGetDesktopFolder(IDesktopFolder);
          IDesktopFolder.ParseDisplayName(0, nil, POleStr(Root), Eaten, RootItemIDList, flags);
        end;

        with BrowseInfo do
        begin
          hwndOwner := 0;
          pidlRoot := RootItemIDList;
{$IFDEF SW_UNICODE}
          pszDisplayName := CPChar_or_PWideChar(Buffer);
          lpszTitle := PWideChar(Caption);
{$ELSE}
          pszDisplayName := PChar(Buffer);
          lpszTitle := PChar(Caption);
{$ENDIF}
          ulFlags := BIF_RETURNONLYFSDIRS;
        end;
        ActiveWindow := GetActiveWindow;
        WindowList := DisableTaskWindows(0);
        try
          ItemIDList := ShBrowseForFolder(BrowseInfo);
        finally
          EnableTaskWindows(WindowList);
          SetActiveWindow(ActiveWindow);
        end;
        Result := Assigned(ItemIDList);
        if Result then
        begin

{$IFDEF SW_UNICODE}
          SHGetPathFromIDList(ItemIDList, PWideChar(Buffer));
{$ELSE}
          SHGetPathFromIDList(ItemIDList, PChar(Buffer));
{$ENDIF}
          ShellMalloc.Free(ItemIDList);
          Directory := Buffer;
        end;
      finally
        ShellMalloc.Free(Buffer);
      end;
    end;
  end;

var
  W: Widestring;
begin
  // Result := GetSW('Selecione um Diretório',iniDir,W);
  Result := SelectDirectory('Selecione um Diretório', iniDir, W);
  if Length(W) > 3 then
  begin
    W := W + PathDelim;
  end;
  Dir := W;
end;

function GetOSLanguage: TOSLanguage; overload;
var
  S: string;
begin
  Result := GetOSLanguage(S);
end;

function GetOSLanguage(out oslanguage: string): TOSLanguage; overload;
{$IFDEF MSWINDOWS}
  function IdiomaPadrao: string;
  var
    WinLanguage: array [0 .. 50] of Char;
  begin
    VerLanguageName(GetSystemDefaultLangID, WinLanguage, 50);
    Result := StrPas(WinLanguage);
  end;

var
  S: string;
begin
  S := lcase(IdiomaPadrao);

  if InString('bra', S) then
  begin
    Result := oslPTB
  end
  else if InString('port', S) then
  begin
    Result := oslPTB
  end
  else if InString('ing', S) then
  begin
    Result := oslING
  end
  else
  begin
    Result := oslXXX;
  end;
  oslanguage := S;
end;
{$ELSE}

begin
  Result := oslXXX;
end;
{$ENDIF}

function ShowProgram(Const sProgram: string): Boolean;
var
  StartupInfo: TStartupInfo;
  ProcessInfo: TProcessInformation;
  s1, s2: PChar;
begin
  if IsFile(sProgram) then
  begin
    Result := True;
    s1 := CPChar_or_PWideChar(ExtractFileName(sProgram));
    s2 := CPChar_or_PWideChar(ExtractFilePath(sProgram));
    FillChar(StartupInfo, SizeOf(TStartupInfo), 0);
    StartupInfo.cb := SizeOf(TStartupInfo);
    if CreateProcess(nil, CPChar_or_PWideChar(s1), nil, nil, False, REALTIME_PRIORITY_CLASS, nil, CPChar_or_PWideChar(s2), StartupInfo, ProcessInfo) then
    begin
      WaitForSingleObject(ProcessInfo.hProcess, INFINITE);
      CloseHandle(ProcessInfo.hProcess);
    end
    else
    begin
      Result := False;
    end;
  end
  else
  begin
    Result := False;
  end;
end;

function SetAniCursor(Const sCursor: TFileName): Boolean;
const
  cnCursorID1 = 1;
begin
  if Length(sCursor) = 0 then
  begin
    Screen.Cursor := 0;
    Result := True;
  end
  else
  begin
    try
      Screen.Cursors[cnCursorID1] := LoadCursorFromFile(CPChar_or_PWideChar(sCursor));
      Screen.Cursor := cnCursorID1;
      Result := True;
    except
      Result := False;
    end;
  end;
end;

function AppIsRunning(TypeShow: Integer): Boolean;
var
  hWndMe: HWND;
var
  AppTitle: string;
begin
  AppTitle := Application.Title;
  Application.Title := '*%*%*%*%*%';
  hWndMe := FindWindow(nil, CPChar_or_PWideChar(AppTitle));
  if (hWndMe <> 0) then
  begin
    Result := True;
    ShowWindow(hWndMe, TypeShow);
  end
  else
  begin
    Result := False;
  end;
  Application.Title := AppTitle;
end;

function SetDisplay(DisplaPixel: TDisplaPixel): Boolean;
var
  DevMode: TDeviceMode;
begin
  EnumDisplaySettings(nil, 0, DevMode);
  DevMode.dmFields := DM_PELSWIDTH or DM_PELSHEIGHT;
  case DisplaPixel of
    T1024x768:
      begin
        DevMode.dmPelsWidth := 1024;
        DevMode.dmPelsHeight := 0768;
      end;
    T800x600:
      begin
        DevMode.dmPelsWidth := 0800;
        DevMode.dmPelsHeight := 0600;
      end;
    T640x480:
      begin
        DevMode.dmPelsWidth := 0640;
        DevMode.dmPelsHeight := 0480;
      end;
  else
    DevMode.dmPelsWidth := 0800;
    DevMode.dmPelsHeight := 0600;
  end;
  Result := ChangeDisplaySettings(DevMode, CDS_UPDATEREGISTRY) = DISP_CHANGE_SUCCESSFUL;
end;

function Second: TTime;
begin

  try
    Result := StrToTime(format('00%s00%s01', [FormatSettings.TimeSeparator, FormatSettings.TimeSeparator]));
  except
    Result := 0;
  end;
end;

function KillFile(cFileName: string): Boolean;
begin
  Result := Winapi.Windows.DeleteFile(CPChar_or_PWideChar(cFileName));
end;

function MoveFile(cFileName: string; CNewFileName: string): Boolean;
begin
  Result := Winapi.Windows.MoveFile(CPChar_or_PWideChar(cFileName), CPChar_or_PWideChar(CNewFileName))
end;

function CopyFile(cFileName: string; CNewFileName: string; QueimeFile: Boolean = True): Boolean;
begin
  Result := Winapi.Windows.CopyFile(CPChar_or_PWideChar(cFileName), CPChar_or_PWideChar(CNewFileName), not QueimeFile);
end;

function CompareStr(Str1, Str2: string; Like: Boolean = False): Boolean;
begin
  if Like then
  begin
    if Length(Str1) > Length(Str2) then
    begin
      Str1 := Mid(Str1, 1, Length(Str2));
    end
    else
    begin
      Str2 := Mid(Str2, 1, Length(Str1));
    end;

  end;

  Result := System.SysUtils.CompareStr(Str1, Str2) = 0
end;

// função que Dados um Valor 'V' já incrementado um percentual 'P'
// retornará o valor de 'V' antes da aplicação do percentual 'P'
// 10 + 12% = 12
// 12 - 12% = 8,8 Errado {A função não faz isso}
// Ela retornara o valor que foi preciso para incrementar para se alcançar 12>=10

function ValueOutPercentReceive(value, Per: Float): Float;
var
  V1: Float;
begin
  V1 := (Per / 100) + 1;
  if V1 > 0 then
    V1 := (value / V1)
  else
    V1 := 00;
  Result := V1;
end;

function RecPercent(ValueMax, ValueActual: Float): Float;
var
  V1, V2: Extended;
begin
  V1 := (ValueMax - ValueActual) * 100;

  if ValueMax > 0 then
    V2 := (V1 / ValueMax)
  else
    V2 := 0;

  Result := V2;
end;

// função que Decrementa um percentual de um valor
function DecPercent(value, Per: Float): Float;
var
  V1: Float;
begin
  V1 := (value * Per) / 100;
  Result := value - V1;
end;

function RetPercentValue(value, Per: Float): Float;
var
  V1: Float;
begin
  V1 := (value * Per) / 100;
  Result := value - (value - V1);
end;

// função que Incrementa um percentual de um valor
function IncPercent(value, Per: Float): Float;
var
  V1: Float;
begin
  V1 := (value * Per) / 100;
  Result := value + V1;
end;

function ReplaceSubstring(StrSource, StrNew, StrActual: string): string;
var
  P: Word;
begin
  repeat
    P := Pos(StrSource, StrActual);
    if P > 0 then
    begin
      Delete(StrActual, P, Length(StrSource));
      Insert(StrNew, StrActual, P);
    end;
  until P = 0;
  Result := StrActual;
end;

function DateToDescri(DateTime: TDateTime): string;
begin
  Result := '';
end;

function FloatToDescri(Numero: Extended): string;
const
  NoSingular: array [1 .. 6] of string = ('TRILHÃO', 'BILHÃO', 'MILHÃO', 'MIL', 'REAL', 'CENTAVO');
  NoPlural: array [1 .. 6] of string = ('TRILHÕES', 'BILHÕES', 'MILHÕES', 'MIL', 'REAIS', 'CENTAVOS');
  {
    Estas constantes facilitam o entendimento do código.
    Como os valores de singular e plural são armazenados em um vetor,
    cada posicao indica a grandeza do número armazenado (leia-se sempre
    da esquerda para a direita).
  }
  CasaDosTrilhoes = 1;
  CasaDosBilhoes = CasaDosTrilhoes + 1;
  CasaDosMilhoes = CasaDosBilhoes + 1;
  CasaDosMilhares = CasaDosMilhoes + 1;
  CasaDasCentenas = CasaDosMilhares + 1;
  CasaDosCentavos = CasaDasCentenas + 1;

  function Extenso3em3(Numero: Word): string;
  const
    Valores: array [1 .. 36] of Word = (1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 30, 40, 50, 60, 70, 80, 90, 100, 200, 300, 400, 500, 600, 700, 800, 900);
    Nomes: array [0 .. 36] of string[12] = ('', 'UM', 'DOIS', 'TRÊS', 'QUATRO', 'CINCO', 'SEIS', 'SETE', 'OITO', 'NOVE', 'DEZ', 'ONZE', 'DOZE', 'TREZE', 'QUATORZE', 'QUINZE', 'DEZESSEIS', 'DEZESSETE', 'DEZOITO', 'DEZENOVE', 'VINTE', 'TRINTA', 'QUARENTA', 'CINQÜENTA', 'SESSENTA', 'SETENTA', 'OITENTA', 'NOVENTA', 'CENTO', 'DUZENTOS', 'TREZENTOS', 'QUATROCENTOS', 'QUINHENTOS', 'SEISCENTOS', 'SETECENTOS', 'OITOCENTOS', 'NOVECENTOS');
  var
    i: Byte;
    Resposta: string;
    Inteiro: Word;
    Resto: Word;
  begin
    Inteiro := Numero;
    Resposta := '';

    for i := 36 downto 1 do
    begin
      Resto := (Inteiro div Valores[i]) * Valores[i];
      if (Resto = Valores[i]) and (Inteiro >= Resto) then
      begin
        Resposta := Resposta + string(Nomes[i]) + ' E ';
        Inteiro := Inteiro - Valores[i];
      end;
    end;

    { Corta o 'E' excedente do final da string }
    Extenso3em3 := Copy(Resposta, 1, Length(Resposta) - 3);
  end;

var
  TrioAtual, TrioPosterior: Byte;
  V: Integer; { usada apenas com o Val }
  Resposta: array [CasaDosTrilhoes .. CasaDosCentavos] of string;
  RespostaN: array [CasaDosTrilhoes .. CasaDosCentavos] of Word;
  Plural: array [CasaDosTrilhoes .. CasaDosCentavos] of Boolean;
  Inteiro: Extended;
  NumStr: string;
  TriosUsados: set of CasaDosTrilhoes .. CasaDosCentavos;
  NumTriosInt: Byte;

  { Para os não pascalistas de tradição, observe o uso de uma função
    encapsulada na outra. }
  function ProximoTrio(i: Byte): Byte;
  begin
    repeat
      inc(i);
    until (i in TriosUsados) or (i >= CasaDosCentavos);
    ProximoTrio := i;
  end;

begin
  Inteiro := Int(Numero * 100);

  { Inicializa os vetores }
  for TrioAtual := CasaDosTrilhoes to CasaDosCentavos do
  begin
    Resposta[TrioAtual] := '';
    Plural[TrioAtual] := False;
  end;

  {
    O número é quebrado em partes distintas, agrupadas de três em três casas:
    centenas, milhares, milhões, bilhões e trilhões. A última parte (a sexta)
    contém apenas os centavos, com duas casas
  }

{$IFDEF SW_UNICODE}
  NumStr := IntToStr(Round(NumStr));
  NumStr := AlignStr(17, NumStr, ' ', taRightJustify);
{$ELSE}
  Str(Inteiro: 17: 0, NumStr);
{$ENDIF}
  TrioAtual := 1;
  Inteiro := Int(Inteiro / 100); { remove os centavos }

  { Preenche os espaços vazios com zeros para evitar erros de conversão }
  while NumStr[TrioAtual] = ' ' do
  begin
    NumStr[TrioAtual] := '0';
    inc(TrioAtual);
  end;

  { Inicializa o conjunto como vazio }
  TriosUsados := [];
  NumTriosInt := 0; { Números de trios da parte inteira (sem os centavos) }

  { Este loop gera os extensos de cada parte do número }
  for TrioAtual := CasaDosTrilhoes to CasaDosCentavos do
  begin
    Val(Copy(NumStr, 3 * TrioAtual - 2, 3), RespostaN[TrioAtual], V);
    if RespostaN[TrioAtual] <> 0 then
    begin
      Resposta[TrioAtual] := Resposta[TrioAtual] + Extenso3em3(RespostaN[TrioAtual]);
      TriosUsados := TriosUsados + [TrioAtual];
      inc(NumTriosInt);
      if RespostaN[TrioAtual] > 1 then
      begin
        Plural[TrioAtual] := True;
      end;
    end;
  end;

  if CasaDosCentavos in TriosUsados then
    Dec(NumTriosInt);

  { Gerar a resposta propriamente dita }
  NumStr := '';

  {
    Este trecho obriga que o nome da moeda seja sempre impresso no caso de
    haver uma parte inteira, qualquer que seja o valor.
  }
  if (Resposta[CasaDasCentenas] = '') and (Inteiro > 0) then
  begin
    Resposta[CasaDasCentenas] := ' ';
    Plural[CasaDasCentenas] := True;
    TriosUsados := TriosUsados + [CasaDasCentenas];
  end;

  { Basta ser maior que um para que a palavra "real" seja escrita no plural }
  if Inteiro > 1 then
    Plural[CasaDasCentenas] := True;

  { Localiza o primeiro elemento }
  TrioAtual := 0;
  TrioPosterior := ProximoTrio(TrioAtual);

  { Localiza o segundo elemento }
  TrioAtual := TrioPosterior;
  TrioPosterior := ProximoTrio(TrioAtual);

  { Este loop vai percorrer apenas os trios preenchidos e saltar os vazios. }
  while TrioAtual <= CasaDosCentavos do
  begin
    { se for apenas cem, não escrever 'cento' }
    if Resposta[TrioAtual] = 'CENTO' then
      Resposta[TrioAtual] := 'CEM';

    { Verifica se a resposta deve ser no plural ou no singular }
    if Resposta[TrioAtual] <> '' then
    begin
      NumStr := NumStr + Resposta[TrioAtual] + ' ';
      if Plural[TrioAtual] then
        NumStr := NumStr + NoPlural[TrioAtual] + ' '
      else
        NumStr := NumStr + NoSingular[TrioAtual] + ' ';

      { Verifica a necessidade da particula 'e' para os números }
      if (TrioAtual < CasaDosCentavos) and (Resposta[TrioPosterior] <> '') and (Resposta[TrioPosterior] <> ' ') then
      begin
        {
          Este trecho analisa diversos fatores e decide entre usar uma
          vírgula ou um "E", em função de uma peculiaridade da língua. Veja
          os exemplos para compreender:
          - DOIS MIL, QUINHENTOS E CINQÜENTA REAIS
          - DOIS MIL E QUINHENTOS REAIS
          - DOIS MIL E UM REAIS
          - TRÊS MIL E NOVENTA E CINCO REAIS
          - QUATRO MIL, CENTO E UM REAIS
          - UM MILHÃO E DUZENTOS MIL REAIS
          - UM MILHÃO, DUZENTOS MIL E UM REAIS
          - UM MILHÃO, OITOCENTOS E NOVENTA REAIS
          Obs.: Fiz o máximo esforço pra que o extenso soasse o mais natural
          possível em relação à lingua falada, mas se aparecer alguma
          situação em que algo soe esquisito, peço a gentileza de me
          avisar.
        }
        if (TrioAtual < CasaDosCentavos) and ((NumTriosInt = 2) or (TrioAtual = CasaDosMilhares)) and ((RespostaN[TrioPosterior] <= 100) or (RespostaN[TrioPosterior] mod 100 = 0)) then
          NumStr := NumStr + 'E '
        else
          NumStr := NumStr + ', ';
      end;
    end;

    { se for apenas trilhões, bilhões ou milhões, acrescenta o 'de' }
    if (NumTriosInt = 1) and (Inteiro > 0) and (TrioAtual <= CasaDosMilhoes) then
    begin
      NumStr := NumStr + ' DE ';
    end;

    { se tiver centavos, acrescenta a partícula 'e', mas somente se houver
      qualquer valor na parte inteira }
    if (TrioAtual = CasaDasCentenas) and (Resposta[CasaDosCentavos] <> '') and (Inteiro > 0) then
    begin
      NumStr := Copy(NumStr, 1, Length(NumStr) - 2) + ' E ';
    end;

    TrioAtual := ProximoTrio(TrioAtual);
    TrioPosterior := ProximoTrio(TrioAtual);
  end;

  { Eliminar algumas situações em que o extenso gera excessos de espaços
    da resposta. Mero perfeccionismo... }
  NumStr := ReplaceSubstring('  ', ' ', NumStr);
  NumStr := ReplaceSubstring(' ,', ',', NumStr);

  Result := NumStr;
end;

function GetUserWindows: string;
begin
//  Result := unetfun.GetUserWindows;
end;

function GetIpHost: string;
begin
//  Result := unetfun.GetIpLocal;
end;

{$ENDREGION}
{$REGION 'rotinas de controle de aplicacoes para debugs'}

procedure developer_memory_leaks_onshutdown_enabled;
begin
  System.ReportMemoryLeaksOnShutdown := True;
end;

procedure developer_memory_leaks_onshutdown_disabled;
begin
  System.ReportMemoryLeaksOnShutdown := False;
end;
{$ENDREGION}
{$REGION 'windows_block_controle'}
// Para esconder oprograma do CTRL+ALT+DEL faça:

procedure windows_application_hide_task_manager;
type
  TRegisterServiceProcess = function(dwProcessID, dwType: DWORD): DWORD; stdcall;

var
  hNdL: THandle;
var
  RegisterServiceProcess: TRegisterServiceProcess;
begin
  hNdL := LoadLibrary('KERNEL32.DLL');
  RegisterServiceProcess := GetProcAddress(hNdL, 'RegisterServiceProcess');
  RegisterServiceProcess(GetCurrentProcessID, 1);
  FreeLibrary(hNdL);
end;

procedure windows_set_icon_start_menu(FileName: string);
var
  NewImage: TPicture;
  // var Iniciar:THandle;
begin
  NewImage := TPicture.Create;
  NewImage.LoadFromFile(FileName);
  { Iniciar := } FindWindowEx(FindWindow('Shell_TrayWnd', nil), 0, 'Button', nil);
  // recebe imagem antiga
  // ant:=SendMessage(Iniciar,BM_SetImage,0,NewImage.Bitmap.Handle);
end;

procedure windows_block_taskmgr(bTF: Boolean);
var
  reg: TRegistry;
begin
  reg := TRegistry.Create;

  reg.RootKey := HKEY_CURRENT_USER;

  if not reg.OpenKey('Software', True) then
  begin
  end
  else if not reg.OpenKey('Microsoft', True) then
  begin
  end
  else if not reg.OpenKey('Windows', True) then
  begin
  end
  else if not reg.OpenKey('CurrentVersion', True) then
  begin
  end
  else if not reg.OpenKey('Policies', True) then
  begin
  end
  else if not reg.OpenKey('System', True) then
  begin
  end
  else
  begin
    if (bTF = True) then
    begin
      reg.Writestring('DisableTaskMgr', '1');
    end
    else
    begin
      reg.DeleteValue('DisableTaskMgr'); // remove chave e libera TaskManager
    end;
  end;
  reg.CloseKey;
  reg.Destroy;
end;

procedure windows_block_disabled;
var
  OldValue: LongBool;
begin
  { Travar e Liga as teclas: Alt+Tab, Ctrl+Esc, Ctrl+Alt+Del }
  SystemParametersInfo(97, Word(True), @OldValue, 0);
  EnableWindow(FindWindowEx(FindWindow('Shell_TrayWnd', nil), 0, 'Button', nil), False);
  windows_block_taskmgr(True);
  // ESCONDER ICONES DA AREA DE TRABALHO
  ShowWindow(FindWindow(nil, 'Program Manager'), SW_HIDE);
  // ESCONDER BARRA DE TAREFAS
  // AutoOcultar a barra de tarefas
  ShowWindow(FindWindow('Shell_TrayWnd', nil), SW_HIDE);
  // "MATAR" BOTAO INICIAR
  // muita atenca para esta rotina, pois para "ressussitar(ta certo essa palavra?) somente com o reinicio da maquina
  // foi passado pra mim uma rotina (que esta posta logo a seguir) para resolver este problema, mas eu ainda NAO testei.
  // PostMessage(FindWindowEx(FindWindow('Shell_TrayWnd',nil),0,'Button',nil),WM _CLOSE,0,0);

  // destroy o botão do menu iniciar
  // PostMessage(FindWindowEx(FindWindow('Shell_TrayWnd',nil),0,'Button',nil),WM_CLOSE,0,0);

  EnableWindow(FindWindowEx(FindWindow('Shell_TrayWnd', nil), 0, 'Button', nil), False);

end;

procedure windows_block_enabled;
var
  OldValue: LongBool;
begin

  EnableWindow(FindWindowEx(FindWindow('Shell_TrayWnd', nil), 0, 'Button', nil), True);

  { Travar e Liga as teclas: Alt+Tab, Ctrl+Esc, Ctrl+Alt+Del }
  SystemParametersInfo(97, Word(False), @OldValue, 0);

  windows_block_taskmgr(False);

  ShowWindow(FindWindow(nil, 'Program Manager'), SW_SHOW);


  // ESCONDER BARRA DE TAREFAS
  // AutoOcultar a barra de tarefas
  // Ocultar.......
  // ShowWindow(FindWindow('Shell_TrayWnd', nil), SW_HIDE);
  // Mostrar.....
  // ShowWindow(FindWindow('Shell_TrayWnd', nil), SW_SHOWNORMAL);
  // Voltar como Estava.....
  // ShowWindow(FindWindow('Shell_TrayWnd', nil), SW_RESTORE);

  ShowWindow(FindWindow('Shell_TrayWnd', nil), SW_RESTORE);

end;

procedure windows_close_system_windows;
  procedure _close(ap: string);
  var
    H: THandle;
  begin
    H := FindWindow(nil, CPChar_or_PWideChar(ap));
    PostMessage(H, WM_CLOSE, 0, 0);
  end;

begin
  _close('Gerenciador de Tarefas');
  _close('Gerenciador de Tarefas do windows');
  _close('Meu Computador');
  _close('Meus Documentos');

  _close('Task Manager');
  _close('My Computer');
  _close('My Documents');

end;

{$ENDREGION}
{$REGION 'procedure.initialization'}

procedure DoUseRegionalSettings;
begin
  if Assigned(UseRegionalSettings) then
  begin
    UseRegionalSettings;
  end;
end;

{$ENDREGION}

procedure windows_execute(command: string; showprompt: Boolean = False);
begin
  command := Trim(command);
{$IFDEF SW_UNICODE}
  if showprompt then
    WinExec(PAnsiChar(CPChar_or_PWideChar(command)), SW_NORMAL)
  else
    WinExec(PAnsiChar(CPChar_or_PWideChar(command)), SW_HIDE);
{$ELSE}
  if showprompt then
    WinExec(LPSTR(command), SW_NORMAL)
  else
    WinExec(LPSTR(command), SW_HIDE);
{$ENDIF}
end;

procedure windows_execute(command: TstringList; showprompt: Boolean = False);
begin
  while Assigned(command) and (command.Count > 0) do
  begin
    windows_execute(command.strings[0], showprompt);
    command.Delete(0);
    Sleep(500);
  end;
end;

procedure setPaths;
begin
  pathInclude(pathSWBin);
  pathInclude(pathSWBin + 'qt');
end;

procedure doInitVariables;
begin
  setPaths;
//  DefaultFormPostion := poMainFormCenter;
  Date1900 := EncodeDateD(1900, 1 , 1 );
  Date2000 := EncodeDateD(2000, 1 , 1 );
  Date2500 := EncodeDateD(2500, 12, 31);
  fpath := ExtractFilePath(Application.ExeName);
end;

initialization

doInitVariables;

finalization

end.
