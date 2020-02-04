Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 21BFE151ACB
	for <lists.virtualization@lfdr.de>; Tue,  4 Feb 2020 13:52:19 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id BF00B85497;
	Tue,  4 Feb 2020 12:52:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iKbMijLMqkqM; Tue,  4 Feb 2020 12:52:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id A2C26852C7;
	Tue,  4 Feb 2020 12:52:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7F7DEC1D87;
	Tue,  4 Feb 2020 12:52:16 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C5BD2C0174
 for <virtualization@lists.linux-foundation.org>;
 Tue,  4 Feb 2020 12:52:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id AB6A3203E3
 for <virtualization@lists.linux-foundation.org>;
 Tue,  4 Feb 2020 12:52:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pa+RFW-Otr0x
 for <virtualization@lists.linux-foundation.org>;
 Tue,  4 Feb 2020 12:52:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70042.outbound.protection.outlook.com [40.107.7.42])
 by silver.osuosl.org (Postfix) with ESMTPS id 624802038B
 for <virtualization@lists.linux-foundation.org>;
 Tue,  4 Feb 2020 12:52:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hunt6rBe5ULWjDyCI35n3UJUQlpG9OrIt8B4HTj8A/6CNhKX+M1fJA3fg1/UlTgGuPY+rUNsxyjJsBPP/ZDf1/HIbk5+Afd9CTSYMhEOt3VBV7ER/j94iYoqEYNaxzCiPOFUyUTWYzJTA5Dn/j7KLhuAxZzZypioYPis1vHuoXui0pdzLDhD3A1beUHeiNfqtFCj6zFX53WZ0x8WAeyHQv3gFp0T9GnxyprHRO7GrNH6YLJgy0w6mTDPkY41LbdqnfQe0V0HNQz9So2jrUQk8RSZNFjbcmm0KBETnkAwAyO20IcDeHVxc4/71W8dwD1EG3GMKKI69l4sChtdM9IShg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mpC4kyVFwC3rB+vTbnM6pkI+Hr9jmeheaKUwckA2Hcg=;
 b=gjRV4Hbw7onbeJk9nKyGW+Uq8b7uggDcpvhboqbndYdi7rkLGVuHj4RuQ8E24asmPVebCluUYvSfOZFOR82u9ARdF0GZfXEMGNXjL/+OP1zD4D1X6LTHznf8DExHOpVVlEjr8OWPGbhOabGzZGzr6ZQv8jPpFDyWuwNKlv11iSHJ5+HYp6wdljI/Z59WxLWshEH+Jm/tlcbb22SQXrPvvk5HYFAkhJnUntCWNHGFhhrBzg2tt1Mq0WDLOzwExzS1czfQ5mAn6HM0JI5s4/XwzUNz5fVo+2aJO60PZMfm90NZR0rX4PFDQAj424lQC25mi/VmgNOrfcWpuP0qf0WMoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mpC4kyVFwC3rB+vTbnM6pkI+Hr9jmeheaKUwckA2Hcg=;
 b=FrmDGmLPgPi0FyJS7/DaY3IN2yXHT6wgBEs9vOgf+BXGG8HJunKkI+Onmmdz5zNE5knKPgmD9dTQueKNkA6+6o+RkP8AFzZ1PgUWEq1q4p2vYoqYFTz15x9sprMuJTle5LsttU6tK0A7es+NnTLaHG8h1crqfrrMmyu9rEz6QQg=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=jgg@mellanox.com; 
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (52.133.14.15) by
 VI1PR05MB5277.eurprd05.prod.outlook.com (20.178.9.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2686.27; Tue, 4 Feb 2020 12:52:08 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::1c00:7925:d5c6:d60d]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::1c00:7925:d5c6:d60d%7]) with mapi id 15.20.2686.031; Tue, 4 Feb 2020
 12:52:08 +0000
Date: Tue, 4 Feb 2020 08:52:04 -0400
From: Jason Gunthorpe <jgg@mellanox.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH 5/5] vdpasim: vDPA device simulator
Message-ID: <20200204125204.GS23346@mellanox.com>
References: <20200116124231.20253-1-jasowang@redhat.com>
 <20200116124231.20253-6-jasowang@redhat.com>
 <1b86d188-0666-f6ab-e3b3-bec1cfbd0c76@linux.intel.com>
 <cca7901b-51dd-4f4b-5c30-c42577ad5194@redhat.com>
Content-Disposition: inline
In-Reply-To: <cca7901b-51dd-4f4b-5c30-c42577ad5194@redhat.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: MN2PR05CA0003.namprd05.prod.outlook.com
 (2603:10b6:208:c0::16) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:44::15)
MIME-Version: 1.0
Received: from mlx.ziepe.ca (142.68.57.212) by
 MN2PR05CA0003.namprd05.prod.outlook.com (2603:10b6:208:c0::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2707.9 via Frontend Transport; Tue, 4 Feb 2020 12:52:07 +0000
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)	(envelope-from
 <jgg@mellanox.com>)	id 1iyxgS-0001Mu-BA; Tue, 04 Feb 2020 08:52:04 -0400
X-Originating-IP: [142.68.57.212]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: e1e6986e-e8ef-4d48-fd46-08d7a9710b22
X-MS-TrafficTypeDiagnostic: VI1PR05MB5277:|VI1PR05MB5277:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR05MB527710630800F2D39D9A8313CF030@VI1PR05MB5277.eurprd05.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-Forefront-PRVS: 03030B9493
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(346002)(396003)(136003)(376002)(39860400002)(199004)(189003)(66946007)(66476007)(33656002)(66556008)(86362001)(8936002)(1076003)(478600001)(5660300002)(186003)(26005)(316002)(4326008)(2616005)(52116002)(9746002)(7416002)(9786002)(8676002)(6916009)(81156014)(81166006)(2906002)(36756003)(24400500001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB5277;
 H:VI1PR05MB4141.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XDISqpoPOpohiCFsSvYYY08kahaUNrwILL4J0MuhX8aLG8S9Y4/Popl13wQ/DsZcjmSmxh/QRpguSLLVn5uCEAS48JtE/rPoWvviSAfxsJLYYM2knNI1MkCJUjwpgCYZBRS2XkEyvWwYOiHg6yT2KrmGO089BHXLVz9EAQDBS8MON0iLsGjF1utTdeAZlsgrZylfI45x6tQmryGNDX23APC182Cn93uSGSXa8f6NP2n7p87Mqzf3rUIfGXxVXtxtqxEj1hH0FyO+4kvJouSdQdDzJUVdS59YWtHlFLBGJUdfo2pLulXw2O4a27Gtlj7z2GeoxDS9AkpvKNNaW7HHMMJkjPBSXXKTGTyVs5BrKS2Tjgaajc4yc+JI5ba/CW7+//7Z/mKYkIkcuk+JzTe645jvNDK1b1wrR9evemWKGlwbYEp0+CM5I35KBJBoJbOAkIW+HdG62GM+Z0gTNXqNJbUqfulH7jc6dUImhL/DuPTZRs6WIuh3VPYngZNiyDC5
X-MS-Exchange-AntiSpam-MessageData: YjcQgx1HsdIJVIig40XIush/QH2MeDhlC6P9RL2dVyQ0pEdat2Fq/nWP7KYXfzYFJ17YLUQYp4SaWVW9+gN6HY3WyyMxXNXThLoU6wqfNj1Y49R9Ad2ynODCy+PxnvqfIqOykiOTNbSZaH7IF5W8ug==
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1e6986e-e8ef-4d48-fd46-08d7a9710b22
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2020 12:52:08.1104 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HdXM5URTq/Pcq3bZwIiYkzxVTDdoYEq3DpCJnMoYQqo5TsX+hHFCC0pIDxUgEq9pv/+gNYCgzfrljqUby2nrUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB5277
Cc: jakub.kicinski@netronome.com, kvm@vger.kernel.org, mst@redhat.com,
 mhabets@solarflare.com, virtualization@lists.linux-foundation.org,
 rob.miller@broadcom.com, lulu@redhat.com, hanand@xilinx.com, hch@infradead.org,
 eperezma@redhat.com, haotian.wang@sifive.com, shahafs@mellanox.com,
 parav@mellanox.com, jiri@mellanox.com, xiao.w.wang@intel.com,
 stefanha@redhat.com, zhihong.wang@intel.com, rdunlap@infradead.org,
 linux-kernel@vger.kernel.org, maxime.coquelin@redhat.com,
 Zhu Lingshan <lingshan.zhu@linux.intel.com>, netdev@vger.kernel.org,
 lingshan.zhu@intel.com
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

T24gVHVlLCBGZWIgMDQsIDIwMjAgYXQgMDQ6Mjg6MjdQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90
ZToKPiAKPiBPbiAyMDIwLzIvNCDkuIvljYg0OjIxLCBaaHUgTGluZ3NoYW4gd3JvdGU6Cj4gPiA+
ICtzdGF0aWMgY29uc3Qgc3RydWN0IGRtYV9tYXBfb3BzIHZkcGFzaW1fZG1hX29wcyA9IHsKPiA+
ID4gK8KgwqDCoCAubWFwX3BhZ2UgPSB2ZHBhc2ltX21hcF9wYWdlLAo+ID4gPiArwqDCoMKgIC51
bm1hcF9wYWdlID0gdmRwYXNpbV91bm1hcF9wYWdlLAo+ID4gPiArwqDCoMKgIC5hbGxvYyA9IHZk
cGFzaW1fYWxsb2NfY29oZXJlbnQsCj4gPiA+ICvCoMKgwqAgLmZyZWUgPSB2ZHBhc2ltX2ZyZWVf
Y29oZXJlbnQsCj4gPiA+ICt9Owo+ID4gPiArCj4gPiAKPiA+IEhleSBKYXNvbiwKPiA+IAo+ID4g
SU1ITywgaXQgd291bGQgYmUgbmljZSBpZiBkbWFfb3BzIG9mIHRoZSBwYXJlbnQgZGV2aWNlIGNv
dWxkIGJlIHJlLXVzZWQuCj4gPiB2ZHBhX2RldmljZSBpcyBleHBlY3RpbmcgdG8gcmVwcmVzZW50
IGEgcGh5c2ljYWwgZGV2aWNlIGV4Y2VwdCB0aGlzCj4gPiBzaW11bGF0b3IsIGhvd2V2ZXIsIHRo
ZXJlIGFyZSBub3QgZW5vdWdoIGluZm9ybWF0aW9uIGluIHZkcGFfZGV2aWNlLmRldgo+ID4gdG8g
aW5kaWNhdGluZyB3aGljaCBraW5kIHBoeXNpY2FsIGRldmljZSBpdCBhdHRhY2hlZCB0by4gTmFt
ZWx5Cj4gPiBnZXRfYXJjaF9kbWFfb3BzKHN0cnVjdCBidXMgdHlwZSkgY2FuIG5vdCB3b3JrIG9u
IHZkcGFfZGV2aWNlLmRldi4gVGhlbgo+ID4gaXQgc2VlbXMgZGV2aWNlIGRyaXZlcnMgbmVlZCB0
byBpbXBsZW1lbnQgYSB3cmFwIG9mIGRtYV9vcHMgb2YgcGFyZW50Cj4gPiBkZXZpY2VzLiBDYW4g
dGhpcyB3b3JrIGJlIGRvbmUgaW4gdGhlIHZkcGEgZnJhbWV3b3JrIHNpbmNlIGl0IGxvb2tzIGxp
a2UKPiA+IGEgY29tbW9uIHRhc2s/IENhbiAidmRfZGV2LT52ZGV2LmRldi5wYXJlbnQgPSB2ZHBh
LT5kZXYtPnBhcmVudDsiIGluCj4gPiB2aXJ0aW9fdmRwYV9wcm9iZSgpIGRvIHRoZSB3b3JrPwo+
ID4gCj4gPiBUaGFua3MsCj4gPiBCUgo+ID4gWmh1IExpbmdzaGFuCj4gCj4gCj4gR29vZCBjYXRj
aC4KPiAKPiBJIHRoaW5rIHdlIGNhbi4KCklNSE8geW91IG5lZWQgdG8gc3BlY2lmeSBzb21lICdk
bWFfZGV2aWNlJywgbm90IHRyeSBhbmQgcGxheSB0cmlja3MKd2l0aCBkbWFfb3BzLCBvciBhc3N1
bWluZyB0aGUgcGFyZW50IGlzIGFsd2F5cyB0aGUgZGV2aWNlIHVzZWQgZm9yCmRtYS4KCkphc29u
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxp
emF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9u
Lm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92
aXJ0dWFsaXphdGlvbg==
