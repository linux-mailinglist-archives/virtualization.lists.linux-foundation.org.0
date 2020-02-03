Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 051F91513A1
	for <lists.virtualization@lfdr.de>; Tue,  4 Feb 2020 01:23:41 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 5C33284FB9;
	Tue,  4 Feb 2020 00:23:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nUzJ8PrjTOpB; Tue,  4 Feb 2020 00:23:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 8F53F84493;
	Tue,  4 Feb 2020 00:23:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 577F9C1D8C;
	Tue,  4 Feb 2020 00:23:38 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EBFB1C0174
 for <virtualization@lists.linux-foundation.org>;
 Tue,  4 Feb 2020 00:23:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id CA69384D89
 for <virtualization@lists.linux-foundation.org>;
 Tue,  4 Feb 2020 00:23:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0nFeHiBJ+smQ
 for <virtualization@lists.linux-foundation.org>;
 Tue,  4 Feb 2020 00:23:35 +0000 (UTC)
X-Greylist: delayed 01:17:34 by SQLgrey-1.7.6
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2050.outbound.protection.outlook.com [40.107.223.50])
 by whitealder.osuosl.org (Postfix) with ESMTPS id AE6EF84D35
 for <virtualization@lists.linux-foundation.org>;
 Tue,  4 Feb 2020 00:23:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iPVq3d/GXLpicb3uMHOJtTXyGT+duKZYZ0w3Z7ga0X8Dziy2wphQfLWOxrkkFPYYAbhfmWh44eBi9d4hgnGIOwdkyNuZQYRaaap86JhZvikNstqJLRHHJqfKgiOIKBpl3T8A7MSjHHXXvutN92mXquc7ps7aN4GtqbOYmCmKRS2BWdbrHg9FtRJDTeSCnCnafqshWZvAKyi+f4Mf9cR7ua7BrbByYIXW9sFgAt5PKXI/u8ZfD+g48HtRniHCUk3iLRARPiZ24tuxHH/RKAVef877yHUPVdpzC94zVvnsz3qFadswVAKNel9k2skGvPWOVh3ysuV6PWFzRmi8rHv23A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kp+UgOTBXfGDndv3QXe7JY6YS96jQqOWrRkPWGCLKj8=;
 b=WpS34r0hEyGet4/npFC/umjQ0WDyNSE5VKAlCvIsRThn706WCzk6D0cB+lzgcHasJwEznL8z961bLU7A7fRmoeWxS++yv/Tj+kHrOXnJh1TJnmpuzUCQJ6dHxOR1Cw/MvbKremPpkHgcdtnNdUZ9lgbKfoR7GQXDzk6EwxHE21e0bYlR92w6yoCTcHw+f2OEYSN6PMK82pk1QiUtmrt7dlA4VTsSotwqHSlXgV3UJGPMv1xBST5NtBS8BL9cchKF1MkJJL2ljAVkNzAtsXKk5MoqCiYAGB5gbpOPP9Fidfritgz2rBrg4hQpFU0nrQrk0Wuf/twU+9vWWyxne5Q74Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kp+UgOTBXfGDndv3QXe7JY6YS96jQqOWrRkPWGCLKj8=;
 b=MYRLwGl1lsHygpvHPiQuewfeW/1rc0xdR6QhThacseBqKU//6MRUEVX175MN/lF6zNK/8cROPCKdCyDwmHYGG/E4PBXV7vyoJSXzAYxqhOfnmWX26xX/cqEWN8nJrHSqFiWf17A9IBKvsw3K3O3O98dFKih2kn2ud5mj3XEdth4=
Received: from BYAPR05MB4776.namprd05.prod.outlook.com (52.135.233.146) by
 BYAPR05MB4390.namprd05.prod.outlook.com (52.135.204.160) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2707.9; Mon, 3 Feb 2020 22:50:39 +0000
Received: from BYAPR05MB4776.namprd05.prod.outlook.com
 ([fe80::7c65:25af:faf7:5331]) by BYAPR05MB4776.namprd05.prod.outlook.com
 ([fe80::7c65:25af:faf7:5331%2]) with mapi id 15.20.2707.018; Mon, 3 Feb 2020
 22:50:39 +0000
To: David Hildenbrand <david@redhat.com>
Subject: Re: Balloon pressuring page cache
Thread-Topic: Balloon pressuring page cache
Thread-Index: AQHV2uRbkFYQY7vaBUSq2sNiClqnPQ==
Date: Mon, 3 Feb 2020 22:50:39 +0000
Message-ID: <539B606A-A0CA-4AA4-B99A-759C874A1EF8@vmware.com>
References: <CAJuQAmpDUyve2S+oxp9tLUhuRcnddXnNztC5PmYOOCpY6c68xg@mail.gmail.com>
 <91270a68-ff48-88b0-219c-69801f0c252f@redhat.com>
 <CAJuQAmoaK0Swytu2Os_SQRfG5_LqiCPaDa9yatatm9MtfncNTQ@mail.gmail.com>
 <75d4594f-0864-5172-a0f8-f97affedb366@redhat.com>
 <286AC319A985734F985F78AFA26841F73E3F8A02@shsmsx102.ccr.corp.intel.com>
 <CAJuQAmqcayaNuG19fKCuux=YVO3+VcN-qrXvobgKMykogeMkzA@mail.gmail.com>
 <20200203080520-mutt-send-email-mst@kernel.org>
 <5ac131de8e3b7fc1fafd05a61feb5f6889aeb917.camel@linux.intel.com>
 <c836a8d1-c5cc-eb8b-84ed-027070b77bf8@redhat.com>
In-Reply-To: <c836a8d1-c5cc-eb8b-84ed-027070b77bf8@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=namit@vmware.com; 
x-originating-ip: [66.170.99.2]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8c6bda88-7e8b-47b6-c010-08d7a8fb7da7
x-ms-traffictypediagnostic: BYAPR05MB4390:
x-microsoft-antispam-prvs: <BYAPR05MB43904177109D29ED377BD2D5D0000@BYAPR05MB4390.namprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0302D4F392
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(396003)(346002)(39860400002)(136003)(366004)(189003)(199004)(81156014)(2906002)(53546011)(6486002)(36756003)(86362001)(316002)(6506007)(2616005)(186003)(3480700007)(54906003)(6916009)(26005)(5660300002)(81166006)(64756008)(478600001)(6512007)(66476007)(8676002)(8936002)(66556008)(66446008)(4326008)(76116006)(33656002)(71200400001)(66946007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR05MB4390;
 H:BYAPR05MB4776.namprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: vmware.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: F4v4zleVLDSduWwP9U3VgeXVJupAi4stQVbtCbBfLPGiUAvxBtxrmijowvlbR4tLqDsQCHnKmWsuIa7HcNMMSz49Sm2fkDmW6r2T5oetpPKfdbQiPsQlOkFdhyDdIXTu5KWr8S8oieFgPnlYmvDrC9yk5ORtwmoxUsjw06u+JloHPz+6q3sTYswbBXR2cAJmjxQCunr7YhfgGeaebXPvM6I72QSpl13ANUzBNzJyyKle5XKxyHqsjO4zefd2t0mcbFEH6xeIfnZCtF8oV5UjmaWllLYEN/++kiPvRBIfzTXbpV7D4c/NGgoJYEMjvNFJ1jhbXO5/gCdGi2aNwBVUPGflsFUcYPwj2WXMg8QC1f9ydeb2c6rvcRxg2HeOU6LuQzOhNGnJ0t2UYoCMIhDqZaMynefb02ZPPo0x8To+XL1GAGYrY1NX5bHpgzVPsYiBPm4AKtWMCE9EYBNRCqgSPBVIZuizJGQ5CbK3MZOXbiwDUSz5Tbi4MI740255FfSHaoY/zxbFCC+Uyfps5B9v/g==
x-ms-exchange-antispam-messagedata: 1kRxwFAYXUFnCRA/MzMFifc/mEIe42MQdTe/eqfbslTqTpBLPx0lHbSAW6M82ycxzAioqq/2oXVtk/te1Gp8Ct8hzOLQ8PX8JmxvKf/PxhNpFHuPSJWyHNTGRc2kmrJEo35q0FfnQGJahQGjvFjcxA==
x-ms-exchange-transport-forked: True
Content-ID: <C42C2E4103B8044FA73368F7658703F0@namprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c6bda88-7e8b-47b6-c010-08d7a8fb7da7
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Feb 2020 22:50:39.2998 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Rm0DeSdtb10rUEtzWaBKVsCuRdrSmOUF0VC2IhSkpPZE6x/KMrILffQ+3oPCkVqsL+L/V8xbuSPYFsAxGIHoHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR05MB4390
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

PiBPbiBGZWIgMywgMjAyMCwgYXQgODozNCBBTSwgRGF2aWQgSGlsZGVuYnJhbmQgPGRhdmlkQHJl
ZGhhdC5jb20+IHdyb3RlOg0KPiANCj4gT24gMDMuMDIuMjAgMTc6MTgsIEFsZXhhbmRlciBEdXlj
ayB3cm90ZToNCj4+IE9uIE1vbiwgMjAyMC0wMi0wMyBhdCAwODoxMSAtMDUwMCwgTWljaGFlbCBT
LiBUc2lya2luIHdyb3RlOg0KPj4+IE9uIFRodSwgSmFuIDMwLCAyMDIwIGF0IDExOjU5OjQ2QU0g
LTA4MDAsIFR5bGVyIFNhbmRlcnNvbiB3cm90ZToNCj4+Pj4gT24gVGh1LCBKYW4gMzAsIDIwMjAg
YXQgNzozMSBBTSBXYW5nLCBXZWkgVyA8d2VpLncud2FuZ0BpbnRlbC5jb20+IHdyb3RlOg0KPj4+
PiANCj4+Pj4gICAgT24gVGh1cnNkYXksIEphbnVhcnkgMzAsIDIwMjAgMTE6MDMgUE0sIERhdmlk
IEhpbGRlbmJyYW5kIHdyb3RlOg0KPj4+Pj4gT24gMjkuMDEuMjAgMjA6MTEsIFR5bGVyIFNhbmRl
cnNvbiB3cm90ZToNCj4+Pj4+PiBPbiBXZWQsIEphbiAyOSwgMjAyMCBhdCAyOjMxIEFNIERhdmlk
IEhpbGRlbmJyYW5kIDxkYXZpZEByZWRoYXQuY29tDQo+Pj4+Pj4gPG1haWx0bzpkYXZpZEByZWRo
YXQuY29tPj4gd3JvdGU6DQo+Pj4+Pj4gDQo+Pj4+Pj4gICAgT24gMjkuMDEuMjAgMDE6MjIsIFR5
bGVyIFNhbmRlcnNvbiB2aWEgVmlydHVhbGl6YXRpb24gd3JvdGU6DQo+Pj4+Pj4+IEEgcHJpbWFy
eSBhZHZhbnRhZ2Ugb2YgdmlydGlvIGJhbGxvb24gb3ZlciBvdGhlciBtZW1vcnkgcmVjbGFpbQ0K
Pj4+Pj4+PiBtZWNoYW5pc21zIGlzIHRoYXQgaXQgY2FuIHByZXNzdXJlIHRoZSBndWVzdCdzIHBh
Z2UgY2FjaGUgaW50bw0KPj4+Pj4+ICAgIHNocmlua2luZy4NCj4+Pj4+Pj4gSG93ZXZlciwgc2lu
Y2UgdGhlIGJhbGxvb24gZHJpdmVyIGNoYW5nZWQgdG8gdXNpbmcgdGhlIHNocmlua2VyDQo+Pj4+
ICAgIEFQSQ0KPj4+Pj4gPGh0dHBzOi8vZ2l0aHViLmNvbS90b3J2YWxkcy9saW51eC9jb21taXQv
NzE5OTQ2MjBiYjI1YThiMTA5Mzg4ZmVmYTkNCj4+Pj4+IGU5OWEyOGUzNTUyNTVhI2RpZmYtZmQy
MDJhY2Y2OTRkOWViYTE5YzhjNjRkYTNlNDgwYzk+IHRoaXMNCj4+Pj4+Pj4gdXNlIGNhc2UgaGFz
IGJlY29tZSBhIGJpdCBtb3JlIHRyaWNreS4gSSdtIHdvbmRlcmluZyB3aGF0IHRoZQ0KPj4+Pj4g
aW50ZW5kZWQNCj4+Pj4+Pj4gZGV2aWNlIGltcGxlbWVudGF0aW9uIGlzLg0KPj4+Pj4+PiANCj4+
Pj4+Pj4gV2hlbiBpbmZsYXRpbmcgdGhlIGJhbGxvb24gYWdhaW5zdCBwYWdlIGNhY2hlIChpLmUu
IG5vIGZyZWUNCj4+Pj4gICAgbWVtb3J5DQo+Pj4+Pj4+IHJlbWFpbnMpIHZtc2Nhbi5jIHdpbGwg
Ym90aCBzaHJpbmsgcGFnZSBjYWNoZSwgYnV0IGFsc28gaW52b2tlDQo+Pj4+ICAgIHRoZQ0KPj4+
Pj4+PiBzaHJpbmtlcnMgLS0gaW5jbHVkaW5nIHRoZSBiYWxsb29uJ3Mgc2hyaW5rZXIuIFNvIHRo
ZSBiYWxsb29uDQo+Pj4+ICAgIGRyaXZlcg0KPj4+Pj4+PiBhbGxvY2F0ZXMgbWVtb3J5IHdoaWNo
IHJlcXVpcmVzIHJlY2xhaW0sIHZtc2NhbiBnZXRzIHRoaXMgbWVtb3J5DQo+Pj4+PiBieQ0KPj4+
Pj4+PiBzaHJpbmtpbmcgdGhlIGJhbGxvb24sIGFuZCB0aGVuIHRoZSBkcml2ZXIgYWRkcyB0aGUg
bWVtb3J5IGJhY2sNCj4+Pj4gICAgdG8NCj4+Pj4+IHRoZQ0KPj4+Pj4+PiBiYWxsb29uLiBCYXNp
Y2FsbHkgYSBidXN5IG5vLW9wLg0KPj4+PiANCj4+Pj4gICAgUGVyIG15IHVuZGVyc3RhbmRpbmcs
IHRoZSBiYWxsb29uIGFsbG9jYXRpb24gd29u4oCZdCBpbnZva2Ugc2hyaW5rZXIgYXMNCj4+Pj4g
ICAgX19HRlBfRElSRUNUX1JFQ0xBSU0gaXNuJ3Qgc2V0LCBubz8NCj4+Pj4gDQo+Pj4+IEkgY291
bGQgYmUgd3JvbmcgYWJvdXQgdGhlIG1lY2hhbmlzbSwgYnV0IHRoZSBkZXZpY2Ugc2VlcyBsb3Rz
IG9mIGFjdGl2aXR5IG9uDQo+Pj4+IHRoZSBkZWZsYXRlIHF1ZXVlLiBUaGUgYmFsbG9vbiBpcyBi
ZWluZyBzaHJ1bmsuIEFuZCB0aGlzIG9ubHkgc3RhcnRzIG9uY2UgYWxsDQo+Pj4+IGZyZWUgbWVt
b3J5IGlzIGRlcGxldGVkIGFuZCB3ZSdyZSBpbmZsYXRpbmcgaW50byBwYWdlIGNhY2hlLg0KPj4+
IA0KPj4+IFNvIGdpdmVuIHRoaXMgbG9va3MgbGlrZSBhIHJlZ3Jlc3Npb24sIG1heWJlIHdlIHNo
b3VsZCByZXZlcnQgdGhlDQo+Pj4gcGF0Y2ggaW4gcXVlc3Rpb24gNzE5OTQ2MjBiYjI1ICgidmly
dGlvX2JhbGxvb246IHJlcGxhY2Ugb29tIG5vdGlmaWVyIHdpdGggc2hyaW5rZXIiKQ0KPj4+IEJl
c2lkZXMsIHdpdGggVklSVElPX0JBTExPT05fRl9GUkVFX1BBR0VfSElOVA0KPj4+IHNocmlua2Vy
IGFsc28gaWdub3JlcyBWSVJUSU9fQkFMTE9PTl9GX01VU1RfVEVMTF9IT1NUIHdoaWNoIGlzbid0
IG5pY2UNCj4+PiBhdCBhbGwuDQo+Pj4gDQo+Pj4gU28gaXQgbG9va3MgbGlrZSBhbGwgdGhpcyBy
ZXdvcmsgaW50cm9kdWNlZCBtb3JlIGlzc3VlcyB0aGFuIGl0DQo+Pj4gYWRkcmVzc2VkIC4uLg0K
Pj4+IA0KPj4+IEkgYWxzbyBDQyBBbGV4IER1eWNrIGZvciBhbiBvcGluaW9uIG9uIHRoaXMuDQo+
Pj4gQWxleCwgd2hhdCBkbyB5b3UgdXNlIHRvIHB1dCBwcmVzc3VyZSBvbiBwYWdlIGNhY2hlPw0K
Pj4gDQo+PiBJIHdvdWxkIHNheSByZXZlcnRpbmcgcHJvYmFibHkgbWFrZXMgc2Vuc2UuIEknbSBu
b3Qgc3VyZSB0aGVyZSBpcyBtdWNoDQo+PiB2YWx1ZSB0byBoYXZpbmcgYSBzaHJpbmtlciBydW5u
aW5nIGRlZmxhdGlvbiB3aGVuIHlvdSBhcmUgYWN0aXZlbHkgdHJ5aW5nDQo+PiB0byBpbmNyZWFz
ZSB0aGUgYmFsbG9vbi4gSXQgd291bGQgbWFrZSBtb3JlIHNlbnNlIHRvIHdhaXQgdW50aWwgeW91
IGFyZQ0KPj4gYWN0dWFsbHkgYWJvdXQgdG8gc3RhcnQgaGl0dGluZyBvb20uDQo+IA0KPiBJIHRo
aW5rIHRoZSBzaHJpbmtlciBtYWtlcyBzZW5zZSBmb3IgZnJlZSBwYWdlIGhpbnRpbmcgZmVhdHVy
ZQ0KPiAoZXZlcnl0aGluZyBvbiBmcmVlX3BhZ2VfbGlzdCkuDQo+IA0KPiBTbyBpbnN0ZWFkIG9m
IG9ubHkgcmV2ZXJ0aW5nLCBJIHRoaW5rIHdlIHNob3VsZCBzcGxpdCBpdCB1cCBhbmQgYWx3YXlz
DQo+IHJlZ2lzdGVyIHRoZSBzaHJpbmtlciBmb3IgVklSVElPX0JBTExPT05fRl9GUkVFX1BBR0Vf
SElOVCBhbmQgdGhlIE9PTQ0KPiBub3RpZmllciAoYXMgYmVmb3JlKSBmb3IgVklSVElPX0JBTExP
T05fRl9NVVNUX1RFTExfSE9TVC4NCj4gDQo+IChPZiBjb3Vyc2UsIGFkYXB0aW5nIHdoYXQgaXMg
YmVpbmcgZG9uZSBpbiB0aGUgc2hyaW5rZXIgYW5kIGluIHRoZSBPT00NCj4gbm90aWZpZXIpDQoN
CkRhdmlkLA0KDQpQbGVhc2Uga2VlcCBtZSBwb3N0ZWQuIEkgZGVjaWRlZCB0byBhZGFwdCB0aGUg
c2FtZSBzb2x1dGlvbiBhcyB0aGUgdmlydGlvDQpiYWxsb29uIGZvciB0aGUgVk13YXJlIGJhbGxv
b24uIElmIHRoZSB2ZXJkaWN0IGlzIHRoYXQgdGhpcyBpcyBkYW1hZ2luZyBhbmQNCnRoZSBPT00g
bm90aWZpZXIgc2hvdWxkIGJlIHVzZWQgaW5zdGVhZCwgSSB3aWxsIHN1Ym1pdCBwYXRjaGVzIHRv
IG1vdmUgdG8NCk9PTSBub3RpZmllciBhcyB3ZWxsLg0KDQpSZWdhcmRzLA0KTmFkYXYNCg0KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRp
b24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3Jn
Cmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1
YWxpemF0aW9u
