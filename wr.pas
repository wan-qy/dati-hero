uses crt,dos;
var
  f1,f2,fff,ffff,f3:boolean;
  es3,s4,ss,ss3,ss4,sss,s1,ttt,name,password,name2,qq,mobile,shenfen,school,sex,birth,area,iiiiii,mynumber,asus11,asus12,ttt2,number,sssyy,se:ansistring;
f,i,count,y,q,ans,x,w,da,mm,e,j,op,cuowu,dati,sjys,dcjh,tmys,tmbj,xuanxiang,zhengque,ee,qtzt,tlsj,gold,exp,let,level,rig,wro,rec,moans,shuaxin,paicuo,pppp,er:longint;
  c,b,xx:char;
  ss1,s,iiiii:array[0..1000] of ansistring;
  asus:array[0..20] of ansistring;
  aa:array[0..1000] of longint;
  lev,wp:array[0..500] of longint;
  qt,bj:text;zhql:real;      s3:ansistring;
procedure init;//初始化
begin
  for i:=1 to 500 do lev[i]:=i*10;
  textcolor(12);textbackground(10);
end;

procedure login_init;//登录初始化
var x,i:longint;bj:text;se,ss:string;
begin
  x:=random(10)+1;str(x,se);
  clrscr;assign(bj,'首页'+se+'.txt');reset(bj);
  for i:=1 to 23 do begin readln(bj,ss); writeln(ss); end;close(bj);
  gotoxy(36,9);f:=0;
end;

procedure login_go;//登录回车
begin
  if ord(xx)=13 then begin inc(f);gotoxy(36,11);end;
end;

procedure login_init;//登录读入
begin
  if ((xx>='a')and(xx<='z'))or((xx>='A')and(xx<='Z'))or((xx>='0')and(xx<='9')) then
    begin
    if f=0 then write(xx) else write('*');
    if f=0 then s3:=s3+xx else s4:=s4+xx;
    end;
end;

procedure login_backspace;//登录退格
begin
  if ord(xx)=8 then begin 
    gotoxy(wherex-1,wherey);
    if f=0 then delete(s3,length(s3),1);if f=1 then delete(s4,length(s4),1);
    end;
end;
procedure login;//登录
var f:longint;xx:char;
begin
  repeat
    login_init;
    xx:=readkey;
    login_go;
    login_read;
    login_backspace;
    if ord(xx)=27 then halt;
  until (f=2)or(ord(xx)=72)or(ord(xx)=80)or(ord(xx)=75)or(ord(xx)=77);
end;

procedure test_flash;//验证动态界面
var
  i:longint;
begin
  if (ord(xx)<72)or(ord(xx)>80) then
  begin for i:=3 to 75 do begin gotoxy(i,17);write('-');delay(1); end;
  gotoxy(76,17);write('>');delay(100);end;
end;

procedure test_init;//验证初始化
begin
  assign(bj,'asus\count.txt');reset(bj);readln(bj,ans);close(bj);f1:=false;f2:=false;
end;

procedure test_alluser;//逐一用户验证
begin
  str(i,sss);sss:='asus\'+sss;assign(bj,sss);reset(bj);readln(bj,ss3);readln(bj,ss4);
    if (s3=ss3)then f1:=true;
    if (s3=ss3)and(s4=ss4)then begin str(i,ttt);str(i,ttt2);f2:=true;str(i,mynumber);mynumber:='asus\'+mynumber;str(i,number);end;
  close(bj);
end;

procedure test;//验证
var
  bj:text;i,ans:longint;ss3,ss4:string;
begin
  if f=2 then begin
  test_flash;
  test_init;
  for i:=1 to ans do begin test_alluser;end;
end;

procerue wrong;//登陆错误
begin
  if (f1=true)and(f2=false)then begin gotoxy(30,17);write('密码错误，按任意键继续');readkey;end;
  if (f1=false)and(f2=false)then begin gotoxy(30,17);write('找不到用户，按任意键继续');readkey;end;
end;

procedure readinformition;//读取用户信息
begin
  ttt:='asus\'+ttt;assign(bj,ttt);reset(bj);
  readln(bj,name);readln(bj,password);readln(bj,password);readln(bj,name2);readln(bj,qq);readln(bj,mobile);readln(bj,shenfen);readln(bj,school);readln(bj,sex);
  readln(bj,birth);readln(bj,gold);readln(bj,exp);readln(bj,level);
  readln(bj,moans);close(bj);
  ttt2:='achi\'+ttt2;assign(bj,ttt2);reset(bj);readln(bj,rig,wro,rec);close(bj);
end;

procedure return;//还原
begin
  s3:=' ';s4:=' ';delete(s3,1,1);delete(s4,1,1);
end;

procedure register_init;//注册初始化
begin
  clrscr;assign(bj,'注册.txt');reset(bj);
  for i:=1 to 24 do begin readln(bj,ss);writeln(ss);end;close(bj);
  count:=1;y:=0;p[1]:=3;p[2]:=6;p[3]:=6;p[4]:=0;p[5]:=0;p[6]:=0;p[7]:=0;p[8]:=0;p[9]:=0;p[10]:=0;q[1]:=10;q[2]:=16;q[3]:=16;q[4]:=40;q[5]:=12;q[6]:=16;q[7]:=18;q[8]:=10;q[9]:=10;q[10]:=10;gotoxy(20,count*2+2);
end;

procedure register_go;//注册回车
begin
  if (ord(xx)=13)and(y>=p[count]) then begin inc(count);y:=0;gotoxy(20,count*2+2);end;
end;

procedure register_check;//注册检查
begin
  ffff:=true;
  if (count<=3)and not(((xx>='a')and(xx<='z'))or((xx>='A')and(xx<='Z'))or((xx>='0')and(xx<='9'))) then ffff:=false;
end;

procedure register_show;//注册显示
begin
  if (ord(xx)<>13)and(y<=q[count])and(ffff=true)and(ord(xx)<>8) then begin
  s[count]:=s[count]+xx;if count>=2 then write('*') else write(xx);end;  
end;

procedure register_backspace;//注册退格
begin
  if ord(xx)=8 then delete(s[count],length(s[count]),1);
end;

procedure register_other;//其他注册
begin
  repeat
    gotoxy(20,count*2+2);readln(s[count]);gotoxy(20,count*2+2);writeln(s[count]);
  until (length(s[count])>=p[count])and(length(s[count])<=q[count]);
end;

procedure register_read;//注册输入
begin
  repeat
    if count<=3 then begin 
      xx:=readkey;inc(y);
      register_go;
      register_check;
      register_show;
      register_backspace;
    end else begin
    register_other;
    inc(count);end;
  until count=11;
end;

procedure register_flash;//注册动画
begin
  fff:=true;
  for i:=3 to 75 do begin gotoxy(i,2); write('-');delay(1);end;
  gotoxy(76,2);write('>');gotoxy(30,2);
end;

procedure register_wrong;//注册错误检查
begin
  if (length(s[1])<3)or(length(s[1])>10)or(length(s[2])<6)or(length(s[3])<6)then begin
  write('用户名或密码长度出错，按任意键继续');fff:=false;end;
  if s[2]<>s[3] then begin write('密码不匹配，按任意键继续');fff:=false;end;
end;

procedure register_check;//注册检查重复用户
begin
  if fff=true then begin
    assign(bj,'asus\count.txt');reset(bj);readln(bj,ans);close(bj);
    for i:=1 to ans do
      begin
        str(i,sss);sss:='asus\'+sss;assign(bj,sss);reset(bj);readln(bj,ss);close(bj);
        if ss=s[1] then begin fff:=false;write('已有此用户，按任意键继续');end;
      end;
  end;
end;

procedure register_success_user+1;//用户+1
begin
  assign(bj,'asus\count.txt');rewrite(bj);writeln(bj,ans+1);close(bj);
end;

procedure register_success_userdata;//用户数据读入
begin
  str(ans+1,sss);sss:='asus\'+sss;assign(bj,sss);rewrite(bj);
  for i:=1 to 10 do writeln(bj,s[i]);
  writeln(bj,0);writeln(bj,0);writeln(bj,1);writeln(bj,0);close(bj);
end;

procedure register_success_usercount;//用户答题数量初始化
begin
   str(ans+1,sss);sss:='achi\'+sss;
   assign(bj,sss);rewrite(bj);writeln(bj,'0 0 0');close(bj);
end;

procedure register_success_userthing;//用户物品数量初始化
begin
  str(ans+1,sss);sss:='thing\'+sss;
  assign(bj,sss);rewrite(bj);for i:=1 to 7 do writeln(bj,0);close(bj);
end;

procedure register_success;//注册成功
begin
  register_success_user+1;
  register_success_userdata;
  register_success_usercount;
  register_success_usesthing;
  write('注册成功,按任意键继续');
end;

procedure register;//注册
var p,q:array[0..10000] of longint;
begin
  register_init;
  register_read;
  register_flash;
  register_wrong;
  register_check;
  if fff=true then register_success;
  readkey;
end;

procedure run;//运行
begin
  repeat
  login;test;wrong;
  if (f1=true)and(f2=true) then begin
  readinformation;go;end; end else register;
  return;
  until (1<>1);
end;

procedure cuoti;//错题统计
var
  s:ansistring;i,j,ans:longint;bj:text;a:Array[0..10000] of longint;
begin
  s:='cuoti\'+number+'.txt';assign(bj,s);reset(bj);readln(bj,ans);
  for i:=1 to ans do readln(Bj,a[i]);close(bj);
  assign(bj,s);rewrite(bj);writeln(bj,ans+1);
  for j:=1 to i do
    writeln(bj,a[j]);
  writeln(bj,x);close(bj);
end;

procedure up;//升级
begin
  gotoxy(1,19);exp:=exp-lev[level];level:=level+1;
  writeln('◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆恭喜你升级了！◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆');delay(100);
  writeln('您的等级：',level-1,'────→',level);delay(100);
  writeln('奖励：金币*',level);writeln('答题时间增加0.25秒');delay(1000);gold:=gold+level;
end;

procedure jiaohuan;//选项随机
begin
  y:=random(24)+1;da:=1;
  if y=2 then begin ss:=s[3];s[3]:=s[4];s[4]:=ss;end;if y=3 then begin ss:=s[2];s[2]:=s[3];s[3]:=ss;end;
  if y=4 then begin ss:=s[2];s[2]:=s[3];s[3]:=s[4];s[4]:=ss;end;if y=5 then begin ss:=s[2];s[2]:=s[4];s[4]:=s[3];s[3]:=ss;end;
  if y=6 then begin ss:=s[2];s[2]:=s[4];s[4]:=ss;end;if y=7 then begin ss:=s[1];s[1]:=s[2];s[2]:=ss;da:=2;end;
  if y=8 then begin ss:=s[1];s[1]:=s[2];s[2]:=ss;ss:=s[3];s[3]:=s[4];s[4]:=ss;da:=2;end;if y=9 then begin ss:=s[1];s[1]:=s[2];s[2]:=s[3];s[3]:=ss;da:=3;end;
  if y=10 then begin ss:=s[1];s[1]:=s[2];s[2]:=s[3];s[3]:=s[4];s[4]:=ss;da:=4;end;if y=11 then begin ss:=s[1];s[1]:=s[2];s[2]:=s[4];s[4]:=s[3];s[3]:=ss;da:=3;end;
  if y=12 then begin ss:=s[1];s[1]:=s[2];s[2]:=s[4];s[4]:=ss;da:=4;end;if y=13 then begin ss:=s[1];s[1]:=s[3];s[3]:=s[2];s[2]:=ss;da:=2;end;
  if y=14 then begin ss:=s[1];s[1]:=s[3];s[3]:=s[4];s[4]:=s[2];s[2]:=ss;da:=2;end;if y=15 then begin ss:=s[1];s[1]:=s[3];s[3]:=ss;da:=3;end;
  if y=16 then begin ss:=s[1];s[1]:=s[3];s[3]:=s[4];s[4]:=ss;da:=4;end;if y=17 then begin ss:=s[1];s[1]:=s[3];s[3]:=ss;ss:=s[2];s[2]:=s[4];s[4]:=ss;da:=3;end;
  if y=18 then begin ss:=s[1];s[1]:=s[3];s[3]:=s[2];s[2]:=s[4];s[4]:=ss;da:=4;end;if y=19 then begin ss:=s[1];s[1]:=s[4];s[4]:=s[3];s[3]:=s[2];s[2]:=ss;da:=2;end;
  if y=20 then begin ss:=s[1];s[1]:=s[4];s[4]:=s[2];s[2]:=ss;da:=2;end;if y=21 then begin ss:=s[1];s[1]:=s[4];s[4]:=s[3];s[3]:=ss;da:=3;end;
  if y=22 then begin ss:=s[1];s[1]:=s[4];s[4]:=ss;da:=4;end;if y=23 then begin ss:=s[1];s[1]:=s[4];s[4]:=s[2];s[2]:=s[3];s[3]:=ss;da:=3;end;
  if y=24 then begin ss:=s[1];s[1]:=s[4];s[4]:=ss;ss:=s[2];s[2]:=s[3];s[3]:=ss;da:=4;end;
end;

procedure go;//答题
  procedure ppp;
var
  w,rans,wans,tans,ppqq,dengji,yy:longint;f:boolean;pp,bj:text;dtans,zql:real;i:longint;
  sss:string;r:array[0..100] of longint;
  aa,bb,cc,dd,aaa,bbb,ccc,ddd:word;
  pppp2,pppp1:longint;
begin
  zql:=0.0;dtans:=0.0;c:=' ';inc(e);f:=false;clrscr;x:=random(397)+1;
  yy:=random(10)+1;str(yy,se);
  str(x,s1);s1:='data\'+s1+'.txt';
  assign(pp,s1);reset(pp);
  for w:=0 to 4 do begin readln(pp,ss);s[w]:=ss;end;close(pp);
  str(x,s1);s1:='time2\'+s1;
  jiaohuan;
  assign(pp,s1);reset(pp);readln(pp,rans);readln(pp,wans);readln(pp,tans);close(pp);
  gotoxy(1,5);textcolor(tmys);writeln(s[0]);ans:=length(s[0]) div 78;textcolor(xuanxiang);gotoxy(1,6+ans);
  write('A.');writeln(s[1]);write('B.');writeln(s[2]);write('C.');writeln(s[3]);write('D.');writeln(s[4]);textcolor(qtzt);
  assign(bj,mynumber);reset(bj);
  for i:=1 to 13 do readln(bj,asus[i]);close(bj);
  val(asus[13],dengji);mm:=dati+dengji*25;
  repeat
  gettime(aa,bb,cc,dd);
  repeat
    gettime(aaa,bbb,ccc,ddd);
  until ddd<>dd;
  pppp1:=dd+cc*100+bb*6000+aa*360000;
  pppp2:=ddd+ccc*100+bbb*6000+aaa*360000;
  mm:=mm-abs(pppp2-pppp1);gotoxy(1,1);textcolor(sjys);write('剩余时间：');write(mm div 100,':');if mm mod 100<10 then write(0);write(mm mod 100);textcolor(qtzt);
  write('      你已经连续答对',e-1,'题');gotoxy(1,2);if (rans+wans>0)then begin zql:=(wans/(rans+wans)*100);dtans:=(tans/(rans+wans)/100);end;
  writeln('答对此题人数：',wans,'  答错此题人数：',rans,'  正确率：',zql:0:2,'%  平均答题时间：',dtans:0:2,'秒');
  writeln('你的金币：',gold,'  经验：',exp,' 等级：',dengji,' 刷新卡【S】：',shuaxin,' 排错卡【P】：',paicuo);
  writeln('------------------------------------------------------------------------------');keypressed;
  if keypressed then begin c:=readkey;end;
  if ord(c)=27 then halt;if c='q' then begin f3:=false;gold:=gold-5;exp:=exp-5;exit;end;
  until (c='a')or(c='b')or(c='c')or(c='d')or(c='A')or(c='B')or(c='C')or(c='D')or(((c='s')or(c='S'))and(shuaxin>0))or(mm<=0);
  if (c='s')or(c='S') then begin
  er:=0;
  f3:=true;dec(e);dec(shuaxin);sss:='thing\'+number;
  assign(bj,sss);reset(bj);
  for i:=1 to 7 do readln(bj,r[i]);dec(r[4]);close(bj);
  assign(bj,sss);rewrite(bj);
  for i:=1 to 7 do writeln(bj,r[i]);close(bj);
  end else   begin
  gotoxy(1,10+ans);write('正确答案是：');
  if da=1 then writeln('A');if da=2 then writeln('B');if da=3 then writeln('C');if da=4 then writeln('D');
  if (c='a')or(c='A') then if da=1 then begin writeln('恭喜你答对了');  gold:=gold+5;exp:=exp+5;inc(rig);gotoxy(1,12+ans);inc(er); writeln('金币+5，经验+5');end else begin
writeln('很遗憾你答错了');inc(wro);gotoxy(1,6+ans);textbackground(cuowu);write('A.');writeln(s[1]);textbackground(black);ee:=e;e:=0;er:=0;f3:=false;  gold:=gold-5;
exp:=exp-5;gotoxy(1,12+ans);writeln('金币-5，经验-5');cuoti;end;
  if (c='b')or(c='B') then if da=2 then begin writeln('恭喜你答对了'); gold:=gold+5;exp:=exp+5;inc(rig);gotoxy(1,12+ans); inc(er); writeln('金币+5，经验+5');end else begin
writeln('很遗憾你答错了');inc(wro);gotoxy(1,7+ans);textbackground(cuowu);write('B.');writeln(s[2]);textbackground(black);ee:=e;e:=0;er:=0;f3:=false;  gold:=gold-5;
exp:=exp-5;gotoxy(1,12+ans);writeln('金币-5，经验-5');cuoti;end;
  if (c='c')or(c='C') then if da=3 then begin writeln('恭喜你答对了'); gold:=gold+5;exp:=exp+5;inc(rig);gotoxy(1,12+ans); inc(er); writeln('金币+5，经验+5');end else begin
writeln('很遗憾你答错了');inc(wro);gotoxy(1,8+ans);textbackground(cuowu);write('C.');writeln(s[3]);textbackground(black);ee:=e;e:=0;er:=0;f3:=false;  gold:=gold-5;
exp:=exp-5;gotoxy(1,12+ans);writeln('金币-5，经验-5');cuoti;end;
  if (c='d')or(c='D') then if da=4 then begin writeln('恭喜你答对了'); gold:=gold+5;exp:=exp+5;inc(rig);gotoxy(1,12+ans);inc(er);  writeln('金币+5，经验+5');end else begin
writeln('很遗憾你答错了');inc(wro);gotoxy(1,9+ans);textbackground(cuowu);write('D.');writeln(s[4]);textbackground(black);ee:=e;e:=0;er:=0;f3:=false;  gold:=gold-5;
exp:=exp-5;gotoxy(1,12+ans);writeln('金币-5，经验-5');cuoti;end;
  if mm=0 then begin writeln('时间到，你没有做出选择');ee:=e;e:=0;er:=0;f3:=false;gold:=gold-5;exp:=exp-5;gotoxy(1,12+ans);writeln('金币-5，经验-5');inc(wro);cuoti;end;
  gotoxy(1,5+da+ans);textbackground(zhengque);
  if da=1 then write('A.');if da=2 then write('B.');if da=3 then write('C.');if da=4 then write('D.');writeln(s[da]);
  textbackground(black);tans:=tans+dati+dengji*25-mm;if f3=true then rans:=rans+1 else wans:=wans+1;
  assign(pp,s1);rewrite(pp);writeln(pp,rans);writeln(pp,wans);writeln(pp,tans);close(pp);
  if (er>2) then begin gotoxy(1,13+ans);writeln('不用刷新卡连续答对',er,'题，奖励',er div 3,'金币！');gold:=gold+er div 3;end;
  if exp>lev[level] then up;
  assign(pp,mynumber);rewrite(pp);
  for i:=1 to 10 do writeln(pp,asus[i]);
  writeln(pp,gold);writeln(pp,exp);writeln(pp,level);close(pp);
  assign(pp,ttt2);rewrite(pp);writeln(pp,rig,' ',wro,' ',rec);close(pp);delay(tlsj);end;

end;

procedure x1;
begin
  er:=0;
  repeat ppp;if c='q' then f3:=false;until (1<>1)or(c='q');
end;

procedure x2;//连答模式
var
e,ai:longint;qt1,qt2,qt3:text;sss,sss1:ansistring;
begin
  e:=0;er:=0;f3:=true;
 repeat ppp;until f3=false;
  gotoxy(1,14);
  writeln('你连续答对了',ee-1,'题，快去英雄榜看看有没有你的名字吧！按任意键回到主界面！');
  if ee-1>=1 then begin assign(qt1,'record\count.txt');reset(qt1);readln(qt1,ai);close(qt1);
  assign(qt2,'record\count.txt');rewrite(qt2);writeln(qt2,ai+1);close(qt2);
  str(ai+1,sss1);sss1:='record\'+sss1;sss:=name;iiiiii:=name2;
  assign(qt3,sss1);rewrite(qt3);writeln(qt3,sss);writeln(qt3,iiiiii);writeln(qt3,ee-1);close(qt3);
  end;
  assign(qt1,ttt2);reset(qt1);read(qt1,rig);read(qt1,wro);read(qt1,rec);close(qt1);
  if ee-1>rec then begin
  rec:=ee-1;
  writeln('恭喜你创造了您的新纪录——',rec,'题！');
  assign(qt1,ttt2);rewrite(qt1);writeln(qt1,rig,' ',wro,' ',rec);close(qt1);
  end;
  ee:=0;
  readkey;
end;

procedure x3;//双人模式
var
e,p1,p2,w,huihe,yy:longint;f:boolean;pp:text;
aa,bb,cc,dd,aaa,bbb,ccc,ddd:word;
pppp1,pppp2:longint;s:Array[0..10000] of ansistring;ss:ansistring;
begin
  e:=0;p1:=dcjh;p2:=dcjh;huihe:=0;
 repeat
  c:=' ';inc(e);f:=false;clrscr;gotoxy(1,2);
  if e mod 2=1 then begin inc(huihe);write('玩家1答题了') end else write('玩家2答题了');
  write(huihe,'回合');writeln;
  writeln('玩家一剩余错误机会：',p1);writeln('玩家二剩余错误机会：',p2);yy:=random(10)+1;str(yy,se);
  x:=random(397)+1;;str(x,s1);s1:='data'+se+'\'+s1+'.txt';assign(pp,s1);reset(pp);
  for w:=0 to 5 do
    begin readln(pp,ss);s[w]:=ss;end;
  jiaohuan;
  mm:=dati;gotoxy(1,5);textcolor(tmys);writeln(s[0]);ans:=length(s[0])div 78;textcolor(xuanxiang);gotoxy(1,6+ans);
  write('A.');writeln(s[1]);write('B.');writeln(s[2]);write('C.');writeln(s[3]);write('D.');writeln(s[4]);textcolor(qtzt);
 repeat
  gettime(aa,bb,cc,dd);
  repeat
    gettime(aaa,bbb,ccc,ddd);
  until ddd<>dd;
  pppp1:=dd+cc*100+bb*6000+aa*360000;
  pppp2:=ddd+ccc*100+bbb*6000+aaa*360000;
  mm:=mm-abs(pppp2-pppp1);
  gotoxy(1,1);textcolor(sjys);write('剩余时间：');write(mm div 100,':');if mm mod 100<10 then write(0);write(mm mod 100);keypressed;
  if keypressed then begin c:=readkey;end;if ord(c)=27 then halt;if c='q' then exit;
  until (c='a')or(c='b')or(c='c')or(c='d')or(c='A')or(c='B')or(c='C')or(c='D')or(mm<=0);
  textcolor(qtzt);gotoxy(1,11+ans);write('正确答案是：');
  if da=1 then writeln('A');if da=2 then writeln('B');if da=3 then writeln('C');if da=4 then writeln('D');
  if (c='a')or(c='A') then if da=1 then writeln('恭喜你答对了')else begin writeln('很遗憾你答错了');gotoxy(1,6+ans);textbackground(cuowu);write('A.');writeln(s[1]);textbackground(black);if e mod 2=1 then dec(p1) else dec(p2);cuoti;end;
  if (c='b')or(c='B') then if da=2 then writeln('恭喜你答对了')else begin writeln('很遗憾你答错了');gotoxy(1,7+ans);textbackground(cuowu);write('B.');writeln(s[2]);textbackground(black);if e mod 2=1 then dec(p1) else dec(p2);cuoti;end;
  if (c='c')or(c='C') then if da=3 then writeln('恭喜你答对了')else begin writeln('很遗憾你答错了');gotoxy(1,8+ans);textbackground(cuowu);write('C.');writeln(s[3]);textbackground(black);if e mod 2=1 then dec(p1) else dec(p2);cuoti;end;
  if (c='d')or(c='D') then if da=4 then writeln('恭喜你答对了')else begin writeln('很遗憾你答错了');gotoxy(1,9+ans);textbackground(cuowu);write('D.');writeln(s[4]);textbackground(black);if e mod 2=1 then dec(p1) else dec(p2);cuoti;end;
  if mm<=0 then begin writeln('时间到，你没有做出选择');
  if e mod 2=1 then dec(p1) else dec(p2);cuoti;
  end;
  gotoxy(1,5+da+ans);textbackground(zhengque);
  if da=1 then write('A.');if da=2 then write('B.');if da=3 then write('C.');if da=4 then write('D.');writeln(s[da]);
  textbackground(black);close(pp);gotoxy(1,14);delay(tlsj);
  until (p1=0)or(p2=0);
  if (p2=3)then writeln('玩家二完胜玩家一，看来玩家一要好好努力了!');if (p1=3)then writeln('玩家一完胜玩家二，看来玩家二要好好努力了!');if p2=1 then writeln('玩家二险胜玩家一，玩家一好可惜啊!');if p1=1 then writeln('玩家一险胜玩家二，玩家二好可惜啊!');if
p2=2 then writeln('玩家二战胜了玩家一！');if p1=2 then writeln('玩家一战胜了玩家二!');readkey;
end;

procedure x4;//挑战模式
var
w,rans,wans,tans,ppqq,dengji,shijian,i,zhengque,ai,mmm:longint;f:boolean;pp:text;dtans,zql:real;
aa,bb,cc,dd,aaa,bbb,ccc,ddd:word;
pppp1,pppp2,yy,er:longint;
  qt3:text;sss1:ansistring;r:array[0..100] of longint;
begin
  clrscr;writeln('挑战模式规则：');
  writeln('你有60秒的时间答题，答对+3秒，答错-7秒，到没有时间就失败了');
  writeln('按任意键开始挑战');
  readkey;mm:=6000;zhengque:=0;shijian:=0;er:=0;
  repeat
  zql:=0.0;dtans:=0.0;c:=' ';inc(e);f:=false;clrscr;x:=random(397)+1;
  yy:=random(10)+1;str(yy,se);
  str(x,s1);s1:='data'+se+'\'+s1+'.txt';
  assign(pp,s1);reset(pp);
  for w:=0 to 5 do begin readln(pp,ss);s[w]:=ss;end;close(pp);
  str(x,s1);s1:='time2\'+s1;
  assign(pp,s1);reset(pp);readln(pp,rans);readln(pp,wans);readln(pp,tans);close(pp);
  jiaohuan;
  gotoxy(1,5);textcolor(tmys);writeln(s[0]);ans:=length(s[0]) div 78;textcolor(xuanxiang);gotoxy(1,6+ans);
  write('A.');writeln(s[1]);write('B.');writeln(s[2]);write('C.');writeln(s[3]);write('D.');writeln(s[4]);textcolor(qtzt);
  assign(pp,mynumber);reset(pp);
  for i:=1 to 13 do readln(pp,asus[i]);
  close(pp);
  val(asus[13],dengji);mmm:=mm;
  repeat
  gettime(aa,bb,cc,dd);
  repeat
    gettime(aaa,bbb,ccc,ddd);
  until ddd<>dd;
  pppp1:=dd+cc*100+bb*6000+aa*360000;
  pppp2:=ddd+ccc*100+bbb*6000+aaa*360000;
  shijian:=shijian+pppp2-pppp1;
  mm:=mm-abs(pppp2-pppp1);gotoxy(1,1);textcolor(sjys);write('剩余时间：');write(mm div 100,':');if mm mod 100<10 then write(0);write(mm mod 100);textcolor(qtzt);
  write('      你已经答对',zhengque,'题');gotoxy(1,2);if (rans+wans>0)then begin zql:=(wans/(rans+wans)*100);dtans:=(tans/(rans+wans)/100);end;
  writeln('答对此题人数：',wans,'  答错此题人数：',rans,'  正确率：',zql:0:2,'%  平均答题时间：',dtans:0:2,'秒');
  writeln('你的金币：',gold,'  经验：',exp,' 等级：',dengji,' 刷新卡【S】：',shuaxin,' 排错卡【P】：',paicuo);
  writeln('------------------------------------------------------------------------------');keypressed;
  if keypressed then begin c:=readkey;end;if ord(c)=27 then halt;
  if c='q' then begin f3:=false;exit;end;
  until (c='a')or(c='b')or(c='c')or(c='d')or(c='A')or(c='B')or(c='C')or(c='D')or(((c='s')or(c='S'))and(shuaxin>0))or(mm<=0);
  if (c='s')or(c='S') then begin
  f3:=true;dec(e);dec(shuaxin);er:=0;
  sss:='thing\'+number;
  assign(bj,sss);reset(bj);
  for i:=1 to 7 do readln(bj,r[i]);dec(r[4]);close(bj);
  assign(bj,sss);rewrite(bj);
  for i:=1 to 7 do writeln(bj,r[i]);close(bj);
  end else begin
  gotoxy(1,10+ans);write('正确答案是：');
  if da=1 then writeln('A');if da=2 then writeln('B');if da=3 then writeln('C');if da=4 then writeln('D');
  if (c='a')or(c='A') then if da=1 then begin writeln('恭喜你答对了');  gold:=gold+5;exp:=exp+5;inc(er);inc(rig);gotoxy(1,12+ans); writeln('金币+5，经验+5，时间+3秒');inc(zhengque);mm:=mm+300;end else begin
writeln('很遗憾你答错了');inc(wro);gotoxy(1,6+ans);er:=0;textbackground(cuowu);write('A.');writeln(s[1]);textbackground(black);ee:=e;e:=0;f3:=false;  gold:=gold-5;
exp:=exp-5;gotoxy(1,12+ans);writeln('金币-5，经验-5，时间-7秒');mm:=mm-700;cuoti;end;
  if (c='b')or(c='B') then if da=2 then begin writeln('恭喜你答对了'); gold:=gold+5;exp:=exp+5;inc(er);inc(rig);gotoxy(1,12+ans); writeln('金币+5，经验+5，时间+3秒');inc(zhengque);mm:=mm+300;end else begin
writeln('很遗憾你答错了');inc(wro);gotoxy(1,7+ans);er:=0;textbackground(cuowu);write('B.');writeln(s[2]);textbackground(black);ee:=e;e:=0;f3:=false;  gold:=gold-5;
exp:=exp-5;gotoxy(1,12+ans);writeln('金币-5，经验-5，时间-7秒');mm:=mm-700;cuoti;end;
  if (c='c')or(c='C') then if da=3 then begin writeln('恭喜你答对了'); gold:=gold+5;exp:=exp+5;inc(er);inc(rig);gotoxy(1,12+ans); writeln('金币+5，经验+5，时间+3秒');inc(zhengque);mm:=mm+300;end else begin
writeln('很遗憾你答错了');inc(wro);gotoxy(1,8+ans);er:=0;textbackground(cuowu);write('C.');writeln(s[3]);textbackground(black);ee:=e;e:=0;f3:=false;  gold:=gold-5;
exp:=exp-5;gotoxy(1,12+ans);writeln('金币-5，经验-5，时间-7秒');mm:=mm-700;cuoti;end;
  if (c='d')or(c='D') then if da=4 then begin writeln('恭喜你答对了'); gold:=gold+5;exp:=exp+5;inc(er);inc(rig);gotoxy(1,12+ans); writeln('金币+5，经验+5，时间+3秒');inc(zhengque);mm:=mm+300;end else begin
writeln('很遗憾你答错了');inc(wro);gotoxy(1,9+ans);er:=0;textbackground(cuowu);write('D.');writeln(s[4]);textbackground(black);ee:=e;e:=0;f3:=false;  gold:=gold-5;
exp:=exp-5;gotoxy(1,12+ans);writeln('金币-5，经验-5，时间-7秒');mm:=mm-700;cuoti;end;
  if mm<=0 then begin writeln('时间到，你没有做出选择');ee:=e;e:=0;f3:=false;gold:=gold-5;exp:=exp-5;gotoxy(1,12+ans);writeln('金币-5，经验-5，时间-7秒');er:=0;mm:=mm-700;inc(wro);end;
  if (er>2) then begin gotoxy(1,13+ans);writeln('不用刷新卡连续答对',er,'题，奖励',er div 3,'金币！');gold:=gold+er div 3;end;
  gotoxy(1,5+da+ans);textbackground(yellow);
  if da=1 then write('A.');if da=2 then write('B.');if da=3 then write('C.');if da=4 then write('D.');writeln(s[da]);
  textbackground(black);tans:=tans+mmm-mm;if f3=true then rans:=rans+1 else wans:=wans+1;
  assign(pp,s1);rewrite(pp);writeln(pp,rans);writeln(pp,wans);writeln(pp,tans);close(pp);
  if exp>lev[level] then up;
  assign(pp,mynumber);rewrite(pp);
  for i:=1 to 10 do
  writeln(pp,asus[i]);
  writeln(pp,gold);writeln(pp,exp);writeln(pp,level);close(pp);
  assign(pp,ttt2);rewrite(pp);writeln(pp,rig,' ',wro,' ',rec);close(pp);delay(tlsj);
  end;
  until mm<=0;
  clrscr;
  writeln('你挂掉了');writeln('坚持时间：',shijian div 100,'.',shijian mod 100,'秒');
  writeln('答对题数：',zhengque);writeln('快去英雄榜上看看有没有你的名字吧！');
  writeln('按任意键继续');
  assign(qt3,'tzms\count.txt');reset(qt3);readln(qt3,ai);close(qt3);
  assign(qt3,'tzms\count.txt');rewrite(qt3);writeln(qt3,ai+1);close(qt3);
  str(ai+1,sss1);sss1:='tzms\'+sss1;sss:=name;iiiiii:=name2;
  assign(qt3,sss1);rewrite(qt3);writeln(qt3,sss);writeln(qt3,iiiiii);writeln(qt3,shijian);writeln(qt3,zhengque);close(qt3);
  readkey;
end;

procedure x5;//问题求解
var
  x,i,count,j,tot:longint;daan,s:ansistring;ss,si:array[0..1000] of ansistring;
  a:array[0..100] of longint;pp:text;sss:string;c:char;
begin
  repeat
  clrscr;
writeln('-----------------------------------问题求解-----------------------------------');
  x:=random(37)+1;str(x,s);
  s:='wtqj\'+s+'.txt';
  for i:=1 to 100 do ss[i]:='';
  assign(pp,s);reset(pp);
  for count:=1 to 100 do begin readln(pp,ss[count]);if ss[count]='' then break;end;
  dec(count);close(pp);
  for i:=2 to count-1 do
    begin writeln(ss[i]);for j:=1 to length(ss[i]) div 78 do writeln;end;
  readln(daan);
  if daan=ss[count] then begin
  writeln('恭喜你答对了，金币+10，经验+10');
  assign(pp,mynumber);reset(pp);
  for i:=1 to 10 do readln(pp,si[i]);for i:=11 to 13 do readln(pp,a[i]);close(pp);
  a[11]:=a[11]+10;a[12]:=a[12]+10;gold:=gold+10;exp:=exp+10;
  assign(pp,mynumber);rewrite(pp);
  for i:=1 to 10 do writeln(pp,si[i]);for i:=11 to 13 do writeln(pp,a[i]);close(pp);
  sss:='wtqjdt\'+number;
  assign(pp,sss);reset(pp);readln(pp,tot);close(pp);
  assign(pp,sss);rewrite(pp);writeln(pp,tot+1);close(pp);
  end else writeln('很遗憾你答错了');
  writeln('正确答案是：',ss[count]);writeln('按任意键继续，q键退出');c:=readkey;
  until c='q';
end;

procedure x6;//阅读程序
var
  ii,x,i,j,k,yeshu,zhizhen,maxl,tot:longint;f:boolean;daan,ss:ansistring;
  s:array[0..300] of ansistring;sss:ansistring;
  si:array[0..1000] of ansistring;a:Array[0..1000] of longint;
begin
  repeat
  clrscr;
  x:=random(78)+1;str(x,ss);ss:='ydcx\'+ss+'.txt';
  assign(bj,ss);reset(bj);
  for i:=1 to 200 do readln(bj,s[i]);close(bj);
  for i:=1 to 200 do if s[i]='' then break;
  i:=i-1;yeshu:=i div 20+1;
  if i mod 20=0 then dec(yeshu);zhizhen:=1;
  repeat
  clrscr;if zhizhen*20<i then maxl:=zhizhen*20 else maxl:=i;
  for j:=zhizhen*20-19 to maxl do if j<>1 then writeln(s[j]);
  writeln('第',zhizhen,'页，共',yeshu,'页，←和→翻页，再按→输入答案，输出空行完成输出');
  c:=readkey;
  if ord(c)=75 then dec(zhizhen);if ord(c)=77 then inc(zhizhen);
  if zhizhen=0 then zhizhen:=1;if zhizhen>yeshu then break;
  until 1<>1;
  writeln('你的输出是：');f:=true;ii:=i+1;i:=i+1;
  repeat begin inc(ii);readln(daan);if daan<>s[ii] then f:=false;end;until daan='';
  for j:=i+1 to 200 do if s[j]='' then break;
  if f=true then begin writeln('恭喜你答对了，金币+15，经验+15');
  assign(bj,mynumber);reset(bj);
  for i:=1 to 10 do readln(bj,si[i]);for i:=11 to 13 do readln(bj,a[i]);close(bj);
  a[11]:=a[11]+15;a[12]:=a[12]+15;gold:=gold+15;exp:=exp+15;
  assign(bj,mynumber);rewrite(bj);
  for i:=1 to 10 do writeln(bj,si[i]);for i:=11 to 13 do writeln(bj,a[i]);close(bj);
  sss:='ydcxdt\'+number;assign(bj,sss);reset(bj);readln(bj,tot);close(bj);
  assign(bj,sss);rewrite(bj);writeln(bj,tot+1);close(bj);
  end
  else begin
  writeln('答案错误，正确答案是：');for k:=i+1 to j-1 do writeln(s[k]);
  end;
  writeln('按q退出，其他继续');c:=readkey;
  until c='q';
end;

procedure x7;//模拟卷
var
  s:array[0..30,0..10] of ansistring;ydcx,mydcx:array[0..30,0..100] of ansistring;
  ss,st:ansistring;sss,my,wtqj:array[0..200] of ansistring;
  ft:array[0..1000] of boolean;bt:text;x,i,j,jj,zhizhen,fs,k,p,ii:longint;
  tm,daan,ma:array[0..1000] of longint;f:boolean;
begin
  clrscr;writeln('题目正在导入中，请稍候。。。');fillchar(ft,sizeof(ft),false);
  for i:=1 to 20 do
    begin x:=random(270-i);zhizhen:=0;
      for j:=1 to 270 do begin if not ft[j] then inc(zhizhen);if zhizhen=x then break;end;
      tm[i]:=j;ft[j]:=true; end;
  fillchar(ft,sizeof(ft),false);
  for i:=21 to 22 do
    begin x:=random(37);zhizhen:=0;
    for j:=1 to 37 do begin if not ft[j] then inc(zhizhen);if zhizhen=x then break;end;
    tm[i]:=j;ft[j]:=true; end;
  fillchar(ft,sizeof(ft),false);
  for i:=23 to 26 do
    begin x:=random(78)-i+23;zhizhen:=0;
      for j:=1 to 78 do begin if not ft[j] then inc(zhizhen);if zhizhen=x then break;end;
      tm[i]:=j;ft[j]:=true; end;
  for i:=1 to 20 do
    begin
      str(tm[i],ss);ss:='data\'+ss+'.txt';assign(bt,ss);reset(bt);
      for w:=0 to 5 do begin readln(bt,ss);s[i,w]:=ss;end;
      close(bt);jiaohuan;daan[i]:=da;
    end;
  zhizhen:=1;fillchar(ma,sizeof(ma),0);
  repeat
    clrscr;
    writeln('选择题第',zhizhen,'题：');writeln(s[zhizhen,0]);
    for i:=1 to length(s[zhizhen,0])div 78 do writeln;
    writeln('A.',s[zhizhen,1]);writeln('B.',s[zhizhen,2]);
    writeln('C.',s[zhizhen,3]);writeln('D.',s[zhizhen,4]);
    writeln('你的选择：',chr(ma[zhizhen]+ord('A')-1));writeln('←上一题  下一题→');
    c:=readkey;
    if (c='a')or(c='A') then ma[zhizhen]:=1;if (c='b')or(c='B') then ma[zhizhen]:=2;
    if (c='c')or(c='C') then ma[zhizhen]:=3;if (c='d')or(c='D') then ma[zhizhen]:=4;
    if (c='q')or(c='Q') then exit;
    if ord(c)=75 then dec(zhizhen);if ord(c)=77 then inc(zhizhen);
    if zhizhen=0 then zhizhen:=1;
  until zhizhen>20;
  repeat
    clrscr;writeln('问题求解第',zhizhen-20,'题：');
    str(tm[zhizhen],ss);ss:='wtqj\'+ss+'.txt';
    assign(bt,ss);reset(bt);
    for i:=1 to 50 do begin readln(bt,sss[i]);if sss[i]='' then break;end;close(bt);
    for j:=2 to i-2 do
      begin
        writeln(sss[j]);
        for k:=length(sss[j]) div 78 downto 1 do writeln;
      end;
    writeln('输入你的答案，回车完成输出');readln(my[zhizhen-20]);
    wtqj[zhizhen-20]:=sss[i-1];inc(zhizhen);
  until zhizhen>22;
  clrscr;fs:=0;
  for i:=1 to 20 do if daan[i]=ma[i] then fs:=fs+4;
  for i:=21 to 22 do if wtqj[i-20]=my[i-20] then fs:=fs+10;
  writeln('你的分数：',fs);writeln('错误题目题号：');
  for i:=1 to 20 do if daan[i]<>ma[i] then write(i,' ');
  for i:=21 to 22 do if wtqj[i-20]<>my[i-20] then write(i,' ');
  writeln('按任意键继续');readkey;
  for i:=1 to 20 do
    begin
      clrscr;writeln('选择题第',i,'题：');writeln(s[i,0]);
      for j:=1 to length(s[i,0])div 78 do writeln;
      writeln('A.',s[i,1]);writeln('B.',s[i,2]);writeln('C.',s[i,3]);writeln('D.',s[i,4]);
      writeln('你的选择：',chr(ord('A')-1+ma[i]));
      writeln('正确答案：',chr(ord('A')-1+daan[i]));
      writeln('任意键查看下一题');readkey;
    end;
  for i:=21 to 22 do
    begin
      clrscr;writeln('问题求解第',i-20,'题：');
      str(tm[i],ss);ss:='wtqj\'+ss+'.txt';
      assign(bt,ss);reset(bt);
      for ii:=1 to 50 do
        begin readln(bt,sss[ii]);if sss[ii]='' then break;end;
      close(bt);
      for j:=1 to ii-2 do
        begin writeln(sss[j]);for k:=length(sss[j]) div 78 downto 1 do writeln;end;
      readkey;
    end;
end;

procedure x8;//英雄商店
var
  bj:text;i,cc,f:longint;c:char;ss:ansistring;ff:boolean;
  a,r,e:array[0..100] of longint;s:array[0..100] of string;
procedure gaiming;
var i:longint;
begin
  if a[1]>0 then begin f:=3;
  repeat
  clrscr;writeln('输入你想改的用户名（3-10字符），只能是大小写字母、数字');
  ff:=true;readln(sss);
  if (length(sss)<3)or(length(sss)>10) then ff:=false;
  for i:=1 to length(sss) do if not((sss[i]>='a')and(sss[i]<='z'))or((sss[i]>='0')and(sss[i]<='9'))or((sss[i]>='A')and(sss[i]<='Z')) then ff:=false;
  until ff=true;
  name:=sss;assign(bj,mynumber);reset(bj);
  for i:=1 to 13 do readln(bj,s[i]);close(bj);assign(bj,mynumber);rewrite(bj);
  writeln(bj,sss);for i:=2 to 13 do writeln(bj,s[i]);close(bj);
  ss:='thing\'+number;assign(bj,ss);reset(bj);
  for i:=1 to 7 do readln(bj,r[i]);close(bj);
  assign(bj,ss);rewrite(bj);writeln(bj,r[1]-1);for i:=2 to 7 do writeln(bj,r[i]);close(bj);
  end else f:=4;
end;

procedure gaimima;
var i:longint;
begin
  if a[2]>0 then begin f:=3;
  repeat
  clrscr;sss:='';writeln('输入你想改的密码（6-16字符），只能是大小写字母、数字');
  repeat
  c:=readkey;if ord(c)<>13 then sss:=sss+c;write('*');
  until ord(c)=13;
  ff:=true;if (length(sss)<6)or(length(sss)>16) then ff:=false;
  for i:=1 to length(sss) do if not((sss[i]>='a')and(sss[i]<='z'))or((sss[i]>='0')and(sss[i]<='9'))or((sss[i]>='A')and(sss[i]<='Z')) then ff:=false;
  until ff=true;
  assign(bj,mynumber);reset(bj);for i:=1 to 13 do readln(bj,s[i]);close(bj);
  assign(bj,mynumber);rewrite(bj);writeln(bj,s[1]);writeln(bj,sss);writeln(bj,sss);
  for i:=4 to 13 do writeln(bj,s[i]);close(bj);ss:='thing\'+number;assign(bj,ss);reset(bj);for i:=1 to 7 do readln(bj,r[i]);close(bj);assign(bj,ss);rewrite(bj);
  writeln(bj,r[1]);writeln(bj,r[2]-1);for i:=3 to 7 do writeln(bj,r[i]);close(bj);
  end else f:=4;
end;

procedure gainicheng;
var i:longint;
begin
  if a[3]>0 then begin f:=3;
  repeat
  clrscr;writeln('输入你想改的昵称（0-60字符）');readln(sss);
  until length(sss)<=60;
  assign(bj,mynumber);reset(bj);for i:=1 to 13 do readln(bj,s[i]);close(bj);
  assign(bj,mynumber);rewrite(bj);for i:=1 to 3 do writeln(bj,s[i]);writeln(bj,sss);
  for i:=5 to 13 do writeln(bj,s[i]);close(bj);ss:='thing\'+number;assign(bj,ss);reset(bj);for i:=1 to 7 do readln(bj,r[i]);close(bj);assign(bj,ss);rewrite(bj);
  writeln(bj,r[1]);writeln(bj,r[2]);writeln(bj,r[3]-1);
  for i:=4 to 7 do writeln(bj,r[i]);close(bj);
  end else f:=4;
end;

procedure jingyanshu;
var i:longint;
begin
  if a[7]>0 then begin
  f:=3;assign(bj,mynumber);reset(bj);
  for i:=1 to 13 do readln(bj,s[i]);close(bj);val(s[12],exp);exp:=exp+15;
  assign(bj,mynumber);rewrite(bj);for i:=1 to 11 do writeln(bj,s[i]);
  writeln(bj,exp);writeln(bj,s[13]);close(bj);ss:='thing\'+number;assign(bj,ss);reset(bj);for i:=1 to 7 do readln(bj,r[i]);close(bj);assign(bj,ss);rewrite(bj);
  for i:=1 to 6 do writeln(bj,r[i]);writeln(bj,r[7]-1);close(bj);
  end else f:=4;
end;

procedure qingling;
var
  i:longint;
begin
  if a[5]>0 then begin
  f:=3;sss:='achi\'+number;
  assign(bj,sss);rewrite(bj);writeln(bj,0);writeln(bj,0);writeln(bj,0);close(bj);
  sss:='thing\'+number;assign(bj,sss);reset(bj);
  for i:=1 to 7 do readln(bj,r[i]);close(bj);dec(r[5]);
  assign(bj,sss);rewrite(bj);for i:=1 to 7 do writeln(bj,r[i]);close(bj);wro:=0;rig:=0;
  end else f:=4;
end;

begin
  f:=0;e[0]:=0;
  repeat
  x:=random(10)+1;str(x,se);
  clrscr;assign(bj,'商店'+se+'.txt');reset(bj);
  for i:=1 to 23 do begin readln(bj,ss);writeln(ss);end;close(bj);gotoxy(4,21);
  if f=1 then writeln('恭喜你成功购买了这件物品');
  if f=2 then writeln('对不起，你的金币不足');
  if f=3 then writeln('恭喜你成功使用了这件物品');
  if f=4 then writeln('对不起，这件物品数量不足');
  ss:='thing\'+number;assign(bj,ss);reset(bj);
  for i:=1 to 7 do readln(bj,a[i]);close(bj);gotoxy(14,13);writeln(gold);
  for i:=5 to 11 do begin gotoxy(56,i);writeln(a[i-4]);end;c:=readkey;
  if ((c>='a')and(c<='e'))or((c>='A')and(c<='E')) then begin
  case c of
  'a','A':gaiming;{'b','B':gaimima;}'c','C':gainicheng;'d','D':jingyanshu;'e','E':qingling;
  end;
  end else begin
  e[1]:=100;e[2]:=100;e[3]:=100;e[4]:=20;e[5]:=200;e[6]:=900;e[7]:=25;val(c,cc);
  if gold>=e[cc] then begin gold:=gold-e[cc];f:=1;
  assign(bj,mynumber);reset(bj);for i:=1 to 13 do readln(bj,s[i]);close(bj);
  val(s[11],gold);gold:=gold-e[cc];assign(bj,mynumber);rewrite(bj);
  for i:=1 to 10 do writeln(bj,s[i]);writeln(bj,gold);
  for i:=12 to 13 do writeln(bj,s[i]);close(bj);
  ss:='thing\'+number;assign(bj,ss);reset(bj);
  for i:=1 to 7 do readln(bj,r[i]);close(bj);inc(r[cc]);
  assign(bj,ss);rewrite(bj);for i:=1 to 7 do writeln(bj,r[i]);close(bj);f:=3;
  end else f:=2;
  end;
  until (c='q')or(c='Q');
end;

procedure x9;//英雄榜
var c,cc:char;ss:string;i,zhizhen,yeshu:longint;bt:text;

procedure huanye;
begin
  writeln('第',zhizhen,'页\共',yeshu,'页，←→键换页，q键退出');c:=readkey;
  if ord(c)=75 then dec(zhizhen);if ord(c)=77 then inc(zhizhen);
  if zhizhen<1 then zhizhen:=1;if zhizhen>yeshu then zhizhen:=yeshu;
end;
{procedure qsort(l,r:longint);
var
  i,j,m,t:longint;s:String;
begin
  i:=l;j:=r;
  m:=(aa[l]+aa[r]) div 2;
  repeat
    while (aa[i]>m)and(i<=ai) do inc(i);
    while (aa[j]<m)and(j>0) do dec(j);
    if i<=j then begin
    t:=aa[i];aa[i]:=aa[j];aa[j]:=t;
    s:=ss1[i];ss1[i]:=ss1[j];ss1[j]:=s;
    s:=iiiii[i];iiiii[i]:=iiiii[j];iiiii[j]:=s;
    end;
  until i>j;
  if i<r then qsort(i,r);
  if j>l then qsort(l,j);
end; }
procedure x8lxdt;
var
  qt,qt2:text;ai,t,i,j:longint;s:ansistring;
  aa:array[0..10000] of longint;
  ss1,iiiii:array[0..10000] of ansistring;
begin
  clrscr;
  assign(qt2,'record\count.txt');reset(qt2);readln(qt2,ai);close(qt2);
  for i:=1 to ai do
    begin str(i,s);s:='record\'+s;
    assign(qt2,s);reset(qt2);readln(qt2,ss1[i]);readln(qt2,iiiii[i]);readln(qt2,aa[i]);close(qt2);end;
  for i:=ai downto 1 do
    for j:=1 to i-1 do
      if aa[j]<aa[j+1] then begin
      t:=aa[j];aa[j]:=aa[j+1];aa[j+1]:=t;s:=ss1[j];ss1[j]:=ss1[j+1];ss1[j+1]:=s;s:=iiiii[j];iiiii[j]:=iiiii[j+1];iiiii[j+1]:=s;end;
  //qsort(1,ai);
  yeshu:=ai div 20+1;
  if ai mod 20=0 then dec(yeshu);
  zhizhen:=1;
  repeat
  clrscr;
  writeln('★★★★★★★★★★★★★英雄榜——连续答题排名★★★★★★★★★★★★★');
  writeln('排名       名字                                     昵称 成绩');
  for i:=zhizhen*20-19 to zhizhen*20 do
    if i<=ai then begin
    if i=1 then textcolor(yellow);if i=2 then textcolor(red);if i=3 then textcolor(green);if i=4 then textcolor(blue);if i>4 then textcolor(white);
    writeln(i:4,' ',ss1[i]:10,' ',iiiii[i]:40,' ',aa[i]);
    end;
  huanye;
  until c='q';
end;

procedure x8jb;
var
  qt,qt2:text;ai,t,i,j:longint;s:ansistring;
begin
  clrscr;
  assign(qt2,'asus\count.txt');reset(qt2);readln(qt2,ai);close(qt2);
  for i:=1 to ai do
    begin str(i,s);s:='asus\'+s;
    assign(qt2,s);reset(qt2);readln(qt2,ss1[i]);readln(qt2,ss);readln(qt2,ss);readln(qt2,iiiii[i]);readln(qt2,ss);readln(qt2,ss);readln(qt2,ss);readln(qt2,ss);readln(qt2,ss);readln(qt2,ss);readln(qt2,aa[i]);close(qt2);end;
  for i:=ai downto 1 do
    for j:=1 to i-1 do
      if aa[j]<aa[j+1] then begin
      t:=aa[j];aa[j]:=aa[j+1];aa[j+1]:=t;s:=ss1[j];ss1[j]:=ss1[j+1];ss1[j+1]:=s;s:=iiiii[j];iiiii[j]:=iiiii[j+1];iiiii[j+1]:=s;end;
  yeshu:=ai div 20+1;
  if ai mod 20=0 then dec(yeshu);
  zhizhen:=1;
  repeat
  clrscr;
  writeln('★★★★★★★★★★★★★★英雄榜——金币排名★★★★★★★★★★★★★★');
  writeln('排名       名字                                     昵称 金币');
  for i:=zhizhen*20-19 to zhizhen*20 do
    if i<=ai then begin
    if i=1 then textcolor(yellow);if i=2 then textcolor(red);if i=3 then textcolor(green);if i=4 then textcolor(blue);if i>4 then textcolor(white);
    writeln(i:4,' ',ss1[i]:10,' ',iiiii[i]:40,' ',aa[i]);
    end;
  huanye;
  until c='q';
end;

procedure x8jy;
var
  qt,qt2:text;ai,t,i,j:longint;s:ansistring;
  bb:array[0..1000] of longint;
begin
  clrscr;
  assign(qt2,'asus\count.txt');reset(qt2);readln(qt2,ai);close(qt2);
  for i:=1 to ai do
    begin str(i,s);s:='asus\'+s;
    assign(qt2,s);reset(qt2);readln(qt2,ss1[i]);readln(qt2,ss);readln(qt2,ss);readln(qt2,iiiii[i]);readln(qt2,ss);readln(qt2,ss);readln(qt2,ss);readln(qt2,ss);readln(qt2,ss);readln(qt2,ss);readln(qt2,ss);readln(qt2,bb[i]);readln(qt2,aa[i]);close(qt2);end;
  for i:=ai downto 1 do
    for j:=1 to i-1 do
      if (aa[j]<aa[j+1])or((aa[j]=aa[j+1])and(bb[j]<bb[j+1])) then begin
      t:=aa[j];aa[j]:=aa[j+1];aa[j+1]:=t;s:=ss1[j];ss1[j]:=ss1[j+1];ss1[j+1]:=s;s:=iiiii[j];iiiii[j]:=iiiii[j+1];iiiii[j+1]:=s;t:=bb[j];bb[j]:=bb[j+1];bb[j+1]:=t;end;
  yeshu:=ai div 20+1;
  if ai mod 20=0 then dec(yeshu);
  zhizhen:=1;
  repeat
  clrscr;
  writeln('★★★★★★★★★★★★★★英雄榜——等级排名★★★★★★★★★★★★★★');
  writeln('排名       名字                                     昵称 等级 经验');
  for i:=zhizhen*20-19 to zhizhen*20 do
    if i<=ai then begin
    if i=1 then textcolor(yellow);if i=2 then textcolor(red);if i=3 then textcolor(green);if i=4 then textcolor(blue);if i>4 then textcolor(white);
    writeln(i:4,' ',ss1[i]:10,' ',iiiii[i]:40,' ',aa[i]:4,' ',bb[i]:4);
    end;
  huanye;
  until c='q';
end;

procedure x8dtzs;
var
  qt,qt2:text;ai,t,i,j,xx,yy:longint;s:ansistring;
begin
  clrscr;
  assign(qt2,'asus\count.txt');reset(qt2);readln(qt2,ai);close(qt2);
  for i:=1 to ai do
    begin str(i,s);s:='asus\'+s;
    assign(qt2,s);reset(qt2);readln(qt2,ss1[i]);readln(qt2,ss);readln(qt2,ss);readln(qt2,iiiii[i]);close(qt2);
    str(i,s);s:='achi\'+s;
    assign(qt2,s);reset(qt2);read(qt2,xx);read(qt2,yy);aa[i]:=xx+yy;close(qt2);end;
  for i:=ai downto 1 do
    for j:=1 to i-1 do
      if (aa[j]<aa[j+1])then begin
      t:=aa[j];aa[j]:=aa[j+1];aa[j+1]:=t;s:=ss1[j];ss1[j]:=ss1[j+1];ss1[j+1]:=s;s:=iiiii[j];iiiii[j]:=iiiii[j+1];iiiii[j+1]:=s;end;
  yeshu:=ai div 20+1;
  if ai mod 20=0 then dec(yeshu);
  zhizhen:=1;
  repeat
  clrscr;
  writeln('★★★★★★★★★★★★★英雄榜——答题总数排名★★★★★★★★★★★★★');
  writeln('排名       名字                                     昵称 答题总数');
  for i:=zhizhen*20-19 to zhizhen*20 do
    if i<=ai then begin
    if i=1 then textcolor(yellow);if i=2 then textcolor(red);if i=3 then textcolor(green);if i=4 then textcolor(blue);if i>4 then textcolor(white);
    writeln(i:4,' ',ss1[i]:10,' ',iiiii[i]:40,' ',aa[i]:4);
    end;
  huanye;
  until c='q';
end;

procedure x8ddzs;
var
  qt,qt2:text;ai,t,i,j,xx,yy:longint;s:ansistring;
begin
  clrscr;
  assign(qt2,'asus\count.txt');reset(qt2);readln(qt2,ai);close(qt2);
  for i:=1 to ai do
    begin str(i,s);s:='asus\'+s;
    assign(qt2,s);reset(qt2);readln(qt2,ss1[i]);readln(qt2,ss);readln(qt2,ss);readln(qt2,iiiii[i]);close(qt2);
    str(i,s);s:='achi\'+s;
    assign(qt2,s);reset(qt2);read(qt2,aa[i]);close(qt2);end;
  for i:=ai downto 1 do
    for j:=1 to i-1 do
      if (aa[j]<aa[j+1])then begin
      t:=aa[j];aa[j]:=aa[j+1];aa[j+1]:=t;s:=ss1[j];ss1[j]:=ss1[j+1];ss1[j+1]:=s;s:=iiiii[j];iiiii[j]:=iiiii[j+1];iiiii[j+1]:=s;end;
  yeshu:=ai div 20+1;
  if ai mod 20=0 then dec(yeshu);
  zhizhen:=1;
  repeat
  clrscr;
  writeln('★★★★★★★★★★★★★英雄榜——答对总数排名★★★★★★★★★★★★★');
  writeln('排名       名字                                     昵称 答对总数');
  for i:=zhizhen*20-19 to zhizhen*20 do
    if i<=ai then begin
    if i=1 then textcolor(yellow);if i=2 then textcolor(red);if i=3 then textcolor(green);if i=4 then textcolor(blue);if i>4 then textcolor(white);
    writeln(i:4,' ',ss1[i]:10,' ',iiiii[i]:40,' ',aa[i]:4);
    end;
  huanye;
  until c='q';
end;

procedure x8zql;
var
  qt,qt2:text;ai,i,j,xx,yy,tt:longint;s:ansistring;
  cc:array[0..1000] of double;
  t:double;
begin
  clrscr;
  assign(qt2,'asus\count.txt');reset(qt2);readln(qt2,ai);close(qt2);
  for i:=1 to ai do
    begin str(i,s);s:='asus\'+s;
    assign(qt2,s);reset(qt2);readln(qt2,ss1[i]);readln(qt2,ss);readln(qt2,ss);readln(qt2,iiiii[i]);close(qt2);
    str(i,s);s:='achi\'+s;
    assign(qt2,s);reset(qt2);read(qt2,xx);read(qt2,yy);if xx+yy<>0 then cc[i]:=xx/(xx+yy)*100 else cc[i]:=0;close(qt2);
  aa[i]:=xx;end;
  for i:=ai downto 1 do
    for j:=1 to i-1 do
      if (cc[j]<cc[j+1])then begin
      t:=cc[j];cc[j]:=cc[j+1];cc[j+1]:=t;s:=ss1[j];ss1[j]:=ss1[j+1];ss1[j+1]:=s;s:=iiiii[j];iiiii[j]:=iiiii[j+1];iiiii[j+1]:=s;tt:=aa[j];aa[j]:=aa[j+1];aa[j+1]:=tt;end;
  yeshu:=ai div 20+1;
  if ai mod 20=0 then dec(yeshu);
  zhizhen:=1;
  repeat
  clrscr;
  writeln('★★★★★★★★★★★★★英雄榜——正确率排名★★★★★★★★★★★★★');
  writeln('排名       名字                                     昵称 答对 正确率');
  for i:=zhizhen*20-19 to zhizhen*20 do
    if i<=ai then begin
    if i=1 then textcolor(yellow);if i=2 then textcolor(red);if i=3 then textcolor(green);if i=4 then textcolor(blue);if i>4 then textcolor(white);
    writeln(i:4,' ',ss1[i]:10,' ',iiiii[i]:40,' ',aa[i]:4,' ',cc[i]:0:2,'%');
    end;
  huanye;
  until c='q';
end;

procedure x8wtqj;
var
  qt,qt2,qt3:text;ai,i,j,xx,yy,tt:longint;s:ansistring;
  cc:array[0..1000] of longint;
  t:longint;
begin
  clrscr;
  assign(qt2,'asus\count.txt');reset(qt2);readln(qt2,ai);close(qt2);
  for i:=1 to ai do
    begin str(i,s);s:='asus\'+s;
    assign(qt2,s);reset(qt2);readln(qt2,ss1[i]);
    readln(qt2,ss);readln(qt2,ss);readln(qt2,iiiii[i]);close(qt2);
    str(i,s);s:='wtqjdt\'+s;
    assign(qt2,s);reset(qt2);
    readln(qt2,cc[i]);close(qt2);
    end;
  for i:=ai downto 1 do
    for j:=1 to i-1 do
      if (cc[j]<cc[j+1])then begin
      t:=cc[j];cc[j]:=cc[j+1];cc[j+1]:=t;s:=ss1[j];ss1[j]:=ss1[j+1];ss1[j+1]:=s;s:=iiiii[j];iiiii[j]:=iiiii[j+1];iiiii[j+1]:=s;end;
  yeshu:=ai div 20+1;
  if ai mod 20=0 then dec(yeshu);
  zhizhen:=1;
  repeat
  clrscr;
  writeln('★★★★★★★★★★英雄榜——问题求解答对数量排名★★★★★★★★★★');
  writeln('排名       名字                                     昵称 答对数量');
  for i:=zhizhen*20-19 to zhizhen*20 do
    if i<=ai then begin
    if i=1 then textcolor(yellow);if i=2 then textcolor(red);if i=3 then textcolor(green);if i=4 then textcolor(blue);if i>4 then textcolor(white);
    writeln(i:4,' ',ss1[i]:10,' ',iiiii[i]:40,' ',cc[i]);
    end;
  huanye;
  until c='q';
end;

procedure x8ydcx;
var
  qt,qt2,qt3:text;ai,i,j,xx,yy,tt:longint;s:ansistring;
  cc:array[0..1000] of longint;
  t:longint;
begin
  clrscr;
  assign(qt2,'asus\count.txt');reset(qt2);readln(qt2,ai);close(qt2);
  for i:=1 to ai do
    begin str(i,s);s:='asus\'+s;
    assign(qt2,s);reset(qt2);readln(qt2,ss1[i]);
    readln(qt2,ss);readln(qt2,ss);readln(qt2,iiiii[i]);close(qt2);
    str(i,s);s:='ydcxdt\'+s;
    assign(qt2,s);reset(qt2);
    readln(qt2,cc[i]);close(qt2);
    end;
  for i:=ai downto 1 do
    for j:=1 to i-1 do
      if (cc[j]<cc[j+1])then begin
      t:=cc[j];cc[j]:=cc[j+1];cc[j+1]:=t;s:=ss1[j];ss1[j]:=ss1[j+1];ss1[j+1]:=s;s:=iiiii[j];iiiii[j]:=iiiii[j+1];iiiii[j+1]:=s;end;
  yeshu:=ai div 20+1;
  if ai mod 20=0 then dec(yeshu);
  zhizhen:=1;
  repeat
  clrscr;
  writeln('★★★★★★★★★★英雄榜——阅读程序答对数量排名★★★★★★★★★★');
  writeln('排名       名字                                     昵称 答对数量');
  for i:=zhizhen*20-19 to zhizhen*20 do
    if i<=ai then begin
    if i=1 then textcolor(yellow);if i=2 then textcolor(red);if i=3 then textcolor(green);if i=4 then textcolor(blue);if i>4 then textcolor(white);
    writeln(i:4,' ',ss1[i]:10,' ',iiiii[i]:40,' ',cc[i]);
    end;
  huanye;
  until c='q';
end;

procedure x8tz1;
var
  qt,qt2:text;ai,t,i,j:longint;s:ansistring;
  ss1,iiiii1:array[0..10000] of ansistring;
  aa:array[0..10000] of longint;
begin
  clrscr;
  assign(qt2,'tzms\count.txt');reset(qt2);readln(qt2,ai);close(qt2);
  for i:=1 to ai do
    begin str(i,s);s:='tzms\'+s;
    assign(qt2,s);reset(qt2);readln(qt2,ss1[i]);readln(qt2,iiiii[i]);readln(qt2,aa[i]);close(qt2);end;
  for i:=ai downto 1 do
    for j:=1 to i-1 do
      if aa[j]<aa[j+1] then begin
      t:=aa[j];aa[j]:=aa[j+1];aa[j+1]:=t;s:=ss1[j];ss1[j]:=ss1[j+1];ss1[j+1]:=s;s:=iiiii[j];iiiii[j]:=iiiii[j+1];iiiii[j+1]:=s;end;
  yeshu:=ai div 20+1;
  if ai mod 20=0 then dec(yeshu);
  zhizhen:=1;
  repeat
  clrscr;
  writeln('★★★★★★★★★★★★英雄榜——挑战模式时间排名★★★★★★★★★★★★');
  writeln('排名       名字                                     昵称 时间');
  for i:=zhizhen*20-19 to zhizhen*20 do
    if i<=ai then begin
    if i=1 then textcolor(yellow);if i=2 then textcolor(red);if i=3 then textcolor(green);if i=4 then textcolor(blue);if i>4 then textcolor(white);
    writeln(i:4,' ',ss1[i]:10,' ',iiiii[i]:40,' ',aa[i]div 100,'.',aa[i]mod 100,'秒');
    end;
  huanye;
  until c='q';
end;

procedure x8tz2;
var
  qt,qt2:text;ai,t,i,j,p:longint;s:ansistring;
  aa:array[0..10000] of longint;
  ss1,iiiii:array[0..10000] of ansistring;
begin
  clrscr;
  assign(qt2,'tzms\count.txt');reset(qt2);readln(qt2,ai);close(qt2);
  for i:=1 to ai do
    begin str(i,s);s:='tzms\'+s;
    assign(qt2,s);reset(qt2);readln(qt2,ss1[i]);readln(qt2,iiiii[i]);readln(qt2,p);readln(qt2,aa[i]);close(qt2);end;
  for i:=ai downto 1 do
    for j:=1 to i-1 do
      if aa[j]<aa[j+1] then begin
      t:=aa[j];aa[j]:=aa[j+1];aa[j+1]:=t;s:=ss1[j];ss1[j]:=ss1[j+1];ss1[j+1]:=s;s:=iiiii[j];iiiii[j]:=iiiii[j+1];iiiii[j+1]:=s;end;
  yeshu:=ai div 20+1;
  if ai mod 20=0 then dec(yeshu);
  zhizhen:=1;
  repeat
  clrscr;
  writeln('★★★★★★★★★★★★英雄榜——挑战模式答对排名★★★★★★★★★★★★');
  writeln('排名       名字                                     昵称 答对');
  for i:=zhizhen*20-19 to zhizhen*20 do
    if i<=ai then begin
    if i=1 then textcolor(yellow);if i=2 then textcolor(red);if i=3 then textcolor(green);if i=4 then textcolor(blue);if i>4 then textcolor(white);
    writeln(i:4,' ',ss1[i]:10,' ',iiiii[i]:40,' ',aa[i]);
    end;
  huanye;
  until c='q';
end;

procedure x8tbhf;
var
  qt,qt2:text;ai,t,i,j,p:longint;s:ansistring;
begin
  clrscr;
  assign(qt2,'tieba\count.txt');reset(qt2);readln(qt2,ai);close(qt2);
  for i:=1 to ai do
    begin str(i,s);s:='tbhf\'+s;
    assign(qt2,s);reset(qt2);readln(qt2,aa[i]);close(qt2);
    str(i,s);s:='tbfz\'+s;
    assign(qt2,s);reset(qt2);readln(qt2,ss1[i]);close(qt2);
    str(i,s);s:='tieba\'+s+'.txt';
    assign(qt2,s);reset(qt2);readln(qt2,iiiii[i]);close(qt2);end;
  for i:=ai downto 1 do
    for j:=1 to i-1 do
      if aa[j]<aa[j+1] then begin
      t:=aa[j];aa[j]:=aa[j+1];aa[j+1]:=t;s:=ss1[j];ss1[j]:=ss1[j+1];ss1[j+1]:=s;s:=iiiii[j];iiiii[j]:=iiiii[j+1];iiiii[j+1]:=s;end;
  yeshu:=ai div 20+1;
  if ai mod 20=0 then dec(yeshu);
  zhizhen:=1;
  repeat
  clrscr;
  writeln('★★★★★★★★★★★★英雄榜——贴吧回复数量排名★★★★★★★★★★★★');
  writeln('排名       吧主                                 贴吧名称 回复次数');
  for i:=zhizhen*20-19 to zhizhen*20 do
    if i<=ai then begin
    if i=1 then textcolor(yellow);if i=2 then textcolor(red);if i=3 then textcolor(green);if i=4 then textcolor(blue);if i>4 then textcolor(white);
    writeln(i:4,' ',ss1[i]:10,' ',iiiii[i]:40,' ',aa[i]);
    end;
  huanye;
  until c='q';
end;


procedure x8tbll;
var
  qt,qt2:text;ai,t,i,j,p:longint;s:ansistring;
begin
  clrscr;
  assign(qt2,'tieba\count.txt');reset(qt2);readln(qt2,ai);close(qt2);
  for i:=1 to ai do
    begin str(i,s);s:='tbll\'+s;
    assign(qt2,s);reset(qt2);readln(qt2,aa[i]);close(qt2);
    str(i,s);s:='tbfz\'+s;
    assign(qt2,s);reset(qt2);readln(qt2,ss1[i]);close(qt2);
    str(i,s);s:='tieba\'+s+'.txt';
    assign(qt2,s);reset(qt2);readln(qt2,iiiii[i]);close(qt2);end;
  for i:=ai downto 1 do
    for j:=1 to i-1 do
      if aa[j]<aa[j+1] then begin
      t:=aa[j];aa[j]:=aa[j+1];aa[j+1]:=t;s:=ss1[j];ss1[j]:=ss1[j+1];ss1[j+1]:=s;s:=iiiii[j];iiiii[j]:=iiiii[j+1];iiiii[j+1]:=s;end;
  yeshu:=ai div 20+1;
  if ai mod 20=0 then dec(yeshu);
  zhizhen:=1;
  repeat
  clrscr;
  writeln('★★★★★★★★★★★★英雄榜——贴吧回复数量排名★★★★★★★★★★★★');
  writeln('排名       吧主                                 贴吧名称 浏览次数');
  for i:=zhizhen*20-19 to zhizhen*20 do
    if i<=ai then begin
    if i=1 then textcolor(yellow);if i=2 then textcolor(red);if i=3 then textcolor(green);if i=4 then textcolor(blue);if i>4 then textcolor(white);
    writeln(i:4,' ',ss1[i]:10,' ',iiiii[i]:40,' ',aa[i]);
    end;
  huanye;
  until c='q';
end;

begin
  repeat
  x:=random(10)+1;str(x,se);
  clrscr;assign(bt,'英雄榜'+se+'.txt');reset(bt);
  for i:=1 to 23 do begin readln(bt,ss);writeln(ss);end;close(bt);
  cc:=readkey;if cc='1' then x8lxdt;if cc='2' then x8jb;if cc='3' then x8jy;
  if cc='4' then x8dtzs;if cc='5' then x8ddzs;if cc='6' then x8zql;
  if cc='7' then x8wtqj;if cc='8' then x8ydcx;if cc='9' then x8tz1;
  if cc='0' then x8tz2;if cc='a' then x8tbhf;if cc='b' then x8tbll;
  until cc='q';
end;

procedure x10;//英雄贴吧
var
  bj:text;sss:ansistring;
  yee,bianhao,yeshu,ans,zhizhen,zhizhen2,i,j,k,pp,anss:longint;c:char;
  s:array[0..10000] of ansistring;ye,zhi,hf,ll:array[0..10000] of longint;

procedure fatie;
var
  biaoti,ss:ansistring;sr,s:Array[0..1000] of ansistring;
  i,hang,zishu,j,gg,ii,ans:longint;nian,yue,ri,shi,fen,miao,haomiao:word;
begin
  clrscr;if gold<30 then writeln('金币不足，按任意键退出');
  if level<5 then writeln('等级不够，按任意键退出');
  if (gold<30)or(level<5) then begin
  readkey;exit;end else begin
  repeat
  clrscr;writeln('标题(不超过40字符)：');
  writeln('正文(不超过1000字符或20行，输出空行完成输出)：');
  gotoxy(21,1);readln(biaoti);gotoxy(21,1);writeln(biaoti);gotoxy(1,3);hang:=0;i:=0;
  repeat
    inc(i);gotoxy(1,hang+3);readln(sr[i]);gotoxy(1,hang+3);writeln(sr[i]);
    for j:=1 to length(sr[i]) div 78 do writeln;
    hang:=hang+length(sr[i]) div 78+1;zishu:=zishu+length(sr[i]);
  until sr[i]='';
  until (length(biaoti)<=40)and(zishu<=1000)and(hang<=20);
  assign(bj,mynumber);reset(bj);for ii:=1 to 13 do readln(bj,s[ii]);close(bj);
  val(s[11],gg);gg:=gg-30;str(gg,s[11]);
  assign(bj,mynumber);rewrite(bj);for ii:=1 to 13 do writeln(bj,s[ii]);close(bj);
  assign(bj,'tieba\count.txt');reset(bj);readln(bj,ans);close(bj);
  assign(bj,'tieba\count.txt');rewrite(bj);writeln(bj,ans+1);close(bj);
  str(ans+1,ss);ss:='tieba\'+ss+'.txt';assign(bj,ss);rewrite(bj);
  writeln(bj,biaoti);write(bj,'作者：',name);
  getdate(nian,yue,ri,shi);gettime(shi,fen,miao,haomiao);
  write(bj,'  时间：',nian,'年',yue,'月',ri,'日 ',shi,':',fen,':',miao);
  writeln(bj);writeln(bj,'[end]');
  for j:=1 to i-1 do writeln(bj,sr[j]);close(bj);
  str(ans+1,ss);ss:='tbfz\'+ss;assign(bj,ss);rewrite(bj);
  writeln(bj,name);close(bj);
  end;
end;

procedure huifu;
var
  ii,i:longint;mingzi:ansistring;ff:boolean;
  biaoti,ss:ansistring;sr,s:Array[0..1000] of ansistring;
  hang,zishu,j,k,gg,ans,cou,anss:longint;nian,yue,ri,shi,fen,miao,haomiao:word;
begin
  str(bianhao,sss);sss:='tbfz\'+sss;assign(bj,sss);reset(bj);
  readln(bj,mingzi);close(bj);
  clrscr;if gold<2 then writeln('金币不足，按任意键退出');
  if level<3 then writeln('等级不够，按任意键退出');
  if (gold<2)or(level<3) then begin
  readkey;exit;end else begin
  repeat
  clrscr;
  writeln('输入你想回复的内容(小于200字符)，楼主小于1000字符，不超过20行，输空行结束');
  gotoxy(1,2);ii:=0;hang:=0;zishu:=0;
  repeat
    inc(ii);gotoxy(1,hang+3);readln(sr[ii]);gotoxy(1,hang+3);writeln(sr[ii]);
    for j:=1 to length(sr[ii]) div 78 do writeln;
    hang:=hang+length(sr[ii]) div 78+1;zishu:=zishu+length(sr[ii]);
  until sr[ii]='';
  ff:=true;
  if name=mingzi then begin
  if zishu>1000 then ff:=false;if hang>20 then ff:=false;
  end else begin
  if zishu>100 then ff:=false;if hang>20 then ff:=false;
  end;
  until ff=true;
  assign(bj,mynumber);reset(bj);for ii:=1 to 13 do readln(bj,s[ii]);close(bj);
  val(s[11],gg);if name<>mingzi then gg:=gg-2;str(gg,s[11]);
  assign(bj,mynumber);rewrite(bj);for ii:=1 to 13 do writeln(bj,s[ii]);close(bj);
  str(bianhao,ss);ss:='tieba\'+ss+'.txt';
  assign(bj,ss);reset(bj);
  for i:=1 to 1000 do begin readln(bj,s[i]);if s[i]='' then break; end;close(bj);
  assign(bj,ss);rewrite(bj);
  for j:=1 to i-1 do begin  writeln(bj,s[j]);end;
  writeln(bj,'[end]');write(bj,'回复人：',name);
  getdate(nian,yue,ri,shi);gettime(shi,fen,miao,haomiao);
  write(bj,'  时间：',nian,'年',yue,'月',ri,'日 ',shi,':',fen,':',miao);writeln(bj);
  for j:=1 to ii-1 do writeln(bj,sr[j]);close(bj);
  str(bianhao,sss);sss:='tbhf\'+sss;
  assign(bj,sss);reset(bj);readln(bj,anss);close(bj);
  assign(bj,sss);rewrite(bj);writeln(bj,anss+1);close(bj);
  end;
end;

begin
  repeat
  clrscr;
  assign(bj,'tieba\count.txt');reset(bj);readln(bj,ans);close(bj);
  for i:=1 to ans do
    begin str(i,sss);sss:='tieba\'+sss+'.txt';
          assign(bj,sss);reset(bj);readln(bj,s[i]);close(bj);end;
  for i:=1 to ans do
    begin
      str(i,sss);sss:='tbhf\'+sss;assign(bj,sss);reset(bj);readln(bj,hf[i]);close(bj);
      str(i,sss);sss:='tbll\'+sss;assign(bj,sss);reset(bj);readln(bj,ll[i]);close(bj);
    end;
  yeshu:=ans div 10+1;if ans mod 10=0 then dec(yeshu);zhizhen:=1;zhizhen2:=1;
  repeat
  clrscr;x:=random(10)+1;str(x,se);
  assign(bj,'贴吧'+se+'.txt');reset(bj);
  for i:=1 to 23 do begin readln(bj,ss);writeln(ss);end;close(bj);
  gotoxy(5,14);writeln(zhizhen);gotoxy(12,14);writeln(yeshu);
  for i:=zhizhen*10-9 to zhizhen*10 do
    if i<=ans then begin gotoxy(3,4+(i-1) mod 10);
      if zhizhen*10+zhizhen2-10=i then textbackground(yellow) else textbackground(black);
      writeln(s[i]);textbackground(black);
      gotoxy(45,4+(i-1) mod 10);writeln(hf[i]);gotoxy(50,4+(i-1) mod 10);writeln(ll[i]);end;
  textbackground(black);c:=readkey;
  if ord(c)=75 then dec(zhizhen);if ord(c)=77 then inc(zhizhen);
  if ord(c)=72 then dec(zhizhen2);if ord(c)=80 then inc(zhizhen2);
  if zhizhen2=0 then begin dec(zhizhen);zhizhen2:=10;end;
  if zhizhen2=11 then begin inc(zhizhen);zhizhen2:=0;end;
  while zhizhen2+zhizhen*10-10>ans do dec(zhizhen2);
  if zhizhen=0 then begin zhizhen:=1;zhizhen2:=1;end;
  if zhizhen>yeshu then begin zhizhen:=yeshu;zhizhen2:=10;end;
  while zhizhen2+zhizhen*10-10>ans do dec(zhizhen2);
  if (c='f')or(c='F') then fatie;if (c='q')or(c='Q') then exit;
  until ord(c)=13;
  bianhao:=zhizhen*10+zhizhen2-10;str(bianhao,ss);ss:='tieba\'+ss+'.txt';
  assign(bj,ss);reset(bj);
  for i:=1 to 10000 do begin readln(bj,s[i]);if s[i]='' then break;end;close(bj);
  str(bianhao,ss);ss:='tbll\'+ss;
  assign(bj,ss);reset(bj);readln(bj,anss);close(bj);
  assign(bj,ss);rewrite(bj);writeln(bj,anss+1);close(bj);
  for j:=1 to i-1 do
    begin zhi[j]:=zhi[j-1]+length(s[j]) div 78+1;ye[j]:=zhi[j] div 21+1;end;
  yee:=1;
  repeat
  clrscr;pp:=0;
  for j:=1 to i-1 do
    if ye[j]=yee then begin
      if s[j]='[end]' then begin pp:=pp+1;writeln('-----------------------------------第',pp,'楼-----------------------------------');end else
      writeln(s[j]);for k:=1 to length(s[j]) div 78 do writeln;
    end;
  writeln('第',yee,'页，共',ye[i-1],'页，←、→翻页，【h】回复');
  c:=readkey;if ord(c)=75 then dec(yee);if yee=0 then yee:=1;
  if ord(c)=77 then inc(yee);if yee>ye[i-1] then yee:=ye[i-1];
  if (c='h')or(c='H') then huifu;
  until c='q';
  until 1<>1;
end;

{procedure x11;
var

begin
  write('第一滴血  答对一道题目   5   ');
  if rig>=1 then begin writeln('√');rank:=rank+5;end else writeln('×');
  write('初露锋芒  答对十道题目   10  ');
  if rig>=10 then begin writeln('√');rank:=rank+10;end else writeln('×');
  write('锋芒毕露  答对五十道题目 20  ');
  if rig>=50 then begin writeln('√');rank:=rank+20;end else writeln('×');
  write('身经百战  答对一百道题目 20  ');
  if rig>=100 then begin writeln('√');rank:=rank+20;end else writeln('×');
  write('虐爆题库  答对289道题目  30  ');
  if rig>=289 then begin writeln('√');rank:=rank+30;end else writeln('×');
  write('六六大顺  答对666到题目  30  ');
  if rig>=666 then begin writeln('√');rank:=rank+30;end else writeln('×');
  write('横扫千军  答对一千道题目 30  ');
  if rig>=1000 then begin writeln('√');rank:=rank+30;end else writeln('×');
  write('新的纪元  答对2000道题目 100 ');
  if rig>=2000 then begin writeln('√');rank:=rank+100;end else writeln('×');
  write('答题英雄  答对5000道题目 200 ');
  if rig>=5000 then begin writeln('√');rank:=rank+100;end else writeln('×');
  write('送出一血  答错一道题目   2   ');
  if wro>=1 then begin writeln('√');rank:=rank+2;end else writeln('×');
  write('超越鬼了  答错十道题目   5   ');
  if wro>=10 then begin writeln('√');rank:=rank+5;end else writeln('×');
  write('我是炮灰  答错一百道题目 10  ');
  if wro>=100 then begin writeln('√');rank:=rank+10;end else writeln('×');
  write('死神来临  答错444道题目  20  ');
  if wro>=444 then begin writeln('√');rank:=rank+20;end else writeln('×');
  write('超大炮灰  答错1000道题目 20  ');
  if wro>=1000 then begin writeln('√');rank:=rank+20;end else writeln('×');
  write('
end;}
procedure xa;
var
  s,ss:ansistring;
  uu:array[0..10000] of ansistring;
  r:array[0..1000,1..5] of ansistring;
  i,ans,j,k,l:longint;
  a,b:array[0..10000] of longint;
  c:char;bj:text;
begin
  clrscr;s:='cuoti\'+number+'.txt';
  assign(bj,s);reset(bj);readln(bj,ans);
  for i:=1 to ans do readln(Bj,a[i]);close(bj);
  for i:=ans downto 1 do
    begin
      clrscr;
      str(a[i],ss);assign(bj,'data\'+ss+'.txt');reset(bj);
      for j:=1 to 5 do readln(bj,uu[j]);
      close(bj);writeln(uu[1]);
      for j:=1 to length(uu[1]) div 78 do writeln;
      writeln('正确答案：',uu[2]);writeln('错误答案1：',uu[3]);
      writeln('错误答案2：',uu[4]);writeln('错误答案3：',uu[5]);
      writeln('q键退出，s键删除这道错题，k键生成错题本，其他键继续');c:=readkey;
      if (c='q')or(c='Q') then exit;
      if (c='s')or(c='S') then begin
      s:='cuoti\'+number+'.txt';
      assign(bj,s);reset(bj);readln(bj,ans);
      for j:=1 to ans do readln(bj,b[i]);close(bj);
      assign(bj,s);rewrite(bj);writeln(bj,ans-1);
      for j:=1 to ans do if j<>i then writeln(bj,b[j]);close(bj);
      end;
      if (c='k')or(c='K') then begin
      s:='cuoti\'+number+'.txt';
      assign(bj,s);reset(bj);readln(bj,ans);
      for j:=1 to ans do readln(Bj,b[j]);close(bj);
      for j:=ans downto 1 do
        begin
          str(b[j],ss);
          assign(bj,'data\'+ss+'.txt');reset(bj);
          for k:=1 to 5 do readln(bj,r[j][k]);close(bj);
        end;
      assign(bj,'错题本.txt');rewrite(bj);
      for j:=ans downto 1 do
        begin
        str(j,ss);
        writeln(bj,r[j][1]);writeln(bj,'正确答案 ：',r[j][2]);
        writeln(bj,'错误答案1：',r[j][3]);writeln(bj,'错误答案2：',r[j][4]);
        writeln(bj,'错误答案3：',r[j][5]);writeln(bj);
        end;
      close(bj);
      writeln('错题本已经生成，请在错题本.txt文件中找到，按任意键退出');
      c:=readkey;exit;
    end;end;
  writeln('你已经把错题看完,按任意键继续');
  readkey;
end;
begin
  repeat
  clrscr; randomize;  cursoroff;
  assign(qt,'computer\首页背景.txt');reset(qt);
  readln(qt,op);textbackground(op);close(qt);
  assign(qt,'computer\首页字体颜色.txt');reset(qt);readln(qt,op);
  textcolor(op);close(qt);
  assign(qt,'computer\错误选项背景.txt');reset(qt);readln(qt,cuowu);close(qt);assign(qt,'computer\答题时间.txt');reset(qt);
  readln(qt,dati);dati:=dati*100;close(qt);
  assign(qt,'computer\时间颜色.txt');
  reset(qt);readln(qt,sjys);close(qt);
  assign(qt,'computer\双人模式答错机会.txt');
  reset(qt);readln(qt,dcjh);close(qt);
  assign(qt,'computer\题目颜色.txt');
  reset(qt);readln(qt,tmys);close(qt);
  assign(qt,'computer\题目背景.txt');
  reset(qt);readln(qt,tmbj);close(qt);
  assign(qt,'computer\选项颜色.txt');
  reset(qt);readln(qt,xuanxiang);close(qt);
  assign(qt,'computer\正确选项背景.txt');
  reset(qt);readln(qt,zhengque);close(qt);
  assign(qt,'computer\停留时间.txt');
  reset(qt);readln(qt,tlsj);close(qt);
  assign(qt,'computer\其他字体颜色.txt');
  reset(qt);readln(qt,qtzt);close(qt);
  x:=random(10)+1;str(x,se);
  assign(bj,'背景'+se+'.txt' );reset(bj);
  for i:=1 to 24 do begin readln(bj,ss);writeln(ss);end;close(bj);
  sssyy:='thing\'+number;assign(bj,sssyy);reset(bj);
  for i:=1 to 7 do readln(bj,wp[i]);close(bj);
  if wp[6]>=1 then dati:=dati+1000;shuaxin:=wp[4];paicuo:=wp[5];
  gotoxy(36,3);writeln(name);gotoxy(45,6);write(name);gotoxy(62,6);write(gold);gotoxy(73,6);write('待');gotoxy(45,7);write(exp,'\',lev[level]);
  gotoxy(62,7);write(level);gotoxy(73,7);write('待');
  gotoxy(47,8);write(wro+rig);gotoxy(60,8);write('待');
  gotoxy(47,9);write(rig);gotoxy(60,9);write('待');
  gotoxy(45,10);if wro+rig=0 then write('  0.00')
  else begin zhql:=(rig/(wro+rig))*100;write(zhql:6:2);end;
  gotoxy(60,10);write('待');
  gotoxy(47,11);write(rec);gotoxy(60,11);write('待');
  xx:=readkey;if ord(xx)=27 then halt;if ord(xx)=13 then exit;
  textbackground(tmbj);textcolor(qtzt);e:=0;
  if xx='1' then x1;if xx='2' then x2;if xx='3' then x3;if xx='4' then x4;
  if xx='5' then x5;if xx='6' then x6;if xx='7' then x7;
  if xx='8' then x8;if xx='9' then x9;if xx='0' then x10;if xx='a' then xa;
  until 1<>1;
  end;
begin
  init;
  run;
end.

