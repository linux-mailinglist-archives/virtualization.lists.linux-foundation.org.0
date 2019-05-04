Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 832E6136ED
	for <lists.virtualization@lfdr.de>; Sat,  4 May 2019 03:26:37 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id D3DB13E87;
	Sat,  4 May 2019 01:26:31 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 1433A3E82
	for <virtualization@lists.linux-foundation.org>;
	Sat,  4 May 2019 01:25:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
	(mail-eopbgr800059.outbound.protection.outlook.com [40.107.80.59])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 6AAAFE3
	for <virtualization@lists.linux-foundation.org>;
	Sat,  4 May 2019 01:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
	s=selector1;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=mdKWZNWsC2QDZPr7BKiJhEirVBVPb9zk96COLc9DNXU=;
	b=lEgevMdZZX+zU54N6kgdk2i69yRAMZ1RjdI734MtLBF+Afc95EpzNxORO0FD2WfvJutDMZ0kn2ymdhvZRhsQkp5e9pvW+q33KQiq9UCAA6F83BbIoHEfg7hRKOR+5pje7Z7uJ0sprgYZuotYI3k+6PTIAHzEnBZ+pkpsbZXj0rc=
Received: from BYAPR05MB4776.namprd05.prod.outlook.com (52.135.233.146) by
	BYAPR05MB6213.namprd05.prod.outlook.com (20.178.55.158) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1856.10; Sat, 4 May 2019 01:25:25 +0000
Received: from BYAPR05MB4776.namprd05.prod.outlook.com
	([fe80::b057:917a:f098:6098]) by
	BYAPR05MB4776.namprd05.prod.outlook.com
	([fe80::b057:917a:f098:6098%7]) with mapi id 15.20.1878.012;
	Sat, 4 May 2019 01:25:24 +0000
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v4 0/4] vmw_balloon: Compaction and shrinker support
Thread-Topic: [PATCH v4 0/4] vmw_balloon: Compaction and shrinker support
Thread-Index: AQHU+5sfw4lXp6MJj0Ov0LaKSU1Rk6ZaOUgA
Date: Sat, 4 May 2019 01:25:24 +0000
Message-ID: <8A2D1D43-759A-4B09-B781-31E9002AE3DA@vmware.com>
References: <20190425115445.20815-1-namit@vmware.com>
In-Reply-To: <20190425115445.20815-1-namit@vmware.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=namit@vmware.com; 
x-originating-ip: [66.170.99.2]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f4bafb9c-9199-422e-8764-08d6d02f623f
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);
	SRVR:BYAPR05MB6213; 
x-ms-traffictypediagnostic: BYAPR05MB6213:
x-ld-processed: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0,ExtAddr
x-microsoft-antispam-prvs: <BYAPR05MB6213679830B52A78D4C2C711D0360@BYAPR05MB6213.namprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3276;
x-forefront-prvs: 0027ED21E7
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(396003)(346002)(376002)(39860400002)(366004)(136003)(189003)(199004)(2616005)(486006)(33656002)(68736007)(36756003)(6486002)(102836004)(186003)(6506007)(26005)(53546011)(8936002)(76176011)(73956011)(3846002)(6116002)(66946007)(66556008)(66446008)(446003)(54906003)(2906002)(7736002)(478600001)(66476007)(64756008)(11346002)(99286004)(14444005)(256004)(25786009)(229853002)(476003)(71200400001)(6916009)(66066001)(305945005)(316002)(76116006)(14454004)(82746002)(8676002)(5660300002)(83716004)(6512007)(4326008)(6246003)(53936002)(71190400001)(86362001)(81166006)(6436002)(81156014);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR05MB6213;
	H:BYAPR05MB4776.namprd05.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: vmware.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: qPo5D/F9hGET3k6Gq/zZ44ji2YXV45Kc7MgTWcwETlnHn+o1eeWnGSiDvUs5kAjzytfoSv+ws1n+fZs1J4v58hq39BFQ1JHzm2kUQJXg1M9q8oiJ4n9pAbEX2X1WCdbZabGpVu1hGH34rfhSC/y/UB3k7N0j2JSj0KikbzqDLe6yc5UrhqPy6u2uZ7VxIZc0Kk9H7IuA6CbB3+uARirVRAFFIlsjZnexzDMA/Qfi5Nq+n9FBc+rfZd54lDbYww6ErRqiudTH5yOS5CRgok602/Papr26lfeYFykWyOj5Ra6wEtA9l+IDEE7LjMlYvajvrZoAS7xGyCpSFfc1AIKZjxuzWV+Ek3NOZb+h7ntzVJkUAtm6KeYfzbz2x5NeWNFMVrj9iNJZsNex8ArbaRvy1gwGO/MK1vcnk0aVZFLa/ns=
Content-ID: <88829AE5ABEA6941919308A6A9557F98@namprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4bafb9c-9199-422e-8764-08d6d02f623f
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 May 2019 01:25:24.8825 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR05MB6213
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Arnd Bergmann <arnd@arndb.de>, "Michael S. Tsirkin" <mst@redhat.com>,
	Pv-drivers <Pv-drivers@vmware.com>, lkml <linux-kernel@vger.kernel.org>,
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

> On Apr 25, 2019, at 4:54 AM, Nadav Amit <namit@vmware.com> wrote:
> 
> VMware balloon enhancements: adding support for memory compaction,
> memory shrinker (to prevent OOM) and splitting of refused pages to
> prevent recurring inflations.
> 
> Patches 1-2: Support for compaction
> Patch 3: Support for memory shrinker - disabled by default
> Patch 4: Split refused pages to improve performance
> 
> v3->v4:
> * "get around to" comment [Michael]
> * Put list_add under page lock [Michael]
> 
> v2->v3:
> * Fixing wrong argument type (int->size_t) [Michael]
> * Fixing a comment (it) [Michael]
> * Reinstating the BUG_ON() when page is locked [Michael] 
> 
> v1->v2:
> * Return number of pages in list enqueue/dequeue interfaces [Michael]
> * Removed first two patches which were already merged
> 
> Nadav Amit (4):
>  mm/balloon_compaction: List interfaces
>  vmw_balloon: Compaction support
>  vmw_balloon: Add memory shrinker
>  vmw_balloon: Split refused pages
> 
> drivers/misc/Kconfig               |   1 +
> drivers/misc/vmw_balloon.c         | 489 ++++++++++++++++++++++++++---
> include/linux/balloon_compaction.h |   4 +
> mm/balloon_compaction.c            | 144 ++++++---
> 4 files changed, 553 insertions(+), 85 deletions(-)
> 
> -- 
> 2.19.1

Ping.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
