# script StatisticCreator

## �����
 ������ ������� ��� ��������� ���������� � �������� ���������� ������� �� ������ ������� �������� ������.

## ���������� � �������
 ������� � ����������� config ���� � ������������� ��� ������� (��. ������ ���������� �����: /config/local.yml)
 ������� �������� (���� ����������): 
  1. ��������� ssh ����������� � ���������� ������ ������� 
  2. �������� ��������������� ������ (��. ������ scripts/bz3_addpart.sh) - ��� ��������� ��� ������� � ������� rails ����������
  
## ������ 
 ```
 ruby all.rb 123 local
 ```
 , ��� 123 - id ��������, ��� ������� ��������� ����������; local - �������� ����������������� ����� (/config/local.yml)
 ������������� ����� ���� �������� ����, ���� ��������� ������� ���������� �� � ������������ ���, ��������: 
 ```
 ruby all.rb 123 local 2016-12-05
 ```
 