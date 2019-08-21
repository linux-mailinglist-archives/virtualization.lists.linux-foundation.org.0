Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A9C29840C
	for <lists.virtualization@lfdr.de>; Wed, 21 Aug 2019 21:10:41 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 87D0FE48;
	Wed, 21 Aug 2019 19:10:34 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id EBA40E32
	for <virtualization@lists.linux-foundation.org>;
	Wed, 21 Aug 2019 19:10:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
	(mail-eopbgr680085.outbound.protection.outlook.com [40.107.68.85])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id AB7A6F8
	for <virtualization@lists.linux-foundation.org>;
	Wed, 21 Aug 2019 19:10:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=TD9U6HqgvAozUktxAGxXmnrMgU4lyTRqPUmMO8ALlpVzmTKBD9suMcK4XOnrAteR4JIn2DQ3/GNo4wlcnGnuqAi0CHWAlU3mGy2bBeLpqUJ7NMwwjVy7n27+RHfq+/sUvYbyJndTeKFkGAA2Oqr+AkW/x7ktuGA48p7H/uFBU89e5Y7dL1BqwLc5ohxYtImQS2E/DNGkPxQVSkYq3HoEyhxesrSl11gTOWEZiGN+VSvwvD+4AIWhhsRvJBumgJ1AVLAq8z70hKGNyxO4yUB44Bq8UCHSAEr2rnw8acbNz0rpxs6pM43+gQpvGXcoxN00ciGgi/C4addH9p97sGmeug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=wG6tqMgSTBH0KZVTCN2cAG1cJekBFi5JOC4rsIS865o=;
	b=VVBdnBf92HDuyYB2dG362kbYwUQ/MQnpQx1WChX2Rxxc+hUnWwYA+MCGw3ChcIlkfflkwqguJ38N2bzJ+jk3lKUzeA9CfampRbiBjfTZkyPeCezweN0GPNnkrJnsImZlIuKPxPBRSCOruu6M4jN+pF7auDvceF0eirNuKg8PWXFgXTY9aavIPyXpoOb96ZuPthrztyXmQuO7Xqm7KJpKWSJCX5geSLKOHJAaD+8IeyGuBp17gqA3Zvk3Xih94JNsWRgAnMtS8N5Jmr0F61LYMOYFx/68misdj+qhx4sCWEoMmiXxQhNaF928IB3FtuNrJLMSRZwiywGTbx1gCvRtHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
	dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=wG6tqMgSTBH0KZVTCN2cAG1cJekBFi5JOC4rsIS865o=;
	b=1pdE37e69u/hDDjHOW/4ZE6LCtV4TDCYZkd99eVTJBWEtRFMcvwDD1/2LV2L6HqNKotud+MEoGcPdG8emlzREBE9WtR2a67buizaC/90yXDQIE/KY2JVIf5kmn2ouCYW5iJt0SbFRkVIHCJ9xW1Xy+e/tro1AOIwIiXV8yN2OXU=
Received: from BYAPR05MB4776.namprd05.prod.outlook.com (52.135.233.146) by
	BYAPR05MB6183.namprd05.prod.outlook.com (20.178.55.88) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2199.10; Wed, 21 Aug 2019 19:10:29 +0000
Received: from BYAPR05MB4776.namprd05.prod.outlook.com
	([fe80::1541:ed53:784a:6376]) by
	BYAPR05MB4776.namprd05.prod.outlook.com
	([fe80::1541:ed53:784a:6376%5]) with mapi id 15.20.2199.011;
	Wed, 21 Aug 2019 19:10:29 +0000
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v2] mm/balloon_compaction: Informative allocation warnings
Thread-Topic: [PATCH v2] mm/balloon_compaction: Informative allocation warnings
Thread-Index: AQHVWEJHWn7VmeZ5cEugJmetWObq/6cF9CyAgAAAcQCAAAHXgIAAATcA
Date: Wed, 21 Aug 2019 19:10:28 +0000
Message-ID: <36AC2460-9E88-4BAF-B793-A14A00E41617@vmware.com>
References: <20190821094159.40795-1-namit@vmware.com>
	<75ff92c2-7ae2-c4a6-cd1f-44741e29d20e@redhat.com>
	<4E10A342-9A51-4C1F-8E5A-8005AACEF4CE@vmware.com>
	<497b1189-8e1d-2926-ee5e-9077fcceb04b@redhat.com>
In-Reply-To: <497b1189-8e1d-2926-ee5e-9077fcceb04b@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=namit@vmware.com; 
x-originating-ip: [66.170.99.2]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fcbd377d-9233-4bfb-1689-08d7266b3b32
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
	SRVR:BYAPR05MB6183; 
x-ms-traffictypediagnostic: BYAPR05MB6183:
x-microsoft-antispam-prvs: <BYAPR05MB61836A38AE0D6F25728FCEFDD0AA0@BYAPR05MB6183.namprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-forefront-prvs: 0136C1DDA4
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(4636009)(39860400002)(136003)(376002)(366004)(346002)(396003)(189003)(199004)(71190400001)(6512007)(71200400001)(5660300002)(229853002)(476003)(486006)(36756003)(6436002)(7736002)(6486002)(33656002)(8676002)(53546011)(81166006)(81156014)(2616005)(102836004)(446003)(6506007)(66066001)(26005)(305945005)(54906003)(25786009)(86362001)(6916009)(256004)(6246003)(8936002)(99286004)(14444005)(316002)(11346002)(76116006)(14454004)(2906002)(76176011)(53936002)(6116002)(3846002)(66946007)(66446008)(64756008)(66476007)(66556008)(478600001)(186003)(4326008);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR05MB6183;
	H:BYAPR05MB4776.namprd05.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: vmware.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 5Cpyo/UKwKc24KmukrinZBxAg0bb+ioGQlL3wQUkgIDHxI3gSQHj63pl3MK9K/DUu2FKedbrkMdYHE7kHe13lMksOBTCkLGMC9uvM1IuDGVH0v5y4AreF9/RNxY7tCXGsD8ZoLXBN2IC2aCqg9R+qBf+Un86hp83D+3/vTxtIlRQ76uE+ZwgECQ7RgSuJSvA26rJYZE2LWx2A+9usT9imxs4ZJ0M1PU2LMJbdkwDFvzh8EGQYJWz81RyStJVIyUQwDjpEho0Vf+SRkA8sSNisteIIPqfZKD32cYkC68Dg//7iVWxExA29ixuvsQy7QOComr+prI+AGrHASvEVaWH7pdy0vJSZryguCB2DhAFffxv1LBe2KL1i5L9VvC3+yd00yjObmkkH9CgnSmSxdSaYA4U+AiEFnPTO56ugITcl+c=
x-ms-exchange-transport-forked: True
Content-ID: <953AC7B8E279284B9861A33D6CA5BBDF@namprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fcbd377d-9233-4bfb-1689-08d7266b3b32
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2019 19:10:28.9011 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /hhOmwH1aKVeBknnvxP0eChnaHdN27DHLyq1QTXH06FYcNAu3N6UEpRuoQVzXYre0WNmy8g/w6yWEtPU79Lk+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR05MB6183
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Linux-MM <linux-mm@kvack.org>, "virtualization@lists.linux-foundation.org"
	<virtualization@lists.linux-foundation.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"Michael S. Tsirkin" <mst@redhat.com>
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

> On Aug 21, 2019, at 12:06 PM, David Hildenbrand <david@redhat.com> wrote:
> 
> On 21.08.19 20:59, Nadav Amit wrote:
>>> On Aug 21, 2019, at 11:57 AM, David Hildenbrand <david@redhat.com> wrote:
>>> 
>>> On 21.08.19 11:41, Nadav Amit wrote:
>>>> There is no reason to print generic warnings when balloon memory
>>>> allocation fails, as failures are expected and can be handled
>>>> gracefully. Since VMware balloon now uses balloon-compaction
>>>> infrastructure, and suppressed these warnings before, it is also
>>>> beneficial to suppress these warnings to keep the same behavior that the
>>>> balloon had before.
>>>> 
>>>> Since such warnings can still be useful to indicate that the balloon is
>>>> over-inflated, print more informative and less frightening warning if
>>>> allocation fails instead.
>>>> 
>>>> Cc: David Hildenbrand <david@redhat.com>
>>>> Cc: Jason Wang <jasowang@redhat.com>
>>>> Signed-off-by: Nadav Amit <namit@vmware.com>
>>>> 
>>>> ---
>>>> 
>>>> v1->v2:
>>>> * Print informative warnings instead suppressing [David]
>>>> ---
>>>> mm/balloon_compaction.c | 7 ++++++-
>>>> 1 file changed, 6 insertions(+), 1 deletion(-)
>>>> 
>>>> diff --git a/mm/balloon_compaction.c b/mm/balloon_compaction.c
>>>> index 798275a51887..0c1d1f7689f0 100644
>>>> --- a/mm/balloon_compaction.c
>>>> +++ b/mm/balloon_compaction.c
>>>> @@ -124,7 +124,12 @@ EXPORT_SYMBOL_GPL(balloon_page_list_dequeue);
>>>> struct page *balloon_page_alloc(void)
>>>> {
>>>> 	struct page *page = alloc_page(balloon_mapping_gfp_mask() |
>>>> -				       __GFP_NOMEMALLOC | __GFP_NORETRY);
>>>> +				       __GFP_NOMEMALLOC | __GFP_NORETRY |
>>>> +				       __GFP_NOWARN);
>>>> +
>>>> +	if (!page)
>>>> +		pr_warn_ratelimited("memory balloon: memory allocation failed");
>>>> +
>>>> 	return page;
>>>> }
>>>> EXPORT_SYMBOL_GPL(balloon_page_alloc);
>>> 
>>> Not sure if "memory balloon" is the right wording. hmmm.
>>> 
>>> Acked-by: David Hildenbrand <david@redhat.com>
>> 
>> Do you have a better suggestion?
> 
> Not really - that's why I ack'ed :)
> 
> However, thinking about it - what about moving the check + print to the
> caller and then using dev_warn... or sth. like simple "virtio_balloon:
> ..." ? You can then drop the warning for vmware balloon if you feel like
> not needing it.

Actually, there is already a warning that is printed by the virtue_balloon
in fill_balloon():

                struct page *page = balloon_page_alloc();

                if (!page) {
                        dev_info_ratelimited(&vb->vdev->dev,
                                             "Out of puff! Can't get %u pages\n",
                                             VIRTIO_BALLOON_PAGES_PER_PAGE);
                        /* Sleep for at least 1/5 of a second before retry. */
                        msleep(200);
                        break;
                }

So are you ok with going back to v1?

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
