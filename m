Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D1A62B987
	for <lists.virtualization@lfdr.de>; Mon, 27 May 2019 19:50:06 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id D681D187B;
	Mon, 27 May 2019 17:50:00 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id D540E187B
	for <virtualization@lists.linux-foundation.org>;
	Mon, 27 May 2019 17:49:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
	(mail-eopbgr720051.outbound.protection.outlook.com [40.107.72.51])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 55BF681A
	for <virtualization@lists.linux-foundation.org>;
	Mon, 27 May 2019 17:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=84Agb6YxRcTQolVN89GeO41cT9eczLaKMoggrxBFaDo=;
	b=Chdi20eWe81DiAvpKogBQxu+0/kuUjWinUOicy3ohl0xg/FoB8Ftvqcm9N9ttGCtXQzozPLYiTABU6zfLM6yt6cCT4Ih17iAr62UerRIlojsmfik6ELwGlKoyvQzKi1ldVuHZ4rUmuu29ByRYy0dFQ7qPDIS19XySFreAnafGhc=
Received: from BYAPR05MB4776.namprd05.prod.outlook.com (52.135.233.146) by
	BYAPR05MB5126.namprd05.prod.outlook.com (20.177.231.20) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1943.15; Mon, 27 May 2019 17:49:03 +0000
Received: from BYAPR05MB4776.namprd05.prod.outlook.com
	([fe80::2cb6:a3d1:f675:ced8]) by
	BYAPR05MB4776.namprd05.prod.outlook.com
	([fe80::2cb6:a3d1:f675:ced8%3]) with mapi id 15.20.1943.007;
	Mon, 27 May 2019 17:49:03 +0000
To: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [RFC PATCH 5/6] x86/mm/tlb: Flush remote and local TLBs
	concurrently
Thread-Topic: [RFC PATCH 5/6] x86/mm/tlb: Flush remote and local TLBs
	concurrently
Thread-Index: AQHVEtL3brMxLnyQKEm7V/vFcW9jOKZ7iV8AgAMzSQCAAIaiAA==
Date: Mon, 27 May 2019 17:49:03 +0000
Message-ID: <AA36DE0F-04DB-47E1-B5D8-2E4522E9D6B3@vmware.com>
References: <20190525082203.6531-1-namit@vmware.com>
	<20190525082203.6531-6-namit@vmware.com>
	<08b21fb5-2226-7924-30e3-31e4adcfc0a3@suse.com>
	<20190527094710.GU2623@hirez.programming.kicks-ass.net>
In-Reply-To: <20190527094710.GU2623@hirez.programming.kicks-ass.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=namit@vmware.com; 
x-originating-ip: [66.170.99.2]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b9b31594-5baf-436d-2703-08d6e2cb9b9b
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
	SRVR:BYAPR05MB5126; 
x-ms-traffictypediagnostic: BYAPR05MB5126:
x-microsoft-antispam-prvs: <BYAPR05MB512671C8B694A1DB98E15C14D01D0@BYAPR05MB5126.namprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:913;
x-forefront-prvs: 0050CEFE70
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(376002)(366004)(39860400002)(136003)(346002)(396003)(189003)(199004)(7736002)(6506007)(6486002)(53546011)(305945005)(76176011)(6436002)(476003)(446003)(2616005)(66946007)(66476007)(66556008)(64756008)(66446008)(76116006)(53936002)(11346002)(73956011)(486006)(33656002)(8676002)(66066001)(82746002)(26005)(6512007)(186003)(102836004)(36756003)(81156014)(81166006)(5660300002)(8936002)(478600001)(25786009)(316002)(83716004)(54906003)(6916009)(71200400001)(256004)(71190400001)(7416002)(86362001)(14454004)(99286004)(2906002)(68736007)(3846002)(229853002)(6116002)(6246003)(4326008);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR05MB5126;
	H:BYAPR05MB4776.namprd05.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: vmware.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: zBAId/Uz7q/Lk3k7ZY9fjNmTdC/c8lTbh1ATc32M5GHGD5n1WupgFXIz0GgW97yNw/1RlFZuJZP9v3WSPUGsH4eNl+MAW/IpaB/VeTFG+suY5+qCaDm1+uz1exPlNnkWMpHrsZOn32b15G0pS8kJ+4eaa+DRdv2UFKLddNKOYqQa4n+LBqC5UuxvuvIz2H8Lp93ylTVgiSTTldQTdDvifigxylHVuHijX3nPbO24ERZrnSZ1tfbeLCDZTGzR9PuOB/AHXkHUYMgGMJox7wSvxFaVlWo93l7rXnnhDJE2Z1b+FX1plFfINBCaDDNYEtt84C2CHY8tuVixMq3rbG+cQRdBFAvzLdsQt6x+KFM5AURE61hGtomqv0L5l0hZiqqbAuBj5KxWn0LJKRTg+Q3iUj+qQzyDXVZv8fE1NTEvkQ0=
Content-ID: <A4055DEB35687B479CB0588C414C980D@namprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9b31594-5baf-436d-2703-08d6e2cb9b9b
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 May 2019 17:49:03.4330 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: namit@vmware.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR05MB5126
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Juergen Gross <jgross@suse.com>, Sasha Levin <sashal@kernel.org>,
	"linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Stephen Hemminger <sthemmin@microsoft.com>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>,
	Haiyang Zhang <haiyangz@microsoft.com>, "x86@kernel.org" <x86@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"virtualization@lists.linux-foundation.org"
	<virtualization@lists.linux-foundation.org>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Andy Lutomirski <luto@kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

PiBPbiBNYXkgMjcsIDIwMTksIGF0IDI6NDcgQU0sIFBldGVyIFppamxzdHJhIDxwZXRlcnpAaW5m
cmFkZWFkLm9yZz4gd3JvdGU6DQo+IA0KPiBPbiBTYXQsIE1heSAyNSwgMjAxOSBhdCAxMDo1NDo1
MEFNICswMjAwLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gT24gMjUvMDUvMjAxOSAxMDoyMiwg
TmFkYXYgQW1pdCB3cm90ZToNCj4gDQo+Pj4gZGlmZiAtLWdpdCBhL2FyY2gveDg2L2luY2x1ZGUv
YXNtL3BhcmF2aXJ0X3R5cGVzLmggYi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9wYXJhdmlydF90eXBl
cy5oDQo+Pj4gaW5kZXggOTQ2ZjhmMWYxZWZjLi4zYTE1NmU2M2M1N2QgMTAwNjQ0DQo+Pj4gLS0t
IGEvYXJjaC94ODYvaW5jbHVkZS9hc20vcGFyYXZpcnRfdHlwZXMuaA0KPj4+ICsrKyBiL2FyY2gv
eDg2L2luY2x1ZGUvYXNtL3BhcmF2aXJ0X3R5cGVzLmgNCj4+PiBAQCAtMjExLDYgKzIxMSwxMiBA
QCBzdHJ1Y3QgcHZfbW11X29wcyB7DQo+Pj4gCXZvaWQgKCpmbHVzaF90bGJfdXNlcikodm9pZCk7
DQo+Pj4gCXZvaWQgKCpmbHVzaF90bGJfa2VybmVsKSh2b2lkKTsNCj4+PiAJdm9pZCAoKmZsdXNo
X3RsYl9vbmVfdXNlcikodW5zaWduZWQgbG9uZyBhZGRyKTsNCj4+PiArCS8qDQo+Pj4gKwkgKiBm
bHVzaF90bGJfbXVsdGkoKSBpcyB0aGUgcHJlZmVycmVkIGludGVyZmFjZS4gV2hlbiBpdCBpcyB1
c2VkLA0KPj4+ICsJICogZmx1c2hfdGxiX290aGVycygpIHNob3VsZCByZXR1cm4gZmFsc2UuDQo+
PiANCj4+IFRoaXMgY29tbWVudCBkb2VzIG5vdCBtYWtlIHNlbnNlLiBmbHVzaF90bGJfb3RoZXJz
KCkgcmV0dXJuIHR5cGUgaXMNCj4+IHZvaWQuDQo+IA0KPiBJIHN1c3BlY3QgdGhhdCBpcyBhbiBh
cnRpZmFjdCBmcm9tIGJlZm9yZSB0aGUgc3RhdGljX2tleTsgYW4gYXR0ZW1wdCB0bw0KPiBtYWtl
IHRoZSBwdiBpbnRlcmZhY2UgbGVzcyBhd2t3YXJkLg0KDQpZZXMsIHJlbWFpbmRlcnMgdGhhdCBz
aG91bGQgaGF2ZSBiZWVuIHJlbW92ZWQgLSBJIHdpbGwgcmVtb3ZlIHRoZW0gZm9yIHRoZQ0KbmV4
dCB2ZXJzaW9uLg0KDQo+IFNvbWV0aGluZyBsaWtlIHRoZSBiZWxvdyB3b3VsZCB3b3JrIGZvciBL
Vk0gSSBzdXNwZWN0LCB0aGUgb3RoZXJzDQo+IChIeXBlci1WIGFuZCBYZW4gYXJlIG1vcmUgJ2lu
dGVyZXN0aW5nJykuDQo+IA0KPiAtLS0NCj4gLS0tIGEvYXJjaC94ODYva2VybmVsL2t2bS5jDQo+
ICsrKyBiL2FyY2gveDg2L2tlcm5lbC9rdm0uYw0KPiBAQCAtNTgwLDcgKzU4MCw3IEBAIHN0YXRp
YyB2b2lkIF9faW5pdCBrdm1fYXBmX3RyYXBfaW5pdCh2b2kNCj4gDQo+IHN0YXRpYyBERUZJTkVf
UEVSX0NQVShjcHVtYXNrX3Zhcl90LCBfX3B2X3RsYl9tYXNrKTsNCj4gDQo+IC1zdGF0aWMgdm9p
ZCBrdm1fZmx1c2hfdGxiX290aGVycyhjb25zdCBzdHJ1Y3QgY3B1bWFzayAqY3B1bWFzaywNCj4g
K3N0YXRpYyB2b2lkIGt2bV9mbHVzaF90bGJfbXVsdGkoY29uc3Qgc3RydWN0IGNwdW1hc2sgKmNw
dW1hc2ssDQo+IAkJCWNvbnN0IHN0cnVjdCBmbHVzaF90bGJfaW5mbyAqaW5mbykNCj4gew0KPiAJ
dTggc3RhdGU7DQo+IEBAIC01OTQsNiArNTk0LDkgQEAgc3RhdGljIHZvaWQga3ZtX2ZsdXNoX3Rs
Yl9vdGhlcnMoY29uc3Qgcw0KPiAJICogcXVldWUgZmx1c2hfb25fZW50ZXIgZm9yIHByZS1lbXB0
ZWQgdkNQVXMNCj4gCSAqLw0KPiAJZm9yX2VhY2hfY3B1KGNwdSwgZmx1c2htYXNrKSB7DQo+ICsJ
CWlmIChjcHUgPT0gc21wX3Byb2Nlc3Nvcl9pZCgpKQ0KPiArCQkJY29udGludWU7DQo+ICsNCj4g
CQlzcmMgPSAmcGVyX2NwdShzdGVhbF90aW1lLCBjcHUpOw0KPiAJCXN0YXRlID0gUkVBRF9PTkNF
KHNyYy0+cHJlZW1wdGVkKTsNCj4gCQlpZiAoKHN0YXRlICYgS1ZNX1ZDUFVfUFJFRU1QVEVEKSkg
ew0KPiBAQCAtNjAzLDcgKzYwNiw3IEBAIHN0YXRpYyB2b2lkIGt2bV9mbHVzaF90bGJfb3RoZXJz
KGNvbnN0IHMNCj4gCQl9DQo+IAl9DQo+IA0KPiAtCW5hdGl2ZV9mbHVzaF90bGJfb3RoZXJzKGZs
dXNobWFzaywgaW5mbyk7DQo+ICsJbmF0aXZlX2ZsdXNoX3RsYl9tdWx0aShmbHVzaG1hc2ssIGlu
Zm8pOw0KPiB9DQo+IA0KPiBzdGF0aWMgdm9pZCBfX2luaXQga3ZtX2d1ZXN0X2luaXQodm9pZCkN
Cj4gQEAgLTYyOCw5ICs2MzEsOCBAQCBzdGF0aWMgdm9pZCBfX2luaXQga3ZtX2d1ZXN0X2luaXQo
dm9pZCkNCj4gCWlmIChrdm1fcGFyYV9oYXNfZmVhdHVyZShLVk1fRkVBVFVSRV9QVl9UTEJfRkxV
U0gpICYmDQo+IAkgICAgIWt2bV9wYXJhX2hhc19oaW50KEtWTV9ISU5UU19SRUFMVElNRSkgJiYN
Cj4gCSAgICBrdm1fcGFyYV9oYXNfZmVhdHVyZShLVk1fRkVBVFVSRV9TVEVBTF9USU1FKSkgew0K
PiAtCQlwdl9vcHMubW11LmZsdXNoX3RsYl9vdGhlcnMgPSBrdm1fZmx1c2hfdGxiX290aGVyczsN
Cj4gKwkJcHZfb3BzLm1tdS5mbHVzaF90bGJfbXVsdGkgPSBrdm1fZmx1c2hfdGxiX211bHRpOw0K
PiAJCXB2X29wcy5tbXUudGxiX3JlbW92ZV90YWJsZSA9IHRsYl9yZW1vdmVfdGFibGU7DQo+IC0J
CXN0YXRpY19rZXlfZGlzYWJsZSgmZmx1c2hfdGxiX211bHRpX2VuYWJsZWQua2V5KTsNCj4gCX0N
Cj4gDQo+IAlpZiAoa3ZtX3BhcmFfaGFzX2ZlYXR1cmUoS1ZNX0ZFQVRVUkVfUFZfRU9JKSkNCg0K
VGhhdOKAmXMgd2hhdCBJIGhhdmUgYXMgd2VsbCA7LSkuDQoNCkFzIHlvdSBtZW50aW9uZWQgKGlu
IGFub3RoZXIgZW1haWwpLCBzcGVjaWZpY2FsbHkgaHlwZXItdiBjb2RlIHNlZW1zDQpjb252b2x1
dGVkIHRvIG1lLiBJbiBnZW5lcmFsLCBJIHByZWZlciBub3QgdG8gdG91Y2ggS1ZNL1hlbi9oeXBl
ci12LCBidXQgeW91DQp0d2lzdCBteSBhcm0sIEkgd2lsbCBzZW5kIGEgY29tcGlsZS10ZXN0ZWQg
dmVyc2lvbiBmb3IgWGVuIGFuZCBoeXBlci12Lg0KDQpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVh
bGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZv
dW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
