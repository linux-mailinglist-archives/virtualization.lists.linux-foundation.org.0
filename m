Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id C19867376F
	for <lists.virtualization@lfdr.de>; Wed, 24 Jul 2019 21:09:03 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 0681913EC;
	Wed, 24 Jul 2019 18:59:39 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 79357270B
	for <virtualization@lists.linux-foundation.org>;
	Fri, 19 Jul 2019 14:29:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
	(mail-oln040092010109.outbound.protection.outlook.com [40.92.10.109])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id C1FF9887
	for <virtualization@lists.linux-foundation.org>;
	Fri, 19 Jul 2019 14:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
	s=selector1;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=ioJUaMXICoRqtBY8u7e79bGIp+iiseMksbPRmJlfptk=;
	b=Le/dpl3FO98TR3Q0do2Et02svqO7DOeq8Rj2VyR/Ond3I7o5Z4YxwhOVxAgPhSkS+zP0w15qEKQ1JFajcl873vZv4QpU7tEKez+Jw9OmTI4J4p82LgyMcGFQ9+KDLgyjf64SKchkrIS9kCQ8Fvz0G6p+HPyf8IMDf3otKPTrmAmWL5f1pRdNN5A7u8FRHOgZ0CVZZZv0PJHQqrLN7ijQMyGz4xu3iN2out+rOQGPklhgY61NEuUWbLvr2cbh5zEqUNN8q32Rlw0KUVYMD9+FYgulkmMf9lPaB1PDFJn8x5GypTetlzjoHaXbFkGVC7OD63h4Gf6NJw37gq+ljKUYrA==
Received: from CO1NAM04FT064.eop-NAM04.prod.protection.outlook.com
	(10.152.90.56) by CO1NAM04HT017.eop-NAM04.prod.protection.outlook.com
	(10.152.91.78) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2052.18;
	Fri, 19 Jul 2019 14:29:42 +0000
Received: from BYAPR14MB3205.namprd14.prod.outlook.com (10.152.90.56) by
	CO1NAM04FT064.mail.protection.outlook.com (10.152.91.144) with
	Microsoft SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2052.18 via Frontend Transport; Fri, 19 Jul 2019 14:29:42 +0000
Received: from BYAPR14MB3205.namprd14.prod.outlook.com
	([fe80::90b2:404:ecfe:30ab]) by BYAPR14MB3205.namprd14.prod.outlook.com
	([fe80::90b2:404:ecfe:30ab%6]) with mapi id 15.20.2094.011;
	Fri, 19 Jul 2019 14:29:42 +0000
From: =?utf-8?B?5YaJIGppYW5n?= <jiangkidd@hotmail.com>
To: Jason Wang <jasowang@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH] virtio-net: parameterize min ring num_free for virtio
	receive
Thread-Topic: [PATCH] virtio-net: parameterize min ring num_free for virtio
	receive
Thread-Index: AQHVPWggIuOCp2PIFki8Fasred18HabQV+AAgAAPyoCAAAungIAAAEYAgADHPQCAAMcfgA==
Date: Fri, 19 Jul 2019 14:29:42 +0000
Message-ID: <BYAPR14MB3205D9D62B96691EC647030CA6CB0@BYAPR14MB3205.namprd14.prod.outlook.com>
References: <BYAPR14MB32056583C4963342F5D817C4A6C80@BYAPR14MB3205.namprd14.prod.outlook.com>
	<20190718085836-mutt-send-email-mst@kernel.org>
	<bdd30ef5-4f69-8218-eed0-38c6daac42db@redhat.com>
	<20190718103641-mutt-send-email-mst@kernel.org>
	<20190718104307-mutt-send-email-mst@kernel.org>
	<d1faa33a-6c4c-1190-8430-f0639edc3b96@redhat.com>
In-Reply-To: <d1faa33a-6c4c-1190-8430-f0639edc3b96@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK2PR02CA0220.apcprd02.prod.outlook.com
	(2603:1096:201:20::32) To BYAPR14MB3205.namprd14.prod.outlook.com
	(2603:10b6:a03:ab::18)
x-incomingtopheadermarker: OriginalChecksum:365F0E27E309C650A1CEE29117D26FFACBCB32A651434DB11F97CA040477654B;
	UpperCasedChecksum:A511475669A92D02F9852A8E08F3EC8EA790DD9E9A2687E7CC77A9424C3BCFC2;
	SizeAsReceived:8550; Count:49
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [gFqvvJ3LIef7GDM/qy7uEQq8tfQVGhL8]
x-microsoft-original-message-id: <9c1bdbc5-e2c1-8dd7-52f9-1a4b43b86ff0@hotmail.com>
x-ms-publictraffictype: Email
x-incomingheadercount: 49
x-eopattributedmessage: 0
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(5050001)(7020095)(20181119110)(201702061078)(5061506573)(5061507331)(1603103135)(2017031320274)(2017031323274)(2017031324274)(2017031322404)(1601125500)(1603101475)(1701031045);
	SRVR:CO1NAM04HT017; 
x-ms-traffictypediagnostic: CO1NAM04HT017:
x-microsoft-antispam-message-info: Wy+texAaQ4rWuaxum8ydcOiNJIWPwdagjHk/svlrgy/rvrDlM2iMtC4gqVI+g/BTJm7BnwV1BEtyT4JSF7IemGbz8/oFUFz1duMEEW13yuss3OEPXkcrHyiVzFnVRIFJng7hTgokCdnA+A4T6r5l6Ko0O+9MabMpuT1BOel41m0ClOYp4NYcVizV6ZG1PHiy
Content-ID: <B80A979BFC294147820AACF54C95F378@namprd14.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: hotmail.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 581c5d1a-9404-43a4-ee82-08d70c558a0a
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2019 14:29:42.7158 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1NAM04HT017
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, FROM_EXCESS_BASE64,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
X-Mailman-Approved-At: Wed, 24 Jul 2019 18:59:23 +0000
Cc: "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>,
	"songliubraving@fb.com" <songliubraving@fb.com>,
	"jakub.kicinski@netronome.com" <jakub.kicinski@netronome.com>,
	"hawk@kernel.org" <hawk@kernel.org>,
	"daniel@iogearbox.net" <daniel@iogearbox.net>,
	"jiangran.jr@alibaba-inc.com" <jiangran.jr@alibaba-inc.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"john.fastabend@gmail.com" <john.fastabend@gmail.com>,
	"ast@kernel.org" <ast@kernel.org>, "kafai@fb.com" <kafai@fb.com>,
	"yhs@fb.com" <yhs@fb.com>, "bpf@vger.kernel.org" <bpf@vger.kernel.org>,
	"virtualization@lists.linux-foundation.org"
	<virtualization@lists.linux-foundation.org>,
	"davem@davemloft.net" <davem@davemloft.net>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

DQpPbiAyMDE5LzcvMTkgMTA6MzYsIEphc29uIFdhbmcgd3JvdGU6DQo+DQo+IE9uIDIwMTkvNy8x
OCDkuIvljYgxMDo0MywgTWljaGFlbCBTLiBUc2lya2luIHdyb3RlOg0KPj4gT24gVGh1LCBKdWwg
MTgsIDIwMTkgYXQgMTA6NDI6NDdBTSAtMDQwMCwgTWljaGFlbCBTLiBUc2lya2luIHdyb3RlOg0K
Pj4+IE9uIFRodSwgSnVsIDE4LCAyMDE5IGF0IDEwOjAxOjA1UE0gKzA4MDAsIEphc29uIFdhbmcg
d3JvdGU6DQo+Pj4+IE9uIDIwMTkvNy8xOCDkuIvljYg5OjA0LCBNaWNoYWVsIFMuIFRzaXJraW4g
d3JvdGU6DQo+Pj4+PiBPbiBUaHUsIEp1bCAxOCwgMjAxOSBhdCAxMjo1NTo1MFBNICswMDAwLCA/
IGppYW5nIHdyb3RlOg0KPj4+Pj4+IFRoaXMgY2hhbmdlIG1ha2VzIHJpbmcgYnVmZmVyIHJlY2xh
aW0gdGhyZXNob2xkIG51bV9mcmVlIA0KPj4+Pj4+IGNvbmZpZ3VyYWJsZQ0KPj4+Pj4+IGZvciBi
ZXR0ZXIgcGVyZm9ybWFuY2UsIHdoaWxlIGl0J3MgaGFyZCBjb2RlZCBhcyAxLzIgKiBxdWV1ZSBu
b3cuDQo+Pj4+Pj4gQWNjb3JkaW5nIHRvIG91ciB0ZXN0IHdpdGggcWVtdSArIGRwZGssIHBhY2tl
dCBkcm9wcGluZyBoYXBwZW5zIHdoZW4NCj4+Pj4+PiB0aGUgZ3Vlc3QgaXMgbm90IGFibGUgdG8g
cHJvdmlkZSBmcmVlIGJ1ZmZlciBpbiBhdmFpbCByaW5nIHRpbWVseS4NCj4+Pj4+PiBTbWFsbGVy
IHZhbHVlIG9mIG51bV9mcmVlIGRvZXMgZGVjcmVhc2UgdGhlIG51bWJlciBvZiBwYWNrZXQgDQo+
Pj4+Pj4gZHJvcHBpbmcNCj4+Pj4+PiBkdXJpbmcgb3VyIHRlc3QgYXMgaXQgbWFrZXMgdmlydGlv
X25ldCByZWNsYWltIGJ1ZmZlciBlYXJsaWVyLg0KPj4+Pj4+DQo+Pj4+Pj4gQXQgbGVhc3QsIHdl
IHNob3VsZCBsZWF2ZSB0aGUgdmFsdWUgY2hhbmdlYWJsZSB0byB1c2VyIHdoaWxlIHRoZQ0KPj4+
Pj4+IGRlZmF1bHQgdmFsdWUgYXMgMS8yICogcXVldWUgaXMga2VwdC4NCj4+Pj4+Pg0KPj4+Pj4+
IFNpZ25lZC1vZmYtYnk6IGppYW5na2lkZDxqaWFuZ2tpZGRAaG90bWFpbC5jb20+DQo+Pj4+PiBU
aGF0IHdvdWxkIGJlIG9uZSByZWFzb24sIGJ1dCBJIHN1c3BlY3QgaXQncyBub3QgdGhlDQo+Pj4+
PiB0cnVlIG9uZS4gSWYgeW91IG5lZWQgbW9yZSBidWZmZXIgZHVlIHRvIGppdHRlcg0KPj4+Pj4g
dGhlbiBqdXN0IGluY3JlYXNlIHRoZSBxdWV1ZSBzaXplLiBXb3VsZCBiZSBjbGVhbmVyLg0KPj4+
Pj4NCj4+Pj4+DQo+Pj4+PiBIb3dldmVyIGFyZSB5b3Ugc3VyZSB0aGlzIGlzIHRoZSByZWFzb24g
Zm9yDQo+Pj4+PiBwYWNrZXQgZHJvcHM/IERvIHlvdSBzZWUgdGhlbSBkcm9wcGVkIGJ5IGRwZGsN
Cj4+Pj4+IGR1ZSB0byBsYWNrIG9mIHNwYWNlIGluIHRoZSByaW5nPyBBcyBvcHBvc2VkIHRvDQo+
Pj4+PiBieSBndWVzdD8NCj4+Pj4+DQo+Pj4+Pg0KPj4+PiBCZXNpZGVzIHRob3NlLCB0aGlzIHBh
dGNoIGRlcGVuZHMgb24gdGhlIHVzZXIgdG8gY2hvb3NlIGEgc3VpdGFibGUgDQo+Pj4+IHRocmVz
aG9sZA0KPj4+PiB3aGljaCBpcyBub3QgZ29vZC4gWW91IG5lZWQgZWl0aGVyIGEgZ29vZCB2YWx1
ZSB3aXRoIGRlbW9uc3RyYXRlZCANCj4+Pj4gbnVtYmVycyBvcg0KPj4+PiBzb21ldGhpbmcgc21h
cnRlci4NCj4+Pj4NCj4+Pj4gVGhhbmtzDQo+Pj4gSSBkbyBob3dldmVyIHRoaW5rIHRoYXQgd2Ug
aGF2ZSBhIHByb2JsZW0gcmlnaHQgbm93OiB0cnlfZmlsbF9yZWN2IGNhbg0KPj4+IHRha2UgdXAg
YSBsb25nIHRpbWUgZHVyaW5nIHdoaWNoIG5ldCBzdGFjayBkb2VzIG5vdCBydW4gYXQgYWxsLiBJ
bWFnaW5lDQo+Pj4gYSAxSyBxdWV1ZSAtIHdlIGFyZSB0YWxraW5nIDUxMiBwYWNrZXRzLiBUaGF0
J3MgZXhjZWVzc2l2ZS4NCj4NCj4NCj4gWWVzLCB3ZSB3aWxsIHN0YXJ2ZSBhIGZhc3QgaG9zdCBp
biB0aGlzIGNhc2UuDQo+DQo+DQo+Pj4gwqDCoCBuYXBpIHBvbGwNCj4+PiB3ZWlnaHQgc29sdmVz
IGEgc2ltaWxhciBwcm9ibGVtLCBzbyBpdCBtaWdodCBtYWtlIHNlbnNlIHRvIGNhcCB0aGlzIGF0
DQo+Pj4gbmFwaV9wb2xsX3dlaWdodC4NCj4+Pg0KPj4+IFdoaWNoIHdpbGwgYWxsb3cgdHdlYWtp
bmcgaXQgdGhyb3VnaCBhIG1vZHVsZSBwYXJhbWV0ZXIgYXMgYQ0KPj4+IHNpZGUgZWZmZWN0IDop
IE1heWJlIGp1c3QgZG8gTkFQSV9QT0xMX1dFSUdIVC4NCj4+IE9yIG1heWJlIE5BUElfUE9MTF9X
RUlHSFQvMiBsaWtlIHdlIGRvIGF0IGhhbGYgdGhlIHF1ZXVlIDspLiBQbGVhc2UNCj4+IGV4cGVy
aW1lbnQsIG1lYXN1cmUgcGVyZm9ybWFuY2UgYW5kIGxldCB0aGUgbGlzdCBrbm93DQo+Pg0KPj4+
IE5lZWQgdG8gYmUgY2FyZWZ1bCB0aG91Z2g6IHF1ZXVlcyBjYW4gYWxzbyBiZSBzbWFsbCBhbmQg
SSBkb24ndCANCj4+PiB0aGluayB3ZQ0KPj4+IHdhbnQgdG8gZXhjZWVkIHF1ZXVlIHNpemUgLyAy
LCBvciBtYXliZSBxdWV1ZSBzaXplIC0gbmFwaV9wb2xsX3dlaWdodC4NCj4+PiBEZWZpbml0ZWx5
IG11c3Qgbm90IGV4Y2VlZCB0aGUgZnVsbCBxdWV1ZSBzaXplLg0KPg0KPg0KPiBMb29raW5nIGF0
IGludGVsLCBpdCB1c2VzIDE2IGFuZCBpNDBlIHVzZXMgMzIuwqAgSXQgbG9va3MgdG8gbWUgDQo+
IE5BUElfUE9MTF9XRUlHSFQvMiBpcyBiZXR0ZXIuDQo+DQo+IEppYW5nLCB3YW50IHRvIHRyeSB0
aGF0IGFuZCBwb3N0IGEgbmV3IHBhdGNoPw0KPg0KPiBUaGFua3MNCj4NCj4NCj4+Pg0KPj4+IC0t
IA0KPj4+IE1TVA0KDQpXZSBkaWQgaGF2ZSBjb21wbGV0ZWQgc2V2ZXJhbCByb3VuZHMgb2YgdGVz
dCB3aXRoIHNldHRpbmcgdGhlIHZhbHVlIHRvIA0KYnVkZ2V0ICg2NCBhcyB0aGUgZGVmYXVsdCB2
YWx1ZSkuIEl0IGRvZXMgaW1wcm92ZSBhIGxvdCB3aXRoIHBwcyBpcyANCmJlbG93IDQwMHBwcyBm
b3IgYSBzaW5nbGUgc3RyZWFtLiBMZXQgbWUgY29uc29saWRhdGUgdGhlIGRhdGEgYW5kIHdpbGwg
DQpzZW5kIGl0IHNvb24uIEFjdHVhbGx5LCB3ZSBhcmUgY29uZmlkZW50IHRoYXQgaXQgcnVucyBv
dXQgb2YgZnJlZSBidWZmZXIgDQppbiBhdmFpbCByaW5nIHdoZW4gcGFja2V0IGRyb3BwaW5nIGhh
cHBlbnMgd2l0aCBiZWxvdyBzeXN0ZW10YXA6DQoNCkp1c3QgYSBzbmlwcGV0Og0KDQpwcm9iZSBt
b2R1bGUoInZpcnRpb19yaW5nIikuZnVuY3Rpb24oInZpcnRxdWV1ZV9nZXRfYnVmIikNCnsNCiDC
oMKgwqAgeCA9IChAY2FzdCgkX3ZxLCAidnJpbmdfdmlydHF1ZXVlIiktPnZyaW5nLT51c2VkLT5p
ZHgpLSANCihAY2FzdCgkX3ZxLCAidnJpbmdfdmlydHF1ZXVlIiktPmxhc3RfdXNlZF9pZHgpIC0t
LT4gd2UgdXNlIHRoaXMgb25lIHRvIA0KdmVyaWZ5IGlmIHRoZSBxdWV1ZSBpcyBmdWxsLCB3aGlj
aCBtZWFucyBndWVzdCBpcyBub3QgYWJsZSB0byB0YWtlIA0KYnVmZmVyIGZyb20gdGhlIHF1ZXVl
IHRpbWVseQ0KDQogwqDCoMKgIGlmICh4PDAgJiYgKHgrNjU1MzUpPDQwOTYpDQogwqDCoMKgIMKg
wqDCoCB4ID0geCs2NTUzNQ0KDQogwqDCoMKgIGlmKCh4PT0xMDI0KSAmJiBAY2FzdCgkX3ZxLCAi
dnJpbmdfdmlydHF1ZXVlIiktPnZxLT5jYWxsYmFjayA9PSANCmNhbGxiYWNrX2FkZHIpDQogwqDC
oMKgIMKgwqDCoCBuZXRyeGNvdW50W3hdIDw8PCBnZXR0aW1lb2ZkYXlfcygpDQp9DQoNCg0KcHJv
YmUgbW9kdWxlKCJ2aXJ0aW9fcmluZyIpLmZ1bmN0aW9uKCJ2aXJ0cXVldWVfYWRkX2luYnVmIikN
CnsNCiDCoMKgwqAgeSA9IChAY2FzdCgkdnEsICJ2cmluZ192aXJ0cXVldWUiKS0+dnJpbmctPmF2
YWlsLT5pZHgpLSAoQGNhc3QoJHZxLCANCiJ2cmluZ192aXJ0cXVldWUiKS0+dnJpbmctPnVzZWQt
PmlkeCkgLS0tPiB3ZSB1c2UgdGhpcyBvbmUgdG8gdmVyaWZ5IGlmIA0Kd2UgcnVuIG91dCBvZiBm
cmVlIGJ1ZmZlciBpbiBhdmFpbCByaW5nDQogwqDCoMKgIGlmICh5PDAgJiYgKHkrNjU1MzUpPDQw
OTYpDQogwqDCoMKgIMKgwqDCoCB5ID0geSs2NTUzNQ0KDQogwqDCoMKgIGlmKEAyPT0iZGVidWdv
biIpDQogwqDCoMKgIHsNCiDCoMKgwqAgwqDCoMKgIGlmKHk9PTAgJiYgQGNhc3QoJHZxLCAidnJp
bmdfdmlydHF1ZXVlIiktPnZxLT5jYWxsYmFjayA9PSANCmNhbGxiYWNrX2FkZHIpDQogwqDCoMKg
IMKgwqDCoCB7DQogwqDCoMKgIMKgwqDCoCDCoMKgwqAgbmV0cnhmcmVlY291bnRbeV0gPDw8IGdl
dHRpbWVvZmRheV9zKCkNCg0KIMKgwqDCoCDCoMKgwqAgwqDCoMKgIHByaW50Zigibm8gYXZhaWwg
cmluZyBsZWZ0IHNlZW4sIHByaW50aW5nIG1vc3QgcmVjZW50IDUgbnVtIA0KZnJlZSwgdnE6ICVs
eCwgY3VycmVudCBpbmRleDogJWRcbiIsICR2cSwgcmVjZW50ZnJlZWNvdW50KQ0KIMKgwqDCoCDC
oMKgwqAgwqDCoMKgIGZvcihpPXJlY2VudGZyZWVjb3VudDsgaSE9KChyZWNlbnRmcmVlY291bnQr
NCkgJSA1KTsgDQppPSgoaSsxKSAlIDUpKQ0KIMKgwqDCoCDCoMKgwqAgwqDCoMKgIHsNCiDCoMKg
wqAgwqDCoMKgIMKgwqDCoCDCoMKgwqAgcHJpbnRmKCJpbmRleDogJWQsIG51bSBmcmVlOiAlZFxu
IiwgaSwgcmVjZW50ZnJlZVskdnEsIGldKQ0KIMKgwqDCoCDCoMKgwqAgwqDCoMKgIH0NCg0KIMKg
wqDCoCDCoMKgwqAgwqDCoMKgIHByaW50ZigiaW5kZXg6ICVkLCBudW0gZnJlZTogJWRcbiIsIGks
IHJlY2VudGZyZWVbJHZxLCBpXSkNCiDCoMKgwqAgwqDCoMKgIMKgwqDCoCAvL2V4aXQoKQ0KIMKg
wqDCoCDCoMKgwqAgfQ0KIMKgwqDCoCB9DQp9DQoNCg0KcHJvYmUgDQptb2R1bGUoInZpcnRpb19u
ZXQiKS5zdGF0ZW1lbnQoInZpcnRuZXRfcmVjZWl2ZUBkcml2ZXJzL25ldC92aXJ0aW9fbmV0LmM6
NzMyIikNCnsNCiDCoMKgwqAgcmVjZW50ZnJlZWNvdW50KysNCiDCoMKgwqAgcmVjZW50ZnJlZWNv
dW50ID0gcmVjZW50ZnJlZWNvdW50ICUgNQ0KIMKgwqDCoCByZWNlbnRmcmVlWyRycS0+dnEsIHJl
Y2VudGZyZWVjb3VudF0gPSAkcnEtPnZxLT5udW1fZnJlZSAtLS0+IA0KcmVjb3JkIHRoZSBudW1f
ZnJlZSBmb3IgdGhlIGxhc3QgNSBjYWxscyB0byB2aXJ0bmV0X3JlY2VpdmUsIHNvIHdlIGNhbiAN
CnNlZSBpZiBsb3dlcmluZyB0aGUgYmFyIGhlbHBzLg0KfQ0KDQoNCkhlcmUgaXMgdGhlIHJlc3Vs
dDoNCg0Kbm8gYXZhaWwgcmluZyBsZWZ0IHNlZW4sIHByaW50aW5nIG1vc3QgcmVjZW50IDUgbnVt
IGZyZWUsIHZxOiANCmZmZmY5YzEzYzEyMDAwMDAsIGN1cnJlbnQgaW5kZXg6IDENCmluZGV4OiAx
LCBudW0gZnJlZTogNTYxDQppbmRleDogMiwgbnVtIGZyZWU6IDMwNQ0KaW5kZXg6IDMsIG51bSBm
cmVlOiAzNjkNCmluZGV4OiA0LCBudW0gZnJlZTogNDMzDQppbmRleDogMCwgbnVtIGZyZWU6IDQ5
Nw0Kbm8gYXZhaWwgcmluZyBsZWZ0IHNlZW4sIHByaW50aW5nIG1vc3QgcmVjZW50IDUgbnVtIGZy
ZWUsIHZxOiANCmZmZmY5YzEzYzEyMDAwMDAsIGN1cnJlbnQgaW5kZXg6IDENCmluZGV4OiAxLCBu
dW0gZnJlZTogNTQzDQppbmRleDogMiwgbnVtIGZyZWU6IDQ2Mw0KaW5kZXg6IDMsIG51bSBmcmVl
OiA0NjkNCmluZGV4OiA0LCBudW0gZnJlZTogNDc2DQppbmRleDogMCwgbnVtIGZyZWU6IDQ3OQ0K
bm8gYXZhaWwgcmluZyBsZWZ0IHNlZW4sIHByaW50aW5nIG1vc3QgcmVjZW50IDUgbnVtIGZyZWUs
IHZxOiANCmZmZmY5YzEzYzEyMDAwMDAsIGN1cnJlbnQgaW5kZXg6IDINCmluZGV4OiAyLCBudW0g
ZnJlZTogNTU1DQppbmRleDogMywgbnVtIGZyZWU6IDQxNA0KaW5kZXg6IDQsIG51bSBmcmVlOiA0
MjANCmluZGV4OiAwLCBudW0gZnJlZTogNDI3DQppbmRleDogMSwgbnVtIGZyZWU6IDQ5MQ0KDQpZ
b3UgY2FuIHNlZSBpbiB0aGUgbGFzdCA0IGNhbGxzIHRvIHZpcnRuZXRfcmVjZWl2ZSBiZWZvcmUg
d2UgcnVuIG91dCBvZiANCmZyZWUgYnVmZmVyIGFuZCBzdGFydCB0byByZWxhaW0sIG51bV9mcmVl
IGlzIHF1aXRlIGhpZ2guIFNvIGlmIHdlIGNhbiBkbyANCnRoZSByZWNsYWltIGVhcmxpZXIsIGl0
IHdpbGwgY2VydGFpbmx5IGhlbHAuDQoNCk1lYW53aGlsZSwgdGhlIHBhdGNoIEkgcHJvcG9zZWQg
YWN0dWFsbHkga2VlcHMgdGhlIGRlZmF1bHQgdmFsdWUgYXMgMS8yIA0KKiBxdWV1ZS4gU28gdGhl
IGRlZmF1bHQgYmVoYXZpb3IgcmVtYWlucyBhbmQgb25seSBsZWF2ZSB0aGUgaW50ZXJmYWNlIHRv
IA0KYWR2YW5jZWQgdXNlcnMsIHdobyByZWFsbHkgdW5kZXJzdGFuZHMgd2hhdCB0aGV5IGFyZSBk
b2luZy4gQWxzbywgdGhlIA0KYmVzdCB2YWx1ZSBtYXkgdmFyeSBpbiBkaWZmZXJlbnQgZW52aXJv
bm1lbnQuIERvIHlvdSBzdGlsbCB0aGluayANCmhhcmRjb2RpbmcgdGhpcyBpcyBiZXR0ZXIgb3B0
aW9uPw0KDQoNCkppYW5nDQoNCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxp
c3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
