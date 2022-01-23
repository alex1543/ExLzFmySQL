unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, mysql50conn, SQLDB, DB, Forms, Controls, Graphics, Dialogs,
  StdCtrls, Grids, ExtCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    CheckBox1: TCheckBox;
    DataSource1: TDataSource;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    Memo1: TMemo;
    GroupBox1: TGroupBox;
    Image1: TImage;
    Label1: TLabel;
    Memo2: TMemo;
    MySQL50Connection1: TMySQL50Connection;
    SQLQuery1: TSQLQuery;
    SQLTransaction1: TSQLTransaction;
    StringGrid1: TStringGrid;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure CheckBox1Change(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;
      isAllOk:Boolean;
      nRow:Integer;    
      nCol:Integer;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
begin
    isAllOk:=true;
  try
    MySQL50Connection1.Connected:=true;
  except
    ShowMessage('Can''t connect to database. Check if a database named ''test'' has been created and try again.');
  exit;
  end;
  try
    SQLTransaction1.Active:=true;
  except
    ShowMessage('Can''t create transaction.');
  exit;
  end;
  try
    SQLQuery1.Active:=false;
    SQLQuery1.SQL.Clear;
    SQLQuery1.sql.add('SET character_set_client='+#39+'utf8'+#39+',character_set_connection='+#39+'cp1251'+#39+',character_set_results='+#39+'utf8'+#39+';');
    SQLQuery1.ExecSQL;
    SQLQuery1.SQL.Clear;
    SQLQuery1.sql.add('SELECT * from myArtTable ORDER BY id DESC;');
    SQLQuery1.Open;

    StringGrid1.Cells[0,0]:='#';
    StringGrid1.Cells[1,0]:='text';
    StringGrid1.Cells[2,0]:='description';
    StringGrid1.Cells[3,0]:='keywords';

  nRow:=1;
  repeat
    StringGrid1.RowCount:=nRow+1;
    StringGrid1.ColCount:=SQLQuery1.FieldCount;

    nCol:=0;
    while nCol< SQLQuery1.FieldCount do
    begin
      StringGrid1.Cells[nCol,nRow]:=SQLQuery1.Fields[nCol].AsString;
      nCol:=nCol+1;
    end;

    SQLQuery1.Next;
    nRow:=nRow+1;
  until SQLQuery1.EOF;

  except
    ShowMessage('Error while executing SQL query.');
  exit;
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin

  isAllOk:=true;
  try
    MySQL50Connection1.Connected:=true;
  except
    ShowMessage('Can''t connect to database. Check if a database named ''test'' has been created and try again.');
  exit;
  end;
  try
    SQLTransaction1.Active:=true;
  except
    ShowMessage('Can''t create transaction.');
  exit;
  end;
  try
    SQLQuery1.SQL.Clear;
    SQLQuery1.SQL.Add('INSERT INTO myArtTable (text, description, keywords) VALUES('+#39+Edit2.text+#39+', '+#39+Edit3.text+#39+', '+#39+Edit4.text+#39+');');
    SQLQuery1.ExecSQL;
    Button1.Click;

  except
    ShowMessage('Error while executing SQL query.');
  exit;
  end;


end;

procedure TForm1.Button3Click(Sender: TObject);
begin
    try
      MySQL50Connection1.Connected:=true;
    except
      ShowMessage('Can''t connect to database. Check if a database named ''test'' has been created and try again.');
    exit;
    end;
    try
      SQLTransaction1.Active:=true;
    except
      ShowMessage('Can''t create transaction.');
    exit;
    end;
    try
      SQLQuery1.SQL.Clear;
      SQLQuery1.SQL.Add(Memo1.Lines.Text);
      SQLQuery1.ExecSQL;
    except
      ShowMessage('Error while executing SQL query.');
    exit;
    end;
    ShowMessage ('Request completed successfully: '+Memo1.Lines.Text);

end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  Memo1.Text:='DROP TABLE myArtTable;';
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  Memo1.Text:='CREATE TABLE myArtTable (id int(11) NOT NULL auto_increment, text text NOT NULL, description text NOT NULL, keywords text NOT NULL, PRIMARY KEY (id)) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=cp1251;';
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
  Memo1.Text:='DELETE FROM myarttable WHERE id<17;';
end;

procedure TForm1.Button7Click(Sender: TObject);
begin
  Memo1.Text:='UPDATE myarttable SET keywords = ''Ivanov'' WHERE id = 18;';
end;

procedure TForm1.Button8Click(Sender: TObject);
begin
  isAllOk:=true;
try
  MySQL50Connection1.Connected:=true;
except
  ShowMessage('Can''t connect to database. Check if a database named ''test'' has been created and try again.');
exit;
end;
try
  SQLTransaction1.Active:=true;
except
  ShowMessage('Can''t create transaction.');
exit;
end;
try
  SQLQuery1.Active:=false;
  SQLQuery1.SQL.Clear;
  SQLQuery1.sql.add(Edit1.Text);
  SQLQuery1.Open;

nRow:=0; Memo2.Text:='';
repeat
  nCol:=0; Memo2.Lines[nRow]:='';
  while nCol< SQLQuery1.FieldCount do
  begin
    Memo2.Lines[nRow]:=Memo2.Lines[nRow]+' '+SQLQuery1.Fields[nCol].AsString;
    nCol:=nCol+1;
  end;

  SQLQuery1.Next;
  nRow:=nRow+1;
until SQLQuery1.EOF;

except
  ShowMessage('Error while executing SQL query.');
exit;
end;
end;

procedure TForm1.CheckBox1Change(Sender: TObject);
begin

if not CheckBox1.Checked then
  begin
    Form1.Height:=358;
  end else
    Form1.Height:=495;
end;

end.

