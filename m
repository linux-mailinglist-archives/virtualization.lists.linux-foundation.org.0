Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D1D898034
	for <lists.virtualization@lfdr.de>; Wed, 21 Aug 2019 18:34:57 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id E848EC5C;
	Wed, 21 Aug 2019 16:34:50 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 62277B8A
	for <virtualization@lists.linux-foundation.org>;
	Wed, 21 Aug 2019 16:34:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
	(mail-eopbgr720083.outbound.protection.outlook.com [40.107.72.83])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id E67388A2
	for <virtualization@lists.linux-foundation.org>;
	Wed, 21 Aug 2019 16:34:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=Fuh4PQgWrxYZh1LUG7XeQeExWacMcn4BtMdogo62cxi+pOL5TtCzmaJUv3/s9mOSnGEdrL6KFnN4rBzToZ0Lx4fF+qoC1A4MMd5p7K//JQgB/MKjx4Mcd3Qn1YeA/gLN1l24+aUrsZWE+hrElWUXU4FFX1TPN/abPeiVuKQ/S9sJnygEoaAlfLG3Ivtb7Q0n3ZjNE0aYvBVpfeaV+AdmcBWVKu3N5TLdC7h27HnguqKTxiAXLFCwbnSPlMyVTFAG3F36c4OVetO1kvRsDsFjkHbunplfJCNfSsapE8wenLlY7+ZqmqcFuPUzR0cGdTdr4Ofa2cpS4wax2/wlrjIRbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=+XFZ3SnQoakUQsODtm6H0P4yvOkEOaKtByZPUd18pBQ=;
	b=B6A3w2RONdo9igxckGWG7gz0zV4LLhGetw7J2AQtu4jTuySSurq5KjV6Uo1W4fnpZqyo50OlXk9BTtUyjE4zYiU6GByx3/l9l2m/dEIO4ing+lSuLBzwgD8TJZEMGHhnv57ObfjPSrKbakzp9QB/FhEVOEHkR/jI6cX+PRJ63TannVF2YE4FAD2ER+OBMxLkODMMhJcgTn8iT1WtQxmywHzTO/2T5JPkzsbtzJPvI3nmoS3nHC+fG3JrQUgEUigz63EEg3gumSEdGPeiRG67rs4VxVvraIK45CGE8b4C5rUJ1so9lFD4sys4sjXgKoRncwDpn/lDiIuhXYcjJcb9dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
	dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=+XFZ3SnQoakUQsODtm6H0P4yvOkEOaKtByZPUd18pBQ=;
	b=BZppN7RNnYH02WmWPPcseU//P7XaoxjA9pH4QHv88qDoc3IRdqUlhqCxQoPf4BYbe4dO6V/Y320Mv67tuZFjrvXdsS/Nxse+CeE//XSaHk96BCEfrmcp/J8ZKmGS4D2Aw3pnke38moiNDxL+kHuu9TAxZFsL5FdwwGeb1WgkqbQ=
Received: from BYAPR05MB4776.namprd05.prod.outlook.com (52.135.233.146) by
	BYAPR05MB6056.namprd05.prod.outlook.com (20.178.54.13) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2199.9; Wed, 21 Aug 2019 16:34:47 +0000
Received: from BYAPR05MB4776.namprd05.prod.outlook.com
	([fe80::1541:ed53:784a:6376]) by
	BYAPR05MB4776.namprd05.prod.outlook.com
	([fe80::1541:ed53:784a:6376%5]) with mapi id 15.20.2199.011;
	Wed, 21 Aug 2019 16:34:47 +0000
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH] mm/balloon_compaction: suppress allocation warnings
Thread-Topic: [PATCH] mm/balloon_compaction: suppress allocation warnings
Thread-Index: AQHVV3WT44k5kIt6JEiYnWTDWJ3OpKcFxbMAgAAE4ICAAAGZAIAAAZgA
Date: Wed, 21 Aug 2019 16:34:47 +0000
Message-ID: <FC42B62F-167F-4D7D-ADC5-926B36347E82@vmware.com>
References: <20190820091646.29642-1-namit@vmware.com>
	<ba01ec8c-19c3-847c-a315-2f70f4b1fe31@redhat.com>
	<5BBC6CB3-2DCD-4A95-90C9-7C23482F9B32@vmware.com>
	<85c72875-278f-fbab-69c9-92dc1873d407@redhat.com>
In-Reply-To: <85c72875-278f-fbab-69c9-92dc1873d407@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=namit@vmware.com; 
x-originating-ip: [66.170.99.2]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: da165d56-4bbf-47e8-5244-08d726557b0f
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
	SRVR:BYAPR05MB6056; 
x-ms-traffictypediagnostic: BYAPR05MB6056:
x-microsoft-antispam-prvs: <BYAPR05MB60565C2905FC3476A1FDF2CAD0AA0@BYAPR05MB6056.namprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0136C1DDA4
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(4636009)(376002)(346002)(39860400002)(396003)(136003)(366004)(199004)(189003)(14444005)(446003)(71190400001)(7736002)(486006)(2616005)(3846002)(476003)(6436002)(6486002)(8936002)(33656002)(2906002)(6246003)(25786009)(81166006)(229853002)(4326008)(6916009)(6116002)(81156014)(8676002)(256004)(11346002)(66066001)(316002)(26005)(76176011)(6512007)(54906003)(186003)(5660300002)(478600001)(86362001)(66446008)(66476007)(76116006)(53546011)(64756008)(66556008)(6506007)(66946007)(102836004)(71200400001)(14454004)(305945005)(53936002)(36756003)(99286004);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR05MB6056;
	H:BYAPR05MB4776.namprd05.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: vmware.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 8HrHVUoIoJb4xGM3I+7JnFykmwZtjEjLRx+DP93nsCwMIGfNUW8vZrU7wCjmmQ/zgHDSo35NfaHHOitHXG79ZSsG4KmcH164lEngZ4XDDVgYyjrYa7Piuw2eBWa9LfBv3JrMbcrs9ktMBc3gEyZk3tFunpp+9LL9qzZ2yGO7C0A3XEof+5OxpGlJ3smVYNZgMUtr06aHqx7SVapVp/v04XvgYpzKWml3buOc7XnT5K5bL9TnbvKpK4WECBQUPj4jiINY74jdzefKY2fAS63biRgW3K7dEGByiIkeuH8IfWGIUP3MzXoUGfp5n9TiwyHlbujQ6MA1OvgMlURrB9b7pJnmr3xGRF6k0tlFBn1zQGtUJuI9aIjlWZUB2GdLX5iYjT94r7S3QApGjI2S5p+R+Vsl06Ca4K10rRFLEVzsKYw=
x-ms-exchange-transport-forked: True
Content-ID: <E4FB9F0E191CCC4FBEC50321374661EC@namprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da165d56-4bbf-47e8-5244-08d726557b0f
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2019 16:34:47.4052 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RC7AqEiwOmITN26+lGyHmMnwXPXvPXUerkwcYKHVIf8wcRYtNgygfVsxMbXp74ctjTxGOrPUECyNH54FQtNNJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR05MB6056
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: "linux-mm@kvack.org" <linux-mm@kvack.org>,
	"virtualization@lists.linux-foundation.org"
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

PiBPbiBBdWcgMjEsIDIwMTksIGF0IDk6MjkgQU0sIERhdmlkIEhpbGRlbmJyYW5kIDxkYXZpZEBy
ZWRoYXQuY29tPiB3cm90ZToNCj4gDQo+IE9uIDIxLjA4LjE5IDE4OjIzLCBOYWRhdiBBbWl0IHdy
b3RlOg0KPj4+IE9uIEF1ZyAyMSwgMjAxOSwgYXQgOTowNSBBTSwgRGF2aWQgSGlsZGVuYnJhbmQg
PGRhdmlkQHJlZGhhdC5jb20+IHdyb3RlOg0KPj4+IA0KPj4+IE9uIDIwLjA4LjE5IDExOjE2LCBO
YWRhdiBBbWl0IHdyb3RlOg0KPj4+PiBUaGVyZSBpcyBubyByZWFzb24gdG8gcHJpbnQgd2Fybmlu
Z3Mgd2hlbiBiYWxsb29uIHBhZ2UgYWxsb2NhdGlvbiBmYWlscywNCj4+Pj4gYXMgdGhleSBhcmUg
ZXhwZWN0ZWQgYW5kIGNhbiBiZSBoYW5kbGVkIGdyYWNlZnVsbHkuICBTaW5jZSBWTXdhcmUNCj4+
Pj4gYmFsbG9vbiBub3cgdXNlcyBiYWxsb29uLWNvbXBhY3Rpb24gaW5mcmFzdHJ1Y3R1cmUsIGFu
ZCBzdXBwcmVzc2VkIHRoZXNlDQo+Pj4+IHdhcm5pbmdzIGJlZm9yZSwgaXQgaXMgYWxzbyBiZW5l
ZmljaWFsIHRvIHN1cHByZXNzIHRoZXNlIHdhcm5pbmdzIHRvDQo+Pj4+IGtlZXAgdGhlIHNhbWUg
YmVoYXZpb3IgdGhhdCB0aGUgYmFsbG9vbiBoYWQgYmVmb3JlLg0KPj4+IA0KPj4+IEkgYW0gbm90
IHN1cmUgaWYgdGhhdCdzIGEgZ29vZCBpZGVhLiBUaGUgYWxsb2NhdGlvbiB3YXJuaW5ncyBhcmUg
dXN1YWxseQ0KPj4+IHRoZSBvbmx5IHRyYWNlIG9mICJ0aGUgdXNlci9hZG1pbiBkaWQgc29tZXRo
aW5nIGJhZCBiZWNhdXNlIGhlL3NoZSB0cmllZA0KPj4+IHRvIGluZmxhdGUgdGhlIGJhbGxvb24g
dG8gYW4gdW5zYWZlIHZhbHVlIi4gQmVsaWV2ZSBtZSwgSSBwcm9jZXNzZWQgYQ0KPj4+IGNvdXBs
ZSBvZiBzdWNoIGJ1Z3JlcG9ydHMgcmVsYXRlZCB0byB2aXJ0aW8tYmFsbG9vbiBhbmQgdGhlIHdh
cm5pbmcgd2VyZQ0KPj4+IHZlcnkgaGVscGZ1bCBmb3IgdGhhdC4NCj4+IA0KPj4gT2ssIHNvIGEg
bWVzc2FnZSBpcyBuZWVkZWQsIGJ1dCBkb2VzIGl0IGhhdmUgdG8gYmUgYSBnZW5lcmljIGZyaWdo
dGVuaW5nDQo+PiB3YXJuaW5nPw0KPj4gDQo+PiBIb3cgYWJvdXQgdXNpbmcgX19HRlBfTk9XQVJO
LCBhbmQgaWYgYWxsb2NhdGlvbiBkbyBzb21ldGhpbmcgbGlrZToNCj4+IA0KPj4gIHByX3dhcm4o
4oCcQmFsbG9vbiBtZW1vcnkgYWxsb2NhdGlvbiBmYWlsZWTigJ0pOw0KPj4gDQo+PiBPciBldmVu
IHNvbWV0aGluZyBtb3JlIGluZm9ybWF0aXZlPyBUaGlzIHdvdWxkIHN1cmVseSBiZSBsZXNzIGlu
dGltaWRhdGluZw0KPj4gZm9yIGNvbW1vbiB1c2Vycy4NCj4gDQo+IHJhdGVsaW1pdCB3b3VsZCBt
YWtlIHNlbnNlIDopDQo+IA0KPiBBbmQgeWVzLCB0aGlzIHdvdWxkIGNlcnRhaW5seSBiZSBuaWNl
ci4NCg0KVGhhbmtzLiBJIHdpbGwgcG9zdCB2MiBvZiB0aGUgcGF0Y2guDQoNCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxp
bmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczov
L2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlv
bg==
