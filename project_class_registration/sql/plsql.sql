-- 현재 수강 인원
create or replace function now(v_class_code registration.class_code%type)
return number
is
   now number;
begin
   select count(class_code) into now
   from registration where class_code = v_class_code;

   return now;
end;
/

--차트 그리기(class_name, now함수 값 = registration에 등록된 class_code 수)
select c.class_name, now(new.class_code) 
from class c, (select class_code from registration group by class_code) new
where c.class_code = new.class_code
order by now(new.class_code) desc;
      


-- 제한 인원
create or replace function max_student(v_class_code class.class_code%type)
return number
is
   max_number number;
begin
   select max_student into max_number
   from class where class_code = v_class_code;
   
   return max_number;
end;
/

-- 수강 여부
create or replace function result(v_class_code class.class_code%type)
return VARCHAR2
is
   result VARCHAR2(30);
begin
   
   if  (now(v_class_code) < max_student(v_class_code) )  then
   result:='수강 등록 완료';
   else
   result:='신청 대기중';
   end if;

   return result;
end;
/

--검사

-- 삭제 및 수정 프로시저
create or replace procedure autoupdate(v_id registration.student_id%type,  v_class_code registration.class_code%type)
is

begin
   delete from registration
   where student_id=v_id  and class_code=v_class_code;

   UPDATE registration SET result='수강 등록 완료' 
   WHERE class_code=v_class_code and result='신청 대기중'  and ROWNUM <= 1;
end;
/


-- 수강신청 내역 업데이트 시 백업 트리거

drop trigger back_registration;

create or replace trigger back_registration
before delete on registration
for each row
begin
   insert into backup_registration values
   (:old.class_code, :old.class_name, :old.student_id, :old.teacher_name, :old.start_day, :old.end_day, :old.result);
end;
/

-- registration테이블에서 end_day이후로 해당과목 자동삭제 프로시저

drop procedure auto_erase_class;

create or replace procedure auto_erase_class(v_end_day registration.end_day%type)
is

begin
   if(to_char(sysdate, 'yyyy-mm-dd') > v_end_day) then
   delete from registration where end_day=v_end_day;
   end if;
end;
/

