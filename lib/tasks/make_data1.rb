# coding: utf-8

require 'csv'
require 'date'
require 'active_support/time'

class Tasks::MakeData1
  @rooms = {
    "【6F】春会議室（10席）"  => "春",
    "【6F】夏会議室（8席・電縁優先）" => "夏",
    "【6F】秋会議室（10席・電縁優先）" => "秋",
    "【6F】冬会議室（12席）"   => "冬",
    "【6F】花会議室（6名程度）※仮眠室へ声が漏れやすいため、使用の際はご注意下さい。" =>  "花",
    "【6F】月会議室（6名程度)"  => "月",
    "【6F】雪会議室（4名程度）" => "雪",
    "【6F】スペース6-1（6名程度）＊入口背に左手前"  => "6-1",
    "【6F】スペース6-2（6名程度）＊入口背に左真ん中" => "6-2",
    "【6F】スペース6-3（6名程度）＊入口背に左奥"  => "6-3",
    "【6F】スペース6-4（6名程度）＊入口背に右手前" => "6-4",
    "【6F】スペース6-5（6名程度）＊入口背に右真ん中" => "6-5",
    "【6F】スペース6-6（6名程度）＊入口背に右奥" => "6-6",
    "【6F】スペース6-7(8～10名程度）【旧梅】＊入口背に1番奥" => "6-7",
    "【6F】SRブースA＊セミナールーム１入口背に一番手前（ホワイトボードなし）"  => "SR-A",
    "【6F】SRブースB＊＊セミナールーム１入口背に真ん中"  => "SR-B",
    "【6F】SRブースC＊＊セミナールーム１入口背に一番奥"  => "SR-C",
    "【6F】SRブースD＊セミナールーム２窓側【場所移動】"  => "SR-D",
    "【6F】SRブースE＊セミナールーム２真ん中"   => "SR-E",
    "【6F】SRブースF＊セミナールーム２手前"  => "SR-F",
    "【8F】GX)スペース8-1"  => "8-1",
    "【8F】GX)スペース8-2"  => "8-2",
    "【8F】GX)スペース8-3"  => "8-3"
  }
  def self.execute(csv_file_name = 'data/gx_facility.csv')
    reader = CSV.open(csv_file_name, "r")
    p reader.take(1)[0]
    p @rooms
    idx = 0
    reader.each do |row|
      room = @rooms[row[3]]
      startdatetime = DateTime.parse(row[5]) 
      enddatetime   = DateTime.parse(row[6]) 
      next if startdatetime.year < 2012
      p row
      # 正時まで進める
      if startdatetime.min != 0
        hourly_index = startdatetime.advance({:minutes => 60-startdatetime.min})
      else
        hourly_index = startdatetime
      end
      p [room, startdatetime, hourly_index, enddatetime]
      while ( hourly_index < enddatetime && hourly_index.to_date <= startdatetime.to_date ) do
        p hourly_index.strftime('%H:%M:%S')
        sch = Schedule1.new(
          :date => hourly_index.strftime('%Y-%m-%d'), 
          :time => hourly_index.strftime('%H:%M:%S'), 
          :category => row[10], 
          :member => row[11],
          :org_id => row[2],
          :room => room)
        sch.save
        hourly_index = hourly_index.advance({:hours => 1})
      end
      #break if idx > 10
      idx += 1
    end


  end
end
