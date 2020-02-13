Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 0367015C0FB
	for <lists.virtualization@lfdr.de>; Thu, 13 Feb 2020 16:05:55 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 88A7D20385;
	Thu, 13 Feb 2020 15:05:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Al8Tes6XicX1; Thu, 13 Feb 2020 15:05:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 8DD4D20022;
	Thu, 13 Feb 2020 15:05:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4BB76C0177;
	Thu, 13 Feb 2020 15:05:52 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2B44DC0177
 for <virtualization@lists.linux-foundation.org>;
 Thu, 13 Feb 2020 15:05:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 2355C8475F
 for <virtualization@lists.linux-foundation.org>;
 Thu, 13 Feb 2020 15:05:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 36BH9qT9yrwP
 for <virtualization@lists.linux-foundation.org>;
 Thu, 13 Feb 2020 15:05:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20063.outbound.protection.outlook.com [40.107.2.63])
 by whitealder.osuosl.org (Postfix) with ESMTPS id F1FDE846AD
 for <virtualization@lists.linux-foundation.org>;
 Thu, 13 Feb 2020 15:05:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=noSSVL51yIXso78V/Drx7VlBIuluW9PG+LVgjG1w9olWlzONG0vk5GF097ZgVVgGVLjfONTjp8ZgizsY0iMIsTg5/3xbYz5TtC1Zaj/HiOv7MID9KBblTdMY+BKT5D43F6nSjZWPj+IZqLWizCmJdvp/ttBQdO8HK978U91K2vwhoEcLa+pGbj9wvF7WWyP9zs+ZEnIAuYEyQ8AsMqMy+kb8QJm20IHsK5xVsp/eWQEpSfdL5++nyy5NOYGg9K6pkCjoIX35+cbj/jJUb44BajK3+lN06/hMtYYWrHMHCpCMc+ihgpht+ovUxKfhZpq7wOnDgXeKzusDKVghFW6d/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AZPJ+StsmdpwxZ9pIrUwvbhuQ3GSj2LQY7edxansr/c=;
 b=auO7HzasFaBNK8rMTYqVUwyEVXw3ndgqgyGRg4JFd62TN/f9KnOwqos6tAso7SgO01jbRhSuRAwVq5ulxv45xbewpExVvHz5vthi5guGv2adn887JJ9GOt0any2OSKV/3C5uXO5WLYy+KNlEn9aoy54h2Ei1/WBnLDyudMW2qE2mWW2BRi3TOwICx1eCzNLWM+ZnANqbngMCO9hABYorhcaK8EvJ/XW1QWvSKA4/AqQPgcdDMc6aOPAA+HoGZbBM/7FX2rdq6JWGh8OTsTP6oS36kShT+d1rHv0WnhPmTdcbn838ahqijUlEWHUY5EGSnWd9d4dC8cQBHgDTZj5biQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AZPJ+StsmdpwxZ9pIrUwvbhuQ3GSj2LQY7edxansr/c=;
 b=tBkJ4bz+01k3FHjFAQjeScwkYVAIiXcdb9dZOeLGXnU5xgUNAvqlKQOoR55pfjNxnVrs/QlYxl+9RcjWfXUVfxbtrb4w16YMhWwHeLThEhF/P5XecE41koHqPqiOompDqUj+6JKjpcx3UjyawrLbdB88xhPdqKLX1nSwAKznJiU=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=jgg@mellanox.com; 
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (52.133.14.15) by
 VI1PR05MB4303.eurprd05.prod.outlook.com (52.133.15.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2707.21; Thu, 13 Feb 2020 15:05:46 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::1c00:7925:d5c6:d60d]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::1c00:7925:d5c6:d60d%7]) with mapi id 15.20.2729.025; Thu, 13 Feb 2020
 15:05:46 +0000
Date: Thu, 13 Feb 2020 11:05:42 -0400
From: Jason Gunthorpe <jgg@mellanox.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH V2 3/5] vDPA: introduce vDPA bus
Message-ID: <20200213150542.GW4271@mellanox.com>
References: <20200210035608.10002-1-jasowang@redhat.com>
 <20200210035608.10002-4-jasowang@redhat.com>
 <20200211134746.GI4271@mellanox.com>
 <cf7abcc9-f8ef-1fe2-248e-9b9028788ade@redhat.com>
 <20200212125108.GS4271@mellanox.com>
 <12775659-1589-39e4-e344-b7a2c792b0f3@redhat.com>
 <20200213134128.GV4271@mellanox.com>
 <ebaea825-5432-65e2-2ab3-720a8c4030e7@redhat.com>
Content-Disposition: inline
In-Reply-To: <ebaea825-5432-65e2-2ab3-720a8c4030e7@redhat.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: MN2PR13CA0030.namprd13.prod.outlook.com
 (2603:10b6:208:160::43) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:44::15)
MIME-Version: 1.0
Received: from mlx.ziepe.ca (142.68.57.212) by
 MN2PR13CA0030.namprd13.prod.outlook.com (2603:10b6:208:160::43) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2750.8 via Frontend
 Transport; Thu, 13 Feb 2020 15:05:46 +0000
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)	(envelope-from
 <jgg@mellanox.com>)	id 1j2G3i-00051c-IR; Thu, 13 Feb 2020 11:05:42 -0400
X-Originating-IP: [142.68.57.212]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 1de89200-f5cd-4531-9b8b-08d7b0963424
X-MS-TrafficTypeDiagnostic: VI1PR05MB4303:|VI1PR05MB4303:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR05MB4303985C9353290AE0B7AFC5CF1A0@VI1PR05MB4303.eurprd05.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-Forefront-PRVS: 031257FE13
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(39860400002)(346002)(136003)(376002)(366004)(199004)(189003)(66946007)(66556008)(66476007)(1076003)(5660300002)(2616005)(9786002)(9746002)(6916009)(33656002)(7416002)(36756003)(81156014)(316002)(8936002)(8676002)(186003)(4326008)(52116002)(26005)(2906002)(478600001)(81166006)(86362001)(24400500001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB4303;
 H:VI1PR05MB4141.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0JV+7gcnIpRhY7xy6VlPe50jvbWAdQ/VgWpnmlYS34kEZItBzHLgfbAd/fYyRfdKFbMYcXiOcppWPg8eLl3BnIyMXf46EypX4A5RCDbE2HnB6AH883q9UTzAum9lTkHdN65ojwxUaBUVBbhnq4WZjidZgMKSyG30Y2g1iQdJVU2tQrA6P6h66Qcn9aEqmEfvyKnqcL1k53Xwrx7kqu338aTR+z7Te+hyDmJSVAbnH+yBcz5lzerUybhblGGE7sfkJ3Fz3NG1bMZHjU+3gE6Nq4fQWLZUsFxPE3ymVr6d/PLhSmFkz/kEVq1meF3rOZgeM8p+rS68ypsvb4NALoxLcLx2LQcjlCd5nnyF8NDjE6zvqOx4DVvEC9Ysye4k4vSfben30/By6mA9CAZrOqiBkOE6Pe7p1MPD2kBfGo3ce2OHsw3OSFe73DGvoSVNwZ89Ms391nHJPhotRJtdC8AlB8KCFX38ZCYElvVd6GKfv04vrHrPpSLBT3ZozYI4RnK+
X-MS-Exchange-AntiSpam-MessageData: 2knGk/lhiSDBLfVEG7p0Gewtp8omMkfE3scWuR+/HuuJOhjjlZkqIzDQKVVisdnCgG+519Dq90GIstvc/zU8uaEKzqfVK+93ZRGfMb95diSCoQqiOEeUSwVMv1aK84dGAUOToRglULVP5wZO/icr5w==
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1de89200-f5cd-4531-9b8b-08d7b0963424
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2020 15:05:46.5619 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5OgHvRSQiJaIqUR0iQv5SiJgQj0mFopLu5IxDzpYTxDmC7hHopdzG/PriGlsv9ctdMmatxPwkpEhdRPisGqssg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB4303
Cc: kvm@vger.kernel.org, mst@redhat.com, mhabets@solarflare.com,
 virtualization@lists.linux-foundation.org, rob.miller@broadcom.com,
 lulu@redhat.com, hanand@xilinx.com, hch@infradead.org, eperezma@redhat.com,
 haotian.wang@sifive.com, shahafs@mellanox.com, parav@mellanox.com,
 jiri@mellanox.com, xiao.w.wang@intel.com, stefanha@redhat.com,
 zhihong.wang@intel.com, rdunlap@infradead.org, linux-kernel@vger.kernel.org,
 maxime.coquelin@redhat.com, netdev@vger.kernel.org, lingshan.zhu@intel.com
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Linux virtualization <virtualization.lists.linux-foundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/virtualization>, 
 <mailto:virtualization-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/virtualization/>
List-Post: <mailto:virtualization@lists.linux-foundation.org>
List-Help: <mailto:virtualization-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/virtualization>, 
 <mailto:virtualization-request@lists.linux-foundation.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

T24gVGh1LCBGZWIgMTMsIDIwMjAgYXQgMTA6NTg6NDRQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90
ZToKPiAKPiBPbiAyMDIwLzIvMTMg5LiL5Y2IOTo0MSwgSmFzb24gR3VudGhvcnBlIHdyb3RlOgo+
ID4gT24gVGh1LCBGZWIgMTMsIDIwMjAgYXQgMTE6MzQ6MTBBTSArMDgwMCwgSmFzb24gV2FuZyB3
cm90ZToKPiA+IAo+ID4gPiA+ICAgIFlvdSBoYXZlIGRldiwgdHlwZSBvcgo+ID4gPiA+IGNsYXNz
IHRvIGNob29zZSBmcm9tLiBUeXBlIGlzIHJhcmVseSB1c2VkIGFuZCBkb2Vzbid0IHNlZW0gdG8g
YmUgdXNlZAo+ID4gPiA+IGJ5IHZkcGEsIHNvIGNsYXNzIHNlZW1zIHRoZSByaWdodCBjaG9pY2UK
PiA+ID4gPiAKPiA+ID4gPiBKYXNvbgo+ID4gPiBZZXMsIGJ1dCBteSB1bmRlcnN0YW5kaW5nIGlz
IGNsYXNzIGFuZCBidXMgYXJlIG11dHVhbGx5IGV4Y2x1c2l2ZS4gU28gd2UKPiA+ID4gY2FuJ3Qg
YWRkIGEgY2xhc3MgdG8gYSBkZXZpY2Ugd2hpY2ggaXMgYWxyZWFkeSBhdHRhY2hlZCBvbiBhIGJ1
cy4KPiA+IFdoaWxlIEkgc3VwcG9zZSB0aGVyZSBhcmUgdmFyaWF0aW9ucywgdHlwaWNhbGx5ICdj
bGFzcycgZGV2aWNlcyBhcmUKPiA+IHVzZXIgZmFjaW5nIHRoaW5ncyBhbmQgJ2J1cycgZGV2aWNl
cyBhcmUgaW50ZXJuYWwgZmFjaW5nIChpZSBsaWtlIGEKPiA+IFBDSSBkZXZpY2UpCj4gCj4gCj4g
VGhvdWdoIGFsbCB2RFBBIGRldmljZXMgaGF2ZSB0aGUgc2FtZSBwcm9ncmFtbWluZyBpbnRlcmZh
Y2UsIGJ1dCB0aGUKPiBzZW1hbnRpYyBpcyBkaWZmZXJlbnQuIFNvIGl0IGxvb2tzIHRvIG1lIHRo
YXQgdXNlIGJ1cyBjb21wbGllcyB3aGF0Cj4gY2xhc3MucnN0IHNhaWQ6Cj4gCj4gIgo+IAo+IEVh
Y2ggZGV2aWNlIGNsYXNzIGRlZmluZXMgYSBzZXQgb2Ygc2VtYW50aWNzIGFuZCBhIHByb2dyYW1t
aW5nIGludGVyZmFjZQo+IHRoYXQgZGV2aWNlcyBvZiB0aGF0IGNsYXNzIGFkaGVyZSB0by4gRGV2
aWNlIGRyaXZlcnMgYXJlIHRoZQo+IGltcGxlbWVudGF0aW9uIG9mIHRoYXQgcHJvZ3JhbW1pbmcg
aW50ZXJmYWNlIGZvciBhIHBhcnRpY3VsYXIgZGV2aWNlIG9uCj4gYSBwYXJ0aWN1bGFyIGJ1cy4K
PiAKPiAiCgpIZXJlIHdlIGFyZSB0YWxraW5nIGFib3V0IHRoZSAvZGV2L1hYIG5vZGUgdGhhdCBw
cm92aWRlcyB0aGUKcHJvZ3JhbW1pbmcgaW50ZXJmYWNlLiBBbGwgdGhlIHZkcGEgZGV2aWNlcyBo
YXZlIHRoZSBzYW1lIGJhc2ljCmNoYXJkZXYgaW50ZXJmYWNlIGFuZCBkaXNjb3ZlciBhbnkgc2Vt
YW50aWMgdmFyaWF0aW9ucyAnaW4gYmFuZCcKCj4gPiBTbyB3aHkgaXMgdGhpcyB1c2luZyBhIGJ1
cz8gVkRQQSBpcyBhIHVzZXIgZmFjaW5nIG9iamVjdCwgc28gdGhlCj4gPiBkcml2ZXIgc2hvdWxk
IGNyZWF0ZSBhIGNsYXNzIHZob3N0X3ZkcGEgZGV2aWNlIGRpcmVjdGx5LCBhbmQgdGhhdAo+ID4g
ZHJpdmVyIHNob3VsZCBsaXZlIGluIHRoZSBkcml2ZXJzL3Zob3N0LyBkaXJlY3RvcnkuCj4gIAo+
IFRoaXMgaXMgYmVjYXVzZSB3ZSB3YW50IHZEUEEgdG8gYmUgZ2VuZXJpYyBmb3IgYmVpbmcgdXNl
ZCBieSBkaWZmZXJlbnQKPiBkcml2ZXJzIHdoaWNoIGlzIG5vdCBsaW1pdGVkIHRvIHZob3N0LXZk
cGEuIEUuZyBpbiB0aGlzIHNlcmllcywgaXQgYWxsb3dzCj4gdkRQQSB0byBiZSB1c2VkIGJ5IGtl
cm5lbCB2aXJ0aW8gZHJpdmVycy4gQW5kIGluIHRoZSBmdXR1cmUsIHdlIHdpbGwKPiBwcm9iYWJs
eSBpbnRyb2R1Y2UgbW9yZSBkcml2ZXJzIGluIHRoZSBmdXR1cmUuCgpJIGRvbid0IHNlZSBob3cg
dGhhdCBjb25uZWN0cyB3aXRoIHVzaW5nIGEgYnVzLgoKRXZlcnkgY2xhc3Mgb2YgdmlydGlvIHRy
YWZmaWMgaXMgZ29pbmcgdG8gbmVlZCBhIHNwZWNpYWwgSFcgZHJpdmVyIHRvCmVuYWJsZSBWRFBB
LCB0aGF0IHNwZWNpYWwgZHJpdmVyIGNhbiBjcmVhdGUgdGhlIGNvcnJlY3Qgdmhvc3Qgc2lkZQpj
bGFzcyBkZXZpY2UuCgo+ID4gRm9yIHRoZSBQQ0kgVkYgY2FzZSB0aGlzIGRyaXZlciB3b3VsZCBi
aW5kIHRvIGEgUENJIGRldmljZSBsaWtlCj4gPiBldmVyeXRoaW5nIGVsc2UKPiA+IAo+ID4gRm9y
IG91ciBmdXR1cmUgU0YvQURJIGNhc2VzIHRoZSBkcml2ZXIgd291bGQgYmluZCB0byBzb21lCj4g
PiBTRi9BREkvd2hhdGV2ZXIgZGV2aWNlIG9uIGEgYnVzLgo+IAo+IEFsbCB0aGVzZSBkcml2ZXIg
d2lsbCBzdGlsbCBiZSBib3VuZCB0byB0aGVpciBvd24gYnVzIChQQ0kgb3Igb3RoZXIpLiBBbmQK
PiB3aGF0IHRoZSBkcml2ZXIgbmVlZHMgaXMgdG8gcHJlc2VudCBhIHZEUEEgZGV2aWNlIHRvIHZp
cnR1YWwgdkRQQSBidXMgb24KPiB0b3AuCgpBZ2FpbiwgSSBjYW4ndCBzZWUgYW55IHJlYXNvbiB0
byBpbmplY3QgYSAndmRwYSB2aXJ0dWFsIGJ1cycgb24KdG9wLiBUaGF0IHNlZW1zIGxpa2UgbWlz
LXVzaW5nIHRoZSBkcml2ZXIgY29yZS4KCkphc29uCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFs
aXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91
bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
