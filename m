Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id B193F15C3EF
	for <lists.virtualization@lfdr.de>; Thu, 13 Feb 2020 16:52:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 5A223859F1;
	Thu, 13 Feb 2020 15:52:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pB21gTzNqORv; Thu, 13 Feb 2020 15:52:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id A782685A67;
	Thu, 13 Feb 2020 15:52:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8ADBBC0177;
	Thu, 13 Feb 2020 15:52:07 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B992AC0177
 for <virtualization@lists.linux-foundation.org>;
 Thu, 13 Feb 2020 15:52:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id A7FBC85BA9
 for <virtualization@lists.linux-foundation.org>;
 Thu, 13 Feb 2020 15:52:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M6pnVc9+Wa1f
 for <virtualization@lists.linux-foundation.org>;
 Thu, 13 Feb 2020 15:52:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2079.outbound.protection.outlook.com [40.107.22.79])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 7B3D6857C3
 for <virtualization@lists.linux-foundation.org>;
 Thu, 13 Feb 2020 15:52:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WwKGxwjq2mdjBmhyCT+b6zakkOCkomtfy3Y/uM2DBTS3ioL9I5yW4dvNkm/VUJ6PGT/bvbly2WhsM4ieMy9ZSz+PpSMEcT9zb6i9PcOGcN+EPH85rqD4U92dg3+Qvr0f0MAMaCl7Yfw/zI35T/ebslXJ/b7i9i0iILmL7CVJdjo3s41Kk0oq2mFit8mjpYxZoYQ47BxGSsp56gsxcJ23t/nYJYSzyOboeQOkt6KNsCpY6u6WyIQcunjMsvBGdgiPdLJ5rsovpf8uwxOlNWcjHZfKOod1dCpKw1KowCqeIcEtpQGUk/r4GRvFT2RIQqgVGiydNXZg39gBxYShIUi9PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=//KczrXwWXzK/7f9S1HusaFzzirPOtrPtbT6BJ3ZVP8=;
 b=KcK0k92se9Kg9mX5BrF7jnmdJqkGlnI0nbU6GjFZFyohRwzoJL4wF8MCsm1UfdWQifzy53664zr8AEXcPe4gJXstzX46l4HCM5jCwbv4INv7k4XxD/janNX9aH/4YqcCe4eSq+NOLwXo/jcWM36zuWBngN7LN1xMP9Hq/G+RvSXyXTapPsJasR7lXzTnNnWkGcCzbgl4uewc45YOJf3fDNUTS6Qt/p0d8RG+CziT5cUAXNA4awpQrvZRUiBYw1461JieuJD1RazOfCpwyI3e7HSsBzIaVLAo6ZJkbYxPpx2TstCcFOtNOwFFi3DEjY2gGOlGlUIkeoRR+OljIQdGgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=//KczrXwWXzK/7f9S1HusaFzzirPOtrPtbT6BJ3ZVP8=;
 b=s740qDprh5u7bKpsTMgKULs9Gj6fu2FR0mzaCdJc1xewYjjo9VKmO6Xp6mQuRTyZ0Vrjq/0HMcO4uR/mqbyu0efhivnl49OdDc4OIIVjfMHUgjVXUT6yJgPX0UytWKUqLpIGkwWZCgwAe4M5dJqW1kzFmBTFun3wYDX04IPd1os=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=jgg@mellanox.com; 
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (52.133.14.15) by
 VI1PR05MB3278.eurprd05.prod.outlook.com (10.170.239.156) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2729.22; Thu, 13 Feb 2020 15:51:59 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::1c00:7925:d5c6:d60d]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::1c00:7925:d5c6:d60d%7]) with mapi id 15.20.2729.025; Thu, 13 Feb 2020
 15:51:58 +0000
Date: Thu, 13 Feb 2020 11:51:54 -0400
From: Jason Gunthorpe <jgg@mellanox.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH V2 3/5] vDPA: introduce vDPA bus
Message-ID: <20200213155154.GX4271@mellanox.com>
References: <20200210035608.10002-1-jasowang@redhat.com>
 <20200210035608.10002-4-jasowang@redhat.com>
 <20200211134746.GI4271@mellanox.com>
 <cf7abcc9-f8ef-1fe2-248e-9b9028788ade@redhat.com>
 <20200212125108.GS4271@mellanox.com>
 <12775659-1589-39e4-e344-b7a2c792b0f3@redhat.com>
 <20200213134128.GV4271@mellanox.com>
 <ebaea825-5432-65e2-2ab3-720a8c4030e7@redhat.com>
 <20200213150542.GW4271@mellanox.com>
 <20200213103714-mutt-send-email-mst@kernel.org>
Content-Disposition: inline
In-Reply-To: <20200213103714-mutt-send-email-mst@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: MN2PR15CA0020.namprd15.prod.outlook.com
 (2603:10b6:208:1b4::33) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:44::15)
MIME-Version: 1.0
Received: from mlx.ziepe.ca (142.68.57.212) by
 MN2PR15CA0020.namprd15.prod.outlook.com (2603:10b6:208:1b4::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2729.23 via Frontend
 Transport; Thu, 13 Feb 2020 15:51:58 +0000
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)	(envelope-from
 <jgg@mellanox.com>)	id 1j2GmQ-0005eB-SB; Thu, 13 Feb 2020 11:51:54 -0400
X-Originating-IP: [142.68.57.212]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 1f81508b-e3b9-41c0-6e98-08d7b09ca87a
X-MS-TrafficTypeDiagnostic: VI1PR05MB3278:|VI1PR05MB3278:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR05MB327810783AA414DF6A22D69ACF1A0@VI1PR05MB3278.eurprd05.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 031257FE13
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(366004)(376002)(136003)(39860400002)(396003)(199004)(189003)(7416002)(1076003)(9786002)(4326008)(2616005)(9746002)(36756003)(478600001)(86362001)(33656002)(66476007)(81156014)(8936002)(52116002)(8676002)(26005)(66946007)(316002)(81166006)(5660300002)(186003)(66556008)(2906002)(6916009)(24400500001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB3278;
 H:VI1PR05MB4141.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VDrOmCQPbhG6OMaA30BTqTP/4l7SRhA4OM9iPTfxKcaIo6L77coKcFcOgoBUXpDN+Lc8MQOA2aM11/T4vlfTb36xiLOuy/CdzBR0oFwIkL+IvkYRuqqZpeFZd8z8LvbjSmafLwchhzoaNisejZQCDTwRH5M3HarbDxwOrHR1yJuypZXz9BCEyovOZXrR9kD47m9sn44s+1XZePHPGEZd8YpEP0jKcUv9uCO6d8CHWTYxVHR1x7zDgaUTEbyj0wN1kgbNkKc9Ikjf50viyA/Zk3OlOmu5mFNWkHaUnBUzgLqrbpA62VBTovzUXRkCmBCA4PlYYSj5XRqVD0DPmELKjIRIy/4h9FC2Il11QTIehfViRQS9gYMWHdRepRSHabS+vllAlEKTQcrqE4z96x1nRaNvT/DXbholOGH2yHA74G2g2fI38a4SZ8Pcl79s0xYRRZOYqYq78dmiBXuKpG/SvE68a87N68RkTwnP8/IGEH0KNT68Rc5DI3BEijMnbwni
X-MS-Exchange-AntiSpam-MessageData: Qh++IUh2Ir+bpDxJTgnzfj+6h+Ord0RqJxQLFngvzxjrnAuzqjXJPbo+F9UBsZafY5hSfeZ3n+Bm+4+dnA99yjdNqtFKGOAAkdSRHnbVHiv0H+BnaPWsJD/RtGS+GrDC9klDfAaxGrbxsj/tw2k5Sg==
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f81508b-e3b9-41c0-6e98-08d7b09ca87a
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2020 15:51:58.5916 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tDA8g3Wn8CQpdW0mHz1caFOR6pJjN6jMUZXPolgv0Bf0JxHqdm3bAf6WLAxqS/rEe8FEZrPuoNPt9lmO+jYh+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB3278
Cc: kvm@vger.kernel.org, virtualization@lists.linux-foundation.org,
 rob.miller@broadcom.com, lulu@redhat.com, hanand@xilinx.com, hch@infradead.org,
 eperezma@redhat.com, haotian.wang@sifive.com, mhabets@solarflare.com,
 shahafs@mellanox.com, parav@mellanox.com, jiri@mellanox.com,
 xiao.w.wang@intel.com, stefanha@redhat.com, zhihong.wang@intel.com,
 rdunlap@infradead.org, linux-kernel@vger.kernel.org,
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

T24gVGh1LCBGZWIgMTMsIDIwMjAgYXQgMTA6NDE6MDZBTSAtMDUwMCwgTWljaGFlbCBTLiBUc2ly
a2luIHdyb3RlOgo+IE9uIFRodSwgRmViIDEzLCAyMDIwIGF0IDExOjA1OjQyQU0gLTA0MDAsIEph
c29uIEd1bnRob3JwZSB3cm90ZToKPiA+IE9uIFRodSwgRmViIDEzLCAyMDIwIGF0IDEwOjU4OjQ0
UE0gKzA4MDAsIEphc29uIFdhbmcgd3JvdGU6Cj4gPiA+IAo+ID4gPiBPbiAyMDIwLzIvMTMg5LiL
5Y2IOTo0MSwgSmFzb24gR3VudGhvcnBlIHdyb3RlOgo+ID4gPiA+IE9uIFRodSwgRmViIDEzLCAy
MDIwIGF0IDExOjM0OjEwQU0gKzA4MDAsIEphc29uIFdhbmcgd3JvdGU6Cj4gPiA+ID4gCj4gPiA+
ID4gPiA+ICAgIFlvdSBoYXZlIGRldiwgdHlwZSBvcgo+ID4gPiA+ID4gPiBjbGFzcyB0byBjaG9v
c2UgZnJvbS4gVHlwZSBpcyByYXJlbHkgdXNlZCBhbmQgZG9lc24ndCBzZWVtIHRvIGJlIHVzZWQK
PiA+ID4gPiA+ID4gYnkgdmRwYSwgc28gY2xhc3Mgc2VlbXMgdGhlIHJpZ2h0IGNob2ljZQo+ID4g
PiA+ID4gPiAKPiA+ID4gPiA+ID4gSmFzb24KPiA+ID4gPiA+IFllcywgYnV0IG15IHVuZGVyc3Rh
bmRpbmcgaXMgY2xhc3MgYW5kIGJ1cyBhcmUgbXV0dWFsbHkgZXhjbHVzaXZlLiBTbyB3ZQo+ID4g
PiA+ID4gY2FuJ3QgYWRkIGEgY2xhc3MgdG8gYSBkZXZpY2Ugd2hpY2ggaXMgYWxyZWFkeSBhdHRh
Y2hlZCBvbiBhIGJ1cy4KPiA+ID4gPiBXaGlsZSBJIHN1cHBvc2UgdGhlcmUgYXJlIHZhcmlhdGlv
bnMsIHR5cGljYWxseSAnY2xhc3MnIGRldmljZXMgYXJlCj4gPiA+ID4gdXNlciBmYWNpbmcgdGhp
bmdzIGFuZCAnYnVzJyBkZXZpY2VzIGFyZSBpbnRlcm5hbCBmYWNpbmcgKGllIGxpa2UgYQo+ID4g
PiA+IFBDSSBkZXZpY2UpCj4gPiA+IAo+ID4gPiAKPiA+ID4gVGhvdWdoIGFsbCB2RFBBIGRldmlj
ZXMgaGF2ZSB0aGUgc2FtZSBwcm9ncmFtbWluZyBpbnRlcmZhY2UsIGJ1dCB0aGUKPiA+ID4gc2Vt
YW50aWMgaXMgZGlmZmVyZW50LiBTbyBpdCBsb29rcyB0byBtZSB0aGF0IHVzZSBidXMgY29tcGxp
ZXMgd2hhdAo+ID4gPiBjbGFzcy5yc3Qgc2FpZDoKPiA+ID4gCj4gPiA+ICIKPiA+ID4gCj4gPiA+
IEVhY2ggZGV2aWNlIGNsYXNzIGRlZmluZXMgYSBzZXQgb2Ygc2VtYW50aWNzIGFuZCBhIHByb2dy
YW1taW5nIGludGVyZmFjZQo+ID4gPiB0aGF0IGRldmljZXMgb2YgdGhhdCBjbGFzcyBhZGhlcmUg
dG8uIERldmljZSBkcml2ZXJzIGFyZSB0aGUKPiA+ID4gaW1wbGVtZW50YXRpb24gb2YgdGhhdCBw
cm9ncmFtbWluZyBpbnRlcmZhY2UgZm9yIGEgcGFydGljdWxhciBkZXZpY2Ugb24KPiA+ID4gYSBw
YXJ0aWN1bGFyIGJ1cy4KPiA+ID4gCj4gPiA+ICIKPiA+IAo+ID4gSGVyZSB3ZSBhcmUgdGFsa2lu
ZyBhYm91dCB0aGUgL2Rldi9YWCBub2RlIHRoYXQgcHJvdmlkZXMgdGhlCj4gPiBwcm9ncmFtbWlu
ZyBpbnRlcmZhY2UuIEFsbCB0aGUgdmRwYSBkZXZpY2VzIGhhdmUgdGhlIHNhbWUgYmFzaWMKPiA+
IGNoYXJkZXYgaW50ZXJmYWNlIGFuZCBkaXNjb3ZlciBhbnkgc2VtYW50aWMgdmFyaWF0aW9ucyAn
aW4gYmFuZCcKPiA+IAo+ID4gPiA+IFNvIHdoeSBpcyB0aGlzIHVzaW5nIGEgYnVzPyBWRFBBIGlz
IGEgdXNlciBmYWNpbmcgb2JqZWN0LCBzbyB0aGUKPiA+ID4gPiBkcml2ZXIgc2hvdWxkIGNyZWF0
ZSBhIGNsYXNzIHZob3N0X3ZkcGEgZGV2aWNlIGRpcmVjdGx5LCBhbmQgdGhhdAo+ID4gPiA+IGRy
aXZlciBzaG91bGQgbGl2ZSBpbiB0aGUgZHJpdmVycy92aG9zdC8gZGlyZWN0b3J5Lgo+ID4gPiAg
Cj4gPiA+IFRoaXMgaXMgYmVjYXVzZSB3ZSB3YW50IHZEUEEgdG8gYmUgZ2VuZXJpYyBmb3IgYmVp
bmcgdXNlZCBieSBkaWZmZXJlbnQKPiA+ID4gZHJpdmVycyB3aGljaCBpcyBub3QgbGltaXRlZCB0
byB2aG9zdC12ZHBhLiBFLmcgaW4gdGhpcyBzZXJpZXMsIGl0IGFsbG93cwo+ID4gPiB2RFBBIHRv
IGJlIHVzZWQgYnkga2VybmVsIHZpcnRpbyBkcml2ZXJzLiBBbmQgaW4gdGhlIGZ1dHVyZSwgd2Ug
d2lsbAo+ID4gPiBwcm9iYWJseSBpbnRyb2R1Y2UgbW9yZSBkcml2ZXJzIGluIHRoZSBmdXR1cmUu
Cj4gPiAKPiA+IEkgZG9uJ3Qgc2VlIGhvdyB0aGF0IGNvbm5lY3RzIHdpdGggdXNpbmcgYSBidXMu
Cj4gPiAKPiA+IEV2ZXJ5IGNsYXNzIG9mIHZpcnRpbyB0cmFmZmljIGlzIGdvaW5nIHRvIG5lZWQg
YSBzcGVjaWFsIEhXIGRyaXZlciB0bwo+ID4gZW5hYmxlIFZEUEEsIHRoYXQgc3BlY2lhbCBkcml2
ZXIgY2FuIGNyZWF0ZSB0aGUgY29ycmVjdCB2aG9zdCBzaWRlCj4gPiBjbGFzcyBkZXZpY2UuCj4g
Cj4gVGhhdCdzIGp1c3QgYSB0b24gb2YgdXNlbGVzcyBjb2RlIGR1cGxpY2F0aW9uLCBhbmQgYSBn
b29kIGNoYW5jZQo+IHRvIGhhdmUgbWlub3IgdmFyaWF0aW9ucyBpbiBpbXBsZW1lbnRhdGlvbnMg
Y29uZnVzaW5nCj4gdXNlcnNwYWNlLgoKV2hhdD8gV2h5PyBUaGlzIGlzIGhvdyBhbG1vc3QgZXZl
cnkgdXNlciBvZiB0aGUgZHJpdmVyIGNvcmUgd29ya3MuCgpJIGRvbid0IHNlZSBob3cgeW91IGdl
dCBhbnkgZHVwbGljYXRpb24gdW5sZXNzIHRoZSBzdWJzeXN0ZW0gY29yZSBpcwpiYWRseSBkb25l
IHdyb25nLgoKVGhlICdjbGFzcycgaXMgc3VwcG9zZWQgdG8gcHJvdmlkZSBhbGwgdGhlIGxpYnJh
cnkgZnVuY3Rpb25zIHRvIHJlbW92ZQp0aGlzIGR1cGxpY2F0aW9uLiBJbnN0ZWFkIG9mIHBsdWdn
aW5nIHRoZSBIVyBkcml2ZXIgaW4gdmlhIHNvbWUgYnVzCnNjaGVtZSBldmVyeSBzdWJzeXN0ZW0g
aGFzIGl0cyBvd24gJ29wcycgdGhhdCB0aGUgSFcgZHJpdmVyIHByb3ZpZGVzCnRvIHRoZSBzdWJz
eXN0ZW0ncyBjbGFzcyB2aWEgc3Vic3lzdGVtX3JlZ2lzdGVyKCkKClRoaXMgaXMgdGhlICpzdGFu
ZGFyZCogcGF0dGVybiB0byB1c2UgdGhlIGRyaXZlciBjb3JlLgoKVGhpcyBpcyBhbG1vc3QgdGhl
cmUsIGl0IGp1c3QgaGFzIHRoaXMgZXh0cmEgYnVzIHBhcnQgdG8gY29udmV5IHRoZSBIVwpvcHMg
aW5zdGVhZCBvZiBkaXJlY3RseS4KCj4gSW5zdGVhZCwgZWFjaCBkZXZpY2UgaW1wbGVtZW50IHRo
ZSBzYW1lIGludGVyZmFjZSwgYW5kIHRoZW4KPiB2aG9zdCBzaXRzIG9uIHRvcC4KClN1cmUsIGJ1
dCBwbHVnZ2luZyBpbiB2aWEgb3BzL2V0YyBub3QgdmlhIGEgYnVzIGFuZCBhbm90aGVyIHN0cnVj
dApkZXZpY2UuCgo+IFRoYXQgYnVzIGlzIGV4YWN0bHkgd2hhdCBHcmVnIEtIIHByb3Bvc2VkLiBU
aGVyZSBhcmUgb3RoZXIgd2F5cwo+IHRvIHNvbHZlIHRoaXMgSSBndWVzcyBidXQgdGhpcyBiaWtl
c2hlZGRpbmcgaXMgZ2V0dGluZyB0aXJpbmcuCgpUaGlzIGRpc2N1c3Npb24gd2FzIGZvciBhIGRp
ZmZlcmVudCBnb2FsLCBJTUhPLgoKPiBDb21lIG9uIGl0J3MgYW4gaW50ZXJuYWwga2VybmVsIGlu
dGVyZmFjZSwgaWYgd2UgZmVlbAo+IGl0IHdhcyBhIHdyb25nIGRpcmVjdGlvbiB0byB0YWtlIHdl
IGNhbiBjaGFuZ2Ugb3VyIG1pbmRzIGxhdGVyLgo+IE1haW4gdGhpbmcgaXMgZ2V0dGluZyBVQVBJ
IHJpZ2h0LgoKVGhpcyBkaXNjdXNzaW9uIHN0YXJ0ZWQgYmVjYXVzZSB0aGUgcmVmY291bnRpbmcg
aGFzIGJlZW4gYnVzdGVkIHVwIGluCmV2ZXJ5IHZlcnNpb24gcG9zdGVkIHNvIGZhci4gSXQgaXMg
bm90IGJpa2VzaGVkZGluZyB3aGVuIHRoZXNlIGJ1Z3MKYXJlIGFjdHVhbGx5IGJlaW5nIGNhdXNl
ZCBieSB0cnlpbmcgdG8gYWJ1c2UgdGhlIGRyaXZlciBjb3JlIGFuZApzaG9laG9ybiBpbiBhIGJ1
cyB0aGF0IGlzbid0IG5lZWRlZCB3aGVuIGEgY2xhc3MgaXMgdGhlIGNvcnJlY3QgdGhpbmcKdG8g
dXNlLgoKSmFzb24KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4
LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
