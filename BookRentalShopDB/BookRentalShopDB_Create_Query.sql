USE [master]
GO
/****** Object:  Database [BookRentalShopDB]    Script Date: 21-02-17-수 오후 5:21:42 ******/
CREATE DATABASE [BookRentalShopDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BookRentalShopDB', FILENAME = N'D:\Data\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\BookRentalShopDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BookRentalShopDB_log', FILENAME = N'D:\Data\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\BookRentalShopDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [BookRentalShopDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BookRentalShopDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BookRentalShopDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BookRentalShopDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BookRentalShopDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BookRentalShopDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BookRentalShopDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [BookRentalShopDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BookRentalShopDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BookRentalShopDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BookRentalShopDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BookRentalShopDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BookRentalShopDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BookRentalShopDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BookRentalShopDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BookRentalShopDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BookRentalShopDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BookRentalShopDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BookRentalShopDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BookRentalShopDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BookRentalShopDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BookRentalShopDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BookRentalShopDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BookRentalShopDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BookRentalShopDB] SET RECOVERY FULL 
GO
ALTER DATABASE [BookRentalShopDB] SET  MULTI_USER 
GO
ALTER DATABASE [BookRentalShopDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BookRentalShopDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BookRentalShopDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BookRentalShopDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BookRentalShopDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BookRentalShopDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'BookRentalShopDB', N'ON'
GO
ALTER DATABASE [BookRentalShopDB] SET QUERY_STORE = OFF
GO
USE [BookRentalShopDB]
GO
/****** Object:  UserDefinedFunction [dbo].[ufn_getlevel]    Script Date: 21-02-17-수 오후 5:21:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   function [dbo].[ufn_getlevel](@levels char(1))
	returns nvarchar(5)
as
begin
declare @result nvarchar(5); -- 골드회원, 실버회원, 브론즈회원, 철회원 등 변수
		set @result = case @levels
			when 'A' then '골드회원'
			when 'B' then '실버회원'
			when 'C' then '브론즈회원'
			when 'D' then '철회원'
			when 'S' then '관리자'
			else '비회원'
			
	   end;
	 return @result;
	END
GO
/****** Object:  UserDefinedFunction [dbo].[ufn_getState]    Script Date: 21-02-17-수 오후 5:21:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   function [dbo].[ufn_getState](@rentalState char(1))
returns nvarchar(5) 
as 
begin
	declare @result nvarchar(5);  -- 대여중, 반납, 연체중, 분실 을 담는 변수
	set @result = case @rentalState
				when '1' then '대여중'
				when '2' then '반납'
				when '3' then '연체중'
				when '4' then '분실'
				else '미정'
			      end;
	return @result;
end
GO
/****** Object:  Table [dbo].[BooksTBL]    Script Date: 21-02-17-수 오후 5:21:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BooksTBL](
	[bookidx] [int] IDENTITY(1,1) NOT NULL,
	[cateidx] [varchar](8) NOT NULL,
	[bookName] [nvarchar](100) NOT NULL,
	[author] [nvarchar](100) NOT NULL,
	[interpreter] [nvarchar](100) NULL,
	[company] [nvarchar](100) NOT NULL,
	[releaseDate] [date] NOT NULL,
	[ISBN] [char](13) NULL,
	[price] [decimal](10, 0) NULL,
	[descriptions] [nvarchar](max) NULL,
	[regDate] [date] NULL,
 CONSTRAINT [PK_BooksTBL] PRIMARY KEY CLUSTERED 
(
	[bookidx] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cateTBL]    Script Date: 21-02-17-수 오후 5:21:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cateTBL](
	[cateidx] [varchar](8) NOT NULL,
	[cateName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_cateTBL] PRIMARY KEY CLUSTERED 
(
	[cateidx] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[memberTBL]    Script Date: 21-02-17-수 오후 5:21:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[memberTBL](
	[memberidx] [int] IDENTITY(1,1) NOT NULL,
	[memberName] [nvarchar](50) NOT NULL,
	[memberID] [varchar](20) NOT NULL,
	[password] [varchar](250) NOT NULL,
	[levels] [char](1) NOT NULL,
	[mobile] [varchar](20) NULL,
	[email] [varchar](50) NULL,
	[address] [nvarchar](150) NULL,
	[regDate] [date] NULL,
	[lastLoginDt] [datetime] NULL,
	[loginIpAddr] [varchar](15) NULL,
 CONSTRAINT [PK_memberTBL] PRIMARY KEY CLUSTERED 
(
	[memberidx] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RentalTBL]    Script Date: 21-02-17-수 오후 5:21:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RentalTBL](
	[RentalIdx] [int] NOT NULL,
	[memberIdx] [int] NULL,
	[bookIdx] [int] NULL,
	[rentalDt] [datetime] NULL,
	[returnDt] [datetime] NULL,
	[rentalState] [char](1) NOT NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[BooksTBL] ON 
GO
INSERT [dbo].[BooksTBL] ([bookidx], [cateidx], [bookName], [author], [interpreter], [company], [releaseDate], [ISBN], [price], [descriptions], [regDate]) VALUES (1, N'N0001', N'잔혹한 어머니의 날 1', N'넬레 노이하우스', N'김진아', N'북로드', CAST(N'2019-10-07' AS Date), N'9791158791179', CAST(12800 AS Decimal(10, 0)), N'10여 일이 지나 발견된 80대 독거노인의 죽음,

그리고 그의 집 마당에서 발견된 의문의 사람 뼈들……

진정 망자는 연쇄살인범일까, 아니면 연쇄살인의 또 다른 희생자일까?



『백설공주에게 죽음을』의 명성을 잇는 화제의 명품 스릴러



독일을 넘어 전 세계를 매혹시킨 유럽 미스터리의 여왕 넬레 노이하우스의 ‘타우누스 시리즈’ 아홉 번째 작품이자 최신작 『잔혹한 어머니의 날(전2권)』이 북로드에서 번역 출간됐다. 속편은 전편을 뛰어넘기 어렵다는 속설을 뒤엎고 신작을 발표할 때마다 내용과 구성 면에서 갈수록 진화하는 모습을 보여주고 있는 작가는 이번 신작에서도 강렬하고 파격적인 첫 장면부터 읽는 이에게 깊은 인상을 남기며 “넬레 노이하우스의 작품 중에서도 최고”, “처음부터 끝까지 흥미롭다!”, “벌써부터 후속작이 기다려진다” 등의 호평으로 이어졌다. 그리고 먼저 읽은 독자들의 입소문을 타고 출간 즉시 슈피겔 베스트셀러 1위, 독일 아마존 9주 연속 종합 베스트 1위에 머물며 화제를 모았다.



냉철하고 카리스마 넘치는 수사반장 보덴슈타인과 남다른 직관으로 사건을 풀어가는 감성 여형사 피아 산더는 신작 『잔혹한 어머니의 날』에서도 독일 헤센 주의 프랑크푸르트와 타우누스의 동화 같은 마을을 오가며 활약을 펼친다. 분권을 해야 할 만큼 방대한 분량이지만, 시리즈 전권보다 더욱 강력해진 서사의 힘은 결코 지루할 틈을 주지 않는다. 혹여 시리즈를 처음 접한다 해도 걱정할 것 없다. 작품 초반에 강력반 사람들과 지역 경찰에 대한 소개도 잊지 않았으니까. 타우누스 시리즈를 오랜만에 접한 독자라면 옛 기억을 생생하게 불러올 수 있을 것이고, 처음 접한 독자라도 귀족 출신의 영리하고 과묵한 수사반장 보덴슈타인과, 고참 형사가 되었음에도 종종 자신의 감정을 컨트롤하지 못하고 직관에 의존하는 피아 산더 형사를 오랫동안 기억하게 될 것이다.



기존에 타우누스 시리즈를 접해본 사람이라면 누구나 짐작하겠지만, 이번 작품 역시 범죄를 해결하는 과정에서 그 사회가 지닌 모순과, 그로 인해 파생되는 여러 문제들이 관철되고 있다. 80대 노인의 고독사, 아동 학대 등의 문제는 사회적 통제의 실패와 패륜이라는 화두와 절묘하게 결합되며 우리가 살아가는 사회에 대해 다시금 생각해볼 기회를 던진다. 악은 결코 선천적이거나 특별하지 않다. 친숙하고 인간적인 모습으로 우리 삶 곳곳에 침투되어 있다. 그런 악의 존재를 영리하고 노련하게 드러내고 있는 『잔혹한 어머니의 날』은 마지막 페이지를 덮는 순간 인간관계와 사회에 대한 통찰과 사색의 기회를 안겨줄 것이다.', CAST(N'2021-02-17' AS Date))
GO
INSERT [dbo].[BooksTBL] ([bookidx], [cateidx], [bookName], [author], [interpreter], [company], [releaseDate], [ISBN], [price], [descriptions], [regDate]) VALUES (2, N'N0003', N'마도조사 2', N'묵향동후', N'이현아', N'디앤씨미디어', CAST(N'2019-09-03' AS Date), N'9791127852122', CAST(14000 AS Decimal(10, 0)), N'남망기와 설양이 교전을 벌이는 사이

위무선은 세가 소년들을 이끌고

맹인 소녀의 망령이 두드리는 간대 소리를 따라간다.

그리고 그들이 도착한 곳에서 마주한 것은 효성진의 시신이었다.

‘명월청풍 효성진, 오설능상 송자침’

설양, 효성진, 송람, 세 사람의 안타까운 비극.

위무선은 망령의 기억에 스며드는 ''공정共情''을 통해

소녀의 망령에 들어가 의성에서 생긴 돌이킬 수 없는 사건의 전모를 본다.

시신을 파내고 설양을 데려간 도굴꾼은 누구인가?

위무선을 의성으로 이끈 자의 속셈은 또 무엇인가?

그리고……

위무선과 남망기가 애써 찾은 사지와 몸통,

머리 없는 시신 ‘우리 아우님’의 정체는……!', CAST(N'2021-02-17' AS Date))
GO
INSERT [dbo].[BooksTBL] ([bookidx], [cateidx], [bookName], [author], [interpreter], [company], [releaseDate], [ISBN], [price], [descriptions], [regDate]) VALUES (3, N'N0006', N'월드 오브 워크래프트 팝업북 한정판', N'블리자드 엔터테인먼트, 매튜 라인하트', N'유미지', N'제우미디어', CAST(N'2019-10-21' AS Date), N'9788959527779', CAST(58000 AS Decimal(10, 0)), N'스톰윈드, 오그리마에서 다자알로까지!

아제로스의 10개 대도시와 영웅들이 함께하는

<월드 오브 워크래프트> 15주년 한정판 팝업북

''월드 오브 워크래프트''의 15주년을 맞이해 팬들을 위한 소장용 한정판 도서 「월드 오브 워크래프트 팝업북」이 한글화되어 출간한다. 팝업북이란, 페이지를 펼치면 그림이 입체적으로 튀어나오도록 고안된 독특한 형태의 책이다. 이미 해외에서는 열혈 수집가들이 존재하는 인기 아이템이다. 「WOW 팝업북」은 <해리포터>, <왕좌의 게임> 팝업북으로 유명한 세계적 아티스트 ''메튜 라인하트''가 참여해 아제로스의 도시와 영웅들을 현실에 그대로 구현했다.

「WOW 팝업북」은 팬들이 직접 건국에 이바지한 오그리마와 스톰윈드, 전쟁의 상흔이 새겨진 로데론과 텔드랏실, 새로운 격전의 도화선이 될 쿨 티라스와 잔달라의 이국적인 수도 등 다양한 지역이 눈앞에 경이롭게 펼쳐진다. 뿐만 아니라, 이 밖에도 섬세하게 구현된 재미있는 오브젝트와 얼라이언스, 호드의 다양한 영웅들, 숨겨진 요소가 가득 포함되어 있다. 더불어 일반적인 페이지를 넘기는 형식에 더해, 각 장을 분리해 전체 책을 펼치게 되면 ''혼돈의 소용돌이''를 중심으로 마치 아제로스 전체 지도처럼 펼쳐놓을 수 있다.', CAST(N'2021-02-17' AS Date))
GO
INSERT [dbo].[BooksTBL] ([bookidx], [cateidx], [bookName], [author], [interpreter], [company], [releaseDate], [ISBN], [price], [descriptions], [regDate]) VALUES (5, N'N0005', N'루팡의 딸', N'오코제키 다이', N'최재호', N'북플라자', CAST(N'2019-09-25' AS Date), N'9788998274412', CAST(15000 AS Decimal(10, 0)), N'도둑 집안의 대부가 변사체로 발견되었다!

도둑 집안의 대부 이와오에게는 하나코라는 손녀딸이 있다. 하나코는 자신의 신분을 숨긴 채 경찰 집안의 장남 카즈마와 사귀고 있다. 그러던 어느 날 이와오가 괴한에 의해 피살되는 일이 발생하는데…. 상상치도 못할 범인의 정체는?', CAST(N'2021-02-17' AS Date))
GO
INSERT [dbo].[BooksTBL] ([bookidx], [cateidx], [bookName], [author], [interpreter], [company], [releaseDate], [ISBN], [price], [descriptions], [regDate]) VALUES (7, N'N0002', N'희란국 연가', N'김수지', NULL, N'필(FEEL)', CAST(N'2019-11-01' AS Date), N'9791131594100', CAST(14000 AS Decimal(10, 0)), N'소루 공주 먹으면 새 몸 얻어 사람이 될 수 있나니,희란국 요물들 공주를 두고 싸웠더라

희란국에는 요괴들이 사는 깊은 계곡이 있다.

그 아득한 골짜기로부터 들려오는 기묘한 노랫말의 주인공, 소루 공주.

기이하고 불길한 태생으로 왕실 사당에 유폐된 채 홀로 지내던 그녀는 어느 날,영웅 자현과 혼례를 치르게 된다.

희란국의 왕 가륜은 전쟁에서 혁혁한 공을 세워 오면 자신의 귀애하는 딸 가란 공주를 내어 주겠다는 약속을 저버리고 자현을 천덕꾸러기 신세인 소루와 결혼시킨다.

그에 화풀이하듯 아내를 괄대하는 자현. 하지만 그의 냉대에도 불구하고 소루는 남편을 사모하게 되고,

한편, 도성에는 가슴이 뚫린 채 죽은 참혹한 시체가 연이어 발견되는데…….', CAST(N'2021-02-17' AS Date))
GO
INSERT [dbo].[BooksTBL] ([bookidx], [cateidx], [bookName], [author], [interpreter], [company], [releaseDate], [ISBN], [price], [descriptions], [regDate]) VALUES (8, N'N0004', N'최후의 만찬', N'서철원', NULL, N'다산책방', CAST(N'2019-09-25' AS Date), N'9791130625843', CAST(15000 AS Decimal(10, 0)), N'제9회 혼불문학상 수상작
“같은 작가로서 시샘이 날 정도이다” _한승원(소설가·심사위원장)

제9회 혼불문학상 수상작 『최후의 만찬』이 출간됐다. 올해 혼불문학상 응모작은 총 263편이었고 예심을 통과한 작품은 총 6편이었다. 그중에 4편이 최종심에 올랐고 치열한 논의 끝에 신해년(1791년), 우리나라 최초의 순교자 윤지충과 권상연의 순교 장면으로 소설을 여는 『최후의 만찬』이 당선작으로 선정됐다. 심사위원장 한승원 소설가는 이 소설에 대해 “보기 드문 수작이다.” “나는 왜 이런 소설을 쓰지 못했을까, 시샘이 날 정도이다.” “다른 소설가들이 읽으면 깜짝 놀랄 작품이다.” 등의 극찬을 아끼지 않았다. 심사위원들은 “우리 문학에서 오랜만에 만나는 품격 높은 새로운 역사소설”이 탄생했다는 사실에 주목했으며 “오랜 철차탁마를 거친 깊은 내공의 소유자이며 절제된 시적 문장을 다루고 있다”고 평했다.

혼불문학상은 우리시대 대표소설 『혼불』의 작가, 최명희의 문학 정신을 기리기 위해 2011년에 제정되어, 1회 『난설헌』, 2회『프린세스 바리』, 3회 『홍도』, 4회 『비밀 정원』, 5회 『나라 없는 나라』, 6회 『고요한 밤의 눈』, 7회 『칼과 혀』, 8회 『독재자 리아민의 다른 삶』등이 수상작으로 결정되었다. 혼불문학상 수상작들은 한국소설에 새로운 방향성을 제시하며 독자들로부터 꾸준한 사랑과 깊은 신뢰를 받고 있다. 제9회 혼불문학상 심사위원으로는 한승원 소설가(심사위원장), 김양호 평론가, 김영현 소설가, 이경자 소설가, 이병천 소설가가 참여했다.', CAST(N'2021-02-17' AS Date))
GO
INSERT [dbo].[BooksTBL] ([bookidx], [cateidx], [bookName], [author], [interpreter], [company], [releaseDate], [ISBN], [price], [descriptions], [regDate]) VALUES (9, N'N0001', N'너도 곧 쉬게 될 거야', N'비프케 로렌츠', N'서유리', N'고요한숨', CAST(N'2019-09-18' AS Date), N'9791162834930', CAST(14000 AS Decimal(10, 0)), N'주어진 시간은 세 시간, 계속 사라지는 사람들

수수께끼를 풀지 않으면 나와 내 아이가 죽는다!

출산을 앞두고 함께 행복한 미래를 그리던 레나와 다니엘 부부. 그러던 어느 날 남편 다니엘이 사망한다. 레나와 다투고 차로 고속도로를 질주하다 마주 오던 차와 정면충돌해 즉사한 것이다. 레나는 커다란 고통과 죄책감, 외로움 속에서 딸 엠마를 출산한다. 자신의 마음을 돌볼 겨를도 없이 육아에 매이게 된 레나. 지친 레나가 잠깐 눈을 붙인 사이 누군가 집에 침입해 엠마를 납치한다. 다음과 같은 경고만을 남기고.

아무한테도 말하지 마.

말하면 네 딸은 죽어.

레나는 납치범이 딸을 해칠까봐 경찰에 신고하지 못하고 혼자 엠마를 찾아 나선다. 그러나 납치범의 자취에 접근할 때마다 점점 더 강도가 거세어지는 경고와 함께 딸의 사진이 날아들고, 주위 사람들이 하나둘 죽거나 사라진다. 마침내 레나가 찾아낸 단서는 모든 죽음들을 연결하는 섬뜩한 수수께끼로 이어지는데…….', CAST(N'2021-02-17' AS Date))
GO
INSERT [dbo].[BooksTBL] ([bookidx], [cateidx], [bookName], [author], [interpreter], [company], [releaseDate], [ISBN], [price], [descriptions], [regDate]) VALUES (10, N'N0006', N'반지의 제왕 1 반지 원정대, 60주년 완역', N'존 로널드 루엘 톨킨', NULL, N'아르테(arte)', CAST(N'2021-02-24' AS Date), N'9788950992460', CAST(42000 AS Decimal(10, 0)), NULL, CAST(N'2021-02-17' AS Date))
GO
INSERT [dbo].[BooksTBL] ([bookidx], [cateidx], [bookName], [author], [interpreter], [company], [releaseDate], [ISBN], [price], [descriptions], [regDate]) VALUES (11, N'N0006', N'호빗(50주년 완역 전면 개정판)', N'존 로널드 루엘 톨킨', N'이미애', N'아르테(arte)', CAST(N'2021-02-24' AS Date), N'9788950992521', CAST(32000 AS Decimal(10, 0)), N'무서운 용 ‘스마우그’에게 빼앗긴 동쪽의 ‘외로운 산’을 되찾기 위한 난쟁이들과 마법사 간달프의 여정. 평화로운 일상을 살아가던 골목쟁이네 빌보는 이들의 여정에 휘말리면서 위험천만한 모험을 시작하게 된다.

톨킨의 가운데땅 이야기의 서막을 알린 작품 『호빗』은 1937년 출간 이후 베스트셀러로 등극하며 세계적으로 1억 부 이상 판매되었다. 이후 『호빗』에 등장했던 신기한 반지는 『반지의 제왕』에서 암흑군주 사우론의 힘을 상징하는 반지가 되고, 가운데땅의 여러 종족들과 사우론의 악의 세력들은 운명을 건 전투를 시작하게 된다.

2021년 새롭게 출간된 『호빗』은 초판 발행 당시 톨킨이 직접 그려 넣은 일러스트 13점과 두 장의 지도를 함께 넣었고, 크리스토퍼 톨킨이 편집한 50주년 기념판을 반영, 전면 개정 완역하였다. 또한 『호빗』 출간을 회고하는 크리스토퍼 톨킨의 서문을 수록하여 국내 톨킨 독자들이 원작의 풍미를 맛볼 수 있도록 하였다.', CAST(N'2021-02-17' AS Date))
GO
INSERT [dbo].[BooksTBL] ([bookidx], [cateidx], [bookName], [author], [interpreter], [company], [releaseDate], [ISBN], [price], [descriptions], [regDate]) VALUES (12, N'N0002', N'선량한 죽음을 위하여', N'세르페', NULL, N'동아', CAST(N'2021-02-09' AS Date), N'9791163024521', CAST(12800 AS Decimal(10, 0)), N'나는 이 세계에 절망한 친구에게 살해당했다.

괜찮다고, 어떻게든 될 거라고, 내가 도와주겠다고, 다시 시작하자고.

몇 번이나 얘기했는데 친구는 결국 칼을 빼 들고 내 목을 쳤다.

“개자식.”

다시 눈을 떴을 땐 500년이라는 세월이 지나 있었다.

내가 사랑하던 모든 것들은 사라졌고,

이젠 더 이상 세상을 살아갈 의욕도, 이유도 없어져 버렸다.

“이제 행복하게 살아도 됩니다.”

그런데 우연처럼 내 삶에 나타난 한 남자가 햇살처럼 부드러운 위로를 건넸다.

“사람은, 누구나 그래도 됩니다.”

다니엘 대공의 호의가 가득한 손길과 선량한 파란색 눈동자는 다정했다.

문득 계속 살고 싶어질 정도로.

그리고,

“안녕, 내 사랑.”

500년 전 나의 기사였던 알렉세이 볼로딘.

어찌 된 일인지 여전히 살아 있는 그가 내 앞에 나타났다.

“이번에야말로 같이 죽게 해 줘.”

고통에 찬 녹색 빛 눈과 목소리로, 알렉세이 경은 함께 죽기를 간절히 청했다.

나는 삶과 죽음, 어느 것을 선택해야 할지.

- 유리, 너라면 뭐라고 말할까?', CAST(N'2021-02-17' AS Date))
GO
SET IDENTITY_INSERT [dbo].[BooksTBL] OFF
GO
INSERT [dbo].[cateTBL] ([cateidx], [cateName]) VALUES (N'N0001', N'공포/스릴러')
GO
INSERT [dbo].[cateTBL] ([cateidx], [cateName]) VALUES (N'N0002', N'로맨스')
GO
INSERT [dbo].[cateTBL] ([cateidx], [cateName]) VALUES (N'N0003', N'무협')
GO
INSERT [dbo].[cateTBL] ([cateidx], [cateName]) VALUES (N'N0004', N'전쟁/역사')
GO
INSERT [dbo].[cateTBL] ([cateidx], [cateName]) VALUES (N'N0005', N'추리')
GO
INSERT [dbo].[cateTBL] ([cateidx], [cateName]) VALUES (N'N0006', N'SF/판타지')
GO
SET IDENTITY_INSERT [dbo].[memberTBL] ON 
GO
INSERT [dbo].[memberTBL] ([memberidx], [memberName], [memberID], [password], [levels], [mobile], [email], [address], [regDate], [lastLoginDt], [loginIpAddr]) VALUES (1, N'김현수', N'nhsk0767', N'1234', N'B', N'01049420767', N'nhsk0767@gmail.com', N'부산진구 부암동', CAST(N'2021-02-17' AS Date), NULL, NULL)
GO
INSERT [dbo].[memberTBL] ([memberidx], [memberName], [memberID], [password], [levels], [mobile], [email], [address], [regDate], [lastLoginDt], [loginIpAddr]) VALUES (2, N'최연성', N'am3251', N'p@ssw0rd!', N'A', N'01039013464', N'am3251@naver.com', N'부산', CAST(N'2021-02-17' AS Date), NULL, NULL)
GO
INSERT [dbo].[memberTBL] ([memberidx], [memberName], [memberID], [password], [levels], [mobile], [email], [address], [regDate], [lastLoginDt], [loginIpAddr]) VALUES (3, N'성홍렬', N'ghd0276', N'1111', N'C', N'01077590276', N'ghd0276@naver.com', N'부산', CAST(N'2021-02-17' AS Date), NULL, NULL)
GO
INSERT [dbo].[memberTBL] ([memberidx], [memberName], [memberID], [password], [levels], [mobile], [email], [address], [regDate], [lastLoginDt], [loginIpAddr]) VALUES (4, N'박규민', N'guemin96', N'1111', N'D', N'01046329171', N'guemin12@naver.com', N'부산 해운대구 좌동 ', CAST(N'2021-02-17' AS Date), NULL, NULL)
GO
INSERT [dbo].[memberTBL] ([memberidx], [memberName], [memberID], [password], [levels], [mobile], [email], [address], [regDate], [lastLoginDt], [loginIpAddr]) VALUES (5, N'최현화', N'ieyeppo', N'안알랴줌', N'B', N'01039513150', N'ieyeppo@gmail.com', N'부산광역시 동래구', CAST(N'2021-02-17' AS Date), NULL, NULL)
GO
INSERT [dbo].[memberTBL] ([memberidx], [memberName], [memberID], [password], [levels], [mobile], [email], [address], [regDate], [lastLoginDt], [loginIpAddr]) VALUES (6, N'강동훈', N'noworry1', N'1111', N'A', N'01065609693', N'noworry1@naver.com', N'부산진구 당감동 백양순환로9', CAST(N'2021-02-17' AS Date), NULL, NULL)
GO
INSERT [dbo].[memberTBL] ([memberidx], [memberName], [memberID], [password], [levels], [mobile], [email], [address], [regDate], [lastLoginDt], [loginIpAddr]) VALUES (7, N'서동우', N'dw6642', N'1111', N'A', N'01049017846', N'dw6642@naver.com', N'부산시 사상구 괘법동', CAST(N'2021-02-17' AS Date), NULL, NULL)
GO
INSERT [dbo].[memberTBL] ([memberidx], [memberName], [memberID], [password], [levels], [mobile], [email], [address], [regDate], [lastLoginDt], [loginIpAddr]) VALUES (8, N'박성철', N'for', N'1111', N'C', N'01028741479', N'ochestra365@naver.com', N'부산', CAST(N'2021-02-17' AS Date), NULL, NULL)
GO
INSERT [dbo].[memberTBL] ([memberidx], [memberName], [memberID], [password], [levels], [mobile], [email], [address], [regDate], [lastLoginDt], [loginIpAddr]) VALUES (9, N'우준성', N'wnstjd4852', N'1111', N'D', N'01030921890', N'wnstjd4852@naver.com', N'부산', CAST(N'2021-02-17' AS Date), NULL, NULL)
GO
INSERT [dbo].[memberTBL] ([memberidx], [memberName], [memberID], [password], [levels], [mobile], [email], [address], [regDate], [lastLoginDt], [loginIpAddr]) VALUES (10, N'김구겸', N'kg4543', N'1111', N'D', N'01045438127', N'jyc351919@naver.com', N'부산진구 연지동', CAST(N'2021-02-17' AS Date), NULL, NULL)
GO
INSERT [dbo].[memberTBL] ([memberidx], [memberName], [memberID], [password], [levels], [mobile], [email], [address], [regDate], [lastLoginDt], [loginIpAddr]) VALUES (11, N'최재훈', N'jh', N'1111', N'C', N'01075699066', N'cjh930306@naver.com', N'부산', CAST(N'2021-02-17' AS Date), NULL, NULL)
GO
INSERT [dbo].[memberTBL] ([memberidx], [memberName], [memberID], [password], [levels], [mobile], [email], [address], [regDate], [lastLoginDt], [loginIpAddr]) VALUES (12, N'편상현', N'vustkdgus', N'1234', N'B', N'01026579460', N'vustkdgus@naver.com', N'부산광역시 북구 금곡대로228', CAST(N'2021-02-17' AS Date), NULL, NULL)
GO
INSERT [dbo].[memberTBL] ([memberidx], [memberName], [memberID], [password], [levels], [mobile], [email], [address], [regDate], [lastLoginDt], [loginIpAddr]) VALUES (13, N'최대현', N'choidaehyeon', N'1234', N'A', N'01089847695', N'eogusalrns@naver.com', N'창원', CAST(N'2021-02-17' AS Date), NULL, NULL)
GO
INSERT [dbo].[memberTBL] ([memberidx], [memberName], [memberID], [password], [levels], [mobile], [email], [address], [regDate], [lastLoginDt], [loginIpAddr]) VALUES (14, N'조희지', N'zizi0308', N'asdfg00', N'C', N'01064386926', N'whgmlwl222@naver.com', N'부산', CAST(N'2021-02-17' AS Date), NULL, NULL)
GO
INSERT [dbo].[memberTBL] ([memberidx], [memberName], [memberID], [password], [levels], [mobile], [email], [address], [regDate], [lastLoginDt], [loginIpAddr]) VALUES (15, N'신민경', N'alrud006', N'1111', N'A', N'01053145427', N'alsrud006@naver.com', N'부산', CAST(N'2021-02-17' AS Date), NULL, NULL)
GO
INSERT [dbo].[memberTBL] ([memberidx], [memberName], [memberID], [password], [levels], [mobile], [email], [address], [regDate], [lastLoginDt], [loginIpAddr]) VALUES (16, N'하진우', N'whiteHair', N'1111', N'A', N'01062055278', N'pddana@naver.com', N'부산 남구 대연동', CAST(N'2021-02-17' AS Date), NULL, NULL)
GO
INSERT [dbo].[memberTBL] ([memberidx], [memberName], [memberID], [password], [levels], [mobile], [email], [address], [regDate], [lastLoginDt], [loginIpAddr]) VALUES (17, N'정재윤', N'jyj1994', N'1024', N'B', N'01077107683', N'^_^@^_^.com', N'부산', CAST(N'2021-02-17' AS Date), NULL, NULL)
GO
INSERT [dbo].[memberTBL] ([memberidx], [memberName], [memberID], [password], [levels], [mobile], [email], [address], [regDate], [lastLoginDt], [loginIpAddr]) VALUES (18, N'안성주', N'tjdwn12', N'1111', N'B', N'01027405111', N'tjdwn6459@naver.com', N'부산', CAST(N'2021-02-17' AS Date), NULL, NULL)
GO
INSERT [dbo].[memberTBL] ([memberidx], [memberName], [memberID], [password], [levels], [mobile], [email], [address], [regDate], [lastLoginDt], [loginIpAddr]) VALUES (19, N'김유림', N'yfla980107', N'1111', N'C', N'01051986232', N'yfla980107@gmail.com', N'부산', CAST(N'2021-02-17' AS Date), NULL, NULL)
GO
INSERT [dbo].[memberTBL] ([memberidx], [memberName], [memberID], [password], [levels], [mobile], [email], [address], [regDate], [lastLoginDt], [loginIpAddr]) VALUES (20, N'허재현', N'jhheo06', N'6929', N'C', N'01064266929', N'jhheo06@gmail.com', N'부산 해운대구 해운대로161번길 12', CAST(N'2021-02-17' AS Date), NULL, NULL)
GO
INSERT [dbo].[memberTBL] ([memberidx], [memberName], [memberID], [password], [levels], [mobile], [email], [address], [regDate], [lastLoginDt], [loginIpAddr]) VALUES (21, N'박효진', N'Edun', N'? つ ?_? ?つ', N'A', N'01088452413', N'edun@naver.com', N'김해', CAST(N'2021-02-17' AS Date), NULL, NULL)
GO
INSERT [dbo].[memberTBL] ([memberidx], [memberName], [memberID], [password], [levels], [mobile], [email], [address], [regDate], [lastLoginDt], [loginIpAddr]) VALUES (22, N'이태경', N'taekyoung1014', N'1111', N'A', N'01072809231', N'tkyoung1014@naver.com', N'부산광역시 해운대구 대천로67번길 7', CAST(N'2021-02-17' AS Date), NULL, NULL)
GO
INSERT [dbo].[memberTBL] ([memberidx], [memberName], [memberID], [password], [levels], [mobile], [email], [address], [regDate], [lastLoginDt], [loginIpAddr]) VALUES (23, N'김주현', N'kjoo10', N'1004', N'C', N'01071773162', N'kjoo10@naver.com', N'부산 남구 대연동', CAST(N'2021-02-17' AS Date), NULL, NULL)
GO
INSERT [dbo].[memberTBL] ([memberidx], [memberName], [memberID], [password], [levels], [mobile], [email], [address], [regDate], [lastLoginDt], [loginIpAddr]) VALUES (24, N'박수민', N'mini247269', N'1111', N'D', N'01075588982', N'mini247269@naver.com', N'부산 남구 대연동', CAST(N'2021-02-17' AS Date), NULL, NULL)
GO
INSERT [dbo].[memberTBL] ([memberidx], [memberName], [memberID], [password], [levels], [mobile], [email], [address], [regDate], [lastLoginDt], [loginIpAddr]) VALUES (25, N'김하윤', N'Hayun', N'1111', N'D', N'01080299554', N'95-ha@naver.com', N'부산', CAST(N'2021-02-17' AS Date), NULL, NULL)
GO
INSERT [dbo].[memberTBL] ([memberidx], [memberName], [memberID], [password], [levels], [mobile], [email], [address], [regDate], [lastLoginDt], [loginIpAddr]) VALUES (26, N'성명건', N'personar95', N'1234', N'S', N'01066837732', N'personar95@naver.com', N'부산 사하구', CAST(N'2021-02-17' AS Date), NULL, N'210.119.12.109')
GO
SET IDENTITY_INSERT [dbo].[memberTBL] OFF
GO
INSERT [dbo].[RentalTBL] ([RentalIdx], [memberIdx], [bookIdx], [rentalDt], [returnDt], [rentalState]) VALUES (1, 3, 2, CAST(N'2021-01-29T00:00:00.000' AS DateTime), CAST(N'2021-02-01T00:00:00.000' AS DateTime), N'2')
GO
INSERT [dbo].[RentalTBL] ([RentalIdx], [memberIdx], [bookIdx], [rentalDt], [returnDt], [rentalState]) VALUES (2, 18, 3, CAST(N'2021-02-02T00:00:00.000' AS DateTime), NULL, N'3')
GO
INSERT [dbo].[RentalTBL] ([RentalIdx], [memberIdx], [bookIdx], [rentalDt], [returnDt], [rentalState]) VALUES (3, 11, 7, CAST(N'2021-02-02T00:00:00.000' AS DateTime), NULL, N'4')
GO
INSERT [dbo].[RentalTBL] ([RentalIdx], [memberIdx], [bookIdx], [rentalDt], [returnDt], [rentalState]) VALUES (4, 16, 10, CAST(N'2021-02-03T00:00:00.000' AS DateTime), CAST(N'2021-02-04T00:00:00.000' AS DateTime), N'2')
GO
INSERT [dbo].[RentalTBL] ([RentalIdx], [memberIdx], [bookIdx], [rentalDt], [returnDt], [rentalState]) VALUES (5, 26, 9, CAST(N'2021-02-16T00:00:00.000' AS DateTime), NULL, N'1')
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_memberTBL_1_email]    Script Date: 21-02-17-수 오후 5:21:42 ******/
ALTER TABLE [dbo].[memberTBL] ADD  CONSTRAINT [IX_memberTBL_1_email] UNIQUE NONCLUSTERED 
(
	[mobile] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_memberTBL_memberID]    Script Date: 21-02-17-수 오후 5:21:42 ******/
ALTER TABLE [dbo].[memberTBL] ADD  CONSTRAINT [IX_memberTBL_memberID] UNIQUE NONCLUSTERED 
(
	[memberID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BooksTBL]  WITH CHECK ADD  CONSTRAINT [FK_BooksTBL_cateTBL] FOREIGN KEY([cateidx])
REFERENCES [dbo].[cateTBL] ([cateidx])
GO
ALTER TABLE [dbo].[BooksTBL] CHECK CONSTRAINT [FK_BooksTBL_cateTBL]
GO
ALTER TABLE [dbo].[RentalTBL]  WITH CHECK ADD  CONSTRAINT [FK_RentalTBL_BooksTBL] FOREIGN KEY([bookIdx])
REFERENCES [dbo].[BooksTBL] ([bookidx])
GO
ALTER TABLE [dbo].[RentalTBL] CHECK CONSTRAINT [FK_RentalTBL_BooksTBL]
GO
ALTER TABLE [dbo].[memberTBL]  WITH CHECK ADD  CONSTRAINT [CK_memberTBL_levels] CHECK  (([levels]='S' OR [levels]='D' OR [levels]='C' OR [levels]='B' OR [levels]='A'))
GO
ALTER TABLE [dbo].[memberTBL] CHECK CONSTRAINT [CK_memberTBL_levels]
GO
ALTER TABLE [dbo].[RentalTBL]  WITH CHECK ADD  CONSTRAINT [CK_RentalTBL_rentalState] CHECK  (([rentalState]='4' OR [rentalState]='3' OR [rentalState]='2' OR [rentalState]='1'))
GO
ALTER TABLE [dbo].[RentalTBL] CHECK CONSTRAINT [CK_RentalTBL_rentalState]
GO
USE [master]
GO
ALTER DATABASE [BookRentalShopDB] SET  READ_WRITE 
GO
