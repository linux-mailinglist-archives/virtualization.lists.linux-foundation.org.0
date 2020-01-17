Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 910FB140DD9
	for <lists.virtualization@lfdr.de>; Fri, 17 Jan 2020 16:29:15 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 161F888020;
	Fri, 17 Jan 2020 15:29:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1f7Y1H0Ob3LZ; Fri, 17 Jan 2020 15:29:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 5544B87E8B;
	Fri, 17 Jan 2020 15:29:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 44082C077D;
	Fri, 17 Jan 2020 15:29:13 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9BE99C077D
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Jan 2020 15:29:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 96D868691C
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Jan 2020 15:29:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TF-6qxNpsWAq
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Jan 2020 15:29:10 +0000 (UTC)
X-Greylist: delayed 01:34:24 by SQLgrey-1.7.6
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2086.outbound.protection.outlook.com [40.107.22.86])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 7EC5186918
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Jan 2020 15:29:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kq6SapTg671vBvVdxL/ezPXuKG32HUqSyNRYOYFV+UbJCTR7g3f6HKA7sVPw882BoxrxN8oDeHA19HkZVSwUpBK2QXjeKtclbph2cAhqfp2Kqrp0iSUqFjTkUte//PwhASBy7S0LIf7gZKeT5ZpPhUCKgIOAaE5ZfTfkR4Bjap4VZdwzh95KxRzmxg9p7E54JGzKYseMxZT8aHVRKFc+lYuk6R9cYhdh9jqEKpFXY4hgA/ATVkUR9L7yjQmKt80TnJuICCq3Zg8G3IkUcyrtnX9yjbsVFyrNRHFOh8tA3qgRfMM+W05Y61sl8Y201P7RjPsAaXzuzmfDh5AO5m59FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qeFNHna6h6ST80RmV+ePhP5L6u83cafe/GrbU0SYJoo=;
 b=l0w6T9EknYjyRiSgHD/uDqn4YObKzUPgdhkeKvqUn0Qcft/ZvCjq4/PuQ2Z/aj+9DqmNDTQ1RwphAGg+mM9ymwjlb/q7YPyylSj+N7T0GjEzgIMlzz+1CvQaV7EcVIf1GY7H6pI8OqoDbBi3Q5ThAKmA0GLZ6LGmbJPnDEWt3RihjfZ6S7NcX1FEKIPLzl+khy4tAr6kdtsbbhm6tw39KfGQ53TNFLG4I4n0piqmEcEbyFJ+PlQnlPaGiEBB+ygTbmFU8QiwlWYFIssK8dbs2UaVg+Pan3HXWcssqIaRzYrrB71VrOj1ljY6ov/YlNCvKk9kKzAxJEK0JuRSoDucHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qeFNHna6h6ST80RmV+ePhP5L6u83cafe/GrbU0SYJoo=;
 b=Kpx1QyPYKbDIcLY68HeCKX+Bxak3jZYIR/iL1hcLqGUuE7oOUsdTY/XzURd8Z5fiFnEi/EJMH8x3FSrBaE4Hs3yG2mkjK2c9pSe9MaRZKtFsC79Qvt042F/SE3xXv902B+RgWoHNvhCua30ZcGHGucfsCg1+3NCa0pAFGBgiMSo=
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (52.133.14.15) by
 VI1PR05MB5614.eurprd05.prod.outlook.com (20.177.202.212) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2644.23; Fri, 17 Jan 2020 13:54:43 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::1c00:7925:d5c6:d60d]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::1c00:7925:d5c6:d60d%7]) with mapi id 15.20.2644.015; Fri, 17 Jan 2020
 13:54:43 +0000
Received: from mlx.ziepe.ca (142.68.57.212) by
 BL0PR02CA0016.namprd02.prod.outlook.com (2603:10b6:207:3c::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2644.20 via Frontend Transport; Fri, 17 Jan 2020 13:54:42 +0000
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)	(envelope-from
 <jgg@mellanox.com>)	id 1isS55-00081m-FY; Fri, 17 Jan 2020 09:54:35 -0400
From: Jason Gunthorpe <jgg@mellanox.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH 3/5] vDPA: introduce vDPA bus
Thread-Topic: [PATCH 3/5] vDPA: introduce vDPA bus
Thread-Index: AQHVzGqUgTlkW8H4N0+zRVK4Lh0XAKftaJqAgADD3wCAALX/gA==
Date: Fri, 17 Jan 2020 13:54:42 +0000
Message-ID: <20200117135435.GU20978@mellanox.com>
References: <20200116124231.20253-1-jasowang@redhat.com>
 <20200116124231.20253-4-jasowang@redhat.com>
 <20200116152209.GH20978@mellanox.com>
 <03cfbcc2-fef0-c9d8-0b08-798b2a293b8c@redhat.com>
In-Reply-To: <03cfbcc2-fef0-c9d8-0b08-798b2a293b8c@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BL0PR02CA0016.namprd02.prod.outlook.com
 (2603:10b6:207:3c::29) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:44::15)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=jgg@mellanox.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [142.68.57.212]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: aedb548b-06b4-4213-534a-08d79b54cd93
x-ms-traffictypediagnostic: VI1PR05MB5614:|VI1PR05MB5614:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR05MB56146BA30B9DE850DDCB44B2CF310@VI1PR05MB5614.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0285201563
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(136003)(396003)(39850400004)(366004)(199004)(189003)(52116002)(9786002)(316002)(9746002)(54906003)(71200400001)(33656002)(66446008)(66946007)(26005)(478600001)(186003)(4326008)(64756008)(66476007)(66556008)(7416002)(2616005)(2906002)(5660300002)(8676002)(36756003)(86362001)(81166006)(81156014)(6666004)(6916009)(8936002)(1076003)(24400500001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB5614;
 H:VI1PR05MB4141.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PBUcIDlehyVAJNh6fif5YoeBiKXJo2JaF3Za15BlcxNxJzVsss+roQF1TUjUt+aAEw5l8eu3pTiBoviwagBOGB2Z4Pb8EWCGsU4oaqte+a1Y0OVz/4LiPNf3ly++UNYhCnfJdEmguTHotVdAyy54LzA25/Cpjo04QlYmZ/jzho5orw+8Hweg+XP3SLnAzxUjbDskjaetrF3ltpAb8zhKVGmMqyCXtswhgP0Yxa8kzDC5JnAeYE+MQkYAORSrCZ7NjIjB68TFg04owkl/QyrdWa+lRu6ETT+iP8hOuEQP9gtvSWJgLvlsl7+G42+QkPtikOtcKZZzwjbQKoTVHnr5hPheq95TXdC3MSHNRAgz8fGNV8LI56IdzP+qYHwRT1XLwQiAAeq/5mQOAQORpXIRrRa3JH0BXUBsVn43ILkeodb6xaMNWDRP/FVTkyf7zf93P8jau/ZL3HbL62uMCwD9lMu0Wcyu9VmruP9kKkpBw+xz3VeVqykgj4dh3ystDrP0
Content-ID: <6C36226D304AFC44B0802650322CDA8F@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aedb548b-06b4-4213-534a-08d79b54cd93
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jan 2020 13:54:42.7505 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ymmwEAGztRngwVpN9LjuDQhGjPoNYJ1cvYuff/bSHxcO4Jqk2pmJ8kPBWTMYr1hrMhJ/c72NupeHenMrkESCBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB5614
Cc: "jakub.kicinski@netronome.com" <jakub.kicinski@netronome.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "mst@redhat.com" <mst@redhat.com>,
 "mhabets@solarflare.com" <mhabets@solarflare.com>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "rob.miller@broadcom.com" <rob.miller@broadcom.com>,
 "lulu@redhat.com" <lulu@redhat.com>, "hanand@xilinx.com" <hanand@xilinx.com>,
 "hch@infradead.org" <hch@infradead.org>,
 "eperezma@redhat.com" <eperezma@redhat.com>,
 "haotian.wang@sifive.com" <haotian.wang@sifive.com>,
 Shahaf Shuler <shahafs@mellanox.com>, Parav Pandit <parav@mellanox.com>,
 Jiri Pirko <jiri@mellanox.com>,
 "xiao.w.wang@intel.com" <xiao.w.wang@intel.com>,
 "stefanha@redhat.com" <stefanha@redhat.com>,
 "zhihong.wang@intel.com" <zhihong.wang@intel.com>,
 "rdunlap@infradead.org" <rdunlap@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "maxime.coquelin@redhat.com" <maxime.coquelin@redhat.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "lingshan.zhu@intel.com" <lingshan.zhu@intel.com>
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

T24gRnJpLCBKYW4gMTcsIDIwMjAgYXQgMTE6MDM6MTJBTSArMDgwMCwgSmFzb24gV2FuZyB3cm90
ZToNCj4gDQo+IE9uIDIwMjAvMS8xNiDkuIvljYgxMToyMiwgSmFzb24gR3VudGhvcnBlIHdyb3Rl
Og0KPiA+IE9uIFRodSwgSmFuIDE2LCAyMDIwIGF0IDA4OjQyOjI5UE0gKzA4MDAsIEphc29uIFdh
bmcgd3JvdGU6DQo+ID4gPiB2RFBBIGRldmljZSBpcyBhIGRldmljZSB0aGF0IHVzZXMgYSBkYXRh
cGF0aCB3aGljaCBjb21wbGllcyB3aXRoIHRoZQ0KPiA+ID4gdmlydGlvIHNwZWNpZmljYXRpb25z
IHdpdGggdmVuZG9yIHNwZWNpZmljIGNvbnRyb2wgcGF0aC4gdkRQQSBkZXZpY2VzDQo+ID4gPiBj
YW4gYmUgYm90aCBwaHlzaWNhbGx5IGxvY2F0ZWQgb24gdGhlIGhhcmR3YXJlIG9yIGVtdWxhdGVk
IGJ5DQo+ID4gPiBzb2Z0d2FyZS4gdkRQQSBoYXJkd2FyZSBkZXZpY2VzIGFyZSB1c3VhbGx5IGlt
cGxlbWVudGVkIHRocm91Z2ggUENJRQ0KPiA+ID4gd2l0aCB0aGUgZm9sbG93aW5nIHR5cGVzOg0K
PiA+ID4gDQo+ID4gPiAtIFBGIChQaHlzaWNhbCBGdW5jdGlvbikgLSBBIHNpbmdsZSBQaHlzaWNh
bCBGdW5jdGlvbg0KPiA+ID4gLSBWRiAoVmlydHVhbCBGdW5jdGlvbikgLSBEZXZpY2UgdGhhdCBz
dXBwb3J0cyBzaW5nbGUgcm9vdCBJL08NCj4gPiA+ICAgIHZpcnR1YWxpemF0aW9uIChTUi1JT1Yp
LiBJdHMgVmlydHVhbCBGdW5jdGlvbiAoVkYpIHJlcHJlc2VudHMgYQ0KPiA+ID4gICAgdmlydHVh
bGl6ZWQgaW5zdGFuY2Ugb2YgdGhlIGRldmljZSB0aGF0IGNhbiBiZSBhc3NpZ25lZCB0byBkaWZm
ZXJlbnQNCj4gPiA+ICAgIHBhcnRpdGlvbnMNCj4gPiA+IC0gVkRFViAoVmlydHVhbCBEZXZpY2Up
IC0gV2l0aCB0ZWNobm9sb2dpZXMgc3VjaCBhcyBJbnRlbCBTY2FsYWJsZQ0KPiA+ID4gICAgSU9W
LCBhIHZpcnR1YWwgZGV2aWNlIGNvbXBvc2VkIGJ5IGhvc3QgT1MgdXRpbGl6aW5nIG9uZSBvciBt
b3JlDQo+ID4gPiAgICBBRElzLg0KPiA+ID4gLSBTRiAoU3ViIGZ1bmN0aW9uKSAtIFZlbmRvciBz
cGVjaWZpYyBpbnRlcmZhY2UgdG8gc2xpY2UgdGhlIFBoeXNpY2FsDQo+ID4gPiAgICBGdW5jdGlv
biB0byBtdWx0aXBsZSBzdWIgZnVuY3Rpb25zIHRoYXQgY2FuIGJlIGFzc2lnbmVkIHRvIGRpZmZl
cmVudA0KPiA+ID4gICAgcGFydGl0aW9ucyBhcyB2aXJ0dWFsIGRldmljZXMuDQo+ID4gSSByZWFs
bHkgaG9wZSB3ZSBkb24ndCBlbmQgdXAgd2l0aCB0d28gZGlmZmVyZW50IHdheXMgdG8gc3BlbGwg
dGhpcw0KPiA+IHNhbWUgdGhpbmcuDQo+IA0KPiBJIHRoaW5rIHlvdSBtZWFudCBBREkgdnMgU0Yu
IEl0IGxvb2tzIHRvIG1lIHRoYXQgQURJIGlzIGxpbWl0ZWQgdG8gdGhlIHNjb3BlDQo+IG9mIHNj
YWxhYmxlIElPViBidXQgU0Ygbm90Lg0KDQpJIHRoaW5rIGlmIG9uZSBsb29rcyBjYXJlZnVsbHkg
eW91J2QgZmluZCB0aGF0IFNGIGFuZCBBREkgYXJlIHVzaW5nDQp2ZXJ5IHNpbWlsYXIgdGVjaGlu
aXF1ZXMuIEZvciBpbnN0YW5jZSB3ZSdkIGFsc28gbGlrZSB0byB1c2UgdGhlIGNvZGUNCnJlb3Jn
IG9mIHRoZSBNU0lYIHZlY3RvciBzZXR1cCB3aXRoIFNGcyB0aGF0IEludGVsIGlzIGNhbGxpbmcg
SU1TLg0KDQpSZWFsbHkgU0lPViBpcyBzaW1wbHkgYSBidW5kbGUgb2YgcHJlLWV4aXN0aW5nIHN0
dWZmIHVuZGVyIGEgdGlkeQ0KbmFtZSwgd2hhdGV2ZXIgY29kZSBza2VsZXRvbiB3ZSBjb21lIHVw
IHdpdGggZm9yIFNGcyBzaG91bGQgYmUgcmUtdXNlZA0KZm9yIEFESS4NCg0KPiA+IFNob3VsZG4n
dCB0aGVyZSBiZSBhIGRldmljZS9kcml2ZXIgbWF0Y2hpbmcgcHJvY2VzcyBvZiBzb21lIGtpbmQ/
DQo+IA0KPiANCj4gVGhlIHF1ZXN0aW9uIGlzIHdoYXQgZG8gd2Ugd2FudCBkbyBtYXRjaCBoZXJl
Lg0KPiANCj4gMSkgInZpcnRpbyIgdnMgInZob3N0IiwgSSBpbXBsZW1lbnRlZCBtYXRjaGluZyBt
ZXRob2QgZm9yIHRoaXMgaW4gbWRldg0KPiBzZXJpZXMsIGJ1dCBpdCBsb29rcyB1bm5lY2Vzc2Fy
eSBmb3IgdkRQQSBkZXZpY2UgZHJpdmVyIHRvIGtub3cgYWJvdXQgdGhpcy4NCj4gQW55d2F5IHdl
IGNhbiB1c2Ugc3lzZnMgZHJpdmVyIGJpbmQvdW5iaW5kIHRvIHN3aXRjaCBkcml2ZXJzDQo+IDIp
IHZpcnRpbyBkZXZpY2UgaWQgYW5kIHZlbmRvciBpZC4gSSdtIG5vdCBzdXJlIHdlIG5lZWQgdGhp
cyBjb25zaWRlciB0aGUNCj4gdHdvIGRyaXZlcnMgc28gZmFyICh2aXJ0aW8vdmhvc3QpIGFyZSBh
bGwgYnVzIGRyaXZlcnMuDQoNCkFzIHdlIHNlZW0gdG8gYmUgY29udGVtcGxhdGluZyBzb21lIGR5
bmFtaWMgY3JlYXRpb24gb2YgdmRwYSBkZXZpY2VzIEkNCnRoaW5rIHVwb24gY3JlYXRpb24gdGlt
ZSBpdCBzaG91bGQgYmUgc3BlY2lmaWVkIHdoYXQgbW9kZSB0aGV5IHNob3VsZA0KcnVuIGl0IGFu
ZCB0aGVuIGFsbCBkcml2ZXIgYmluZGluZyBhbmQgYXV0b2xvYWRpbmcgc2hvdWxkIGhhcHBlbg0K
YXV0b21hdGljYWxseS4gVGVsbGluZyB0aGUgdXNlciB0byBiaW5kL3VuYmluZCBpcyBhIHZlcnkg
cG9vcg0KZXhwZXJpZW5jZS4NCg0KSmFzb24NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXph
dGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRh
dGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
