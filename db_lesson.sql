
---Q1---
create table departments(
department_id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(20) NOT NULL,
created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
);


---Q2---
alter table people add column department_id int unsigned null after email;

---Q3---
《追加する部署一覧(departments)》
insert into departments(name) values ('営業'),('開発'),('経理'),('人事'),('情報システム');

《追加する人の条件(people)》
insert into people(name, email, department_id, age, gender) values
('小勝はるか','kokatsu@beyond-works.co.jp', 1, 29, 2),
('遠藤優太','endo@beyond-works.co.jp', 1, 30, 1),
('山田涼介','yamada@beyond-works.co.jp', 1, 36, 1),
('加藤萌子', 'kato@beyond-works.co.jp', 2, 24, 2),
('中村えり', 'nakamura@beyond-works.co.jp', 2, 35, 2),
('佐藤来春', 'sato@beyond-works.co.jp', 2, 20, 2),
('後藤誠二', 'goto@beyond-works.co.jp', 2, 42, 1),
('渡辺みずな', 'watanabe@beyond-works.co.jp', 3, 25, 2),
('柏原大飛', 'kashiwabara@beyond-works.co.jp', 4, 58, 1),
('石川美優', 'ishikawa@beyond-works.co.jp', 5, 14, 2);

《追加する日報の条件(reports))》
insert into reports (person_id, content) values
(7, '本日は営業部で新規顧客への提案活動を行いました。'),
(8, '既存顧客との打ち合わせを実施し要望を確認しました。'),
(9, '新規案件の見積書を作成して上司に提出しました。'),
(10, '開発チームでシステムの不具合修正を行いました。'),
(11, 'プログラムの動作確認とテストを実施しました。'),
(12, '新機能の設計書を作成してレビューを依頼しました。'),
(13, 'データベースの構造を確認して改善案をまとめました。'),
(14, '経理部で今月の経費精算と請求書の確認を行いました。'),
(15, '人事部で応募者の書類確認と面接日程の調整をしました。'),
(16, '社内ネットワークの動作確認と問い合わせ対応を行いました。');

---Q4---
update people set department_id = 1 where person_id = 1;
update people set department_id = 2 where person_id = 2;
update people set department_id = 3 where person_id = 3;
update people set department_id = 4 where person_id = 4;
update people set department_id = 5 where person_id = 6;

---Q5---
select name, age from people where gender = 1 order by desc;

---Q6---
テーブル「people」から「department_id」が１のレコードだけを抽出し
そのレコードに対応する名前、メールアドレス、年齢の3つのカラムを取得する
取得したレコードは登録日時の古い順に並べられます。

---Q7---
select name from people where (age >= 20 and age < 30 and gender = 2) or (age >= 40 and age < 50 and gender = 1);

---Q8---
select people.name, people.age from people inner join departments on people.department_id = departments.department_id where departments.name = '営業' order by people.age asc;

---Q9---
select avg(people.age) as average_age from people where department_id = 2 and gender = 2;

---Q10---;
select people.name, departments.name as department_name, reports.content from people inner join departments on people.department_id = departments.department_id inner join reports on people.person_id = reports.person_id;

---Q11---
select people.name from people left join reports on people.person_id = reports.person_id where reports.person_id is null;
