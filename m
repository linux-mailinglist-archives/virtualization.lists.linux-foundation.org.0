Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D72769AAA
	for <lists.virtualization@lfdr.de>; Mon, 15 Jul 2019 20:18:10 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 1E2B1F0D;
	Mon, 15 Jul 2019 18:18:04 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id E2787C7D
	for <virtualization@lists.linux-foundation.org>;
	Mon, 15 Jul 2019 18:18:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
	(mail-eopbgr750050.outbound.protection.outlook.com [40.107.75.50])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 583FD8CB
	for <virtualization@lists.linux-foundation.org>;
	Mon, 15 Jul 2019 18:18:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=CUxDFhMSSgZo5BkG3rM+p2fJPtHv7/N6bN/RxQIYXssrw71/JO5yafiR2KR0wdN+amOlBH+QyBb+J7khACV7uhwXIQRv+oB5UuaQmsfcYchnPvO7a+QDn/29RMHrlYxev4c7cjb+BaOxXGyzBR8HRgnSVfCF9KqgpASKM8OWNktUExw0Zz76M+eocRHBauudjtrQdvQspA9O86rCW0Dbxn5qq2VWHU1p7sCPEi69hx54GTbWeVhzDqmakD2FE7o6tjWDDx+BixwxThbzJQNMMc/j6nFaaPxjWdoH+OA0NdCMcO6hLoZXFiAUzNndFLKQK4LLlh1vmAlOfFVAorQ4cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=7qhzh0sCemfs4/HUWjHMPtuD35pXQjPt26/ttyIbfyk=;
	b=BIGtZEvnwmEnP45eY0IB08uzuctOFeMD0Kb4SYUs4ooQjESuLZkVsVvlf7AwYaum+Ot0k2cAiQDeo//p6AIWS4Iy7RFTNZDtpFAlIeCW2TyyiaOZRTq2V/zf53OGZTv97F++qdc7QknWG7dp5phAhotnpqc3PPNYGGc3o+5Wwn1+iE/wJ3fa0yWYb7j50ibl0Zednrk2MGFgg7khGVMYdTadOO0eE7uiwbwA798ubUI8i6lJwiB8mh8BtaWnJtTRnVHtTvFI/7dzpY6KnkFRIvF3cVMWL4Dh0KHNGJWSjIOY9sJFWtBWJsWKr+45mKGvJ913fvYl+WVfDbJe63orgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
	smtp.mailfrom=vmware.com;dmarc=pass action=none
	header.from=vmware.com;dkim=pass header.d=vmware.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=7qhzh0sCemfs4/HUWjHMPtuD35pXQjPt26/ttyIbfyk=;
	b=ixIO8DKN7G5QV2CD1ZbQkTU1Ua4p2oowjnzKEEbFhMhPO/KqzfIzWVm7eKDlmRjm77uNq0R2ailpiW+sFhQ77hbbvYEmO0RM2KD34+vQqG/LqLxKAm+IPw7Rmm5S1M8Rc5lQQ4acd9OZBgRLRtXLp08IxZdmEhf6m5JnXNUw0Ys=
Received: from SN6PR05MB4783.namprd05.prod.outlook.com (52.135.115.17) by
	SN6PR05MB4413.namprd05.prod.outlook.com (52.135.74.22) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2094.10; Mon, 15 Jul 2019 18:17:59 +0000
Received: from SN6PR05MB4783.namprd05.prod.outlook.com
	([fe80::25ae:a9c7:8cc2:24cb]) by
	SN6PR05MB4783.namprd05.prod.outlook.com
	([fe80::25ae:a9c7:8cc2:24cb%7]) with mapi id 15.20.2094.007;
	Mon, 15 Jul 2019 18:17:59 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2] x86/paravirt: Drop {read,write}_cr8() hooks
Thread-Topic: [PATCH v2] x86/paravirt: Drop {read,write}_cr8() hooks
Thread-Index: AQHVOyBUFdACaHiktUycGK4yMfk9sqbL/QEA
Date: Mon, 15 Jul 2019 18:17:59 +0000
Message-ID: <602B4D96-E2A9-45BE-8247-4E3481ED5402@vmware.com>
References: <20190715151641.29210-1-andrew.cooper3@citrix.com>
In-Reply-To: <20190715151641.29210-1-andrew.cooper3@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=namit@vmware.com; 
x-originating-ip: [66.170.99.2]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2b5dce4e-b85b-4580-9ba0-08d70950c472
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
	SRVR:SN6PR05MB4413; 
x-ms-traffictypediagnostic: SN6PR05MB4413:
x-microsoft-antispam-prvs: <SN6PR05MB441332FAD4D91B8EF277B82DD0CF0@SN6PR05MB4413.namprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 00997889E7
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(4636009)(366004)(39860400002)(136003)(396003)(346002)(376002)(199004)(189003)(8676002)(5660300002)(6116002)(53936002)(256004)(476003)(8936002)(91956017)(76116006)(2616005)(66946007)(446003)(81156014)(99286004)(486006)(11346002)(81166006)(33656002)(25786009)(6512007)(3846002)(66066001)(478600001)(4326008)(14444005)(186003)(316002)(7416002)(7736002)(54906003)(229853002)(6246003)(86362001)(6436002)(102836004)(76176011)(6916009)(68736007)(6486002)(53546011)(26005)(6506007)(36756003)(64756008)(71200400001)(66476007)(71190400001)(66446008)(66556008)(2906002)(305945005)(14454004)(142933001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:SN6PR05MB4413;
	H:SN6PR05MB4783.namprd05.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: vmware.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: e4rgQpucsPHPtHFuYvjh/PvUseVqR4OHS2qtcGw5ldmgsM4aqvli9nLVPGoEWBNuOC/yRbMEfcfMQ4DFBXG/Kg9wdXzhM8RSRFsbaZrKfndudNGx8+EbZJwksWOk5K1Q8bw3uHkwyaCtqb7SIWjvGsjeJKNfzmv5FbcGxdd2yxFp092nG7a1ddTwgnxlnrLg+rac6geXglf5jr0tdwX+7+xJgkGaxddv8UjQXEr6csQ5BrLHhmBWFhZDJlM6/PW+Oev8lTXe7FiwvlL15HQMoDbd27Y/J6szvcmKTYWAUa7tyPcs490/kL0oQqbfYR58Fj1M0RlnSrilDrrjOBmRh4p1T9GXlGAAb+f67jSDF8YHJQp5ZTW/FmRckLimxU0l66nCgifEy7hVEvcEk0KieN5kiZWRT42Xosx57GH1A/M=
Content-ID: <FD49B339CA227D44BB5DFB367BC85236@namprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b5dce4e-b85b-4580-9ba0-08d70950c472
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2019 18:17:59.2414 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: namit@vmware.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR05MB4413
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Juergen Gross <jgross@suse.com>, Feng Tang <feng.tang@intel.com>,
	Pavel Machek <pavel@ucw.cz>, Peter Zijlstra <peterz@infradead.org>,
	the arch/x86 maintainers <x86@kernel.org>,
	"Rafael J. Wysocki" <rjw@rjwysocki.net>,
	LKML <linux-kernel@vger.kernel.org>, Stephane Eranian <eranian@google.com>,
	"virtualization@lists.linux-foundation.org"
	<virtualization@lists.linux-foundation.org>,
	Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
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

PiBPbiBKdWwgMTUsIDIwMTksIGF0IDg6MTYgQU0sIEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29w
ZXIzQGNpdHJpeC5jb20+IHdyb3RlOg0KPiANCj4gVGhlcmUgaXMgYSBsb3Qgb2YgaW5mcmFzdHJ1
Y3R1cmUgZm9yIGZ1bmN0aW9uYWxpdHkgd2hpY2ggaXMgdXNlZA0KPiBleGNsdXNpdmVseSBpbiBf
X3tzYXZlLHJlc3RvcmV9X3Byb2Nlc3Nvcl9zdGF0ZSgpIG9uIHRoZSBzdXNwZW5kL3Jlc3VtZQ0K
PiBwYXRoLg0KPiANCj4gY3I4IGlzIGFuIGFsaWFzIG9mIEFQSUNfVEFTS1BSSSwgYW5kIEFQSUNf
VEFTS1BSSSBpcyBzYXZlZC9yZXN0b3JlZCBieQ0KPiBsYXBpY197c3VzcGVuZCxyZXN1bWV9KCku
ICBTYXZpbmcgYW5kIHJlc3RvcmluZyBjcjggaW5kZXBlbmRlbnRseSBvZiB0aGUNCj4gcmVzdCBv
ZiB0aGUgTG9jYWwgQVBJQyBzdGF0ZSBpc24ndCBhIGNsZXZlciB0aGluZyB0byBiZSBkb2luZy4N
Cj4gDQo+IERlbGV0ZSB0aGUgc3VzcGVuZC9yZXN1bWUgY3I4IGhhbmRsaW5nLCB3aGljaCBzaHJp
bmtzIHRoZSBzaXplIG9mIHN0cnVjdA0KPiBzYXZlZF9jb250ZXh0LCBhbmQgYWxsb3dzIGZvciB0
aGUgcmVtb3ZhbCBvZiBib3RoIFBWT1BTLg0KDQpJIHRoaW5rIHJlbW92aW5nIHRoZSBpbnRlcmZh
Y2UgZm9yIENSOCB3cml0ZXMgaXMgYWxzbyBnb29kIHRvIGF2b2lkDQpwb3RlbnRpYWwgY29ycmVj
dG5lc3MgaXNzdWVzLCBhcyB0aGUgU0RNIHNheXMgKDEwLjguNi4xICJJbnRlcmFjdGlvbiBvZiBU
YXNrDQpQcmlvcml0aWVzIGJldHdlZW4gQ1I4IGFuZCBBUElD4oCdKToNCg0KIk9wZXJhdGluZyBz
b2Z0d2FyZSBzaG91bGQgaW1wbGVtZW50IGVpdGhlciBkaXJlY3QgQVBJQyBUUFIgdXBkYXRlcyBv
ciBDUjgNCnN0eWxlIFRQUiB1cGRhdGVzIGJ1dCBub3QgbWl4IHRoZW0uIFNvZnR3YXJlIGNhbiB1
c2UgYSBzZXJpYWxpemluZw0KaW5zdHJ1Y3Rpb24gKGZvciBleGFtcGxlLCBDUFVJRCkgdG8gc2Vy
aWFsaXplIHVwZGF0ZXMgYmV0d2VlbiBNT1YgQ1I4IGFuZA0Kc3RvcmVzIHRvIHRoZSBBUElDLuKA
nQ0KDQpBbmQgbmF0aXZlX3dyaXRlX2NyOCgpIGRpZCBub3QgZXZlbiBpc3N1ZSBhIHNlcmlhbGl6
aW5nIGluc3RydWN0aW9uLg0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlz
dHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3Jn
L21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
