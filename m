Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id C11FB152739
	for <lists.virtualization@lfdr.de>; Wed,  5 Feb 2020 08:51:32 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 66824861A7;
	Wed,  5 Feb 2020 07:51:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3tK70rxQnPi3; Wed,  5 Feb 2020 07:51:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 0E0A486123;
	Wed,  5 Feb 2020 07:51:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E11F0C1D81;
	Wed,  5 Feb 2020 07:51:29 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8371FC0174
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Feb 2020 07:51:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 709348444E
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Feb 2020 07:51:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vRIEUQ9W-W7T
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Feb 2020 07:51:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700075.outbound.protection.outlook.com [40.107.70.75])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 4294B842EA
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Feb 2020 07:51:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LWyStbozRQcxWVyayOdNgJ3pO/qvygTtg/Al/vToEyfUd+MrsdG9D7hT5xeyL1COsQKRi8iV/itJ5ci7CyDvST3ZekbCfLGHIkgCIZxD3OcfoS2cHBT2qOfck5N2ZEZ674SzE7eewMylvWBJDl5I1m4QLX6fs9be+Vi984OaAmOqJJO4cyRynHVKPtIGfEJYPdY7o8XcKfj+oBTgBLDya/A+Oa3RqlwIZFOd0kvplCZ2YTxqaLTYKmNwtaDhnhy1O36LtZyWPxEC8YR3FeKrdmEDot/wv9s2XBnJfzAveMxb8p55mjic2gOe8GXv6bw/v4wm8GscyiaqJf1DsZ8XFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YdvSqOXlelG/fAv5gp6HsNJpFxJK8LXK8CCewcHDtIY=;
 b=O0FNG1n48KjZz6GqR/+YMf2nqCMPrMJAoiaTDGHjfkt5lLNL5eV98jEVE3AMfUNdG5W3Dm90jXbTAKCd8nSlBWbBius6knWekaIwUf8kf/Ec5dvfqITaUnTHl6mXmTR4ZwWvu422aIyd7qT3eEAAJk2D7biMvuSbczm+cb3oxY9qJyMXluNYqgGOpjxdNGPKnJkfNh6EkssD9MpRvQAV0QCUJO176hCvPwEHe/aioFUg2wvpUwFoTZB/jBjwR1imfJJYY2FsVDyMQO0Q/sfiHctza7eTmGTiKELP7LBR3zDUmqUTJJO+ksjsJxkTW52DyrxXlSkmhUXrjskYQPSUJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YdvSqOXlelG/fAv5gp6HsNJpFxJK8LXK8CCewcHDtIY=;
 b=g/zKc1qwRkOzTTzWAVJ1bEf+dOJuhRSjWNDHn6Jo9iD+AfUQIGfwyzpRuicYdDiR8gaQRHVSBoYgxDd7BTdfCAI/xX/L+u7k0oJwzH9+GynmBMPe8idmRb+AKRHK8c4qxkQT+qdatZKUqdE5YsjPZLdFybnF4R7YcV/bhmXUg4Q=
Received: from BYAPR05MB4776.namprd05.prod.outlook.com (52.135.233.146) by
 BYAPR05MB5464.namprd05.prod.outlook.com (20.177.186.219) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2707.10; Wed, 5 Feb 2020 07:35:25 +0000
Received: from BYAPR05MB4776.namprd05.prod.outlook.com
 ([fe80::7c65:25af:faf7:5331]) by BYAPR05MB4776.namprd05.prod.outlook.com
 ([fe80::7c65:25af:faf7:5331%2]) with mapi id 15.20.2707.018; Wed, 5 Feb 2020
 07:35:25 +0000
To: David Hildenbrand <david@redhat.com>
Subject: Re: Balloon pressuring page cache
Thread-Topic: Balloon pressuring page cache
Thread-Index: AQHV2uRakFYQY7vaBUSq2sNiClqnPagMN94A
Date: Wed, 5 Feb 2020 07:35:24 +0000
Message-ID: <08D323B9-0B4A-47B2-9955-511B8FBA056B@vmware.com>
References: <CAJuQAmpDUyve2S+oxp9tLUhuRcnddXnNztC5PmYOOCpY6c68xg@mail.gmail.com>
 <91270a68-ff48-88b0-219c-69801f0c252f@redhat.com>
 <CAJuQAmoaK0Swytu2Os_SQRfG5_LqiCPaDa9yatatm9MtfncNTQ@mail.gmail.com>
 <75d4594f-0864-5172-a0f8-f97affedb366@redhat.com>
 <286AC319A985734F985F78AFA26841F73E3F8A02@shsmsx102.ccr.corp.intel.com>
 <CAJuQAmqcayaNuG19fKCuux=YVO3+VcN-qrXvobgKMykogeMkzA@mail.gmail.com>
 <20200203080520-mutt-send-email-mst@kernel.org>
 <5ac131de8e3b7fc1fafd05a61feb5f6889aeb917.camel@linux.intel.com>
 <c836a8d1-c5cc-eb8b-84ed-027070b77bf8@redhat.com>
 <539B606A-A0CA-4AA4-B99A-759C874A1EF8@vmware.com>
In-Reply-To: <539B606A-A0CA-4AA4-B99A-759C874A1EF8@vmware.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=namit@vmware.com; 
x-originating-ip: [2601:647:4700:9b2:71e4:1400:b0f6:b6c]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a7c48ab5-bd38-4d92-ebf9-08d7aa0df6ec
x-ms-traffictypediagnostic: BYAPR05MB5464:
x-microsoft-antispam-prvs: <BYAPR05MB5464294942C48F70CBD2F708D0020@BYAPR05MB5464.namprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0304E36CA3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(366004)(39860400002)(346002)(136003)(376002)(199004)(189003)(54906003)(6486002)(6512007)(478600001)(2616005)(316002)(36756003)(3480700007)(4326008)(8676002)(71200400001)(81166006)(81156014)(6916009)(86362001)(8936002)(5660300002)(186003)(64756008)(66476007)(66556008)(66446008)(2906002)(66946007)(53546011)(76116006)(33656002)(6506007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR05MB5464;
 H:BYAPR05MB4776.namprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: vmware.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bDU+48dm1tDkyZmVJ09a7JtjwVMoR1tPwWPOLZzkHgMTsZ5aQ4FTyQiHzgiKFIuz4QqRnOh9kghLeTUC1KzSRwWDWKIHC/AFCdXEoJGuxmsWBKBqRt40/BPe3AUt3TeaVl3OSxZCmAnZPEs5glvoW2zXcPUE0RwBYcTl4OQ6LTIdQcnmSoOSTChmF0Lh7wEFCYBFitLuhge1etVwDglK/6dRzXIeoOAd1yCXy4cs1dl+g+kW+Cq/JvOP29RCeC1V02Lq57cHpo1HsaTNhmdv800FFFOEBATtzLb9XeAyUMvuceLINMFC/McHJ72z6bfYuKiWkygjYSv/zeOZ8yEtxWZCUGUjGk+/FWPmWeT3vJade/a0p7Ale7nGcvAQzvTEhLe6NKekFrr9nYehehcncEz0qk/rO7CvRcUsEK0yIR5KPdRL1x4HxVagdUJejuZ6wzIkytgK1zF6L0+9m04ZpeS4tKf6L6Z4KrNq0v8pppbo6cPmcXH47bU3HZ+oi/sxVYrB+eXhCXTkqqEIC9CavQ==
x-ms-exchange-antispam-messagedata: 9+NL1VerxVZsfbHjJbzJNT5O03N8FLisDL2U4BkTJLT2Q0+SRk6HuspHf7odn6C511whklQ/NZynxM00sigAezOqbBALfNcD0RHqB8ZGwZTLqgfZDmeKgDZOuiL1xD6l85VlvNyTQBUq6JdASCCW3D5+x94gZaKR/dG/gySmnFYQCjaXeD5L/WFf01Wp9aDSEWswKYmiLhB0EN4oKuStuQ==
x-ms-exchange-transport-forked: True
Content-ID: <C60F3DEE54DE9644B2F008073CDF3EA6@namprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7c48ab5-bd38-4d92-ebf9-08d7aa0df6ec
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Feb 2020 07:35:24.8524 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nZ0tRWD+ETuRfJc0vk99PnswINfK97/vmT67+kEVbfQlb4+o4+8OkAHqATh2qOu4GPuwHiBa41ENt+a28WoENg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR05MB5464
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 Tyler Sanderson <tysand@google.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
 David Rientjes <rientjes@google.com>,
 Alexander Duyck <alexander.h.duyck@linux.intel.com>,
 Michal Hocko <mhocko@kernel.org>
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
From: Nadav Amit via Virtualization <virtualization@lists.linux-foundation.org>
Reply-To: Nadav Amit <namit@vmware.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

PiBPbiBGZWIgMywgMjAyMCwgYXQgMjo1MCBQTSwgTmFkYXYgQW1pdCA8bmFtaXRAdm13YXJlLmNv
bT4gd3JvdGU6DQo+IA0KPj4gT24gRmViIDMsIDIwMjAsIGF0IDg6MzQgQU0sIERhdmlkIEhpbGRl
bmJyYW5kIDxkYXZpZEByZWRoYXQuY29tPiB3cm90ZToNCj4+IA0KPj4gT24gMDMuMDIuMjAgMTc6
MTgsIEFsZXhhbmRlciBEdXljayB3cm90ZToNCj4+PiBPbiBNb24sIDIwMjAtMDItMDMgYXQgMDg6
MTEgLTA1MDAsIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90ZToNCj4+Pj4gT24gVGh1LCBKYW4gMzAs
IDIwMjAgYXQgMTE6NTk6NDZBTSAtMDgwMCwgVHlsZXIgU2FuZGVyc29uIHdyb3RlOg0KPj4+Pj4g
T24gVGh1LCBKYW4gMzAsIDIwMjAgYXQgNzozMSBBTSBXYW5nLCBXZWkgVyA8d2VpLncud2FuZ0Bp
bnRlbC5jb20+IHdyb3RlOg0KPj4+Pj4gDQo+Pj4+PiAgIE9uIFRodXJzZGF5LCBKYW51YXJ5IDMw
LCAyMDIwIDExOjAzIFBNLCBEYXZpZCBIaWxkZW5icmFuZCB3cm90ZToNCj4+Pj4+PiBPbiAyOS4w
MS4yMCAyMDoxMSwgVHlsZXIgU2FuZGVyc29uIHdyb3RlOg0KPj4+Pj4+PiBPbiBXZWQsIEphbiAy
OSwgMjAyMCBhdCAyOjMxIEFNIERhdmlkIEhpbGRlbmJyYW5kIDxkYXZpZEByZWRoYXQuY29tDQo+
Pj4+Pj4+IDxtYWlsdG86ZGF2aWRAcmVkaGF0LmNvbT4+IHdyb3RlOg0KPj4+Pj4+PiANCj4+Pj4+
Pj4gICBPbiAyOS4wMS4yMCAwMToyMiwgVHlsZXIgU2FuZGVyc29uIHZpYSBWaXJ0dWFsaXphdGlv
biB3cm90ZToNCj4+Pj4+Pj4+IEEgcHJpbWFyeSBhZHZhbnRhZ2Ugb2YgdmlydGlvIGJhbGxvb24g
b3ZlciBvdGhlciBtZW1vcnkgcmVjbGFpbQ0KPj4+Pj4+Pj4gbWVjaGFuaXNtcyBpcyB0aGF0IGl0
IGNhbiBwcmVzc3VyZSB0aGUgZ3Vlc3QncyBwYWdlIGNhY2hlIGludG8NCj4+Pj4+Pj4gICBzaHJp
bmtpbmcuDQo+Pj4+Pj4+PiBIb3dldmVyLCBzaW5jZSB0aGUgYmFsbG9vbiBkcml2ZXIgY2hhbmdl
ZCB0byB1c2luZyB0aGUgc2hyaW5rZXINCj4+Pj4+ICAgQVBJDQo+Pj4+Pj4gPGh0dHBzOi8vZ2l0
aHViLmNvbS90b3J2YWxkcy9saW51eC9jb21taXQvNzE5OTQ2MjBiYjI1YThiMTA5Mzg4ZmVmYTkN
Cj4+Pj4+PiBlOTlhMjhlMzU1MjU1YSNkaWZmLWZkMjAyYWNmNjk0ZDllYmExOWM4YzY0ZGEzZTQ4
MGM5PiB0aGlzDQo+Pj4+Pj4+PiB1c2UgY2FzZSBoYXMgYmVjb21lIGEgYml0IG1vcmUgdHJpY2t5
LiBJJ20gd29uZGVyaW5nIHdoYXQgdGhlDQo+Pj4+Pj4gaW50ZW5kZWQNCj4+Pj4+Pj4+IGRldmlj
ZSBpbXBsZW1lbnRhdGlvbiBpcy4NCj4+Pj4+Pj4+IA0KPj4+Pj4+Pj4gV2hlbiBpbmZsYXRpbmcg
dGhlIGJhbGxvb24gYWdhaW5zdCBwYWdlIGNhY2hlIChpLmUuIG5vIGZyZWUNCj4+Pj4+ICAgbWVt
b3J5DQo+Pj4+Pj4+PiByZW1haW5zKSB2bXNjYW4uYyB3aWxsIGJvdGggc2hyaW5rIHBhZ2UgY2Fj
aGUsIGJ1dCBhbHNvIGludm9rZQ0KPj4+Pj4gICB0aGUNCj4+Pj4+Pj4+IHNocmlua2VycyAtLSBp
bmNsdWRpbmcgdGhlIGJhbGxvb24ncyBzaHJpbmtlci4gU28gdGhlIGJhbGxvb24NCj4+Pj4+ICAg
ZHJpdmVyDQo+Pj4+Pj4+PiBhbGxvY2F0ZXMgbWVtb3J5IHdoaWNoIHJlcXVpcmVzIHJlY2xhaW0s
IHZtc2NhbiBnZXRzIHRoaXMgbWVtb3J5DQo+Pj4+Pj4gYnkNCj4+Pj4+Pj4+IHNocmlua2luZyB0
aGUgYmFsbG9vbiwgYW5kIHRoZW4gdGhlIGRyaXZlciBhZGRzIHRoZSBtZW1vcnkgYmFjaw0KPj4+
Pj4gICB0bw0KPj4+Pj4+IHRoZQ0KPj4+Pj4+Pj4gYmFsbG9vbi4gQmFzaWNhbGx5IGEgYnVzeSBu
by1vcC4NCj4+Pj4+IA0KPj4+Pj4gICBQZXIgbXkgdW5kZXJzdGFuZGluZywgdGhlIGJhbGxvb24g
YWxsb2NhdGlvbiB3b27igJl0IGludm9rZSBzaHJpbmtlciBhcw0KPj4+Pj4gICBfX0dGUF9ESVJF
Q1RfUkVDTEFJTSBpc24ndCBzZXQsIG5vPw0KPj4+Pj4gDQo+Pj4+PiBJIGNvdWxkIGJlIHdyb25n
IGFib3V0IHRoZSBtZWNoYW5pc20sIGJ1dCB0aGUgZGV2aWNlIHNlZXMgbG90cyBvZiBhY3Rpdml0
eSBvbg0KPj4+Pj4gdGhlIGRlZmxhdGUgcXVldWUuIFRoZSBiYWxsb29uIGlzIGJlaW5nIHNocnVu
ay4gQW5kIHRoaXMgb25seSBzdGFydHMgb25jZSBhbGwNCj4+Pj4+IGZyZWUgbWVtb3J5IGlzIGRl
cGxldGVkIGFuZCB3ZSdyZSBpbmZsYXRpbmcgaW50byBwYWdlIGNhY2hlLg0KPj4+PiANCj4+Pj4g
U28gZ2l2ZW4gdGhpcyBsb29rcyBsaWtlIGEgcmVncmVzc2lvbiwgbWF5YmUgd2Ugc2hvdWxkIHJl
dmVydCB0aGUNCj4+Pj4gcGF0Y2ggaW4gcXVlc3Rpb24gNzE5OTQ2MjBiYjI1ICgidmlydGlvX2Jh
bGxvb246IHJlcGxhY2Ugb29tIG5vdGlmaWVyIHdpdGggc2hyaW5rZXIiKQ0KPj4+PiBCZXNpZGVz
LCB3aXRoIFZJUlRJT19CQUxMT09OX0ZfRlJFRV9QQUdFX0hJTlQNCj4+Pj4gc2hyaW5rZXIgYWxz
byBpZ25vcmVzIFZJUlRJT19CQUxMT09OX0ZfTVVTVF9URUxMX0hPU1Qgd2hpY2ggaXNuJ3Qgbmlj
ZQ0KPj4+PiBhdCBhbGwuDQo+Pj4+IA0KPj4+PiBTbyBpdCBsb29rcyBsaWtlIGFsbCB0aGlzIHJl
d29yayBpbnRyb2R1Y2VkIG1vcmUgaXNzdWVzIHRoYW4gaXQNCj4+Pj4gYWRkcmVzc2VkIC4uLg0K
Pj4+PiANCj4+Pj4gSSBhbHNvIENDIEFsZXggRHV5Y2sgZm9yIGFuIG9waW5pb24gb24gdGhpcy4N
Cj4+Pj4gQWxleCwgd2hhdCBkbyB5b3UgdXNlIHRvIHB1dCBwcmVzc3VyZSBvbiBwYWdlIGNhY2hl
Pw0KPj4+IA0KPj4+IEkgd291bGQgc2F5IHJldmVydGluZyBwcm9iYWJseSBtYWtlcyBzZW5zZS4g
SSdtIG5vdCBzdXJlIHRoZXJlIGlzIG11Y2gNCj4+PiB2YWx1ZSB0byBoYXZpbmcgYSBzaHJpbmtl
ciBydW5uaW5nIGRlZmxhdGlvbiB3aGVuIHlvdSBhcmUgYWN0aXZlbHkgdHJ5aW5nDQo+Pj4gdG8g
aW5jcmVhc2UgdGhlIGJhbGxvb24uIEl0IHdvdWxkIG1ha2UgbW9yZSBzZW5zZSB0byB3YWl0IHVu
dGlsIHlvdSBhcmUNCj4+PiBhY3R1YWxseSBhYm91dCB0byBzdGFydCBoaXR0aW5nIG9vbS4NCj4+
IA0KPj4gSSB0aGluayB0aGUgc2hyaW5rZXIgbWFrZXMgc2Vuc2UgZm9yIGZyZWUgcGFnZSBoaW50
aW5nIGZlYXR1cmUNCj4+IChldmVyeXRoaW5nIG9uIGZyZWVfcGFnZV9saXN0KS4NCj4+IA0KPj4g
U28gaW5zdGVhZCBvZiBvbmx5IHJldmVydGluZywgSSB0aGluayB3ZSBzaG91bGQgc3BsaXQgaXQg
dXAgYW5kIGFsd2F5cw0KPj4gcmVnaXN0ZXIgdGhlIHNocmlua2VyIGZvciBWSVJUSU9fQkFMTE9P
Tl9GX0ZSRUVfUEFHRV9ISU5UIGFuZCB0aGUgT09NDQo+PiBub3RpZmllciAoYXMgYmVmb3JlKSBm
b3IgVklSVElPX0JBTExPT05fRl9NVVNUX1RFTExfSE9TVC4NCj4+IA0KPj4gKE9mIGNvdXJzZSwg
YWRhcHRpbmcgd2hhdCBpcyBiZWluZyBkb25lIGluIHRoZSBzaHJpbmtlciBhbmQgaW4gdGhlIE9P
TQ0KPj4gbm90aWZpZXIpDQo+IA0KPiBEYXZpZCwNCj4gDQo+IFBsZWFzZSBrZWVwIG1lIHBvc3Rl
ZC4gSSBkZWNpZGVkIHRvIGFkYXB0IHRoZSBzYW1lIHNvbHV0aW9uIGFzIHRoZSB2aXJ0aW8NCj4g
YmFsbG9vbiBmb3IgdGhlIFZNd2FyZSBiYWxsb29uLiBJZiB0aGUgdmVyZGljdCBpcyB0aGF0IHRo
aXMgaXMgZGFtYWdpbmcgYW5kDQo+IHRoZSBPT00gbm90aWZpZXIgc2hvdWxkIGJlIHVzZWQgaW5z
dGVhZCwgSSB3aWxsIHN1Ym1pdCBwYXRjaGVzIHRvIG1vdmUgdG8NCj4gT09NIG5vdGlmaWVyIGFz
IHdlbGwuDQoNCkFkZGluZyBzb21lIGluZm9ybWF0aW9uIGZvciB0aGUgcmVjb3JkIChpZiBzb21l
b25lIGdvb2dsZXMgdGhpcyB0aHJlYWQpOg0KDQpJbiB0aGUgVk13YXJlIGJhbGxvb24gZHJpdmVy
LCB0aGUgc2hyaW5rZXIgaXMgZGlzYWJsZWQgYnkgZGVmYXVsdCBzaW5jZSB3ZQ0KZW5jb3VudGVy
ZWQgYSBwZXJmb3JtYW5jZSBkZWdyYWRhdGlvbiBpbiB0ZXN0aW5nLiBJIHRyaWVkIHRvIGF2b2lk
IHJhcGlkDQppbmZsYXRpb24vc2hyaW5rZXItZGVmbGF0aW9uIGN5Y2xlcyBieSBhZGRpbmcgYSB0
aW1lb3V0LCBidXQgYXBwYXJlbnRseSBpdA0KZGlkIG5vdCBoZWxwIGluIGF2b2lkaW5nIHRoZSBw
ZXJmb3JtYW5jZSByZWdyZXNzaW9uLg0KDQpTbyB0aGVyZSBpcyBubyBzdWNoIGlzc3VlIGluIFZN
d2FyZSBiYWxsb29uIGRyaXZlciwgdW5sZXNzIHNvbWVvbmUNCmludGVudGlvbmFsbHkgZW5hYmxl
cyB0aGUgc2hyaW5rZXIgdGhyb3VnaCBhIG1vZHVsZSBwYXJhbWV0ZXIuDQoNCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxp
bmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczov
L2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlv
bg==
