Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 961AA21C3A
	for <lists.virtualization@lfdr.de>; Fri, 17 May 2019 19:10:37 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id A925DC11;
	Fri, 17 May 2019 17:10:32 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id B978EAF3
	for <virtualization@lists.linux-foundation.org>;
	Fri, 17 May 2019 17:10:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
	(mail-eopbgr770043.outbound.protection.outlook.com [40.107.77.43])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 479155E4
	for <virtualization@lists.linux-foundation.org>;
	Fri, 17 May 2019 17:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=PAKADOLlQH6OjaqNSsLfmaOHfMl+eoBy3jCe/k4AUVQ=;
	b=ZMKnlfWW4C4OZ9xkPpnacmCTcU246SPs6c8uovlrFpv0MnajpCOqUaF8noYOaBp+TouOWBShfkmEbHFHwjtTA9ZreVWB4k2WFClMD1a6Ka3t739lfAuKYjHRZNOksMMxVoDBfz0zBX+GXbByQRZdeQ3MNwpE0KbLX/aqj377E18=
Received: from BYAPR05MB4776.namprd05.prod.outlook.com (52.135.233.146) by
	BYAPR05MB6696.namprd05.prod.outlook.com (20.178.235.206) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1922.10; Fri, 17 May 2019 17:10:23 +0000
Received: from BYAPR05MB4776.namprd05.prod.outlook.com
	([fe80::b057:917a:f098:6098]) by
	BYAPR05MB4776.namprd05.prod.outlook.com
	([fe80::b057:917a:f098:6098%7]) with mapi id 15.20.1922.002;
	Fri, 17 May 2019 17:10:23 +0000
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann
	<arnd@arndb.de>
Subject: Re: [PATCH v4 0/4] vmw_balloon: Compaction and shrinker support
Thread-Topic: [PATCH v4 0/4] vmw_balloon: Compaction and shrinker support
Thread-Index: AQHU+5sfw4lXp6MJj0Ov0LaKSU1Rk6ZaOUgAgBV2VAA=
Date: Fri, 17 May 2019 17:10:23 +0000
Message-ID: <9AD9FE33-1825-4D1A-914F-9C29DF93DC8D@vmware.com>
References: <20190425115445.20815-1-namit@vmware.com>
	<8A2D1D43-759A-4B09-B781-31E9002AE3DA@vmware.com>
In-Reply-To: <8A2D1D43-759A-4B09-B781-31E9002AE3DA@vmware.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=namit@vmware.com; 
x-originating-ip: [66.170.99.2]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3b7893ab-7413-4e4b-422e-08d6daea8cb2
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);
	SRVR:BYAPR05MB6696; 
x-ms-traffictypediagnostic: BYAPR05MB6696:
x-ld-processed: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0,ExtAddr
x-microsoft-antispam-prvs: <BYAPR05MB66962251319BC5C7A6401005D00B0@BYAPR05MB6696.namprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3276;
x-forefront-prvs: 0040126723
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(39860400002)(366004)(136003)(396003)(376002)(346002)(189003)(199004)(53936002)(110136005)(99286004)(76176011)(53546011)(102836004)(33656002)(6506007)(66066001)(316002)(86362001)(82746002)(5660300002)(486006)(476003)(54906003)(76116006)(73956011)(2616005)(186003)(478600001)(26005)(6512007)(14454004)(6486002)(446003)(11346002)(229853002)(6436002)(6116002)(3846002)(14444005)(66556008)(71200400001)(71190400001)(4326008)(83716004)(68736007)(25786009)(6246003)(256004)(2906002)(8936002)(36756003)(66476007)(64756008)(66446008)(66946007)(305945005)(7736002)(8676002)(81156014)(81166006);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR05MB6696;
	H:BYAPR05MB4776.namprd05.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: vmware.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 6Sp8TACZchpG8gzKBlId5O7YsGRXGaVhOPOjLkRuDx6bYt2bQsqNLwZlU1Ah08uvD157mq7fgd0NQxUTN7y4FskdJ54/Ol/Y18OMeC5gvBFgQLgjeUs5vsVaG2d6/Qs17tc5JFaTirnIZKtLt9aev8d/NN/7MXzM9G1AKyH+2uWt9u81WeIXUkdm6AyNxeF6XZYcg7TXrGWhYRz1UukNDnyQMAbZ+yjL44GwBuHUzo2VNW1iS7LpUlY+Y4DV2ZA+zvzFA6ybujpaRGAzzWMC9ALottnOBxc0zLssnLaD8WKpmfOkMYGd+NRy7yqAGiHGRh1FfIcqHVbSAQeIkCv8G7hh3NZ7YjZTUvK8yQz0JdwEjBYTkhXKtFR/jmgNJyQaR6cXpfE5zQ1+2JICEdMMRQhsnEDiHYoHPSxUFAGEUio=
Content-ID: <D489544212C01046B2B5533DCF95669B@namprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b7893ab-7413-4e4b-422e-08d6daea8cb2
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 May 2019 17:10:23.6289 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: namit@vmware.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR05MB6696
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Pv-drivers <Pv-drivers@vmware.com>,
	lkml <linux-kernel@vger.kernel.org>,
	"virtualization@lists.linux-foundation.org"
	<virtualization@lists.linux-foundation.org>, Linux-MM <linux-mm@kvack.org>,
	Julien Freche <jfreche@vmware.com>
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Linux virtualization <virtualization.lists.linux-foundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/virtualization>,
	<mailto:virtualization-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/virtualization/>
List-Post: <mailto:virtualization@lists.linux-foundation.org>
List-Help: <mailto:virtualization-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/virtualization>,
	<mailto:virtualization-request@lists.linux-foundation.org?subject=subscribe>
From: Nadav Amit via Virtualization <virtualization@lists.linux-foundation.org>
Reply-To: Nadav Amit <namit@vmware.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

> On May 3, 2019, at 6:25 PM, Nadav Amit <namit@vmware.com> wrote:
> 
>> On Apr 25, 2019, at 4:54 AM, Nadav Amit <namit@vmware.com> wrote:
>> 
>> VMware balloon enhancements: adding support for memory compaction,
>> memory shrinker (to prevent OOM) and splitting of refused pages to
>> prevent recurring inflations.
>> 
>> Patches 1-2: Support for compaction
>> Patch 3: Support for memory shrinker - disabled by default
>> Patch 4: Split refused pages to improve performance
>> 
>> v3->v4:
>> * "get around to" comment [Michael]
>> * Put list_add under page lock [Michael]
>> 
>> v2->v3:
>> * Fixing wrong argument type (int->size_t) [Michael]
>> * Fixing a comment (it) [Michael]
>> * Reinstating the BUG_ON() when page is locked [Michael] 
>> 
>> v1->v2:
>> * Return number of pages in list enqueue/dequeue interfaces [Michael]
>> * Removed first two patches which were already merged
>> 
>> Nadav Amit (4):
>> mm/balloon_compaction: List interfaces
>> vmw_balloon: Compaction support
>> vmw_balloon: Add memory shrinker
>> vmw_balloon: Split refused pages
>> 
>> drivers/misc/Kconfig               |   1 +
>> drivers/misc/vmw_balloon.c         | 489 ++++++++++++++++++++++++++---
>> include/linux/balloon_compaction.h |   4 +
>> mm/balloon_compaction.c            | 144 ++++++---
>> 4 files changed, 553 insertions(+), 85 deletions(-)
>> 
>> -- 
>> 2.19.1
> 
> Ping.

Ping.

Greg, did it got lost again?

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
