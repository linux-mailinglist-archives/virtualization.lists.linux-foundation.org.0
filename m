Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A0E984B2
	for <lists.virtualization@lfdr.de>; Wed, 21 Aug 2019 21:44:48 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id B4EB3DAC;
	Wed, 21 Aug 2019 19:44:36 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id D2F04D30
	for <virtualization@lists.linux-foundation.org>;
	Wed, 21 Aug 2019 19:44:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
	(mail-eopbgr800049.outbound.protection.outlook.com [40.107.80.49])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 51C18F8
	for <virtualization@lists.linux-foundation.org>;
	Wed, 21 Aug 2019 19:44:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=ERdIqxmMrvGZfTdfMjM791SdSx3jcnFw+M5bkNHr7BGGQRBekcD9MkudlHFD8yAaMVaibIS++y259eOJ4zARY2VO2bC/7AaGt8Il+kZHlq5YyRJvEDVX1YOmIzXyZtEiC+LE8kLwdSkaltsHOdtj2j49nZzuSBCzuUJ2KvvKFSr/Qva5S8nbu/o4iEHnWxkIfFpDAAa3nQjsQq0bf4cFiFAje7XlA8+/Zq8yD91+zc7fMPe0GLMhvpPV1uLcL1VWMh7tp0tS0ds4yUNekPSAC54SGcwLUSuF8lpVTb6wVZaXf9fqxSf3EplyVVIe/BnkelL0qKRNrYr3SxKGQ4ZGrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=y8//QLf053soRJPAdJarq0FUV6NnF3KW79cIzMYY6Jc=;
	b=EhIIjBLlFfcqpyXKSBLUck5Tp+ddILptIR6Kup6gUQir8uVBh2bHTqtJKVOlCwzz9Xn51ZKF37HKLV/ob2iIXuHnsdIKeHySt4C90aJwSLjN3ehssOlNIE+TcK//uWhmugwV/vHwIJt9H1CHnbxsxi3kd0bepXW8Oma4cfKVeoQqNwmfbsr/4NJpyvtnMdGdFjJoUDcrB1niXKt4BqyQDpop9igMALWDkqQNr3euUekbEdJCUI7lUGX35WTMJNpkM6b1oD/4WT/CILBSHe0S+nJ1Du145Wi9eLSF0QzOJ16fyXtwBAVSwUKNRNjovEF9PduvSKWIJFbC4p96AjhHPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
	dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=y8//QLf053soRJPAdJarq0FUV6NnF3KW79cIzMYY6Jc=;
	b=FSdgkpzQLtyyeE/6MQa6X/a6aYcI/uKJtzcP84UnHMRMog4iAWQWmdkelWlXemUcWKSv03HPFumYlSYPo5iE9DL3f+pPZL7EI+8U8ClnGkAWPtMWgM7BoaAG7PpxH7oe9EmrxFHXOBbB/j9Vag9FlavCPsr3PNfkhAdQSN/QybU=
Received: from BYAPR05MB4776.namprd05.prod.outlook.com (52.135.233.146) by
	BYAPR05MB4950.namprd05.prod.outlook.com (20.177.228.224) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2199.12; Wed, 21 Aug 2019 19:44:33 +0000
Received: from BYAPR05MB4776.namprd05.prod.outlook.com
	([fe80::1541:ed53:784a:6376]) by
	BYAPR05MB4776.namprd05.prod.outlook.com
	([fe80::1541:ed53:784a:6376%5]) with mapi id 15.20.2199.011;
	Wed, 21 Aug 2019 19:44:33 +0000
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH] mm/balloon_compaction: suppress allocation warnings
Thread-Topic: [PATCH] mm/balloon_compaction: suppress allocation warnings
Thread-Index: AQHVV3WT44k5kIt6JEiYnWTDWJ3OpKcFxbMAgAAE4ICAAAGZAIAAAZgAgAAsYACAAAilAA==
Date: Wed, 21 Aug 2019 19:44:33 +0000
Message-ID: <D4105FF4-5DF3-4DB5-9325-855B63CD9AAD@vmware.com>
References: <20190820091646.29642-1-namit@vmware.com>
	<ba01ec8c-19c3-847c-a315-2f70f4b1fe31@redhat.com>
	<5BBC6CB3-2DCD-4A95-90C9-7C23482F9B32@vmware.com>
	<85c72875-278f-fbab-69c9-92dc1873d407@redhat.com>
	<FC42B62F-167F-4D7D-ADC5-926B36347E82@vmware.com>
	<2aa52636-4ca7-0d47-c5bf-42408af3ea0f@redhat.com>
In-Reply-To: <2aa52636-4ca7-0d47-c5bf-42408af3ea0f@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=namit@vmware.com; 
x-originating-ip: [66.170.99.2]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 081f2881-6045-4b2c-8608-08d7266ffd81
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
	SRVR:BYAPR05MB4950; 
x-ms-traffictypediagnostic: BYAPR05MB4950:
x-microsoft-antispam-prvs: <BYAPR05MB4950545DE6D78CA4D322269DD0AA0@BYAPR05MB4950.namprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:451;
x-forefront-prvs: 0136C1DDA4
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(4636009)(396003)(376002)(366004)(136003)(346002)(39860400002)(189003)(199004)(6512007)(7736002)(2906002)(316002)(36756003)(6116002)(86362001)(3846002)(53546011)(186003)(6436002)(6506007)(14444005)(256004)(99286004)(8676002)(76176011)(305945005)(26005)(102836004)(54906003)(81166006)(71190400001)(6486002)(486006)(5660300002)(229853002)(66066001)(6246003)(53936002)(478600001)(2616005)(476003)(33656002)(81156014)(71200400001)(76116006)(66446008)(66946007)(8936002)(64756008)(66556008)(66476007)(14454004)(4326008)(25786009)(6916009)(11346002)(446003);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR05MB4950;
	H:BYAPR05MB4776.namprd05.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: vmware.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: iFeXF0iA+0PAZdq+1oLwW/SXe4N3tn8PyAKMN0MqvTYiijlQirsB2ZgU5SKtOzMW8G1EY1LAYLj2lTSPpVXd66gqv0bW5ZWxP3p/50GvCNMgMygs160VS4kXO9/8ghz1Pgep+/IkU6kV4+Fx3RsvbK3mvnkRlF3n8iaWOY7DnYnAREGUAXXVB6YO+IJZOZL0gVndfaqg/bp3hFjZp8ekaDmjhxgOahsLqeLPU07l/WzS/uqT2PympjX2NThJOYSiAwh4PvqPDLcR8v0ULuJ4fsABkfMo6Xsn+Ofh4Dsu6HJuuOmldBa5vooaYf9xgfsW24UnKU6S9I7N+v4IAo9wl76VcoaoOoV+g42W31j3IQWf/YbVhAF3ixLI38068mKp5aoSeGlmV8juf7LJaHxSW0VyhCjD3SyRuXXEzjSgxYo=
x-ms-exchange-transport-forked: True
Content-ID: <E0487EC43891654D90815A578D153FBD@namprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 081f2881-6045-4b2c-8608-08d7266ffd81
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2019 19:44:33.1224 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XDypNxcI59kUo+h3Kis0q1WjijfMXTKtxdyw0G1Tp4+mGfUmYwpeO0Eh+BznJcR+hTQVqTi4c6zfHurYuuxFPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR05MB4950
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: "linux-mm@kvack.org" <linux-mm@kvack.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"virtualization@lists.linux-foundation.org"
	<virtualization@lists.linux-foundation.org>
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

PiBPbiBBdWcgMjEsIDIwMTksIGF0IDEyOjEzIFBNLCBEYXZpZCBIaWxkZW5icmFuZCA8ZGF2aWRA
cmVkaGF0LmNvbT4gd3JvdGU6DQo+IA0KPiBPbiAyMS4wOC4xOSAxODozNCwgTmFkYXYgQW1pdCB3
cm90ZToNCj4+PiBPbiBBdWcgMjEsIDIwMTksIGF0IDk6MjkgQU0sIERhdmlkIEhpbGRlbmJyYW5k
IDxkYXZpZEByZWRoYXQuY29tPiB3cm90ZToNCj4+PiANCj4+PiBPbiAyMS4wOC4xOSAxODoyMywg
TmFkYXYgQW1pdCB3cm90ZToNCj4+Pj4+IE9uIEF1ZyAyMSwgMjAxOSwgYXQgOTowNSBBTSwgRGF2
aWQgSGlsZGVuYnJhbmQgPGRhdmlkQHJlZGhhdC5jb20+IHdyb3RlOg0KPj4+Pj4gDQo+Pj4+PiBP
biAyMC4wOC4xOSAxMToxNiwgTmFkYXYgQW1pdCB3cm90ZToNCj4+Pj4+PiBUaGVyZSBpcyBubyBy
ZWFzb24gdG8gcHJpbnQgd2FybmluZ3Mgd2hlbiBiYWxsb29uIHBhZ2UgYWxsb2NhdGlvbiBmYWls
cywNCj4+Pj4+PiBhcyB0aGV5IGFyZSBleHBlY3RlZCBhbmQgY2FuIGJlIGhhbmRsZWQgZ3JhY2Vm
dWxseS4gIFNpbmNlIFZNd2FyZQ0KPj4+Pj4+IGJhbGxvb24gbm93IHVzZXMgYmFsbG9vbi1jb21w
YWN0aW9uIGluZnJhc3RydWN0dXJlLCBhbmQgc3VwcHJlc3NlZCB0aGVzZQ0KPj4+Pj4+IHdhcm5p
bmdzIGJlZm9yZSwgaXQgaXMgYWxzbyBiZW5lZmljaWFsIHRvIHN1cHByZXNzIHRoZXNlIHdhcm5p
bmdzIHRvDQo+Pj4+Pj4ga2VlcCB0aGUgc2FtZSBiZWhhdmlvciB0aGF0IHRoZSBiYWxsb29uIGhh
ZCBiZWZvcmUuDQo+Pj4+PiANCj4+Pj4+IEkgYW0gbm90IHN1cmUgaWYgdGhhdCdzIGEgZ29vZCBp
ZGVhLiBUaGUgYWxsb2NhdGlvbiB3YXJuaW5ncyBhcmUgdXN1YWxseQ0KPj4+Pj4gdGhlIG9ubHkg
dHJhY2Ugb2YgInRoZSB1c2VyL2FkbWluIGRpZCBzb21ldGhpbmcgYmFkIGJlY2F1c2UgaGUvc2hl
IHRyaWVkDQo+Pj4+PiB0byBpbmZsYXRlIHRoZSBiYWxsb29uIHRvIGFuIHVuc2FmZSB2YWx1ZSIu
IEJlbGlldmUgbWUsIEkgcHJvY2Vzc2VkIGENCj4+Pj4+IGNvdXBsZSBvZiBzdWNoIGJ1Z3JlcG9y
dHMgcmVsYXRlZCB0byB2aXJ0aW8tYmFsbG9vbiBhbmQgdGhlIHdhcm5pbmcgd2VyZQ0KPj4+Pj4g
dmVyeSBoZWxwZnVsIGZvciB0aGF0Lg0KPj4+PiANCj4+Pj4gT2ssIHNvIGEgbWVzc2FnZSBpcyBu
ZWVkZWQsIGJ1dCBkb2VzIGl0IGhhdmUgdG8gYmUgYSBnZW5lcmljIGZyaWdodGVuaW5nDQo+Pj4+
IHdhcm5pbmc/DQo+Pj4+IA0KPj4+PiBIb3cgYWJvdXQgdXNpbmcgX19HRlBfTk9XQVJOLCBhbmQg
aWYgYWxsb2NhdGlvbiBkbyBzb21ldGhpbmcgbGlrZToNCj4+Pj4gDQo+Pj4+IHByX3dhcm4o4oCc
QmFsbG9vbiBtZW1vcnkgYWxsb2NhdGlvbiBmYWlsZWTigJ0pOw0KPj4+PiANCj4+Pj4gT3IgZXZl
biBzb21ldGhpbmcgbW9yZSBpbmZvcm1hdGl2ZT8gVGhpcyB3b3VsZCBzdXJlbHkgYmUgbGVzcyBp
bnRpbWlkYXRpbmcNCj4+Pj4gZm9yIGNvbW1vbiB1c2Vycy4NCj4+PiANCj4+PiByYXRlbGltaXQg
d291bGQgbWFrZSBzZW5zZSA6KQ0KPj4+IA0KPj4+IEFuZCB5ZXMsIHRoaXMgd291bGQgY2VydGFp
bmx5IGJlIG5pY2VyLg0KPj4gDQo+PiBUaGFua3MuIEkgd2lsbCBwb3N0IHYyIG9mIHRoZSBwYXRj
aC4NCj4gDQo+IEFzIGRpc2N1c3NlZCBpbiB2Miwgd2UgYWxyZWFkeSBwcmludCBhIHdhcm5pbmcg
aW4gdmlydGlvLWJhbGxvb24sIHNvIEkNCj4gYW0gZmluZSB3aXRoIHRoaXMgcGF0Y2guDQo+IA0K
PiBSZXZpZXdlZC1ieTogRGF2aWQgSGlsZGVuYnJhbmQgPGRhdmlkQHJlZGhhdC5jb20+DQoNCk1p
Y2hhZWwsDQoNCklmIGl0IGlzIHBvc3NpYmxlIHRvIGdldCBpdCB0byA1LjMsIHRvIGF2b2lkIGJl
aGF2aW9yYWwgY2hhbmdlIGZvciBWTXdhcmUNCmJhbGxvb24gdXNlcnMsIGl0IHdvdWxkIGJlIGdy
ZWF0Lg0KDQpUaGFua3MsDQpOYWRhdgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25A
bGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24u
b3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
