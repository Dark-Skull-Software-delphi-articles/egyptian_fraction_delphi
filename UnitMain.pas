unit UnitMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls;

type
  TFormMain = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    ButtonCalc: TButton;
    LabelResult: TLabel;
    LabelNum: TLabel;
    LabelDenum: TLabel;
    procedure ButtonCalcClick(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  FormMain: TFormMain;

implementation

{$R *.DFM}

procedure TFormMain.ButtonCalcClick(Sender: TObject);
var
  Plus: integer;
  N, D, a: integer;
  Tmp: integer;
begin
  LabelResult.Caption := '';
  N := StrToInt(Edit1.Text);
  D := StrToInt(Edit2.Text);
  Plus := 0;
  if D = 0 then begin LabelResult.Caption := 'Impossible : division par 0'; Exit; end
  else LabelResult.Caption := 'Résultat de ' + Edit1.Text + '/' + Edit2.Text + ' : ';
  while N > D do
    begin
      Plus := Plus + 1;
      N := N - D;
    end;
  if Plus <> 0 then LabelResult.Caption := LabelResult.Caption + IntToStr(Plus);
  a := 2;
  while not ((N = 0) or (a > 200)) do
    begin
      Tmp := a * N - D;
      while not (Tmp >= 0) do
        begin
          INC(a);
          Tmp := a * N - D;
        end;
      if Plus = 0 then LabelResult.Caption := LabelResult.Caption + '1/' + IntToStr(a)
      else LabelResult.Caption := LabelResult.Caption + ' + 1/' + IntToStr(a);
      Inc(Plus);
      N := Tmp;
      D := a * D;
      INC(a); {évite d'avoir 2 fois le même dénominateur}
    end;
end;

procedure TFormMain.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9', #8, #35, #36, #37, #39, #45, #46]) then Key := #0;
end;

end.
