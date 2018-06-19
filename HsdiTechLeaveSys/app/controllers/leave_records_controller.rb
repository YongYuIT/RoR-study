class LeaveRecordsController < ApplicationController
  before_action :set_leave_record, only: [:show, :edit, :update, :destroy]
  # GET /leave_records
  # GET /leave_records.json
  def index
    @leave_records = LeaveRecord.all
    for record in @leave_records
      record.leave_type = convertLeaveType(record.leave_type)
    end
  end

  # GET /leave_records/1
  # GET /leave_records/1.json
  def show
    @leave_record.leave_type = convertLeaveType(@leave_record.leave_type)
  end

  # GET /leave_records/new
  def new
    @leave_record = LeaveRecord.new
    @status='new'
  end

  # GET /leave_records/1/edit
  def edit
    @status='edit'
  end

  def excel
    #render :text =>@leave_record.attributes
    send_data get_xml_str, :filename => 'Leave Application.xml', :type => "text/comma-separated-values", :disposition => "attachment"
  end

  # POST /leave_records
  # POST /leave_records.json
  def create
    @leave_record = LeaveRecord.new(leave_record_params)
    @leave_record.staff_id='1'
    @leave_record.state='0'
    respond_to do |format|
      if @leave_record.save
        format.html { redirect_to @leave_record, notice: 'Leave record was successfully created.' }
        format.json { render :show, status: :created, location: @leave_record }
      else
        format.html { render :new }
        format.json { render json: @leave_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /leave_records/1
  # PATCH/PUT /leave_records/1.json
  def update
    respond_to do |format|
      if @leave_record.update(leave_record_params)
        format.html { redirect_to @leave_record, notice: 'Leave record was successfully updated.' }
        format.json { render :show, status: :ok, location: @leave_record }
      else
        format.html { render :edit }
        format.json { render json: @leave_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /leave_records/1
  # DELETE /leave_records/1.json
  def destroy
    @leave_record.destroy
    respond_to do |format|
      format.html { redirect_to leave_records_url, notice: 'Leave record was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_leave_record
    if params[:id]=='excel'
      @leave_record = LeaveRecord.find(params[:recoed])
      excel
    else
      @leave_record = LeaveRecord.find(params[:id])
    end

  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def leave_record_params
    params.require(:leave_record).permit(:staff_id, :from_date, :to_date, :apply_date, :reason, :leave_type, :state)
  end

  def convertLeaveType(type_num)
    result='Others'
    case type_num
    when '1'
      result='Annual Leave'
    when '2'
      result='Public Holiday'
    when '3'
      result='Compensatory Days'
    when '4'
      result='Sick Leave'
    when '5'
      result='Marriage Leave'
    when '6'
      result='Maternity Leave'
    when '7'
      result='Unpaid Leave'
    when '8'
      result='Study Leave'
    when '9'
      result='Others'
    else
    result='Others'
    end
  end

  def get_xml_str
    return %(
<?xml version="1.0"?>
<?mso-application progid="Excel.Sheet"?>
<Workbook xmlns="urn:schemas-microsoft-com:office:spreadsheet"
 xmlns:o="urn:schemas-microsoft-com:office:office"
 xmlns:x="urn:schemas-microsoft-com:office:excel"
 xmlns:dt="uuid:C2F41010-65B3-11d1-A29F-00AA00C14882"
 xmlns:ss="urn:schemas-microsoft-com:office:spreadsheet"
 xmlns:html="http://www.w3.org/TR/REC-html40">
 <DocumentProperties xmlns="urn:schemas-microsoft-com:office:office">
  <Author>Chee</Author>
  <LastAuthor>Yu Yong</LastAuthor>
  <LastPrinted>2017-01-03T10:06:39Z</LastPrinted>
  <Created>2003-01-08T16:16:33Z</Created>
  <LastSaved>2017-01-22T02:04:22Z</LastSaved>
  <Company>Home</Company>
  <Version>14.00</Version>
 </DocumentProperties>
 <CustomDocumentProperties xmlns="urn:schemas-microsoft-com:office:office">
  <KSOProductBuildVer dt:dt="string">2052-10.1.0.6065</KSOProductBuildVer>
 </CustomDocumentProperties>
 <OfficeDocumentSettings xmlns="urn:schemas-microsoft-com:office:office">
  <AllowPNG/>
 </OfficeDocumentSettings>
 <ExcelWorkbook xmlns="urn:schemas-microsoft-com:office:excel">
  <WindowHeight>7875</WindowHeight>
  <WindowWidth>20730</WindowWidth>
  <WindowTopX>0</WindowTopX>
  <WindowTopY>0</WindowTopY>
  <ProtectStructure>False</ProtectStructure>
  <ProtectWindows>False</ProtectWindows>
 </ExcelWorkbook>
 <Styles>
  <Style ss:ID="Default" ss:Name="Normal">
   <Alignment ss:Vertical="Bottom"/>
   <Borders/>
   <Font ss:FontName="Arial" x:Family="Swiss"/>
   <Interior/>
   <NumberFormat/>
   <Protection/>
  </Style>
  <Style ss:ID="s16">
   <Interior/>
  </Style>
  <Style ss:ID="s17">
   <Borders>
    <Border ss:Position="Left" ss:LineStyle="Continuous" ss:Weight="1"/>
    <Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1"/>
   </Borders>
   <Interior/>
  </Style>
  <Style ss:ID="s18">
   <Borders>
    <Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1"/>
   </Borders>
   <Interior/>
  </Style>
  <Style ss:ID="s19">
   <Borders>
    <Border ss:Position="Left" ss:LineStyle="Continuous" ss:Weight="1"/>
   </Borders>
   <Interior/>
  </Style>
  <Style ss:ID="s20">
   <Borders/>
   <Interior/>
  </Style>
  <Style ss:ID="s21">
   <Borders>
    <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="1"/>
    <Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1"/>
   </Borders>
   <Interior/>
  </Style>
  <Style ss:ID="s22">
   <Borders>
    <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="1"/>
    <Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1"/>
   </Borders>
   <Interior/>
   <NumberFormat ss:Format="[ENG][$-409]d\-mmm\-yy;@"/>
  </Style>
  <Style ss:ID="s23">
   <Alignment ss:Horizontal="Right" ss:Vertical="Bottom"/>
   <Borders>
    <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="1"/>
   </Borders>
   <Interior/>
   <NumberFormat ss:Format="[ENG][$-409]d\-mmm\-yy;@"/>
  </Style>
  <Style ss:ID="s24">
   <Borders>
    <Border ss:Position="Left" ss:LineStyle="Continuous" ss:Weight="1"/>
   </Borders>
   <Font ss:FontName="Arial" x:Family="Swiss" ss:Bold="1"/>
   <Interior/>
  </Style>
  <Style ss:ID="s25">
   <Borders>
    <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="1"/>
   </Borders>
   <Interior/>
  </Style>
  <Style ss:ID="s26">
   <Borders>
    <Border ss:Position="Left" ss:LineStyle="Continuous" ss:Weight="1"/>
   </Borders>
   <Font ss:FontName="Arial" x:Family="Swiss" ss:Bold="1" ss:Italic="1"/>
   <Interior/>
  </Style>
  <Style ss:ID="s27">
   <Borders/>
   <Font ss:FontName="Monotype Corsiva" x:Family="Script" ss:Size="12"/>
   <Interior/>
  </Style>
  <Style ss:ID="s28">
   <Borders>
    <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="1"/>
    <Border ss:Position="Left" ss:LineStyle="Continuous" ss:Weight="1"/>
   </Borders>
   <Interior/>
  </Style>
  <Style ss:ID="s29">
   <Borders>
    <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="1"/>
   </Borders>
   <Interior/>
   <NumberFormat ss:Format="[ENG]d\-mmm"/>
  </Style>
  <Style ss:ID="s30">
   <Borders>
    <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="1"/>
   </Borders>
   <Interior/>
   <NumberFormat ss:Format="[ENG][$-409]d\-mmm\-yy;@"/>
  </Style>
  <Style ss:ID="s31">
   <Alignment ss:Horizontal="Left" ss:Vertical="Bottom"/>
   <Borders>
    <Border ss:Position="Left" ss:LineStyle="Continuous" ss:Weight="1"/>
    <Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1"/>
   </Borders>
   <Interior/>
  </Style>
  <Style ss:ID="s32">
   <Borders>
    <Border ss:Position="Right" ss:LineStyle="Continuous" ss:Weight="1"/>
    <Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1"/>
   </Borders>
   <Interior/>
  </Style>
  <Style ss:ID="s33">
   <Borders>
    <Border ss:Position="Right" ss:LineStyle="Continuous" ss:Weight="1"/>
   </Borders>
   <Interior/>
  </Style>
  <Style ss:ID="s34">
   <Borders>
    <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="1"/>
    <Border ss:Position="Right" ss:LineStyle="Continuous" ss:Weight="1"/>
   </Borders>
   <Interior/>
  </Style>
  <Style ss:ID="s35">
   <Borders>
    <Border ss:Position="Left" ss:LineStyle="Continuous" ss:Weight="1"/>
   </Borders>
   <Font ss:FontName="Arial" x:Family="Swiss" ss:Underline="Single"/>
   <Interior/>
  </Style>
  <Style ss:ID="s36">
   <Borders/>
   <Font ss:FontName="Arial" x:Family="Swiss" ss:Underline="Single"/>
   <Interior/>
  </Style>
  <Style ss:ID="s37">
   <Borders>
    <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="1"/>
   </Borders>
   <Font ss:FontName="Arial" x:Family="Swiss" ss:Underline="Single"/>
   <Interior/>
  </Style>
  <Style ss:ID="s38">
   <Borders>
    <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="1"/>
   </Borders>
   <Font ss:FontName="Arial" x:Family="Swiss"/>
   <Interior/>
  </Style>
  <Style ss:ID="s39">
   <Borders/>
   <Font ss:FontName="Arial" x:Family="Swiss"/>
   <Interior/>
  </Style>
  <Style ss:ID="s40">
   <Borders>
    <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="1"/>
    <Border ss:Position="Right" ss:LineStyle="Continuous" ss:Weight="1"/>
    <Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1"/>
   </Borders>
   <Interior/>
  </Style>
  <Style ss:ID="s41">
   <Alignment ss:Horizontal="Left" ss:Vertical="Bottom"/>
   <Borders>
    <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="1"/>
    <Border ss:Position="Right" ss:LineStyle="Continuous" ss:Weight="1"/>
    <Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1"/>
   </Borders>
   <Interior/>
   <NumberFormat ss:Format="Medium Date"/>
  </Style>
  <Style ss:ID="s42">
   <Borders>
    <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="1"/>
    <Border ss:Position="Right" ss:LineStyle="Continuous" ss:Weight="1"/>
   </Borders>
   <Interior/>
   <NumberFormat ss:Format="[ENG][$-409]d\-mmm\-yy;@"/>
  </Style>
  <Style ss:ID="s43">
   <Borders>
    <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="1"/>
    <Border ss:Position="Right" ss:LineStyle="Continuous" ss:Weight="1"/>
    <Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1"/>
   </Borders>
   <Interior/>
   <NumberFormat ss:Format="[ENG][$-409]d\-mmm\-yy;@"/>
  </Style>
  <Style ss:ID="s44">
   <Alignment ss:Horizontal="Left" ss:Vertical="Bottom"/>
   <Borders>
    <Border ss:Position="Left" ss:LineStyle="Continuous" ss:Weight="1"/>
   </Borders>
   <Interior/>
  </Style>
  <Style ss:ID="s45">
   <Alignment ss:Horizontal="Center" ss:Vertical="Bottom"/>
   <Borders>
    <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="1"/>
   </Borders>
   <Interior/>
   <NumberFormat ss:Format="[ENG][$-409]d\-mmm\-yy;@"/>
  </Style>
  <Style ss:ID="s46">
   <Alignment ss:Horizontal="Right" ss:Vertical="Bottom"/>
   <Borders>
    <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="1"/>
    <Border ss:Position="Right" ss:LineStyle="Continuous" ss:Weight="1"/>
    <Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1"/>
   </Borders>
   <Interior/>
   <NumberFormat ss:Format="Medium Date"/>
  </Style>
  <Style ss:ID="s47">
   <Alignment ss:Horizontal="Center" ss:Vertical="Bottom"/>
   <Borders>
    <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="1"/>
    <Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1"/>
   </Borders>
   <Font ss:FontName="Arial Unicode MS" x:CharSet="134" x:Family="Swiss"/>
   <Interior/>
  </Style>
  <Style ss:ID="s48">
   <Alignment ss:Horizontal="Center" ss:Vertical="Bottom"/>
   <Borders>
    <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="1"/>
    <Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1"/>
   </Borders>
   <Interior/>
  </Style>
  <Style ss:ID="s49">
   <Alignment ss:Horizontal="Center" ss:Vertical="Bottom"/>
   <Borders>
    <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="1"/>
    <Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1"/>
   </Borders>
   <Interior/>
   <NumberFormat ss:Format="[ENG][$-409]d\-mmm\-yy;@"/>
  </Style>
  <Style ss:ID="s50">
   <Alignment ss:Horizontal="Center" ss:Vertical="Bottom"/>
   <Borders>
    <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="1"/>
    <Border ss:Position="Right" ss:LineStyle="Continuous" ss:Weight="1"/>
    <Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1"/>
   </Borders>
   <Interior/>
  </Style>
  <Style ss:ID="s51">
   <Borders/>
   <Font ss:FontName="Arial" x:Family="Swiss" ss:Color="#FF0000"/>
   <Interior/>
  </Style>
  <Style ss:ID="s52">
   <Alignment ss:Horizontal="Left" ss:Vertical="Bottom"/>
   <Borders>
    <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="1"/>
   </Borders>
   <Interior/>
  </Style>
  <Style ss:ID="s55">
   <Alignment ss:Horizontal="Center" ss:Vertical="Bottom" ss:WrapText="1"/>
   <Font ss:FontName="Bookman Old Style" x:Family="Roman" ss:Size="14" ss:Bold="1"/>
   <Interior/>
  </Style>
 </Styles>
 <Worksheet ss:Name="Leaving">
  <Names>
   <NamedRange ss:Name="Print_Area" ss:RefersTo="=Leaving!R1C1:R57C10"/>
  </Names>
  <Table ss:ExpandedColumnCount="11" ss:ExpandedRowCount="65" x:FullColumns="1"
   x:FullRows="1" ss:StyleID="s16">
   <Column ss:StyleID="s16" ss:AutoFitWidth="0" ss:Width="13.5"/>
   <Column ss:StyleID="s16" ss:AutoFitWidth="0" ss:Width="86.25"/>
   <Column ss:StyleID="s16" ss:AutoFitWidth="0" ss:Width="58.5"/>
   <Column ss:StyleID="s16" ss:AutoFitWidth="0" ss:Width="93.75"/>
   <Column ss:StyleID="s16" ss:AutoFitWidth="0" ss:Width="72.75"/>
   <Column ss:StyleID="s16" ss:AutoFitWidth="0" ss:Width="40.5"/>
   <Column ss:StyleID="s16" ss:AutoFitWidth="0" ss:Width="50.25"/>
   <Column ss:StyleID="s16" ss:AutoFitWidth="0" ss:Width="62.25"/>
   <Column ss:StyleID="s16" ss:AutoFitWidth="0" ss:Width="83.25"/>
   <Column ss:StyleID="s16" ss:AutoFitWidth="0" ss:Width="64.5"/>
   <Row ss:AutoFitHeight="0" ss:Height="49.5"/>
   <Row ss:AutoFitHeight="0" ss:Height="24.75">
    <Cell ss:Index="2" ss:MergeAcross="8" ss:StyleID="s55"><ss:Data
      ss:Type="String" xmlns="http://www.w3.org/TR/REC-html40"><B>Leave Application Form<Font
        html:Face="Arial" x:Family="Swiss"> </Font><Font html:Face="宋体"
        x:CharSet="134">请假申请</Font></B></ss:Data><NamedCell ss:Name="Print_Area"/></Cell>
   </Row>
   <Row ss:Height="15">
    <Cell ss:Index="2" ss:StyleID="s17"><Data ss:Type="String">Chinese Name:</Data><NamedCell
      ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s18"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s18"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s47"><Data ss:Type="String">余勇</Data><NamedCell
      ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s18"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s18"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s18"><Data ss:Type="String">Division/Department:</Data><NamedCell
      ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s18"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s50"><Data ss:Type="String">R&amp;D</Data><NamedCell
      ss:Name="Print_Area"/></Cell>
   </Row>
   <Row>
    <Cell ss:Index="2" ss:StyleID="s19"><Data ss:Type="String">English Name:</Data><NamedCell
      ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s48"><Data ss:Type="String">Yu Yong</Data><NamedCell
      ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><Data ss:Type="String">Employee Number:</Data><NamedCell
      ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s40"><NamedCell ss:Name="Print_Area"/></Cell>
   </Row>
   <Row>
    <Cell ss:Index="2" ss:StyleID="s19"><Data ss:Type="String">Position:</Data><NamedCell
      ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s49"><Data ss:Type="String">Software  Engineer </Data><NamedCell
      ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><Data ss:Type="String">Date of Employment:</Data><NamedCell
      ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s41"><NamedCell ss:Name="Print_Area"/></Cell>
   </Row>
   <Row>
    <Cell ss:Index="2" ss:StyleID="s19"><Data ss:Type="String">Date of Application:</Data><NamedCell
      ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s45"><Data ss:Type="String">1/22/2017</Data><NamedCell
      ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s33"><NamedCell ss:Name="Print_Area"/></Cell>
   </Row>
   <Row>
    <Cell ss:Index="2" ss:StyleID="s19"><Data ss:Type="String">Start Date:</Data><NamedCell
      ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s23"><ss:Data ss:Type="String"
      xmlns="http://www.w3.org/TR/REC-html40">1/25/2017   9<Font html:Face="宋体"
       x:CharSet="134">：</Font><Font>00</Font></ss:Data><NamedCell
      ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><Data ss:Type="String">Return to work on:</Data><NamedCell
      ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s46"><ss:Data ss:Type="String"
      xmlns="http://www.w3.org/TR/REC-html40">1/25/2017 13<Font html:Face="宋体"
       x:CharSet="134">：</Font><Font>00</Font></ss:Data><NamedCell
      ss:Name="Print_Area"/></Cell>
   </Row>
   <Row>
    <Cell ss:Index="2" ss:StyleID="s19"><Data ss:Type="String">End Date:</Data><NamedCell
      ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:Index="5" ss:StyleID="s23"><ss:Data ss:Type="String"
      xmlns="http://www.w3.org/TR/REC-html40">1/25/2017 12<Font html:Face="宋体"
       x:CharSet="134">：</Font><Font>00</Font></ss:Data><NamedCell
      ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s33"><NamedCell ss:Name="Print_Area"/></Cell>
   </Row>
   <Row>
    <Cell ss:Index="2" ss:StyleID="s19"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s51"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s33"><NamedCell ss:Name="Print_Area"/></Cell>
   </Row>
   <Row>
    <Cell ss:Index="2" ss:StyleID="s19"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s33"><NamedCell ss:Name="Print_Area"/></Cell>
   </Row>
   <Row>
    <Cell ss:Index="2" ss:StyleID="s24"><Data ss:Type="String">Breakdown of leave is as follows:</Data><NamedCell
      ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s33"><NamedCell ss:Name="Print_Area"/></Cell>
   </Row>
   <Row>
    <Cell ss:Index="2" ss:StyleID="s19"><Data ss:Type="String">Annual Leave:</Data><NamedCell
      ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s51"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:Index="6" ss:StyleID="s20"><Data ss:Type="String">day(s)</Data><NamedCell
      ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><Data ss:Type="String">exact date(s)</Data><NamedCell
      ss:Name="Print_Area"/></Cell>
    <Cell ss:Index="10" ss:StyleID="s42"><NamedCell ss:Name="Print_Area"/></Cell>
   </Row>
   <Row>
    <Cell ss:Index="2" ss:StyleID="s19"><Data ss:Type="String">Public Holiday:</Data><NamedCell
      ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s21"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><Data ss:Type="String">day(s)</Data><NamedCell
      ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><Data ss:Type="String">exact date(s)</Data><NamedCell
      ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s22"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s43"><NamedCell ss:Name="Print_Area"/></Cell>
   </Row>
   <Row>
    <Cell ss:Index="2" ss:StyleID="s19"><Data ss:Type="String">Compensatory Days:</Data><NamedCell
      ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s52"><Data ss:Type="String">(3 Hours) 0.375</Data><NamedCell
      ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><Data ss:Type="String">day(s)</Data><NamedCell
      ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><Data ss:Type="String">for working on </Data><NamedCell
      ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s22"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s43"><NamedCell ss:Name="Print_Area"/></Cell>
   </Row>
   <Row>
    <Cell ss:Index="2" ss:StyleID="s19"><Data ss:Type="String">Sick Leave:</Data><NamedCell
      ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s25"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><Data ss:Type="String">day(s)</Data><NamedCell
      ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><Data ss:Type="String">exact date(s)</Data><NamedCell
      ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s30"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s43"><NamedCell ss:Name="Print_Area"/></Cell>
   </Row>
   <Row>
    <Cell ss:Index="2" ss:StyleID="s19"><Data ss:Type="String">Marriage Leave:</Data><NamedCell
      ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s21"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><Data ss:Type="String">day(s)</Data><NamedCell
      ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><Data ss:Type="String">exact date(s)</Data><NamedCell
      ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s22"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s43"><NamedCell ss:Name="Print_Area"/></Cell>
   </Row>
   <Row>
    <Cell ss:Index="2" ss:StyleID="s19"><Data ss:Type="String">Maternity Leave:</Data><NamedCell
      ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s21"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><Data ss:Type="String">day(s)</Data><NamedCell
      ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><Data ss:Type="String">exact date(s)</Data><NamedCell
      ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s22"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s43"><NamedCell ss:Name="Print_Area"/></Cell>
   </Row>
   <Row ss:Hidden="1">
    <Cell ss:Index="2" ss:StyleID="s19"><Data ss:Type="String">Study Leave:</Data><NamedCell
      ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s21"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><Data ss:Type="String">day(s)</Data><NamedCell
      ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><Data ss:Type="String">exact date(s)</Data><NamedCell
      ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s22"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s43"><NamedCell ss:Name="Print_Area"/></Cell>
   </Row>
   <Row>
    <Cell ss:Index="2" ss:StyleID="s19"><Data ss:Type="String">Unpaid Leave:</Data><NamedCell
      ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s21"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><Data ss:Type="String">day(s)</Data><NamedCell
      ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><Data ss:Type="String">exact date(s)</Data><NamedCell
      ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s30"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s43"><NamedCell ss:Name="Print_Area"/></Cell>
   </Row>
   <Row>
    <Cell ss:Index="2" ss:StyleID="s19"><Data ss:Type="String">Study Leave:</Data><NamedCell
      ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s21"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><Data ss:Type="String">day(s)</Data><NamedCell
      ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><Data ss:Type="String">exact date(s)</Data><NamedCell
      ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s30"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s43"><NamedCell ss:Name="Print_Area"/></Cell>
   </Row>
   <Row>
    <Cell ss:Index="2" ss:StyleID="s19"><Data ss:Type="String">Others: </Data><NamedCell
      ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s21"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><Data ss:Type="String">day(s)</Data><NamedCell
      ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><Data ss:Type="String">exact date(s)</Data><NamedCell
      ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s30"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s43"><NamedCell ss:Name="Print_Area"/></Cell>
   </Row>
   <Row>
    <Cell ss:Index="2" ss:StyleID="s26"><Data ss:Type="String">Total</Data><NamedCell
      ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s51"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s48"><Data ss:Type="String">(3 Hours) 0.375</Data><NamedCell
      ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><Data ss:Type="String">day(s)</Data><NamedCell
      ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s33"><NamedCell ss:Name="Print_Area"/></Cell>
   </Row>
   <Row>
    <Cell ss:Index="2" ss:StyleID="s19"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s21"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s33"><NamedCell ss:Name="Print_Area"/></Cell>
   </Row>
   <Row>
    <Cell ss:Index="2" ss:StyleID="s17"><Data ss:Type="String">1.Sign by applicant:</Data><NamedCell
      ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s18"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s18"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s18"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s18"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s17"><Data ss:Type="String">2.Approved by immediate supervisor/Department Head</Data><NamedCell
      ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s18"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s18"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s32"><NamedCell ss:Name="Print_Area"/></Cell>
   </Row>
   <Row>
    <Cell ss:Index="2" ss:StyleID="s19"><Data ss:Type="String">( Same to your ID or passport)</Data><NamedCell
      ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s19"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s33"><NamedCell ss:Name="Print_Area"/></Cell>
   </Row>
   <Row ss:Height="15.75">
    <Cell ss:Index="2" ss:StyleID="s19"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s27"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s27"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s27"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s19"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s33"><NamedCell ss:Name="Print_Area"/></Cell>
   </Row>
   <Row>
    <Cell ss:Index="2" ss:StyleID="s19"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s19"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s33"><NamedCell ss:Name="Print_Area"/></Cell>
   </Row>
   <Row>
    <Cell ss:Index="2" ss:StyleID="s28"><Data ss:Type="String">Date: </Data><NamedCell
      ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s25"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s29"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s30"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s25"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s28"><Data ss:Type="String">Date:</Data><NamedCell
      ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s25"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s25"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s34"><NamedCell ss:Name="Print_Area"/></Cell>
   </Row>
   <Row>
    <Cell ss:Index="2" ss:StyleID="s31"><Data ss:Type="String">3. Human Resources:</Data><NamedCell
      ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s18"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s18"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s18"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s32"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s31"><Data ss:Type="String">4. Approved by Parterns/Senior Partners</Data><NamedCell
      ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s18"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s18"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s32"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s44"/>
   </Row>
   <Row>
    <Cell ss:Index="2" ss:StyleID="s19"><Data ss:Type="String">(To verify eligibility)</Data><NamedCell
      ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s33"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s19"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s33"><NamedCell ss:Name="Print_Area"/></Cell>
   </Row>
   <Row>
    <Cell ss:Index="2" ss:StyleID="s19"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s33"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s33"><NamedCell ss:Name="Print_Area"/></Cell>
   </Row>
   <Row>
    <Cell ss:Index="2" ss:StyleID="s19"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s33"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s33"><NamedCell ss:Name="Print_Area"/></Cell>
   </Row>
   <Row>
    <Cell ss:Index="2" ss:StyleID="s28"><Data ss:Type="String">Date:</Data><NamedCell
      ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s25"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s25"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s25"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s34"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s25"><Data ss:Type="String">Date:</Data><NamedCell
      ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s25"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s25"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s34"><NamedCell ss:Name="Print_Area"/></Cell>
   </Row>
   <Row>
    <Cell ss:Index="2" ss:StyleID="s28"><Data ss:Type="String">If Leave is not approved by Supervisor, state reasons:</Data><NamedCell
      ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s25"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s25"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s25"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s25"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s25"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s25"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s25"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s34"><NamedCell ss:Name="Print_Area"/></Cell>
   </Row>
   <Row>
    <Cell ss:Index="2" ss:StyleID="s17"><Data ss:Type="String">In case of emergency, I can be contacted at:</Data><NamedCell
      ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s18"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s18"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s18"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s18"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s18"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s18"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s18"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s32"><NamedCell ss:Name="Print_Area"/></Cell>
   </Row>
   <Row>
    <Cell ss:Index="2" ss:StyleID="s19"><Data ss:Type="String">Tel:</Data><NamedCell
      ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s25"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s25"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s25"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><Data ss:Type="String">Address:</Data><NamedCell
      ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s25"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s25"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s25"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s34"><NamedCell ss:Name="Print_Area"/></Cell>
   </Row>
   <Row>
    <Cell ss:Index="2" ss:StyleID="s28"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s25"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s25"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s25"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s25"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s25"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s25"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s25"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s34"><NamedCell ss:Name="Print_Area"/></Cell>
   </Row>
   <Row>
    <Cell ss:Index="2" ss:StyleID="s19"><Data ss:Type="String">(For Human Resources Office Use Only)</Data><NamedCell
      ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s33"><NamedCell ss:Name="Print_Area"/></Cell>
   </Row>
   <Row>
    <Cell ss:Index="2" ss:StyleID="s19"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s33"><NamedCell ss:Name="Print_Area"/></Cell>
   </Row>
   <Row>
    <Cell ss:Index="2" ss:StyleID="s35"><Data ss:Type="String">Leave Record</Data><NamedCell
      ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s36"><Data ss:Type="String">Annual Leave Days</Data><NamedCell
      ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s36"><Data ss:Type="String">Compensatory Leave</Data><NamedCell
      ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s36"><Data ss:Type="String">Total Days</Data><NamedCell
      ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s33"><NamedCell ss:Name="Print_Area"/></Cell>
   </Row>
   <Row>
    <Cell ss:Index="2" ss:StyleID="s19"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s33"><NamedCell ss:Name="Print_Area"/></Cell>
   </Row>
   <Row>
    <Cell ss:Index="2" ss:StyleID="s19"><Data ss:Type="String">Leave B/F:</Data><NamedCell
      ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s37"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s25"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s25"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s33"><NamedCell ss:Name="Print_Area"/></Cell>
   </Row>
   <Row>
    <Cell ss:Index="2" ss:StyleID="s19"><Data ss:Type="String">Leave accrued this year:</Data><NamedCell
      ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s33"><NamedCell ss:Name="Print_Area"/></Cell>
   </Row>
   <Row>
    <Cell ss:Index="2" ss:StyleID="s19"><Data ss:Type="String">Total entitlement YTD 31Dec12:</Data><NamedCell
      ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s21"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s21"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s21"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s33"><NamedCell ss:Name="Print_Area"/></Cell>
   </Row>
   <Row>
    <Cell ss:Index="2" ss:StyleID="s19"><Data ss:Type="String">Less leave already taken:</Data><NamedCell
      ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s21"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s21"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s21"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s33"><NamedCell ss:Name="Print_Area"/></Cell>
   </Row>
   <Row>
    <Cell ss:Index="2" ss:StyleID="s19"><Data ss:Type="String">Leave balance:</Data><NamedCell
      ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s21"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s21"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s21"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s33"><NamedCell ss:Name="Print_Area"/></Cell>
   </Row>
   <Row>
    <Cell ss:Index="2" ss:StyleID="s19"><Data ss:Type="String">Less this leave request:</Data><NamedCell
      ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s33"><NamedCell ss:Name="Print_Area"/></Cell>
   </Row>
   <Row>
    <Cell ss:Index="2" ss:StyleID="s19"><Data ss:Type="String">*Leave Remaining: </Data><NamedCell
      ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s21"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s21"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s21"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s33"><NamedCell ss:Name="Print_Area"/></Cell>
   </Row>
   <Row>
    <Cell ss:Index="2" ss:StyleID="s19"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s33"><NamedCell ss:Name="Print_Area"/></Cell>
   </Row>
   <Row>
    <Cell ss:Index="2" ss:StyleID="s19"><Data ss:Type="String">Check by:</Data><NamedCell
      ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s25"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s38"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s36"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s39"><Data ss:Type="String">Date: </Data><NamedCell
      ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s37"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s37"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s37"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s33"><NamedCell ss:Name="Print_Area"/></Cell>
   </Row>
   <Row>
    <Cell ss:Index="2" ss:StyleID="s19"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s33"><NamedCell ss:Name="Print_Area"/></Cell>
   </Row>
   <Row>
    <Cell ss:Index="2" ss:StyleID="s28"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s25"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s25"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s25"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s25"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s25"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s25"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s25"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s34"><NamedCell ss:Name="Print_Area"/></Cell>
   </Row>
   <Row>
    <Cell ss:Index="2" ss:StyleID="s17"><Data ss:Type="String">Process:</Data><NamedCell
      ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s18"><Data ss:Type="String">1.Employee completes form</Data><NamedCell
      ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s18"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s18"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s18"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><Data ss:Type="String">5. Approved by Partners if required</Data><NamedCell
      ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s18"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s18"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s32"><NamedCell ss:Name="Print_Area"/></Cell>
   </Row>
   <Row>
    <Cell ss:Index="2" ss:StyleID="s19"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><Data ss:Type="String">2.Immediate supervisor approve/rejects</Data><NamedCell
      ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><Data ss:Type="String">6. HR notify Employee</Data><NamedCell
      ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s33"><NamedCell ss:Name="Print_Area"/></Cell>
   </Row>
   <Row>
    <Cell ss:Index="2" ss:StyleID="s19"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><Data ss:Type="String">3.Department/ Division head's comment</Data><NamedCell
      ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><Data ss:Type="String">7. HR filing</Data><NamedCell
      ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s20"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s33"><NamedCell ss:Name="Print_Area"/></Cell>
   </Row>
   <Row>
    <Cell ss:Index="2" ss:StyleID="s28"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s25"><Data ss:Type="String">4.HR verify eligibility</Data><NamedCell
      ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s25"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s25"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s25"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s25"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s25"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s25"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s34"><NamedCell ss:Name="Print_Area"/></Cell>
   </Row>
   <Row>
    <Cell ss:Index="2" ss:StyleID="s18"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s18"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s18"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s18"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s18"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s18"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s18"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s18"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s18"><NamedCell ss:Name="Print_Area"/></Cell>
   </Row>
   <Row>
    <Cell ss:Index="2" ss:StyleID="s20"/>
    <Cell ss:StyleID="s20"/>
    <Cell ss:StyleID="s20"/>
    <Cell ss:StyleID="s20"/>
    <Cell ss:StyleID="s20"/>
    <Cell ss:StyleID="s20"/>
    <Cell ss:StyleID="s20"/>
    <Cell ss:StyleID="s20"/>
    <Cell ss:StyleID="s20"/>
   </Row>
   <Row>
    <Cell ss:Index="2" ss:StyleID="s20"/>
    <Cell ss:StyleID="s20"/>
    <Cell ss:StyleID="s20"/>
    <Cell ss:StyleID="s20"/>
    <Cell ss:StyleID="s20"/>
    <Cell ss:StyleID="s20"/>
    <Cell ss:StyleID="s20"/>
    <Cell ss:StyleID="s20"/>
    <Cell ss:StyleID="s20"/>
   </Row>
   <Row>
    <Cell ss:Index="2" ss:StyleID="s20"/>
    <Cell ss:StyleID="s20"/>
    <Cell ss:StyleID="s20"/>
    <Cell ss:StyleID="s20"/>
    <Cell ss:StyleID="s20"/>
    <Cell ss:StyleID="s20"/>
    <Cell ss:StyleID="s20"/>
    <Cell ss:StyleID="s20"/>
    <Cell ss:StyleID="s20"/>
   </Row>
   <Row>
    <Cell ss:Index="2" ss:StyleID="s20"/>
    <Cell ss:StyleID="s20"/>
    <Cell ss:StyleID="s20"/>
    <Cell ss:StyleID="s20"/>
    <Cell ss:StyleID="s20"/>
    <Cell ss:StyleID="s20"/>
    <Cell ss:StyleID="s20"/>
    <Cell ss:StyleID="s20"/>
    <Cell ss:StyleID="s20"/>
   </Row>
   <Row>
    <Cell ss:Index="2" ss:StyleID="s20"/>
    <Cell ss:StyleID="s20"/>
    <Cell ss:StyleID="s20"/>
    <Cell ss:StyleID="s20"/>
    <Cell ss:StyleID="s20"/>
    <Cell ss:StyleID="s20"/>
    <Cell ss:StyleID="s20"/>
    <Cell ss:StyleID="s20"/>
    <Cell ss:StyleID="s20"/>
   </Row>
   <Row>
    <Cell ss:Index="2" ss:StyleID="s20"/>
    <Cell ss:StyleID="s20"/>
    <Cell ss:StyleID="s20"/>
    <Cell ss:StyleID="s20"/>
    <Cell ss:StyleID="s20"/>
    <Cell ss:StyleID="s20"/>
    <Cell ss:StyleID="s20"/>
    <Cell ss:StyleID="s20"/>
    <Cell ss:StyleID="s20"/>
   </Row>
   <Row>
    <Cell ss:Index="2" ss:StyleID="s20"/>
    <Cell ss:StyleID="s20"/>
    <Cell ss:StyleID="s20"/>
    <Cell ss:StyleID="s20"/>
    <Cell ss:StyleID="s20"/>
    <Cell ss:StyleID="s20"/>
    <Cell ss:StyleID="s20"/>
    <Cell ss:StyleID="s20"/>
    <Cell ss:StyleID="s20"/>
   </Row>
   <Row>
    <Cell ss:Index="2" ss:StyleID="s20"/>
    <Cell ss:StyleID="s20"/>
    <Cell ss:StyleID="s20"/>
    <Cell ss:StyleID="s20"/>
    <Cell ss:StyleID="s20"/>
    <Cell ss:StyleID="s20"/>
    <Cell ss:StyleID="s20"/>
    <Cell ss:StyleID="s20"/>
    <Cell ss:StyleID="s20"/>
   </Row>
  </Table>
  <WorksheetOptions xmlns="urn:schemas-microsoft-com:office:excel">
   <PageSetup>
    <Layout x:CenterHorizontal="1" x:CenterVertical="1"/>
    <Header x:Margin="0.24"/>
    <Footer x:Margin="0.17"/>
    <PageMargins x:Bottom="0.24" x:Left="0.36" x:Right="0.37" x:Top="0.2"/>
   </PageSetup>
   <FitToPage/>
   <Print>
    <ValidPrinterInfo/>
    <PaperSizeIndex>9</PaperSizeIndex>
    <Scale>82</Scale>
    <HorizontalResolution>600</HorizontalResolution>
    <VerticalResolution>600</VerticalResolution>
   </Print>
   <PageBreakZoom>90</PageBreakZoom>
   <Selected/>
   <DoNotDisplayGridlines/>
   <Panes>
    <Pane>
     <Number>3</Number>
     <ActiveRow>11</ActiveRow>
     <ActiveCol>11</ActiveCol>
    </Pane>
   </Panes>
   <ProtectObjects>False</ProtectObjects>
   <ProtectScenarios>False</ProtectScenarios>
  </WorksheetOptions>
 </Worksheet>
</Workbook>

    )
  end
end
