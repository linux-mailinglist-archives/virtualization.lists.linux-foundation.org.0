Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EACE983CE
	for <lists.virtualization@lfdr.de>; Wed, 21 Aug 2019 21:00:08 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 8B28EE25;
	Wed, 21 Aug 2019 18:59:40 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 98C8EE24
	for <virtualization@lists.linux-foundation.org>;
	Wed, 21 Aug 2019 18:59:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
	(mail-eopbgr780041.outbound.protection.outlook.com [40.107.78.41])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 3C8DC822
	for <virtualization@lists.linux-foundation.org>;
	Wed, 21 Aug 2019 18:59:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=afE7aTivTngYiuZmjhxanqgHBPbv1fuKmguqa3Qw4QLVRkmBhRQWqfJxyLgUpdmjM/2SDZWogqscDv47OChs7JnSWFj6d+F23wlF1BxpHGXHARzrM/fOTrXVUNypseP3Yky9ScdYLyrww625uOcKOP5brI4Avy/IeWlwO0qloVdC06SIqve4mPT/NbOwY6L9HjoqJuvHLoCrtA2M6YL7qhOfAHoZM5He/O7oT4Q50L/9NYvKjfUW7Qg5kVbTILMZk0fgozAc3K/q5KvrlRG5A2yrdLOzr59YGDz2cWJItsZeHYPSvA9MzT4xSKApcna79RdCrrn3zjdQCnDadPkXFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=bpsejHAG8GNGL6TGAsejnB71BUzlaZtpQTS4DQPTPrU=;
	b=GRks0D3aXBQHvuxOeEJvnVnJUDr5AI3sMTocq4j0QShZWMdW9ISIJIWrHJs1wu15uZxKxxq7J5MRL6NSquhgo1w98APf1ZLXnSPnGlBZFfk9l2c3OCQGDKT5NYVAQ/iIK/aC7cieU9Qi4+ijO6qKqbd93hmsGxSoGzi4yktbaNzcQgBkkHW4C+RRqvtUK6Cnaa4YyQsm0eU27Rs6seBVXnFhY0aS8QuP4urKwKqrjalkCbV5+6zaPce8Yw8gzIDQU0BADtwGiwvSBygkAHYp2BMPieKJ3LseMKLPSKOajmszid6E3m7HQEC/lbfjxknc8r46zZpe82+G6Ie+D1NL4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
	dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=bpsejHAG8GNGL6TGAsejnB71BUzlaZtpQTS4DQPTPrU=;
	b=hjH5olWMCW3ei+2a1+oObp84YwFGQEETXo6ZqpXOwSwKslhlxQNroBkXezpzfRyYF/wZjaHtyLzuvAz5uFEJhXGomHoF57FskxN7qm0MdcNlBrRXcIIGhzQSj73xMfFFgJOJxg/afsf09d/w6F6hm7sEFSmU5ZUI+IgLqPmK8Ek=
Received: from BYAPR05MB4776.namprd05.prod.outlook.com (52.135.233.146) by
	BYAPR05MB5687.namprd05.prod.outlook.com (20.178.1.220) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2199.11; Wed, 21 Aug 2019 18:59:33 +0000
Received: from BYAPR05MB4776.namprd05.prod.outlook.com
	([fe80::1541:ed53:784a:6376]) by
	BYAPR05MB4776.namprd05.prod.outlook.com
	([fe80::1541:ed53:784a:6376%5]) with mapi id 15.20.2199.011;
	Wed, 21 Aug 2019 18:59:33 +0000
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v2] mm/balloon_compaction: Informative allocation warnings
Thread-Topic: [PATCH v2] mm/balloon_compaction: Informative allocation warnings
Thread-Index: AQHVWEJHWn7VmeZ5cEugJmetWObq/6cF9CyAgAAAcQA=
Date: Wed, 21 Aug 2019 18:59:32 +0000
Message-ID: <4E10A342-9A51-4C1F-8E5A-8005AACEF4CE@vmware.com>
References: <20190821094159.40795-1-namit@vmware.com>
	<75ff92c2-7ae2-c4a6-cd1f-44741e29d20e@redhat.com>
In-Reply-To: <75ff92c2-7ae2-c4a6-cd1f-44741e29d20e@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=namit@vmware.com; 
x-originating-ip: [66.170.99.2]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e24b47ef-064e-4344-b982-08d72669b408
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
	SRVR:BYAPR05MB5687; 
x-ms-traffictypediagnostic: BYAPR05MB5687:
x-microsoft-antispam-prvs: <BYAPR05MB56876D6E8010ACA7769026F7D0AA0@BYAPR05MB5687.namprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1388;
x-forefront-prvs: 0136C1DDA4
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(4636009)(39860400002)(346002)(136003)(366004)(396003)(376002)(199004)(189003)(6486002)(66946007)(76116006)(6116002)(54906003)(3846002)(66446008)(64756008)(66556008)(66476007)(478600001)(6246003)(25786009)(6512007)(6436002)(14454004)(33656002)(4326008)(66066001)(229853002)(6916009)(53936002)(8936002)(446003)(81156014)(14444005)(36756003)(256004)(186003)(76176011)(71190400001)(81166006)(305945005)(5660300002)(86362001)(102836004)(476003)(7736002)(53546011)(6506007)(2616005)(486006)(8676002)(2906002)(316002)(71200400001)(99286004)(26005)(11346002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR05MB5687;
	H:BYAPR05MB4776.namprd05.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: vmware.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: gTysi6YqWq1QF4DlvSS9bQZkK3D7e/pZiflpC+vAgruXNsTCPK6O+lhTRBb2wj51fv6cCsWU39v2dVhdKLUCY/3ToVE+1amAU4a+DPL34eIrJLVfB+9Jdm1X78Fx0Cfef+D5bVn6A8WWZVJisgzU3sZwZ5feYnL5x1hwHsYsyXXTjVGkcqG5ZmwT66j4LM81gsTd1TivZWr9/mbmNZxmr3dEy5Zii7/RS2nYR3M4sdPd4D7HsdwCfLVpcBrPf7BK1MBfanHp50q85UhERneNcjKuUrVXMDRVzvJUnNgKyifYLIIOMe/vYv15Cdu2vzu5gXKTcXH2QaEelXIUnOzzoAykyUGWq9A1OQI33Jp7mTrwf0f2ysMIgfHR9TfG7lIYohLbhlrTbWPO1i9I8OfxxF1UvuqIurS9RzaNLqoZ8KU=
x-ms-exchange-transport-forked: True
Content-ID: <3A38FA3954F90E49AB4A1D4968549FAF@namprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e24b47ef-064e-4344-b982-08d72669b408
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2019 18:59:32.8997 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zhohh2xN6E6IypEHFzk2CM/yb7C76yfHc6QZY2s9U68v5PYGF5syks0tlsMEYjXzz1ewoBxE7RV8KQH3AH9hIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR05MB5687
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

> On Aug 21, 2019, at 11:57 AM, David Hildenbrand <david@redhat.com> wrote:
> 
> On 21.08.19 11:41, Nadav Amit wrote:
>> There is no reason to print generic warnings when balloon memory
>> allocation fails, as failures are expected and can be handled
>> gracefully. Since VMware balloon now uses balloon-compaction
>> infrastructure, and suppressed these warnings before, it is also
>> beneficial to suppress these warnings to keep the same behavior that the
>> balloon had before.
>> 
>> Since such warnings can still be useful to indicate that the balloon is
>> over-inflated, print more informative and less frightening warning if
>> allocation fails instead.
>> 
>> Cc: David Hildenbrand <david@redhat.com>
>> Cc: Jason Wang <jasowang@redhat.com>
>> Signed-off-by: Nadav Amit <namit@vmware.com>
>> 
>> ---
>> 
>> v1->v2:
>>  * Print informative warnings instead suppressing [David]
>> ---
>> mm/balloon_compaction.c | 7 ++++++-
>> 1 file changed, 6 insertions(+), 1 deletion(-)
>> 
>> diff --git a/mm/balloon_compaction.c b/mm/balloon_compaction.c
>> index 798275a51887..0c1d1f7689f0 100644
>> --- a/mm/balloon_compaction.c
>> +++ b/mm/balloon_compaction.c
>> @@ -124,7 +124,12 @@ EXPORT_SYMBOL_GPL(balloon_page_list_dequeue);
>> struct page *balloon_page_alloc(void)
>> {
>> 	struct page *page = alloc_page(balloon_mapping_gfp_mask() |
>> -				       __GFP_NOMEMALLOC | __GFP_NORETRY);
>> +				       __GFP_NOMEMALLOC | __GFP_NORETRY |
>> +				       __GFP_NOWARN);
>> +
>> +	if (!page)
>> +		pr_warn_ratelimited("memory balloon: memory allocation failed");
>> +
>> 	return page;
>> }
>> EXPORT_SYMBOL_GPL(balloon_page_alloc);
> 
> Not sure if "memory balloon" is the right wording. hmmm.
> 
> Acked-by: David Hildenbrand <david@redhat.com>

Do you have a better suggestion?

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
